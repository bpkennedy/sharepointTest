$dte = [dateTime]::Get_Today().DayOfWeek.tostring()
write-host $dte
$fileName = $dte + "_" + [dateTime]::now.Hour + "_" + [dateTime]::now.Minute
$fileName = ".\DeployTranscript_" + $fileName + ".txt"
write-host $fileName

Start-Transcript -Path $fileName -Force 

Write-Host "Reset Farm"
C:\Scripts\FarmWarmup.ps1 -SPReset $true

Write-Host "Deployment Script Started"

################################################################################################################################
#  Functions for deployment
################################################################################################################################

function WaitForJobToFinish([string]$Identity)
{  
    $maxwait = 60
    $currentwait = 0
                
    #   Let's wait $maxwait seconds for the timer job to appear
    write-host -NoNewLine "Finding timer job for $Identity"
    while (($Job = Get-SPTimerJob | where { $_.Name -like "*solution-deployment*" + $Identity + "*" }) -eq $null) {
                    write-host -NoNewLine .
                    Start-Sleep -Seconds 1
                    $currentwait++
                    if ( $Currentwait -ge $maxwait ) {
                                    write-host -ForegroundColor DarkRed "No Timer Job Found"
                                    $Currentwait = 0
                                    # OK, we tried.   Let's give up now.
                                    return
                    }
    }
     
    $jobName = $job.Name
    while ((Get-SPTimerJob $JobName) -ne $null)  {
                    Write-Host -NoNewLine .
                    Start-Sleep -Seconds 1
    }

    write-host
    # Let's report on the job status
    $Job.HistoryEntries | %{ write-host -BackgroundColor darkgreen job history: $_.Status $_.ServerName}

    write-Host
}


 
function RetractSolution([string]$Identity)
{
    Write-Host "[RETRACT] Uninstalling $Identity"   
    Write-Host -NoNewLine "[RETRACT] Does $Identity contain any web application-specific resources to deploy?"
    $solution = Get-SPSolution | where { $_.Name -match $Identity }
    if($solution.ContainsWebApplicationResource)
    {
        Write-Host  -f Yellow "...Yes!"       
        Write-Host -NoNewLine "[RETRACT] Uninstalling $Identity from all web applications"           
        Uninstall-SPSolution -identity $Identity  -allwebapplications -Confirm:$false
        Write-Host -f Green "...Done!"
    }
    else
    {
        Write-Host  -f Yellow  "...No!"       
        Uninstall-SPSolution -identity $Identity -Confirm:$false   
        Write-Host -f Green "...Done!"
    }
 
    WaitForJobToFinish
 
    Write-Host -NoNewLine  '[UNINSTALL] Removing solution:' $SolutionName
    Remove-SPSolution -Identity $Identity -Confirm:$false
    Write-Host -f Green "...Done!"
}

function AddSolution([string]$Path, [string]$Identity)
{
    Write-Host -NoNewLine "[ADD] Adding solution:" $Identity
    Add-SPSolution $Path
    Write-Host -f Green "...Done!"
}

function DeploySolution([string]$Path, [string]$Identity, [string]$WebApp)
{   

    Write-Host -NoNewLine "[DEPLOY] Does $Identity contain any web application-specific resources to deploy?"
    $solution = Get-SPSolution | where { $_.Name -match $Identity }
 
    if($solution.ContainsWebApplicationResource)
    {
        Write-Host -f Yellow "...Yes!"       
        if ($WebApp.Length -gt 0)
        {
            Write-Host -NoNewLine ("[DEPLOY] Installing $Identity for " + $WebApp)  
            Install-SPSolution -Identity $Identity -GACDeployment -Force -WebApplication $WebApp
        }
        else
        {
            Write-Host -NoNewLine "[DEPLOY] Installing $Identity for all Web Applications"   
            Install-SPSolution -Identity $Identity -AllWebApplications -GACDeployment -Force
        }        
    }
    else
    {
        Write-Host -f Yellow "...No!  - THIS OVERRIDES THE CONFIGURATION FILE!"       
        Write-Host -NoNewLine "[DEPLOY] Globally deploying $Identity"   
        Install-SPSolution -Identity $Identity -GACDeployment -Force
    }
    Write-Host -f Green "...Done!"
 
    WaitForJobToFinish
}

