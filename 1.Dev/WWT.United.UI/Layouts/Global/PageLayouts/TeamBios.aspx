<%@ Page Language="C#" MasterPageFile="~masterurl/default.master" Inherits="Microsoft.SharePoint.Publishing.PublishingLayoutPage,Microsoft.SharePoint.Publishing,Version=14.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>

<%@ Register TagPrefix="PublishingWebControls" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="PublishingNavigation" Namespace="Microsoft.SharePoint.Publishing.Navigation" Assembly="Microsoft.SharePoint.Publishing, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WpNs0" Namespace="Microsoft.SharePoint.Portal.WebControls" Assembly="Microsoft.Office.Server.Search, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SPSWC" Namespace="Microsoft.SharePoint.Portal.WebControls" Assembly="Microsoft.SharePoint.Portal, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SEARCHWC" Namespace="Microsoft.Office.Server.Search.WebControls" Assembly="Microsoft.Office.Server.Search, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <!-- link to our page layout css  -->
	<SharePoint:CssRegistration Name="United/TeamBiosPageLayout.min.css" runat="server" />
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
<div class="teamBiosContainer">
    <div class="leftSection">
        <WebPartPages:WebPartZone runat="server" AllowPersonalization="true" AllowCustomization="true" AllowLayoutChange="true" FrameType="TitleBarOnly" title="<%$Resources:Microsoft.Office.Server.Search,LayoutPageZone_LeftZone%>" id="LeftZone" orientation="Vertical" QuickAdd-GroupNames="Search" QuickAdd-ShowListsAndLibraries="false">
            <ZoneTemplate>
                <SEARCHWC:RefinementWebPart runat="server" Description="This webpart helps the users to refine search results" ListDisplayName="" QueryNumber="Query1" PartOrder="2" HelpLink="" AllowRemove="True" PartImageSmall="" IsVisible="True" UseDefaultConfiguration="True" AllowHide="True" UseSQLDataSourcePaging="True" ExportControlledProperties="True" IsIncludedFilter="" DataSourceID="" Title="Refinement Panel" ViewFlag="0" NoDefaultStyle="" AccuracyIndex="50" IsIncluded="True" FrameState="Normal" PageSize="-1" PartImageLarge="" AsyncRefresh="False" ExportMode="All" Dir="Default" DetailLink="" ShowWithSampleData="False" ListId="00000000-0000-0000-0000-000000000000" FilterCategoriesDefinition="&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
                    &lt;FilterCategories&gt;

                        &lt;Category
                        Title=&quot;Result Type&quot;
                        Description=&quot;The file extension of the item&quot;
                        Type=&quot;Microsoft.Office.Server.Search.WebControls.ManagedPropertyFilterGenerator&quot;
                        MetadataThreshold=&quot;5&quot;
                        NumberOfFiltersToDisplay=&quot;4&quot;
                        MaxNumberOfFilters=&quot;0&quot;
                        SortBy=&quot;Frequency&quot;
                        SortDirection=&quot;Descending&quot;
                        SortByForMoreFilters=&quot;Name&quot;
                        SortDirectionForMoreFilters=&quot;Ascending&quot; 
                        ShowMoreLink=&quot;True&quot;
                        MappedProperty=&quot;FileExtension&quot;
                        MoreLinkText=&quot;show more&quot;
                        LessLinkText=&quot;show fewer&quot;&gt;
                        &lt;CustomFilters MappingType=&quot;ValueMapping&quot; DataType=&quot;String&quot; ValueReference=&quot;Absolute&quot; ShowAllInMore=&quot;False&quot;&gt;
                            &lt;CustomFilter CustomValue=&quot;Adobe PDF&quot;&gt;
                            &lt;OriginalValue&gt;pdf&lt;/OriginalValue&gt;
                            &lt;/CustomFilter&gt;
                            &lt;CustomFilter CustomValue=&quot;Email&quot;&gt;
                            &lt;OriginalValue&gt;eml&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;msg&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;exch&lt;/OriginalValue&gt;
                            &lt;/CustomFilter&gt;
                            &lt;CustomFilter CustomValue=&quot;Excel&quot;&gt;
                            &lt;OriginalValue&gt;odc&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;ods&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;xls&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;xlsb&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;xlsm&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;xlsx&lt;/OriginalValue&gt;
                            &lt;/CustomFilter&gt;
                            &lt;CustomFilter CustomValue=&quot;Image&quot;&gt;
                            &lt;OriginalValue&gt;tif&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;tiff&lt;/OriginalValue&gt;
                            &lt;/CustomFilter&gt;
                            &lt;CustomFilter CustomValue=&quot;Lotus Notes&quot;&gt;
                            &lt;OriginalValue&gt;nsf&lt;/OriginalValue&gt;
                            &lt;/CustomFilter&gt;
                            &lt;CustomFilter CustomValue=&quot;OneNote&quot;&gt;
                            &lt;OriginalValue&gt;one&lt;/OriginalValue&gt;
                            &lt;/CustomFilter&gt;
                            &lt;CustomFilter CustomValue=&quot;PowerPoint&quot;&gt;
                            &lt;OriginalValue&gt;odp&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;ppt&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;pptm&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;pptx&lt;/OriginalValue&gt;
                            &lt;/CustomFilter&gt;
                            &lt;CustomFilter CustomValue=&quot;Publisher&quot;&gt;
                            &lt;OriginalValue&gt;pub&lt;/OriginalValue&gt;
                            &lt;/CustomFilter&gt;
                            &lt;CustomFilter CustomValue=&quot;Text&quot;&gt;
                            &lt;OriginalValue&gt;odt&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;txt&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;url&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;csv&lt;/OriginalValue&gt;
                            &lt;/CustomFilter&gt;
                            &lt;CustomFilter CustomValue=&quot;Visio&quot;&gt;
                            &lt;OriginalValue&gt;vdw&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;vdx&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;vsd&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;vss&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;vst&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;vsx&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;vtx&lt;/OriginalValue&gt;
                            &lt;/CustomFilter&gt;
                            &lt;CustomFilter CustomValue=&quot;Webpage&quot;&gt;
                            &lt;OriginalValue&gt;ascx&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;asp&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;aspx&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;htm&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;html&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;jhtml&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;js&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;mht&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;mhtml&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;mspx&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;php&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;&lt;/OriginalValue&gt;
                            &lt;/CustomFilter&gt;
                            &lt;CustomFilter CustomValue=&quot;XML&quot;&gt;
                            &lt;OriginalValue&gt;xml&lt;/OriginalValue&gt;
                            &lt;/CustomFilter&gt;
                            &lt;CustomFilter CustomValue=&quot;Word&quot;&gt;
                            &lt;OriginalValue&gt;doc&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;docm&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;docx&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;dot&lt;/OriginalValue&gt;
                            &lt;OriginalValue&gt;nws&lt;/OriginalValue&gt;
                            &lt;/CustomFilter&gt;
                            &lt;CustomFilter CustomValue=&quot;Zip&quot;&gt;
                            &lt;OriginalValue&gt;zip&lt;/OriginalValue&gt;
                            &lt;/CustomFilter&gt;
                        &lt;/CustomFilters&gt;
                        &lt;/Category&gt;

                        &lt;Category
                        Title=&quot;Site&quot;
                        Description=&quot;Which site this document is from&quot;
                        Type=&quot;Microsoft.Office.Server.Search.WebControls.ManagedPropertyFilterGenerator&quot;
                        MetadataThreshold=&quot;5&quot;
                        NumberOfFiltersToDisplay=&quot;4&quot;
                        MaxNumberOfFilters=&quot;20&quot;
                        SortBy=&quot;Frequency&quot;
                        SortByForMoreFilters=&quot;Name&quot;
                        SortDirection=&quot;Descending&quot;
                        SortDirectionForMoreFilters=&quot;Ascending&quot;
                        ShowMoreLink=&quot;True&quot;
                        MappedProperty=&quot;SiteName&quot;
                        MoreLinkText=&quot;show more&quot;
                        LessLinkText=&quot;show fewer&quot; /&gt;

                        &lt;Category
                        Title=&quot;Author&quot;
                        Description=&quot;Use this filter to restrict results authored by a specific author&quot;
                        Type=&quot;Microsoft.Office.Server.Search.WebControls.ManagedPropertyFilterGenerator&quot;
                        MetadataThreshold=&quot;5&quot;
                        NumberOfFiltersToDisplay=&quot;4&quot;
                        MaxNumberOfFilters=&quot;20&quot;
                        SortBy=&quot;Frequency&quot;
                        SortByForMoreFilters=&quot;Name&quot;
                        SortDirection=&quot;Descending&quot;
                        SortDirectionForMoreFilters=&quot;Ascending&quot;
                        ShowMoreLink=&quot;True&quot;
                        MappedProperty=&quot;Author&quot;
                        MoreLinkText=&quot;show more&quot;
                        LessLinkText=&quot;show fewer&quot;
                        /&gt;

                        &lt;Category
                        Title=&quot;Modified Date&quot;
                        Description=&quot;When the item was last updated&quot;
                        Type=&quot;Microsoft.Office.Server.Search.WebControls.ManagedPropertyFilterGenerator&quot;
                        MetadataThreshold=&quot;5&quot;
                        NumberOfFiltersToDisplay=&quot;6&quot;
                        MaxNumberOfFilters=&quot;0&quot;
                        SortBy=&quot;Custom&quot;
                        ShowMoreLink=&quot;True&quot;
                        MappedProperty=&quot;Write&quot;
                        MoreLinkText=&quot;show more&quot;
                        LessLinkText=&quot;show fewer&quot; &gt;
                        &lt;CustomFilters MappingType=&quot;RangeMapping&quot; DataType=&quot;Date&quot; ValueReference=&quot;Relative&quot; ShowAllInMore=&quot;False&quot;&gt;
                            &lt;CustomFilter CustomValue=&quot;Past 24 Hours&quot;&gt;
                            &lt;OriginalValue&gt;-1..&lt;/OriginalValue&gt;
                            &lt;/CustomFilter&gt;
                            &lt;CustomFilter CustomValue=&quot;Past Week&quot;&gt;
                            &lt;OriginalValue&gt;-7..&lt;/OriginalValue&gt;
                            &lt;/CustomFilter&gt;
                            &lt;CustomFilter CustomValue=&quot;Past Month&quot;&gt;
                            &lt;OriginalValue&gt;-30..&lt;/OriginalValue&gt;
                            &lt;/CustomFilter&gt;
                            &lt;CustomFilter CustomValue=&quot;Past Six Months&quot;&gt;
                            &lt;OriginalValue&gt;-183..&lt;/OriginalValue&gt;
                            &lt;/CustomFilter&gt;
                            &lt;CustomFilter CustomValue=&quot;Past Year&quot;&gt;
                            &lt;OriginalValue&gt;-365..&lt;/OriginalValue&gt;
                            &lt;/CustomFilter&gt;
                            &lt;CustomFilter CustomValue=&quot;Earlier&quot;&gt;
                            &lt;OriginalValue&gt;..-365&lt;/OriginalValue&gt;
                            &lt;/CustomFilter&gt;
                        &lt;/CustomFilters&gt;
                        &lt;/Category&gt;

                        &lt;Category
                        Title=&quot;Managed Metadata Columns&quot;
                        Description=&quot;Managed metadata of the documents&quot;
                        Type=&quot;Microsoft.Office.Server.Search.WebControls.TaxonomyFilterGenerator&quot;
                        MetadataThreshold=&quot;3&quot;
                        NumberOfFiltersToDisplay=&quot;3&quot;
                        MaxNumberOfFilters=&quot;20&quot;
                        ShowMoreLink=&quot;True&quot;
                        MappedProperty=&quot;ows_MetadataFacetInfo&quot;
                        MoreLinkText=&quot;show more&quot;
                        LessLinkText=&quot;show fewer&quot; /&gt;

                        &lt;Category
                        Title=&quot;Tags&quot;
                        Description=&quot;All managed metadata of the documents and social tags&quot;
                        Type=&quot;Microsoft.Office.Server.Search.WebControls.TaxonomyFilterGenerator&quot;
                        MetadataThreshold=&quot;3&quot;
                        NumberOfFiltersToDisplay=&quot;3&quot;
                        MaxNumberOfFilters=&quot;20&quot;
                        ShowMoreLink=&quot;True&quot;
                        MappedProperty=&quot;ows_MetadataFacetInfo,popularsocialtags&quot;
                        MoreLinkText=&quot;show more&quot;
                        LessLinkText=&quot;show fewer&quot; /&gt;

                    &lt;/FilterCategories&gt;
                    " FrameType="None" ShowMessages="False" DisplayedCategories="6" SuppressWebPartChrome="False" AllowEdit="True" NumberOfCharsToDisplay="19" EnableOriginalValue="False" ChromeType="None" AutoRefresh="False" AutoRefreshInterval="60" AllowConnect="False" AllowMinimize="True" ViewContentTypeId="" InitialAsyncDataFetch="False" MissingAssembly="Cannot import this Web Part." HelpMode="Modeless" ListUrl="" ID="g_c443dc43_afff_4cd8_a4b5_33889a1ee08d" ConnectionID="00000000-0000-0000-0000-000000000000" AllowZoneChange="True" ManualRefresh="False" __MarkupType="vsattributemarkup" __WebPartId="{C443DC43-AFFF-4CD8-A4B5-33889A1EE08D}" __AllowXSLTEditing="true" WebPart="true" Height="" Width=""><DataFields>
                    </DataFields>
                    <SampleData>
                    <FilterPanel>
                        <FilterCategory Id="Microsoft_Office_Server_Search_WebControls_ManagedPropertyFilterGenerator__-357320691" Type="Microsoft.Office.Server.Search.WebControls.ManagedPropertyFilterGenerator" DisplayName="Result Type" ManagedProperty="FileExtension" ShowMoreLink="True" FreeFormFilterHint="" MoreLinkText="show more" LessLinkText="show fewer">
                        <Filters>
                            <Filter>
                            <Value>Any Result Type</Value>
                            <Tooltip>Any Result Type</Tooltip>
                            <Url>#</Url>
                            <Selection>Implied</Selection>
                            <Count></Count>
                            <Percentage></Percentage>
                            </Filter>
                            <Filter>
                            <Value>Webpages</Value>
                            <Tooltip>Webpages</Tooltip>
                            <Url>#</Url>
                            <Selection>Deselected</Selection>
                            <Count>33</Count>
                            <Percentage></Percentage>
                            </Filter>
                        <Filter>
                            <Value>Documents</Value>
                            <Tooltip>Webpages</Tooltip>
                            <Url>#</Url>
                            <Selection>Deselected</Selection>
                            <Count>33</Count>
                            <Percentage></Percentage>
                        </Filter>
                        </Filters>
                        </FilterCategory>
                    </FilterPanel></SampleData>
                    <Xsl>
                    <?xml version="1.0" encoding="utf-8"?>
                    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime" xmlns:ddwrt2="urn:frontpage:internal">
                        <xsl:output method="xml" indent="no"/>
                        <xsl:param name="RefinementPanelCaption"></xsl:param>
                        <xsl:param name="QueryId"></xsl:param>
                        <xsl:param name="TagsCategoryId"></xsl:param>
                        <xsl:param name="MetadataServiceUrl"></xsl:param>
                        <xsl:param name="IsUIRightToLeft"></xsl:param>
                        <xsl:param name="ApplyButtonText"></xsl:param>
                        <xsl:param name="CancelButtonText"></xsl:param>
                        <xsl:param name="CurrentLcid"></xsl:param>
                        <xsl:param name="MoreLinkPanelIDSuffix"></xsl:param>
                        <xsl:param name="IdPrefix" />
                        <xsl:param name="IsDesignMode">True</xsl:param>
                        <xsl:param name="RefineByHeading">Refinement</xsl:param>
                        <xsl:param name="IsRTL">False</xsl:param>

                        <xsl:template match="FilterPanel" xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime">
                        <xsl:variable name="FilterCategories" select="FilterCategory" />
                        <xsl:variable name="CategoryCount" select="count($FilterCategories)" />
                        <xsl:if test="($CategoryCount &gt; 0)">
                            <xsl:call-template name="FilterCategory">
                            <xsl:with-param name="Categories" select="$FilterCategories" />
                            </xsl:call-template>
                        </xsl:if>
                        </xsl:template>

  

                        <xsl:template name="FilterCategory">
                        <xsl:param name="Categories" />
                        <xsl:if test="$RefinementPanelCaption != ''">
                            <div class="ms-searchref-caption">
                            <xsl:value-of select="$RefinementPanelCaption" />
                            </div>
                        </xsl:if>
                        <xsl:for-each select="$Categories">
                            <xsl:variable name="FilterCategoryId" select="concat(@Id,$IdPrefix)"/> 
                            <xsl:variable name="TagsId" select="concat($TagsCategoryId,$IdPrefix)"/> 
                            <xsl:variable name="ColumnId" select="substring(@Id,10)"/> 
                            <xsl:variable name="FilterCategoryType" select="@Type"/> 
                            <xsl:variable name="ManagedProperty" select="@ManagedProperty"/>
                            <xsl:variable name="SSPList" select="substring-before(CustomData/AssociateTermSets, '|')"/>
                            <xsl:variable name="TermSetList" select="substring-after(CustomData/AssociateTermSets, '|')"/>
                            <xsl:variable name="ShowMoreLink" select="translate(@ShowMoreLink,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/> 
                            <xsl:variable name="FreeFormFilterHint" select="@FreeFormFilterHint"/> 
                            <xsl:variable name="MoreLinkText" select="@MoreLinkText"/> 
                            <xsl:variable name="LessLinkText" select="@LessLinkText"/> 
                            <xsl:variable name="ShowCounts" select="@ShowCounts"/> 
                            <xsl:variable name="DisplayName" select="@DisplayName"/>   
                            <xsl:variable name="EscapedDisplayName" select="CustomData/EscapedDisplayName"/>   
                            <xsl:variable name="ShowTaggingControl" select="@ShowTaggingControl"/>   
                            <div class="ms-searchref-categoryname">
                            <xsl:value-of select="$DisplayName"/>
                            </div>
                            <ul class="ms-searchref-filters" id="TopFilters_{$FilterCategoryId}">
                            <xsl:choose>
          	                    <xsl:when test="$FilterCategoryType = 'Message'">
            	                    <xsl:for-each select="Filters/Filter">
              		                    <xsl:call-template name="FilterMessage">
                		                    <xsl:with-param name="Value" select="Value" />
              		                    </xsl:call-template>
                                </xsl:for-each>
                                </xsl:when>
          	                    <xsl:otherwise>
            	                    <xsl:call-template name="Filter">
              		                    <xsl:with-param name="Filters" select="Filters/Filter" />
              		                    <xsl:with-param name="ShowCounts" select="$ShowCounts" />
            	                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                            </ul>
                            <xsl:if test="$ShowMoreLink='TRUE'">
          	                    <xsl:variable name="MoreFilters" select="MoreFilters/Filter" />
          	                    <xsl:choose>
            	                    <xsl:when test="$FilterCategoryId and ($FilterCategoryId != '') and ($FilterCategoryType = 'Microsoft.Office.Server.Search.WebControls.ManagedPropertyFilterGenerator')">
              		                    <xsl:variable name="MoreDivId" select="concat('RefinementMore_', $QueryId, $FilterCategoryId)" />
              		                    <xsl:variable name="LessDivId" select="concat('RefinementLess_', $QueryId, $FilterCategoryId)" />
              		                    <xsl:if test="$MoreFilters != ''">
                                    <a class="ms-searchref-more" href="javascript:{{}}" onclick="SearchEnsureSOD();ToggleRefMoreLessFilters(this, true);">
                                        <div class="ms-searchref-morelink">
                                        <xsl:value-of select="$MoreLinkText" />
                                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                        <img src="/_layouts/images/more_arrow.png" class="ms-searchref-moreicon" />
                                        </div>
                                    </a>
                                    <ul class="ms-searchref-filters" id="MoreFilters_{$FilterCategoryId}" style="display:none">
                  	                    <xsl:call-template name="Filter">
                    	                    <xsl:with-param name="Filters" select="$MoreFilters" />
                    	                    <xsl:with-param name="ShowCounts" select="$ShowCounts" />
                  	                    </xsl:call-template>
                                    </ul>
                                    <a class="ms-searchref-more" href="javascript:{{}}" onclick="SearchEnsureSOD();ToggleRefMoreLessFilters(this, false);" style="display:none">
                                        <div class="ms-searchref-morelink">
                                        <xsl:value-of select="$LessLinkText" />
                                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                        <img src="/_layouts/images/less_arrow.png" class="ms-searchref-moreicon" />
                                        </div>
                                    </a>
                                    </xsl:if>
                                </xsl:when>
            	                    <xsl:when test="$FilterCategoryId and ($FilterCategoryId != '') and ($FilterCategoryType = 'Microsoft.Office.Server.Search.WebControls.TaxonomyFilterGenerator')">
              		                    <xsl:variable name="IsTagsColumn" select="$FilterCategoryId = $TagsId" />
              		                    <xsl:if test="$MoreFilters != ''">
                                    <a id="{$MoreLinkPanelIDSuffix}_{$FilterCategoryId}" href="javascript:{{}}" class="ms-searchref-more" onclick="SearchEnsureSOD();RenderTaggingControl('{$FilterCategoryId}', {$IsTagsColumn}, '{$SSPList}', '{$TermSetList}', '{$MetadataServiceUrl}', {$CurrentLcid}, '{$MoreLinkPanelIDSuffix}', '{$EscapedDisplayName}', {$ShowTaggingControl}, {$IsUIRightToLeft});">
                                        <div class="ms-searchref-morelink">
                                        <xsl:value-of select="$MoreLinkText" />
                                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                        <img src="/_layouts/images/more_arrow.png" class="ms-searchref-moreicon" />
                                        </div>
                                    </a>
                                    <div style="display:none">
                                        <ul class="ms-searchref-filters" id="MoreFilters_{$FilterCategoryId}">
                                        <xsl:call-template name="Filter">
                      	                    <xsl:with-param name="Filters" select="MoreFilters/Filter" />
                      	                    <xsl:with-param name="ShowCounts" select="$ShowCounts" />
                                        </xsl:call-template>
                                        </ul>
                                        <div id="TaxonomyMoreControl_{$FilterCategoryId}">
                                        <input id="MetadataHiddenInput_{$FilterCategoryId}" type="hidden" />
                                        <div id="TaggingControl_{$FilterCategoryId}" class="ms-taxonomy">
                                            <img alt="" src="/_layouts/images/blank.gif" height="0" width="0"/>
                                        </div>
                                        <img style="display:none" src="/_layouts/images/RTE2FIND.gif" class="ms-searchref-taxapply" align="right" alt="{$ApplyButtonText}" onclick="SearchEnsureSOD();var link=GetTaxonomyApplyFilterUrl('{$FilterCategoryId}','{$ColumnId}');if (link!='')window.location=link;" />
                                        </div>
                                    </div>
                                    <a style="display:none" class="ms-searchref-more" href="javascript:{{}}" onclick="SearchEnsureSOD();ToggleTaxonomyLessFilters(this);">
                                        <div class="ms-searchref-morelink">
                                        <xsl:value-of select="$LessLinkText" />
                                        <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                        <img src="/_layouts/images/less_arrow.png" class="ms-searchref-moreicon" />
                                        </div>
                                    </a>
                                    </xsl:if>
                                </xsl:when>
            	                    <xsl:when test="$FilterCategoryId and ($FilterCategoryId != '') and ($FilterCategoryType = 'Message')">
                                </xsl:when>
            	                    <xsl:otherwise>
                                </xsl:otherwise>
          	                    </xsl:choose>
                            </xsl:if>
                            <div class="ms-searchref-catseparator">&#160;</div>
                        </xsl:for-each>
                        </xsl:template>

                        <xsl:template name="Filter">
                        <xsl:param name="Filters" />
                        <xsl:param name="ShowCounts" />
                        <xsl:for-each select="$Filters">
                            <xsl:variable name="Selection" select="Selection" />
                            <xsl:choose>
                            <xsl:when test="($Selection = 'Selected')">
          	                    <xsl:call-template name="FilterLink">
            	                    <xsl:with-param name="Url" select="Url" />
            	                    <xsl:with-param name="UrlTooltip" select="Tooltip" />
            	                    <xsl:with-param name="Value" select="Value" />
            	                    <xsl:with-param name="FilterSelection" select="'ms-searchref-selected ms-searchref-removable'" />
            	                    <xsl:with-param name="ShowCounts" select="$ShowCounts" />
            	                    <xsl:with-param name="Count" select="Count" />
            	                    <xsl:with-param name="Percentage" select="Percentage" />
            	                    <xsl:with-param name="Indentation" select="Indentation" />
          	                    </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="($Selection = 'Implied')">
          	                    <xsl:call-template name="FilterLink">
            	                    <xsl:with-param name="Url" select="Url" />
            	                    <xsl:with-param name="UrlTooltip" select="Tooltip" />
            	                    <xsl:with-param name="Value" select="Value" />
            	                    <xsl:with-param name="FilterSelection" select="'ms-searchref-selected'" />
            	                    <xsl:with-param name="ShowCounts" select="$ShowCounts" />
            	                    <xsl:with-param name="Count" select="Count" />
            	                    <xsl:with-param name="Percentage" select="Percentage" />
            	                    <xsl:with-param name="Indentation" select="Indentation" />
          	                    </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
          	                    <xsl:call-template name="FilterLink">
            	                    <xsl:with-param name="Url" select="Url" />
            	                    <xsl:with-param name="UrlTooltip" select="Tooltip" />
            	                    <xsl:with-param name="Value" select="Value" />
            	                    <xsl:with-param name="FilterSelection" select="'ms-searchref-unselected'" />
            	                    <xsl:with-param name="ShowCounts" select="$ShowCounts" />
            	                    <xsl:with-param name="Count" select="Count" />
            	                    <xsl:with-param name="Percentage" select="Percentage" />
            	                    <xsl:with-param name="Indentation" select="Indentation" />
          	                    </xsl:call-template>
                            </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        </xsl:template>

                        <xsl:template name="FilterLink">
                        <xsl:param name="Url"/>
                        <xsl:param name="UrlTooltip"/>
                        <xsl:param name="Value"/>
                        <xsl:param name="FilterSelection"/>
                        <xsl:param name="ShowCounts"/>
                        <xsl:param name="Count"/>
                        <xsl:param name="Percentage"/>
                        <xsl:param name="Indentation"/>
                        <xsl:variable name="SecureUrl">
                            <xsl:call-template name="GetSecureUrl">
                            <xsl:with-param name="Url" select="$Url" />
                            </xsl:call-template>
                        </xsl:variable>
                        <li class="ms-searchref-filter {$FilterSelection}">
                            <xsl:if test="($Indentation = '1')">
                            <span class="ms-searchref-indenticon">&#8627;&#160;</span>
                            </xsl:if>
                            <a class="ms-searchref-filterlink" href="{$SecureUrl}" title="{$RefineByHeading}: {$UrlTooltip}">
                            <xsl:value-of select="Value"/>
                            </a>
                            <xsl:choose>
                            <xsl:when test="($ShowCounts = 'Count') and ($Count != '')">
                                <span class="ms-searchref-count">
                                <xsl:if test="$IsRTL = 'True'">&#x200f;</xsl:if> 
                                (<xsl:value-of select="Count"/>)
                                </span>
                            </xsl:when>
                            <xsl:when test="($ShowCounts = 'Percentage') and ($Percentage != '')">
                                <span class="ms-searchref-count">
                                <xsl:if test="$IsRTL = 'True'">&#x200f;</xsl:if> 
                                (<xsl:value-of select="format-number($Percentage, '0%')"/>)
                                </span>
                            </xsl:when>
                            </xsl:choose>
                        </li>
                        </xsl:template>

                        <xsl:template name="FilterMessage">
                        <xsl:param name="Value"/>
                        <xsl:param name="FilterSelection"/>
                        <li class="ms-searchref-filtermsg">
                            <span class="ms-searchref-filterlink ms-searchref-msg">
                            <xsl:value-of select="Value"/>
                            </span>
                        </li>
                        </xsl:template>

                        <xsl:template name="GetSecureUrl">
                        <xsl:param name="Url"/>
                        <xsl:choose>
                            <xsl:when test="$IsDesignMode = 'True'">
                            <xsl:value-of select="$Url" />
                            </xsl:when>
                            <xsl:otherwise>
                            <xsl:value-of select="ddwrt:EnsureAllowedProtocol($Url)" />
                            </xsl:otherwise>
                        </xsl:choose>
                        </xsl:template>

                    </xsl:stylesheet>
                    </Xsl>
                </SEARCHWC:RefinementWebPart>
            </ZoneTemplate>
        </WebPartPages:WebPartZone>
    </div>
    <div class="rightSection">
        <WebPartPages:WebPartZone runat="server" AllowPersonalization="true" AllowCustomization="true" AllowLayoutChange="true" FrameType="TitleBarOnly" title="<%$Resources:Microsoft.Office.Server.Search,LayoutPageZone_RightZone%>" id="RightZone" orientation="Vertical" QuickAdd-GroupNames="Search" QuickAdd-ShowListsAndLibraries="false">
            <ZoneTemplate>
                <SEARCHWC:SearchStatsWebPart runat="server" __MarkupType="xmlmarkup" WebPart="true" __WebPartId="{B21996B4-5760-4EDB-93CF-031C590789FE}" >
                    <WebPart xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://schemas.microsoft.com/WebPart/v2">
                        <Title>Search Statistics</Title><FrameType>None</FrameType><Description>Displays the search statistics such as the number of results shown on the current page, total number of results and time taken to perform the search.</Description><IsIncluded>true</IsIncluded><ZoneID>TopRow</ZoneID><PartOrder>6</PartOrder><FrameState>Normal</FrameState><Height /><Width /><AllowRemove>true</AllowRemove><AllowZoneChange>true</AllowZoneChange><AllowMinimize>true</AllowMinimize><AllowConnect>false</AllowConnect><AllowEdit>true</AllowEdit><AllowHide>true</AllowHide><IsVisible>true</IsVisible><DetailLink /><HelpLink /><HelpMode>Modeless</HelpMode><Dir>Default</Dir><PartImageSmall /><MissingAssembly>Cannot import this Web Part.</MissingAssembly><PartImageLarge /><IsIncludedFilter /><ExportControlledProperties>true</ExportControlledProperties><ConnectionID>00000000-0000-0000-0000-000000000000</ConnectionID><ID>g_b21996b4_5760_4edb_93cf_031c590789fe</ID><Mode xmlns="urn:schemas-microsoft-com:SearchStatsWebPart">OneLine</Mode><DisplayNumberOfPages xmlns="urn:schemas-microsoft-com:SearchStatsWebPart">true</DisplayNumberOfPages><DisplayTotalResults xmlns="urn:schemas-microsoft-com:SearchStatsWebPart">true</DisplayTotalResults><DisplayResponseTime xmlns="urn:schemas-microsoft-com:SearchStatsWebPart">false</DisplayResponseTime><DisplayDeepLatencyStats xmlns="urn:schemas-microsoft-com:SearchStatsWebPart">false</DisplayDeepLatencyStats><ShowMessages xmlns="urn:schemas-microsoft-com:SearchStatsWebPart">false</ShowMessages><QueryID xmlns="urn:schemas-microsoft-com:SearchStatsWebPart">Query1</QueryID>
                    </WebPart>
                </SEARCHWC:SearchStatsWebPart>
                <SEARCHWC:PeopleCoreResultsWebPart runat="server" PreviewWindowSize="160" PartImageSmall="" MoreResultsText="View more results &#187;" ViewFlag="0" PageSize="-1" IsLocationPeople="False" IgnoreNoise="True" ShowMessages="True" ShowWithSampleData="False" ResubmitFlag="NoResubmit" AllowEdit="True" UseSQLDataSourcePaging="True" SpellcheckingMode="Suggest" MoreLinkLabel="View more results &#187;" IsVisible="True" EnableDocumentPreviewPowerPoint="True" DefaultSort="Relevance" MissingAssembly="Cannot import this Web Part." ExportControlledProperties="True" EnableSimilarFind="False" Title="People Search Core Results" ViewContentTypeId="" DataSourceID="" View="Relevance" EnableStemming="False" HelpLink="" ExportMode="All" ShowMoreLink="False" DisplayDiscoveredDefinition="True" ListDisplayName="" AsyncRefresh="False" DefaultRankingModelID="D9BFB1A1-9036-4627-83B2-BBD9983AC8A1" ID="g_183adbd0_da73_49a8_bb90_3b0297b6f3c5" EnableOriginalValue="False" ShowActionLinks="False" AllowMinimize="True" HelpMode="Modeless" DisplayAlertMeLink="True" Description="Displays the people search results and the properties associated with them." PropertiesToRetrieve="
                    &lt;Columns&gt;
                      &lt;Column Name=&quot;WorkId&quot;/&gt;
                      &lt;Column Name=&quot;UserProfile_GUID&quot;/&gt;
                      &lt;Column Name=&quot;AccountName&quot;/&gt;
                      &lt;Column Name=&quot;PreferredName&quot; HitHighLight=&quot;true&quot;/&gt;
                      &lt;Column Name=&quot;YomiDisplayName&quot; HitHighLight=&quot;true&quot;/&gt;
                      &lt;Column Name=&quot;JobTitle&quot; HitHighLight=&quot;true&quot;/&gt;
                      &lt;Column Name=&quot;Department&quot; HitHighLight=&quot;true&quot;/&gt;
                      &lt;Column Name=&quot;WorkPhone&quot; HitHighLight=&quot;true&quot;/&gt;
                      &lt;Column Name=&quot;OfficeNumber&quot; HitHighLight=&quot;true&quot;/&gt;
                      &lt;Column Name=&quot;PictureURL&quot;/&gt;
                      &lt;Column Name=&quot;HierarchyUrl&quot;/&gt;
                      &lt;Column Name=&quot;WorkEmail&quot; HitHighLight=&quot;true&quot;/&gt;
                      &lt;Column Name=&quot;Path&quot;/&gt;
                      &lt;Column Name=&quot;HitHighlightedSummary&quot;/&gt;
                      &lt;Column Name=&quot;HitHighlightedProperties&quot;/&gt;
                      &lt;Column Name=&quot;Responsibility&quot; HitHighLight=&quot;true&quot;/&gt;
                      &lt;Column Name=&quot;Skills&quot; HitHighLight=&quot;true&quot;/&gt;
                      &lt;Column Name=&quot;SipAddress&quot; HitHighLight=&quot;true&quot;/&gt;
                      &lt;Column Name=&quot;Schools&quot; HitHighLight=&quot;true&quot;/&gt;
                      &lt;Column Name=&quot;PastProjects&quot; HitHighLight=&quot;true&quot;/&gt;
                      &lt;Column Name=&quot;Interests&quot; HitHighLight=&quot;true&quot;/&gt; 
                      &lt;Column Name=&quot;OrgNames&quot; HitHighLight=&quot;true&quot;/&gt;
                      &lt;Column Name=&quot;OrgUrls&quot;/&gt;
                      &lt;Column Name=&quot;OrgParentNames&quot; HitHighLight=&quot;true&quot;/&gt;
                      &lt;Column Name=&quot;OrgParentUrls&quot;/&gt;
                      &lt;Column Name=&quot;Memberships&quot; HitHighLight=&quot;true&quot;/&gt;
                      &lt;Column Name=&quot;AboutMe&quot; HitHighLight=&quot;true&quot;/&gt;
                      &lt;Column Name=&quot;BaseOfficeLocation&quot; HitHighLight=&quot;true&quot;/&gt;
                      &lt;Column Name=&quot;ServiceApplicationID&quot;/&gt;
                      &lt;Column Name=&quot;SocialDistance&quot;/&gt;
                    &lt;/Columns&gt;
                    " DateFormat="DateOnly" SortXml="&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;&lt;ResultSorting xmlns:xsi=&quot;http://www.w3.org/2001/XMLSchema-instance&quot; xmlns:xsd=&quot;http://www.w3.org/2001/XMLSchema&quot;&gt;   &lt;SortableFields&gt;    &lt;SortableField SupportsSortDirection=&quot;false&quot; DefaultSortDirection=&quot;Ascending&quot; IsSS14RankProfile=&quot;false&quot; IsDefault=&quot;true&quot;&gt;      &lt;FieldID&gt;default&lt;/FieldID&gt;      &lt;Display&gt;true&lt;/Display&gt;      &lt;DisplayText&gt;Relevance&lt;/DisplayText&gt;    &lt;/SortableField&gt;    &lt;SortableField SupportsSortDirection=&quot;true&quot; DefaultSortDirection=&quot;Ascending&quot; IsSS14RankProfile=&quot;false&quot; IsDefault=&quot;false&quot; Type=&quot;Datetime&quot;&gt;      &lt;FieldID&gt;write&lt;/FieldID&gt;      &lt;Display&gt;true&lt;/Display&gt;      &lt;DisplayText&gt;Date&lt;/DisplayText&gt;    &lt;/SortableField&gt;  &lt;/SortableFields&gt;&lt;/ResultSorting&gt;" AllowRemove="True" RemoveDuplicates="True" RelevanceView="False" ShowSearchResults="True" EnableDocumentPreviewWord="True" DetailLink="" DisplayRSSLink="True" AllowHide="True" IsIncluded="True" ConnectionID="00000000-0000-0000-0000-000000000000" HighestResultPage="1000" QueryNumber="Query1" InitialAsyncDataFetch="False" Dir="Default" ShowLangPicker="True" ShowPeopleSortDropdown="True" AllowZoneChange="True" ManualRefresh="False" AutoRefresh="False" EnablePhonetic="True" SentencesInSummary="3" SharedPropertiesVersion="4" ConcurrentNumberDocumentPreview="10" CharactersInSummary="185" DateView="False" IsIncludedFilter="" NoDefaultStyle="" FrameState="Normal" DefaultPeopleView="Relevance" AutoRefreshInterval="60" PartOrder="8" PartImageLarge="" ResultsPerPage="10" UseLocationVisualization="True" QuerySideLanguage="" SuppressWebPartChrome="False" ChromeType="None" ListUrl="" TotalNumberDocumentPreview="10" CharactersInUrl="90" FrameType="None" ScopeID="-1" EnableNicknames="True" AllowConnect="False" ShowWindowsSearch="True" ListId="00000000-0000-0000-0000-000000000000" __MarkupType="vsattributemarkup" __WebPartId="{183ADBD0-DA73-49A8-BB90-3B0297B6F3C5}" __AllowXSLTEditing="true" WebPart="true" Height="" Width=""><SelectColumns>

                    <Columns>
                      <Column Name="WorkId"/>
                      <Column Name="UserProfile_GUID"/>
                      <Column Name="AccountName"/>
                      <Column Name="PreferredName" HitHighLight="true"/>
                      <Column Name="YomiDisplayName" HitHighLight="true"/>
                      <Column Name="JobTitle" HitHighLight="true"/>
                      <Column Name="Department" HitHighLight="true"/>
                      <Column Name="WorkPhone" HitHighLight="true"/>
                      <Column Name="OfficeNumber" HitHighLight="true"/>
                      <Column Name="PictureURL"/>
                      <Column Name="HierarchyUrl"/>
                      <Column Name="WorkEmail" HitHighLight="true"/>
                      <Column Name="Path"/>
                      <Column Name="HitHighlightedSummary"/>
                      <Column Name="HitHighlightedProperties"/>
                      <Column Name="Responsibility" HitHighLight="true"/>
                      <Column Name="Skills" HitHighLight="true"/>
                      <Column Name="SipAddress" HitHighLight="true"/>
                      <Column Name="Schools" HitHighLight="true"/>
                      <Column Name="PastProjects" HitHighLight="true"/>
                      <Column Name="Interests" HitHighLight="true"/> 
                      <Column Name="OrgNames" HitHighLight="true"/>
                      <Column Name="OrgUrls"/>
                      <Column Name="OrgParentNames" HitHighLight="true"/>
                      <Column Name="OrgParentUrls"/>
                      <Column Name="Memberships" HitHighLight="true"/>
                      <Column Name="AboutMe" HitHighLight="true"/>
                      <Column Name="BaseOfficeLocation" HitHighLight="true"/>
                      <Column Name="ServiceApplicationID"/>
                      <Column Name="SocialDistance"/>
                    </Columns>
                    </SelectColumns>
                    <SampleData>
                    <All_Results>
                      <Result>
                        <id>1</id>
                        <userprofile_guid>E5FD8056-CECD-44EE-ACB3-8E7B1144AA2D</userprofile_guid>
                        <preferredname>Title of document or web page</preferredname>
                        <jobtitle>Display property #1</jobtitle>
                        <workphone>Display property #2</workphone>
                        <officenumber>Display property #3</officenumber>    
                        <workemail>sampleaccount@sampledomain.com</workemail>
                        <url>http://www.sample.com/MySite/Person.aspx?accountname=sampledomain\sampleaccount</url>
                        <urlEncoded>http%3A%2F%2Fwww%2Esample%2Ecom%2FMySite%2FPerson%2Easpx%3Faccountname%3Dsampledomain%5Csampleaccount</urlEncoded>
                        <hithighlightedsummary>
                          This is the summary of the document or web page. The summary is generated from the original document based on matches with query terms. In some cases, the summary is a description provided by the author.
                        </hithighlightedsummary>
                        <hithighlightedproperties>
                          <HHTitle></HHTitle>
                          <HHUrl>http://www.sample.com/MySite/Person.aspx?accountname=sampledomain\sampleaccount</HHUrl>
                          <preferredname hashh="0">
                            Title of document or web page
                          </preferredname>
                          <jobtitle hashh="0">Display property #1</jobtitle>
                          <workphone hashh="0">Display property #2</workphone>
                          <officenumber hashh="0">Display property #3</officenumber>
                          <workemail hashh="0">sampleaccount@sampledomain.com</workemail>
                          <responsibility hashh="0">Display property #4</responsibility>
                          <responsibility hashh="0">Display property #5</responsibility>
                        </hithighlightedproperties>
                        <responsibility_multival>Display property #4</responsibility_multival>
                        <responsibility_multival>Display property #5</responsibility_multival>
                        <responsibility>Display property #4;Display property #5</responsibility>
                        <imageurl imageurldescription="File with extension: aspx">/_layouts/images/html16.gif</imageurl>
                      </Result>
                    </All_Results>
                    </SampleData>
                    <Xsl>
                    <xsl:stylesheet version="1.0" 
                    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                    xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime" 
                    xmlns:asp="http://schemas.microsoft.com/ASPNET/20" 
                    xmlns:SEARCHWC="http://schemas.microsoft.com/searchserver/" xmlns:ddwrt2="urn:frontpage:internal">
                    <xsl:output method="xml" indent="no"/>
                    <xsl:param name="SortBy" />
                    <xsl:param name="DropDownOption" />
                    <xsl:param name="RelevanceSortUrl" />
                    <xsl:param name="RelevanceSortLabel" />
                    <xsl:param name="SocialDistanceSortUrl" />
                    <xsl:param name="SocialDistanceSortLabel" />
                    <xsl:param name="NameSortUrl" />
                    <xsl:param name="NameSortLabel" />
                    <xsl:param name="IsNoKeyword" />
                    <xsl:param name="IsFixedQuery" />
                    <xsl:param name="ShowMoreLink" />
                    <xsl:param name="MoreLinkLabel" />
                    <xsl:param name="MoreLink" />
                    <xsl:param name="AlertMeLink" />
                    <xsl:param name="AlertMeText" />
                    <xsl:param name="SrchRSSText" />
                    <xsl:param name="SrchRSSLink" />
                    <xsl:param name="ShowMessage" />
                    <xsl:param name="ShowActionLinks" />
                    <xsl:param name="SearchProviderText" />
                    <xsl:param name="SearchProviderLink" />
                    <xsl:param name="IsPeopleCoreResultsWebPart" />
                    <xsl:param name="NoFixedQuery" />
                    <xsl:param name="NoKeyword" />
                    <xsl:param name="NoPeopleResults" />
                    <xsl:param name="NoPeopleResults1" />
                    <xsl:param name="NoPeopleResults2" />
                    <xsl:param name="NoPeopleResults3" />
                    <xsl:param name="NoPeopleResults4" />
                    <xsl:param name="ParentOrgsLabel" />
                    <xsl:param name="ViewHiearchyLabel" />
                    <xsl:param name="RecentContentLabel" />
                    <xsl:param name="ResponsibilitiesLabel" />
                    <xsl:param name="SkillsLabel" />
                    <xsl:param name="InterestsLabel" />
                    <xsl:param name="PastProjectsLabel" />
                    <xsl:param name="SchoolLabel" />
                    <xsl:param name="MembershipLabel" />
                    <xsl:param name="AboutMeLabel" />
                    <xsl:param name="BaseOfficeLabel" />
                    <xsl:param name="SummaryLabel" />
                    <xsl:param name="ProfileViewLabel" />
                    <xsl:param name="UpdateProfileLabel" />
                    <xsl:param name="QueriesFoundYouLabel" />
                    <xsl:param name="UpdateProfileKeywordLabel" />
                    <xsl:param name="SelfSearchLabel" />
                    <xsl:param name="NoKeywordLabel" />
                    <xsl:param name="AddToMyColleaguesText" />
                    <xsl:param name="PopupFetcingResultLabel" />
                    <xsl:param name="IdPrefix" />
                    <xsl:param name="LangPickerHeading" />
                    <xsl:param name="LangPickerNodeSet" />
                    <xsl:param name="FilterNodeSet" />
                    <xsl:param name="ShowPeopleSortDropdown" />
                    <xsl:param name="RecentUpdateTabLabel" />

                    <!-- When there is no keywory to issue the search -->
                    <xsl:template name="dvt_1.noKeyword">
                      <span class="ms-sbplain">
                        <xsl:choose>
                          <xsl:when test="$IsFixedQuery">
                            <xsl:value-of select="$NoFixedQuery" />
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:value-of select="$NoKeyword" />
                          </xsl:otherwise>
                        </xsl:choose>
                      </span>       
                    </xsl:template>


                    <!-- When empty result set is returned from search -->
                    <xsl:template name="dvt_1.empty">  
                      <div class="psrch-results">
                        <xsl:if test="$ShowActionLinks">
                          <xsl:call-template name="ActionBarTemplate" />
                        </xsl:if>
                      </div>

                      <span class="srch-description" id="CSR_NO_RESULTS">
                        <xsl:value-of select="$NoPeopleResults"/>
                        <ol>
                          <li><xsl:value-of select="$NoPeopleResults1"/></li>
                          <li><xsl:value-of select="$NoPeopleResults2"/></li>
                          <li><xsl:value-of select="$NoPeopleResults3"/></li>
                          <li><xsl:value-of select="$NoPeopleResults4"/></li>
                        </ol>
                      </span>
                    </xsl:template>

                    <!-- Main body template-->
                    <xsl:template name="dvt_1.body">
                      <div class="psrch-results">
                        <xsl:if test="$ShowActionLinks">
                          <div class="srch-sort-right2"> 
                            <xsl:if test="$LangPickerNodeSet and count($LangPickerNodeSet) &gt; 0">
                              <label for="langpickerdd" id="langpickerddlabel"><xsl:value-of select="$LangPickerHeading"/></label>
                              <select title="{$LangPickerHeading}" class="srch-dropdown" onchange="window.location.href=this.value" id="langpickerdd">
                                <xsl:for-each select="$LangPickerNodeSet">
                                  <xsl:element name="option">
                                    <xsl:attribute name="value"><xsl:value-of select="@url"/></xsl:attribute>
                                    <xsl:if test="@selected = 'true'">
                  	                    <xsl:attribute name="selected">selected</xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="@title"/>
                                  </xsl:element>
                                </xsl:for-each>        
                              </select>
                              <xsl:text disable-output-escaping="yes">&#8195;</xsl:text>
                            </xsl:if>

                            <xsl:if test="$ShowPeopleSortDropdown">
                              <label for="sortbydd" id="sortbyddlabel"><xsl:value-of select="$SortBy" /></label> 
                              <select title="{$SortBy}" name="dropdown" onchange="window.location.href=this.value" class="srch-dropdown" id="sortbydd">
                                <xsl:element name="option"> 
                                  <xsl:attribute name="value"><xsl:value-of select="ddwrt:EnsureAllowedProtocol(string($RelevanceSortUrl))"/></xsl:attribute>
                                  <xsl:if test="$DropDownOption = '0'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                  </xsl:if>
                                  <xsl:value-of select="$RelevanceSortLabel"/>
                                </xsl:element>
                                <xsl:if test="string-length($SocialDistanceSortUrl) &gt; 0 and string-length($SocialDistanceSortLabel) &gt; 0">
                                  <xsl:element name="option"> 
                                    <xsl:attribute name="value"><xsl:value-of select="ddwrt:EnsureAllowedProtocol(string($SocialDistanceSortUrl))"/></xsl:attribute>
                                    <xsl:if test="$DropDownOption = '1'">
                                      <xsl:attribute name="selected">selected</xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="$SocialDistanceSortLabel"/>
                                  </xsl:element>
                                </xsl:if>
                                <xsl:element name="option"> 
                                  <xsl:attribute name="value"><xsl:value-of select="ddwrt:EnsureAllowedProtocol(string($NameSortUrl))"/></xsl:attribute>
                                  <xsl:if test="$DropDownOption = '2'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                  </xsl:if>
                                  <xsl:value-of select="$NameSortLabel"/>
                                </xsl:element>
                              </select>  
                              <xsl:text disable-output-escaping="yes">&#8195;</xsl:text>
                            </xsl:if>

                            <xsl:call-template name="ActionBarTemplate" />
                          </div>
                        </xsl:if>
                        <xsl:for-each select="All_Results/Result">
                          <xsl:call-template name="SingleResult"/>
                        </xsl:for-each>    
                        <xsl:call-template name="MoreLinkTemplate" />
                      </div>  
                    </xsl:template>


                    <!-- This template is called for each result -->
                    <xsl:template name="SingleResult">  
                      <xsl:element name="div"> 
                        <xsl:attribute name="id">
                          <xsl:value-of select="concat('Container', id)"/>
                        </xsl:attribute>
                        <xsl:choose>
                          <xsl:when test="id = 1">
                            <xsl:attribute name="class">psrch-FirstFullResult</xsl:attribute>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:attribute name="class">psrch-FullResult</xsl:attribute>
                          </xsl:otherwise>
                        </xsl:choose>
                        <xsl:call-template name="SingleResultInternal" />
                      </xsl:element>
                    </xsl:template>

                    <xsl:template name="SingleResultInternal">
                      <xsl:variable name="id" select="id"/>
                      <xsl:variable name="currentId" select="concat($IdPrefix,$id)"/>
                      <xsl:variable name="url" select="url"/>
                      <xsl:variable name="email" select="workemail"/>
                      <xsl:variable name="sip" select="sipaddress"/>
                      <xsl:variable name="prefix">IMNRC('</xsl:variable>
                      <xsl:variable name="suffix">')</xsl:variable>

                      <xsl:variable name="hassip"       select="string-length($sip) &gt; 0"/>
                      <xsl:variable name="hasemail"     select="string-length($email) &gt; 0"/>
                      <xsl:variable name="haspn"        select="string-length(preferredname) &gt; 0"/>
                      <xsl:variable name="hasydn"       select="string-length(yomidisplayname) &gt; 0"/>
                      <xsl:variable name="hasjt"        select="string-length(jobtitle) &gt; 0"/>
                      <xsl:variable name="hasdp"        select="string-length(department) &gt; 0"/>
                      <xsl:variable name="hasorg"       select="string-length(orgnames) &gt; 0"/>
                      <xsl:variable name="haswph"       select="string-length(workphone) &gt; 0"/>
                      <xsl:variable name="hasonum"      select="string-length(officenumber) &gt; 0"/>

                      <xsl:variable name="hascol"       select="string-length(colleaguecategory) &gt; 0"/>
                      <xsl:variable name="hasacu"       select="string-length(addtomycolleaguesurl) &gt; 0"/>
                      <xsl:variable name="hashier"      select="string-length(hierarchyurl) &gt; 0"/>

                      <xsl:variable name="hasabme"      select="string-length(aboutme) &gt; 0"/>
                      <xsl:variable name="hasresp"      select="string-length(responsibility) &gt; 0"/>
                      <xsl:variable name="hassk"        select="($FilterNodeSet and $FilterNodeSet/@title='SPShSkills') or hithighlightedproperties/skills/@hashh &gt; 0"/>
                      <xsl:variable name="hasint"       select="($FilterNodeSet and $FilterNodeSet/@title='SPShInterests') or hithighlightedproperties/interests/@hashh &gt; 0"/>
                      <xsl:variable name="hasorgparent" select="($FilterNodeSet and $FilterNodeSet/@title='OrgParentNames') or hithighlightedproperties/orgparentnames/@hashh &gt; 0"/>
                      <xsl:variable name="hasmem"       select="($FilterNodeSet and $FilterNodeSet/@title='Memberships') or hithighlightedproperties/memberships/@hashh &gt; 0"/>
                      <xsl:variable name="haspp"        select="($FilterNodeSet and $FilterNodeSet/@title='SPShPastProjects') or hithighlightedproperties/pastprojects/@hashh &gt; 0"/>
                      <xsl:variable name="hasbol"       select="($FilterNodeSet and $FilterNodeSet/@title='SPShLocation') or hithighlightedproperties/baseofficelocation/@hashh &gt; 0"/>
                      <xsl:variable name="hassch"       select="($FilterNodeSet and $FilterNodeSet/@title='SPShSchool') or hithighlightedproperties/schools/@hashh &gt; 0"/>
                      <xsl:variable name="hassum"       select="count(hithighlightedsummary/c0) &gt; 0"/>

                      <xsl:variable name="hasvlm"       select="string-length(profileviewlastmonth) &gt; 0"/>
                      <xsl:variable name="hasvlw"       select="string-length(profileviewlastweek) &gt; 0"/>
                      <xsl:variable name="hasquery"     select="string-length(queriesfoundyou) &gt; 0"/>
    
                      <div id="UserPhoto{generate-id()}">
                        <a href="{ddwrt:EnsureAllowedProtocol(string($url))}" id="{concat($currentId, '_CSR_IMGL')}" title="{preferredname}">
                          <xsl:variable name="imgid" select="concat('CSR_IMG_',$id)"/>
                          <xsl:variable name="purl">
                            <xsl:call-template name="GetPicUrl">
                              <xsl:with-param name="PicUrl" select="pictureurl"/>
                              <xsl:with-param name="PlaceHolderUrl" select="'/_layouts/images/o14_person_placeholder_96.png'"/>
                            </xsl:call-template>
                          </xsl:variable>
                          <img id="{$imgid}" src="{ddwrt:EnsureAllowedProtocol(string($purl))}" alt="{preferredname}" border="0"></img>
                        </a>
                        <xsl:if test="$hascol">
                          <div id="ColleagueField">
                            <xsl:value-of select="colleaguecategory"/>
                          </div>
                        </xsl:if>
                      </div>
                      <span id="JBean{generate-id()}">
                        <xsl:choose>
                          <xsl:when test="$hassip">
                            <img alt="" border="0" height="12" width="12" src="/_layouts/images/imnhdr.gif" onload="{concat($prefix, $sip, $suffix)}" ShowOfflinePawn="1" id="{concat('CSRP_',$id,',type=sip')}" />
                          </xsl:when>
                          <xsl:otherwise>
                            <img alt="" border="0" height="12" width="12" src="/_layouts/images/imnhdr.gif" onload="{concat($prefix, $email, $suffix)}" ShowOfflinePawn="1" id="{concat('CSRP_',$id,',type=smtp')}" />
                          </xsl:otherwise>
                        </xsl:choose>
                      </span>
                      <div id="ContactInfo{generate-id()}">
                        <ul id="MiniContactCard{generate-id()}">
                          <li id="NameField{generate-id()}">
                            <xsl:if test="$haspn">
                              <a href="{ddwrt:EnsureAllowedProtocol(string($url))}" id="{concat($currentId, '_CSR')}">
                                <xsl:apply-templates select="hithighlightedproperties/preferredname" />
                              </a>
                            </xsl:if>
                          </li>
                          <xsl:if test="$hasydn">
                            <li id="YomiField">
                              <xsl:apply-templates select="hithighlightedproperties/yomidisplayname" />
                            </li>
                          </xsl:if>
                          <xsl:if test="$hasjt">
                            <li id="JobTitleField{generate-id()}">
                              <xsl:apply-templates select="hithighlightedproperties/jobtitle" />
                            </li>
                          </xsl:if>
                          <xsl:if test="$hasdp and not($hasorg)">
                            <li id="DepartmentField">
                              <xsl:apply-templates select="hithighlightedproperties/department" />
                            </li>
                          </xsl:if>
                          <xsl:if test="$hasorg">
                            <li id="OrgField">                    
                              <xsl:call-template name="RenderNameUrlMultivalue">
                                <xsl:with-param name="names" select="hithighlightedproperties/orgnames"/>
                                <xsl:with-param name="urls" select="orgurls_multival"/>
                                <xsl:with-param name="currentId" select="$currentId"/>
                              </xsl:call-template>          
                            </li>
                          </xsl:if>
                          <xsl:if test="$haswph">
                            <li id="PhoneField{generate-id()}">
                              <xsl:apply-templates select="hithighlightedproperties/workphone" />
                            </li>
                          </xsl:if>
                          <xsl:if test="$hasonum">
                            <li id="OfficeField{generate-id()}">
                              <xsl:apply-templates select="hithighlightedproperties/officenumber" />
                            </li>
                          </xsl:if>
                          <xsl:if test="$hassip or $hasemail">
                            <li id="EmailField{generate-id()}">
                              <xsl:choose>
                                <xsl:when test="$hassip">
                                  <a id="{concat($currentId, '_EmailLink')}" href="{concat('mailto:', $sip)}">
                                    <xsl:apply-templates select="hithighlightedproperties/sipaddress" />
                                  </a>
                                </xsl:when>
                                <xsl:otherwise>
                                  <a id="{concat($currentId, '_EmailLink')}" href="{concat('mailto:', $email)}">
                                    <xsl:apply-templates select="hithighlightedproperties/workemail" />
                                  </a>
                                </xsl:otherwise>
                              </xsl:choose>
                            </li>
                          </xsl:if>
                        </ul>

                        <xsl:if test="$hasacu or $hashier or $IsPeopleCoreResultsWebPart">
                          <ul id="Actions">        
                            <xsl:if test="$hasacu">
                              <li id="AddColleagueLinkField">
                                <a id="{concat($currentId, '_AddColleagueLink')}" href="{ddwrt:EnsureAllowedProtocol(string(addtomycolleaguesurl))}">&#187; <xsl:value-of select="$AddToMyColleaguesText" /></a>
                              </li>
                            </xsl:if>
                            <xsl:if test="$hashier">
                              <li id="OrgBrowserField">
                                <a id="{concat($currentId, '_OrgBrowserLink')}" href="{ddwrt:EnsureAllowedProtocol(string(hierarchyurl))}">&#187; <xsl:value-of select="$ViewHiearchyLabel" /></a>
                              </li>
                            </xsl:if>
                            <xsl:if test="$IsPeopleCoreResultsWebPart">
                              <li id="RecentContentField">
                                <a href="javascript:" ID="A1" runat="server" PreferredName="{preferredname}">
                                    <xsl:value-of select="concat('&#187; ', substring-before($RecentContentLabel, '{0}'), preferredname, substring-after($RecentContentLabel, '{0}'))"/>
                                </a>
                                <SEARCHWC:PopupControlExtender ID="PopupControlExtender1" runat="server"
                                TargetControlID="{concat('recentcontentlink_',$id)}"
                                PopupControlID="PopupPanelPeopleCore"
                                PopupShowingScript="{concat('PostbackUserName(this.get_element(),this._popupElement,&quot;',$RecentUpdateTabLabel,'&quot;)')}"
                                PopupHiddenScript=""
                                HoverDelay="500"
                                UnhoverDelay="500"/>
                              </li>
                            </xsl:if>
                          </ul>
                        </xsl:if>
                      </div>

                      <xsl:if test="$hasabme or $hasresp or $hassk or $hasint or $hasorgparent or $hasmem or $haspp or $hassch or $hasbol or $hassum">
                        <div id="MoreInfo{generate-id()}">
                          <ul>        
                            <xsl:if test="$hasabme">
                              <li>
                                <span id="FieldTitle">
                                  <xsl:value-of select="$AboutMeLabel" />
                                </span>
                                <xsl:apply-templates select="hithighlightedproperties/aboutme" />
                              </li>
                            </xsl:if>
                            <xsl:if test="$hasresp">
                              <li>
                                <span id="FieldTitle{generate-id()}">
                                  <xsl:value-of select="$ResponsibilitiesLabel" />
                                </span>          
                                <xsl:call-template name="RenderSimpleMultivalue">
                                  <xsl:with-param name="multivalue" select="hithighlightedproperties/responsibility"/>
                                  <xsl:with-param name="cutoff" select="5"/>
                                </xsl:call-template>
                              </li>
                            </xsl:if>
                            <xsl:if test="$hassk">
                              <li>
                                <span id="FieldTitle">
                                  <xsl:value-of select="$SkillsLabel" />
                                </span>          
                                <xsl:call-template name="RenderSimpleMultivalue">
                                  <xsl:with-param name="multivalue" select="hithighlightedproperties/skills"/>
                                  <xsl:with-param name="cutoff" select="5"/>
                                </xsl:call-template>
                              </li>
                            </xsl:if>
                            <xsl:if test="$hasint">
                              <li>
                                <span id="FieldTitle">
                                  <xsl:value-of select="$InterestsLabel" />
                                </span>          
                                <xsl:call-template name="RenderSimpleMultivalue">
                                  <xsl:with-param name="multivalue" select="hithighlightedproperties/interests"/>
                                  <xsl:with-param name="cutoff" select="5"/>
                                </xsl:call-template>
                              </li>
                            </xsl:if>
                            <xsl:if test="$hasorgparent">
                              <li>            
                                <span id="FieldTitle">
                                  <xsl:value-of select="$ParentOrgsLabel" />
                                </span>          
                                <span id="HotHH">
                                  <xsl:call-template name="RenderNameUrlMultivalue">
                                    <xsl:with-param name="names" select="hithighlightedproperties/orgparentnames"/>
                                    <xsl:with-param name="urls" select="orgparenturls_multival"/>
                                    <xsl:with-param name="currentId" select="$currentId"/>
                                  </xsl:call-template>
                                </span>
                              </li>
                            </xsl:if>
                            <xsl:if test="$hasmem">
                              <li>
                                <span id="FieldTitle">
                                  <xsl:value-of select="$MembershipLabel" />
                                </span>          
                                <xsl:call-template name="RenderSimpleMultivalue">
                                  <xsl:with-param name="multivalue" select="hithighlightedproperties/memberships"/>
                                  <xsl:with-param name="cutoff" select="5"/>
                                </xsl:call-template>
                              </li>
                            </xsl:if>
                            <xsl:if test="$haspp">
                              <li>
                                <span id="FieldTitle">
                                  <xsl:value-of select="$PastProjectsLabel" />
                                </span>          
                                <xsl:call-template name="RenderSimpleMultivalue">
                                  <xsl:with-param name="multivalue" select="hithighlightedproperties/pastprojects"/>
                                  <xsl:with-param name="cutoff" select="5"/>
                                </xsl:call-template>
                              </li>
                            </xsl:if>
                            <xsl:if test="$hassch">
                              <li>
                                <span id="FieldTitle">
                                  <xsl:value-of select="$SchoolLabel" />
                                </span>          
                                <xsl:call-template name="RenderSimpleMultivalue">
                                  <xsl:with-param name="multivalue" select="hithighlightedproperties/schools"/>
                                  <xsl:with-param name="cutoff" select="5"/>
                                </xsl:call-template>
                              </li>
                            </xsl:if>
                            <xsl:if test="$hasbol">
                              <li>
                                <span id="FieldTitle">
                                  <xsl:value-of select="$BaseOfficeLabel" />
                                </span>          
                                <xsl:apply-templates select="hithighlightedproperties/baseofficelocation" />
                              </li>
                            </xsl:if>
                            <xsl:if test="$hassum">
                              <li>
                                <span id="FieldTitle">
                                  <xsl:value-of select="$SummaryLabel" />
                                </span>
                                <xsl:apply-templates select="hithighlightedsummary" />
                              </li>
                            </xsl:if>
                          </ul>
                        </div>
                      </xsl:if>

                      <div id="Clear{generate-id()}">
                        <img src='/_layouts/images/blank.gif' alt=''/>
                      </div>

                      <xsl:if test="$hasvlm or $hasvlw or $hasquery">
                        <div id="SelfSrchHeading">
                          <table cellspacing="0" cellpadding="0">
                            <tr>
                              <td>
                                <xsl:value-of select="$SelfSearchLabel" />
                              </td>
                            </tr>
                          </table>
                        </div>

                        <div id="SelfSrchFreq">
                          <a id="{concat($currentId, '_EditProfileLink')}" href="{ddwrt:EnsureAllowedProtocol(string(editprofileurl))}"><xsl:value-of select="$UpdateProfileLabel" /></a>
                          <div id="SelfSrchFreqTitle">
                              <xsl:value-of select="$ProfileViewLabel" />
                          </div>      
                          <xsl:if test="$hasvlm and $hasvlw">
                            <ul>
                              <li>
                                <xsl:value-of disable-output-escaping="yes" select="profileviewlastmonth"/>
                              </li>
                              <li>
                                <xsl:value-of disable-output-escaping="yes" select="profileviewlastweek"/>
                              </li>
                            </ul>
                          </xsl:if>
                        </div>

                        <div id="SelfSrchTerms">
                          <a id="{concat($currentId, '_UpdateKeywordsLink')}" href="{ddwrt:EnsureAllowedProtocol(string(updatekeywordsurl))}"><xsl:value-of select="$UpdateProfileKeywordLabel" /></a>
                          <div id="SelfSrchTermsTitle">
                            <xsl:value-of select="$QueriesFoundYouLabel" />
                          </div>
                          <div id="SelfSrchTermsContent">
                            <xsl:choose>
                              <xsl:when test="$hasquery">
                                <xsl:call-template name="RenderSimpleMultivalue">
                                  <xsl:with-param name="multivalue" select="queriesfoundyou_multival"/>
                                  <xsl:with-param name="cutoff" select="5"/>
                                </xsl:call-template>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:value-of select="$NoKeywordLabel" />
                              </xsl:otherwise>
                            </xsl:choose>
                          </div>
                        </div>

                        <div id="Clear2">
                          <img src='/_layouts/images/blank.gif' alt=''/>
                        </div>
                      </xsl:if>
                    </xsl:template>  

                    <!-- XSL transformation starts here -->
                    <xsl:template match="/" xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime" xmlns:asp="http://schemas.microsoft.com/ASPNET/20" xmlns:SEARCHWC="http://schemas.microsoft.com/searchserver/">
                      <xsl:if test="$AlertMeLink and $ShowActionLinks">  
                       <input type="hidden" name="P_Query" />
                       <input type="hidden" name="P_LastNotificationTime" />
                      </xsl:if>

                      <div class="psrch-Main">
                        <xsl:choose>
                          <xsl:when test="$IsNoKeyword = 'True'" >
                            <xsl:call-template name="dvt_1.noKeyword" />
                          </xsl:when>
                          <xsl:when test="$ShowMessage = 'True'">
                            <xsl:call-template name="dvt_1.empty" />
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:call-template name="dvt_1.body"/>      
                          </xsl:otherwise>
                        </xsl:choose>

                        <xsl:if test="$IsPeopleCoreResultsWebPart and (count(All_Results/Result) &gt; 0 or count(All_Results/FakeResult) &gt; 0)">
                          <asp:Panel ID="PopupPanelPeopleCore" runat="server" CssClass="psrch-PopupPanel">                
                            <div id="PopupContainer" class="psrch-PopupContainer">          
                              <asp:UpdatePanel runat="server" ID="UpdatePanelPeopleCore" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                <ContentTemplate>              
                                  <SEARCHWC:PeopleCoreResultPopupControl
                                    id="PopupControl51A944753DF0430C8FE1EBAA70F3E945"
                                    runat="server"/>
            
                                  <div id="PopupFooter">
                                    <asp:UpdateProgress ID="UpdateProgress" DisplayAfter="0" AssociatedUpdatePanelID="UpdatePanelPeopleCore" runat="server">
                                      <ProgressTemplate>
                                        <span id="Progress">
                                          <img class="psrch-UpdateGraphics" src="/_layouts/images/hig_progcircle_loading24.gif"/>
                                          <xsl:value-of select="$PopupFetcingResultLabel" />
                                        </span>                  
                                      </ProgressTemplate>
                                    </asp:UpdateProgress>
                                  </div>
                                </ContentTemplate>            
                              </asp:UpdatePanel>
                            </div>
                          </asp:Panel>
                        </xsl:if>   

                      </div>
                    </xsl:template>



                    <xsl:template name="ActionBarTemplate">
                      <xsl:if test="string-length($AlertMeLink) &gt; 0">  
                        <a href="{$AlertMeLink}" id="CSR_AM" title="{$AlertMeText}">
                          <img src="/_layouts/images/bell.gif" alt="{$AlertMeText}" border="0"/>
                        </a>
                        <xsl:text disable-output-escaping="yes">&#8195;</xsl:text>
                      </xsl:if>

                      <xsl:if test="string-length($SrchRSSLink) &gt; 0">     
                        <a type="application/rss+xml" href="{ddwrt:EnsureAllowedProtocol(string($SrchRSSLink))}" title="{$SrchRSSText}" id="SRCHRSSL">
                          <img border="0" src="/_layouts/images/rss.gif" alt="{$SrchRSSText}"/>
                        </a>
                        <xsl:text disable-output-escaping="yes">&#8195;</xsl:text>
                      </xsl:if>

                      <xsl:if test="string-length($SearchProviderLink) &gt; 0">  
                        <a href="{ddwrt:EnsureAllowedProtocol(string($SearchProviderLink))}" title="{$SearchProviderText}" >
                          <img border="0" src="/_layouts/images/searchfolder.png" alt="{$SearchProviderText}"/>
                        </a>
                        <xsl:text disable-output-escaping="yes">&#8195;</xsl:text>
                      </xsl:if> 
                    </xsl:template>

                    <xsl:template name="GetPicUrl">
                      <xsl:param name="PicUrl"/>
                      <xsl:param name="PlaceHolderUrl"/>  
                      <xsl:choose>
                        <xsl:when test="string-length($PicUrl) &lt; 1 or starts-with($PicUrl, 'file:') or starts-with($PicUrl, '\\') or starts-with($PicUrl, '//')">
                          <xsl:value-of select="$PlaceHolderUrl"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="$PicUrl"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:template>

                    <xsl:template name="MoreLinkTemplate">
                      <xsl:if test="$ShowMoreLink = true() and string-length($MoreLink) &gt; 0">
                        <div id="MoreLink">
                          <a href="{ddwrt:EnsureAllowedProtocol(string($MoreLink))}">
                            <xsl:value-of select="$MoreLinkLabel"/>
                          </a>
                        </div>
                      </xsl:if>
                    </xsl:template>

                    <xsl:template name="RenderNameUrlMultivalue">
                      <xsl:param name="names"/>
                      <xsl:param name="urls"/>
                      <xsl:param name="currentId"/>
                      <xsl:for-each select="$names">
                        <xsl:variable name="p" select="position()"/>
                        <xsl:if test="string-length(.) &gt; 0">
      	                    <xsl:if test="$p &gt; 1">
                            <span class="psrch-TextSeparator"> :: </span>
                          </xsl:if>
      	                    <xsl:choose>
        	                    <xsl:when test="string-length($urls[$p]) &gt; 0">
                              <a id="{concat($currentId, '_MultivalueUrl')}" href="{ddwrt:EnsureAllowedProtocol(string($urls[$p]))}">
                                <xsl:apply-templates select="." />
                              </a>
                            </xsl:when>
        	                    <xsl:otherwise>
                              <xsl:apply-templates select="." />
                            </xsl:otherwise>
      	                    </xsl:choose>
                        </xsl:if>        
                      </xsl:for-each>
                    </xsl:template>

                    <xsl:template name="RenderSimpleMultivalue">
                      <xsl:param name="multivalue"/>
                      <xsl:param name="cutoff"/>
                      <xsl:for-each select="$multivalue">
                        <xsl:sort data-type="number" order="descending" select="@hashh"/>
                        <xsl:variable name="p" select="position()"/>
                        <xsl:if test="string-length(.) &gt; 0">
      	                    <xsl:choose>
        	                    <xsl:when test="$p = 1">
                              <span id="Multivalue">
                                <xsl:apply-templates select="." />
                              </span>
                            </xsl:when>
        	                    <xsl:when test="$p &gt; 1 and $p &lt;= $cutoff">
                              <span class="psrch-TextSeparator">
			                    <xsl:text xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime" ddwrt:whitespace-preserve="yes" xml:space="preserve"> </xsl:text>
			                    <xsl:text xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime" ddwrt:nbsp-preserve="yes" disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			                    :: </span>
                              <span id="Multivalue{generate-id()}"><xsl:apply-templates select="." /></span>
                            </xsl:when>
        	                    <xsl:when test="$p = $cutoff + 1">
                              &#8230;
                            </xsl:when>
      	                    </xsl:choose>
                        </xsl:if>
                      </xsl:for-each>
                    </xsl:template>

                    <xsl:template name="HitHighlighting"> 
                     <xsl:param name="hh" /> 
                     <xsl:apply-templates select="$hh"/> 
                    </xsl:template>

                    <xsl:template match="ddd"> 
                      &#8230;  
                    </xsl:template> 
                    <xsl:template match="c0"> 
                        <b><xsl:value-of select="."/></b>
                    </xsl:template> 
                    <xsl:template match="c1"> 
                        <b><xsl:value-of select="."/></b>
                    </xsl:template> 
                    <xsl:template match="c2"> 
                        <b><xsl:value-of select="."/></b>
                    </xsl:template> 
                    <xsl:template match="c3"> 
                        <b><xsl:value-of select="."/></b>
                    </xsl:template> 
                    <xsl:template match="c4"> 
                        <b><xsl:value-of select="."/></b>
                    </xsl:template> 
                    <xsl:template match="c5"> 
                        <b><xsl:value-of select="."/></b>
                    </xsl:template> 
                    <xsl:template match="c6"> 
                        <b><xsl:value-of select="."/></b>
                    </xsl:template> 
                    <xsl:template match="c7"> 
                        <b><xsl:value-of select="."/></b>
                    </xsl:template> 
                    <xsl:template match="c8"> 
                        <b><xsl:value-of select="."/></b>
                    </xsl:template> 
                    <xsl:template match="c9"> 
                        <b><xsl:value-of select="."/></b>
                    </xsl:template> 

                    </xsl:stylesheet>
                    </Xsl>
                    <DataFields>
                    </DataFields>
                </SEARCHWC:PeopleCoreResultsWebPart>
                <SEARCHWC:SearchPagingWebPart runat="server" __MarkupType="xmlmarkup" WebPart="true" __WebPartId="{9D208C7D-E4B9-48C4-93D1-3610C72DF0F7}" >
                    <WebPart xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://schemas.microsoft.com/WebPart/v2">
                        <Title>Search Paging</Title><FrameType>None</FrameType><Description>Display links for navigating pages containing search results.</Description><IsIncluded>true</IsIncluded><ZoneID>TopRow</ZoneID><PartOrder>10</PartOrder><FrameState>Normal</FrameState><Height /><Width /><AllowRemove>true</AllowRemove><AllowZoneChange>true</AllowZoneChange><AllowMinimize>true</AllowMinimize><AllowConnect>true</AllowConnect><AllowEdit>true</AllowEdit><AllowHide>true</AllowHide><IsVisible>true</IsVisible><DetailLink /><HelpLink /><HelpMode>Modeless</HelpMode><Dir>Default</Dir><PartImageSmall /><MissingAssembly>Cannot import this Web Part.</MissingAssembly><PartImageLarge /><IsIncludedFilter /><ExportControlledProperties>true</ExportControlledProperties><ConnectionID>00000000-0000-0000-0000-000000000000</ConnectionID><ID>g_9d208c7d_e4b9_48c4_93d1_3610c72df0f7</ID><_locDefinition>
                        <_locTag d3p1:_loc="locData" xmlns:d3p1="http://schemas.microsoft.com/WebPart/v2">Title</_locTag>
                        <_locTag d3p1:_loc="locData" xmlns:d3p1="http://schemas.microsoft.com/WebPart/v2">Description</_locTag>
                        </_locDefinition> <MaxBeforeCurrent xmlns="urn:schemas-microsoft-com:SearchPagingWebPart">4</MaxBeforeCurrent><MaxAfterCurrent xmlns="urn:schemas-microsoft-com:SearchPagingWebPart">3</MaxAfterCurrent><PreviousLinkUrl xmlns="urn:schemas-microsoft-com:SearchPagingWebPart">/_layouts/images/prev.png</PreviousLinkUrl><PreviousLinkRTL xmlns="urn:schemas-microsoft-com:SearchPagingWebPart">/_layouts/images/next.png</PreviousLinkRTL><NextLinkUrl xmlns="urn:schemas-microsoft-com:SearchPagingWebPart">/_layouts/images/next.png</NextLinkUrl><NextLinkRTL xmlns="urn:schemas-microsoft-com:SearchPagingWebPart">/_layouts/images/prev.png</NextLinkRTL><ShowMessages xmlns="urn:schemas-microsoft-com:SearchPagingWebPart">false</ShowMessages><QueryID xmlns="urn:schemas-microsoft-com:SearchPagingWebPart">Query1</QueryID>
                    </WebPart>
                </SEARCHWC:SearchPagingWebPart>
            </ZoneTemplate>
        </WebPartPages:WebPartZone>
    </div>
</div>
</asp:Content>