function GetFullWebApp([string]$Name, [string]$Prefix, [string]$ProdSuffix, [string]$NotProdSuffix)
{
    if ($Prefix.Length -eq 0)
    {
        $Prefix = "*//"
    }
    if ($ProdSuffix.Length -eq 0)
    {
        $ProdSuffix = ".wwt.com/"
    }
    if ($NotProdSuffix.Length -eq 0)
    {
        $NotProdSuffix = "-*.wwt.com/"
    }
    
    [void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint")
    $farm = [Microsoft.SharePoint.Administration.SPFarm]::Local    
    foreach ($spService in $farm.Services) 
    {
        if ($spService -is [Microsoft.SharePoint.Administration.SPWebService])
        {
            foreach ($webApp in $spService.WebApplications) 
            {
                if ($webApp -is [Microsoft.SharePoint.Administration.SPAdministrationWebApplication]) 
                { 
                    continue 
                }            

                $webAppUrl = $webApp.GetResponseUri('Default').AbsoluteUri
                
                if (($webAppUrl -like "*-dev*") -or ($webAppUrl -like "*-test*") -or ($webAppUrl -like "*-vm*"))
                {                             
                             
                    if ($webAppUrl -like $($Prefix+$Name+$NotProdSuffix))
                    {
                        return $webAppURL
                    }
                }
                else
                {
                    if ($webAppUrl -like $($Prefix+$Name+$ProdSuffix))
                    {
                        return $webAppURL
                    }
                }
                
            }
        }    
    }
}
 

################################################################################################################################
# Functions for Time Sync
################################################################################################################################

Function GetServersFromWebApp()
{
    if($global:TimeSyncSourceServer.Length -gt 0)
    {
        return
    }
    
    switch ($ENV:UserDomain) {
    	"WWTHCDEV" {
            $global:TimeSyncSourceServer = "devcollab1.dev.wwt.local"
            $global:TimeSyncDestServers = "devwfe02.dev.wwtext.local", "devwfe02.dev.wwt.local"
            }
    	"WWTHCTest" {
            $global:TimeSyncSourceServer = "testcollab1.test.wwt.local"
            $global:TimeSyncDestServers = "testcollab2.test.wwt.local","testwfe01.test.wwt.local","testwfe02.test.wwt.local"
    		}
    	"WWTHC" {
            $global:TimeSyncSourceServer = "prodcollab1.wwt.local"
            $global:TimeSyncDestServers = "prodcollab2.wwt.local","prodwfe01.wwt.local","prodwfe02.wwt.local"
    		}
    	default {
            $global:TimeSyncSourceServe= ""
    		$global:TimeSyncDestServers = ""
    		}
    }
}


Function LogWrite([string] $logString)
{
   Add-Content $logFileName -value $logString
}

Function Sync($sourcePath, $destinationPath)
{
    [string[]] $sourceFilePaths = [System.IO.Directory]::GetFiles($sourcePath);
	
    Foreach ($sourceFilePath in $sourceFilePaths)
    {
        [System.IO.FileInfo] $sourceFile = Get-Item $sourceFilePath -Force
        [string] $destFilePath = Join-Path -Path $destinationPath -ChildPath $sourceFile.Name
		
		If (($sourceFile.Attributes -band [System.IO.FileAttributes]::Hidden) -eq [System.IO.FileAttributes]::Hidden)
		{
            LogWrite ("SKIPPING HIDDEN FILE: " + $sourceFilePath + " -> " + $destFilePath)
			Continue
		}
		
		If (-Not (Test-Path $destFilePath))
		{
            LogWrite ("MISSING FILE: " + $sourceFilePath + " -> " + $destFilePath)
			Continue
		}

		[System.IO.FileInfo] $destFile = Get-Item $destFilePath
        
		If ($destFile -eq $null)
		{
            LogWrite ("MISSING FILE: " + $sourceFilePath + " -> " + $destFilePath)
		}
		ElseIf ($destFile.Length -eq $sourceFile.Length)
        {
            [datetime] $destFile.LastWriteTime = $sourceFile.LastWriteTime;
            [datetime] $destFile.CreationTime = $sourceFile.CreationTime;
            
            LogWrite ("SYNCED: " + $sourceFilePath + " -> " + $destFilePath)
        }
        Else
        {
            LogWrite ("SIZE MISMATCH: " + $sourceFilePath + " -> " + $destFilePath)
        }
    }
    
    $childFolders = [System.IO.Directory]::GetDirectories($sourcePath);
	
    Foreach ($childFolderPath in $childFolders)
    {        
        [System.IO.DirectoryInfo] $childFolder = Get-Item $childFolderPath
        [string] $destFolderPath = Join-Path -Path $destinationPath -ChildPath $childFolder.Name
		
		If (-Not (Test-Path $destFolderPath))
		{
            LogWrite ("MISSING FOLDER: " + $childFolderPath + " -> " + $destFolderPath)
			Continue
		}

        [System.IO.DirectoryInfo] $destFolder = Get-Item $destFolderPath

		Sync $childFolder.FullName $destFolder.FullName
    }
}

###########################################################################################################
#  Main Body for Deployments
###########################################################################################################
$Interactive =	[environment]::userinteractive

$TimeSyncServers = ""
$global:TimeSyncSourceServer = ""
$global:TimeSyncDestServer = ""

$snapin = Get-PSSnapin | Where-Object { $_.Name -eq "Microsoft.SharePoint.Powershell" }
if ($snapin -eq $null) {
    Write-Host "[INIT] Loading SharePoint Powershell Snapin"
    Add-PSSnapin "Microsoft.SharePoint.Powershell"
}

Write-Host "[INIT] Reading Config.xml For List Of Solutions To Deploy..."
$0 = $MyInvocation.MyCommand.Definition                 # Get complete file path (eg:  D:\UserProfileProperties\CreateUserProfileProperties.ps1)
$dp0 = [System.IO.Path]::GetDirectoryName($0)           # Get current Directory  file path  (eg:  D:\UserProfileProperties)
$bits = Get-Item $dp0 | Split-Path -Parent              # Get current Drive   (eg:  D:\)
[string]$ConfigFile = $("$dp0\config.xml")
$xmlinput = [xml] (get-content $ConfigFile)
$Solutions = $xmlinput.Solutions
foreach ($wsp in $Solutions.Solution)
{
    $identity = $wsp.Path
    $path = $("$dp0\$identity")
    $WebApplications = $wsp.WebApplications
    Write-Host "[TESTING] Checking $Identity Exists in Path" -NoNewLine
    if (Test-Path $path)
    {
        #Remove Solution
        Write-Host -ForegroundColor Yellow "...Yes!"       
        Write-Host -NoNewLine "[INFO] Determining if $Identity is already installed"
     
        $isInstalled = Get-SPSolution | where { $_.Name -eq $identity }
        if ($isInstalled)
        {
            Write-Host -ForegroundColor Yellow "...Yes!"
            (RetractSolution $identity)                
        }
        else
        {
            Write-Host -ForegroundColor Yellow "...No!"
        }
    
        #Add Solution
        Write-Host "[ADD] -------------------------------------"
        Write-Host "[ADD] Adding Solution to Solution Store"
        (AddSolution $path $identity)

        #Deploy to Each Web App
        foreach ($WebApp in $WebApplications.WebApplication)
        {   
            Write-Host "[DEPLOY] Installation and deployment of $Identity"
            $WebAppURL = GetFullWebApp($WebApp)
			##################################################################################################################################
			#  Code for Time Stamp - determine WebApp - so we know which environment
			GetServersFromWebApp(GetFullWebApp($WebApp))
			##################################################################################################################################
            Write-Host ("[DEPLOY] Found Web Application From Config Name: " + $WebApp + " >> " + $WebAppURL)
            (DeploySolution $path $identity $WebAppURL)                                
        }
    }
    else
    {
        Write-Host -ForegroundColor Red "...No!"
    }
}

Write-Host ""
Write-Host "[FINISHED] ------------------------------------- [FINISHED]" -ForegroundColor Green
Write-Host "All Deployments Specified in the Config.xml have been processed!" -ForegroundColor Green
Write-Host ""

###########################################################################################################################
#  Blob Cache
###########################################################################################################################


Write-Host "[BLOB CACHE] Press any key to continue with Clearing the Blob Cache" -ForegroundColor Yellow
[void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint")
$farm = [Microsoft.SharePoint.Administration.SPFarm]::Local    
foreach ($spService in $farm.Services) 
{
    if ($spService -is [Microsoft.SharePoint.Administration.SPWebService])
    {
        foreach ($webApp in $spService.WebApplications) 
        {
            if ($webApp -is [Microsoft.SharePoint.Administration.SPAdministrationWebApplication]) 
 
            { 
                continue 
            }            

            [Microsoft.SharePoint.Publishing.PublishingCache]::FlushBlobCache($webApp)
            Write-Host "Flushed the BLOB cache for:" $webApp

        }
    }
}
Write-Host "[BLOB CACHE] Completed!" -ForegroundColor Green


###########################################################################################################
# Time Sync
###########################################################################################################

Write-Host "Setting Time Stamps (e-Tags)"
Write-Host "See sepearate log file for details"
[string] $configFileName = "sync-timestamps.xml"

If (-Not (Test-Path $configFileName))
{
    Write-Host ("MISSING CONFIG FILE: " + $configFileName)
}
Else {
    if($global:TimeSyncSourceServer.Length -gt 0)
    {
    	[xml] $xmlConfig = Get-Content $configFileName

    	[string] $sourceServer = $global:TimeSyncSourceServer
    	[string[]] $destinationServers = $global:TimeSyncDestServers
    	[string[]] $folderToCopyPartialAdminShares = $xmlConfig.config.folderToCopyPartialAdminShares.folderToCopyPartialAdminShare
    	[string] $logFileName = $xmlConfig.config.logFileName

    	If (Test-Path $logFileName)
    	{
    		Clear-Content $logFileName
    	}
    	
    	Foreach	($folderToCopyPartialAdminShare in $folderToCopyPartialAdminShares)
    	{
            
    		[string] $sourceFolderPath = "\\" + $sourceServer + "\" + $folderToCopyPartialAdminShare
            Write-Host("Source Path: " + $sourceFolderPath)
            
    		If (-Not (Test-Path $sourceFolderPath))
    		{
    		    LogWrite ("MISSING SOURCE FOLDER: " + $sourceFolderPath)
    			Continue
    		}

    		[System.IO.DirectoryInfo] $sourceFolder = Get-Item $sourceFolderPath

    		Foreach	($destinationServer in $destinationServers)
    		{
                Write-Host("Working on Syncing: " + $sourceServer + " to " + $destinationServer)

    			[string] $destinationFolderPath = "\\" + $destinationServer + "\" + $folderToCopyPartialAdminShare
    			
    			If (-Not (Test-Path $destinationFolderPath))
    			{
    		        LogWrite ("MISSING DESTINATION FOLDER: " + $destinationFolderPath)
    				Continue
    			}

    			[System.IO.DirectoryInfo] $destinationFolder = Get-Item $destinationFolderPath
    			
      			Sync $sourceFolder.FullName $destinationFolder.FullName
    		}
    	}
    }
    else
    {
        Write-Host("Nothing Deployed or Environment couldn't be determined")
    }
}
Write-host("Time-Sync Finished")

###########################################################################################################
#  Finish Up
###########################################################################################################


Write-Host "Deployment Script Completed"

Write-Host "Reset Farm"
C:\Scripts\FarmWarmup.ps1 -SPReset $true

Stop-Transcript