var United = United || {};

United.LeadershipDir = {};

United.LeadershipDir.IsMouseDownOnFilterIcon = false;
United.LeadershipDir.IsDepartmentFilterOpen = false;
United.LeadershipDir.IsTitleFilterOpen = false;
United.LeadershipDir.IsOfficeFilterOpen = false;
United.LeadershipDir.IsLeadershipGroupsFilterOpen = false;
United.LeadershipDir.IsSessionsAttendingFilterOpen = false;

United.LeadershipDir.DepartmentMultiSelect = null;
United.LeadershipDir.TitleMultiSelect = null;
United.LeadershipDir.OfficeMultiSelect = null;
United.LeadershipDir.LeadershipGroupsMultiSelect = null;
United.LeadershipDir.SessionsAttendingMultiSelect = null;

/*
NOTE: The following properties must be set.

United.LeadershipDir.DepartmentMultiSelectId
United.LeadershipDir.TitleMultiSelectId
United.LeadershipDir.OfficeMultiSelectId
United.LeadershipDir.LeadershipGroupsMultiSelectId
United.LeadershipDir.SessionsAttendingMultiSelectId
*/

United.LeadershipDir.FilterIconMouseDown = function () {
    United.LeadershipDir.IsMouseDownOnFilterIcon = true;
};

United.LeadershipDir.FilterIconMouseUp = function () {
    United.LeadershipDir.IsMouseDownOnFilterIcon = false;
};

United.LeadershipDir.AlignFilter = function (headerCell, multiSelectWidget) {
    var headerOuterHeight = headerCell.outerHeight(true);
    var headerOuterWidth = headerCell.outerWidth(true);
    var headerOffset = headerCell.offset();

    var widgetWidth = multiSelectWidget.outerWidth(true);

    multiSelectWidget
        .css("left", (headerOffset.left + headerOuterWidth - widgetWidth).toString() + "px")
        .css("top", (headerOffset.top + headerOuterHeight).toString() + "px");
};

United.LeadershipDir.ToggleTitleFilter = function () {
    if (United.LeadershipDir.IsTitleFilterOpen) {
        United.LeadershipDir.TitleMultiSelect.multiselect("close");
    } else {
        United.LeadershipDir.TitleMultiSelect.multiselect("open");
    }
};

United.LeadershipDir.ToggleDepartmentFilter = function () {
    if (United.LeadershipDir.IsDepartmentFilterOpen) {
        United.LeadershipDir.DepartmentMultiSelect.multiselect("close");
    } else {
        United.LeadershipDir.DepartmentMultiSelect.multiselect("open");
    }
};

United.LeadershipDir.ToggleOfficeFilter = function () {
    if (United.LeadershipDir.IsOfficeFilterOpen) {
        United.LeadershipDir.OfficeMultiSelect.multiselect("close");
    } else {
        United.LeadershipDir.OfficeMultiSelect.multiselect("open");
    }
};

United.LeadershipDir.ToggleLeadershipGroupsFilter = function () {
    if (United.LeadershipDir.IsLeadershipGroupsFilterOpen) {
        United.LeadershipDir.LeadershipGroupsMultiSelect.multiselect("close");
    } else {
        United.LeadershipDir.LeadershipGroupsMultiSelect.multiselect("open");
    }
};

United.LeadershipDir.ToggleSessionsAttendingFilter = function () {
    if (United.LeadershipDir.IsSessionsAttendingFilterOpen) {
        United.LeadershipDir.SessionsAttendingMultiSelect.multiselect("close");
    } else {
        United.LeadershipDir.SessionsAttendingMultiSelect.multiselect("open");
    }
};

United.LeadershipDir.DepartmentFilterChanged = function () {
    United.LeadershipDir.FilterTable();
    United.LeadershipDir.AlignFilter($("#LeadershipDirectory th.departmentCell"), United.LeadershipDir.DepartmentMultiSelect.multiselect("widget"));
    United.LeadershipDir.BuildMiniProfiles();
};

United.LeadershipDir.TitleFilterChanged = function () {
    United.LeadershipDir.FilterTable();
    United.LeadershipDir.AlignFilter($("#LeadershipDirectory th.titleCell"), United.LeadershipDir.TitleMultiSelect.multiselect("widget"));
    United.LeadershipDir.BuildMiniProfiles();
};

United.LeadershipDir.OfficeFilterChanged = function () {
    United.LeadershipDir.FilterTable();
    United.LeadershipDir.AlignFilter($("#LeadershipDirectory th.officeCell"), United.LeadershipDir.OfficeMultiSelect.multiselect("widget"));
    United.LeadershipDir.BuildMiniProfiles();
};

United.LeadershipDir.LeadershipGroupsFilterChanged = function () {
    United.LeadershipDir.FilterTable();
    United.LeadershipDir.AlignFilter($("#LeadershipDirectory th.leadershipGroupsCell"), United.LeadershipDir.LeadershipGroupsMultiSelect.multiselect("widget"));
    United.LeadershipDir.BuildMiniProfiles();
};

United.LeadershipDir.SessionsAttendingFilterChanged = function () {
    United.LeadershipDir.FilterTable();
    United.LeadershipDir.AlignFilter($("#LeadershipDirectory th.sessionsAttendingCell"), United.LeadershipDir.SessionsAttendingMultiSelect.multiselect("widget"));
    United.LeadershipDir.BuildMiniProfiles();
};

United.LeadershipDir.FilterTable = function () {
    var selectedDepartments = United.LeadershipDir.DepartmentMultiSelect.multiselect("getChecked").map(function () { return this.value; }).get();
    var selectedTitles = United.LeadershipDir.TitleMultiSelect.multiselect("getChecked").map(function () { return this.value; }).get();
    var selectedOffices = United.LeadershipDir.OfficeMultiSelect.multiselect("getChecked").map(function () { return this.value; }).get();
    var selectedLeadershipGroups = United.LeadershipDir.LeadershipGroupsMultiSelect.multiselect("getChecked").map(function () { return this.value; }).get();
    var selectedSessionsAttending = United.LeadershipDir.SessionsAttendingMultiSelect.multiselect("getChecked").map(function () { return this.value; }).get();

    var rows = $("#LeadershipDirectory table.leaders tbody tr");

    var visibleRows = 0;

    for (var i = 0; i < rows.length; i++) {
        var row = rows[i];
        var titleCellValue = $(row.cells[2]).text();
        var departmentCellValue = $(row.cells[3]).text();
        var officeCellValue = $(row.cells[4]).text();
        var leadershipGroupsCellValue = $(row.cells[7]).html();
        var sessionsAttendingCellValue = $(row.cells[8]).html();

        if ($.inArray(departmentCellValue, selectedDepartments) != -1 &&
            $.inArray(titleCellValue, selectedTitles) != -1 &&
            $.inArray(officeCellValue, selectedOffices) != -1 &&
            $(selectedLeadershipGroups).filter(function() { return leadershipGroupsCellValue.toLowerCase().indexOf(this.toLowerCase()) >= 0; }).length > 0 &&
            $(selectedSessionsAttending).filter(function () {
                if (this == "") {
                    return sessionsAttendingCellValue == "";
                }
                
                return sessionsAttendingCellValue.toLowerCase().indexOf(this.toLowerCase()) >= 0;
            }).length > 0) {

            if (++visibleRows % 2 == 0) {
                $(row)
                    .removeClass("odd")
                    .addClass("even");
            } else {
                $(row)
                    .removeClass("even")
                    .addClass("odd");
            }

            $(row).show();
        } else {
            $(row).hide();
        }
    }
};

United.LeadershipDir.BuildMiniProfiles = function () {
    var leadershipDirectory = $("#LeadershipDirectory");
    var visibleRows = $(leadershipDirectory).find("table.leaders tbody tr:visible");

    leadershipDirectory.find("table.miniProfilePage").remove();

    var profilesPerPage = 8;

    for (var i = 0; i < visibleRows.length; i++) {
        var row = visibleRows[i];

        var miniProfilePage;

        var indexOnPage = i % profilesPerPage;
        var rowOnPage = Math.floor(indexOnPage / 2) + 1;
        var columnOnPage = (indexOnPage % 2) + 1;

        if (indexOnPage == 0) {
            miniProfilePage = $("<table class=\"miniProfilePage\"><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr></table>");
            miniProfilePage.find("td").css("visibility", "hidden");
            leadershipDirectory.append(miniProfilePage);
        }

        var miniProfile = United.LeadershipDir.BuildMiniProfile(row);
        var miniProfileContainer = $(miniProfilePage).find("tr:nth-child(" + rowOnPage + ") td:nth-child(" + columnOnPage + ")");
        
        if (!!$.trim(miniProfile)) {
            miniProfileContainer.html(miniProfile);
            miniProfileContainer.css("visibility", "visible");
        }
    }
};

United.LeadershipDir.BuildMiniProfile = function (row) {
    var pictureCellValue = $(row.cells[0]).html();
    var nameCellValue = $(row.cells[1]).text();
    var titleCellValue = $(row.cells[2]).text();
    var departmentCellValue = $(row.cells[3]).text();
    var officeCellValue = $(row.cells[4]).text();
    var managerCellValue = $(row.cells[5]).text();
    var hireDateCellValue = $(row.cells[6]).text();
    var sessionsAttendingCellValue = $(row.cells[8]).html();

    var miniProfile = "";
    
    if (!!$.trim(nameCellValue)) {
        if (!!$.trim(pictureCellValue)) {
            miniProfile += "<div class=\"mpPicture\">" + pictureCellValue + "</div>";
        }

        miniProfile += "<div class=\"mpName\">" + nameCellValue + "</div>";
        miniProfile += "<div class=\"mpTitle\">" + titleCellValue + "</div>";
        miniProfile += "<div class=\"mpDepartment\">" + departmentCellValue + "</div>";
        miniProfile += "<div class=\"mpOffice\">" + officeCellValue + "</div>";

        if (!!$.trim(managerCellValue)) {
            miniProfile += "<div class=\"mpManager\">" + managerCellValue + " (Manager)</div>";
        }

        if (!!$.trim(hireDateCellValue)) {
            miniProfile += "<div class=\"mpHireDate\">Hired on " + hireDateCellValue + "</div>";
        }

        if (!!$.trim(sessionsAttendingCellValue)) {
            miniProfile += "<div class=\"mpSessionsAttending\">" + sessionsAttendingCellValue.replace("<br>", " &amp; ") + " Session</div>";
        }
    }

    return miniProfile;
};

$(document).ready(function () {
    United.LeadershipDir.DepartmentMultiSelect = $("#" + United.LeadershipDir.DepartmentMultiSelectId).multiselect({
        height: 270,
        beforeopen: function () {
            United.LeadershipDir.LeadershipGroupsMultiSelect.multiselect("close");
            United.LeadershipDir.OfficeMultiSelect.multiselect("close");
            United.LeadershipDir.SessionsAttendingMultiSelect.multiselect("close");
            United.LeadershipDir.TitleMultiSelect.multiselect("close");
        },
        open: function () {
            United.LeadershipDir.AlignFilter($("#LeadershipDirectory th.departmentCell"), United.LeadershipDir.DepartmentMultiSelect.multiselect("widget"));

            United.LeadershipDir.IsDepartmentFilterOpen = true;
        },
        beforeclose: function () {
            return !United.LeadershipDir.IsMouseDownOnFilterIcon;
        },
        close: function () {
            United.LeadershipDir.IsDepartmentFilterOpen = false;
        },
        click: United.LeadershipDir.DepartmentFilterChanged,
        checkAll: United.LeadershipDir.DepartmentFilterChanged,
        uncheckAll: United.LeadershipDir.DepartmentFilterChanged,
    });

    United.LeadershipDir.TitleMultiSelect = $("#" + United.LeadershipDir.TitleMultiSelectId).multiselect({
        height: 270,
        beforeopen: function () {
            United.LeadershipDir.DepartmentMultiSelect.multiselect("close");
            United.LeadershipDir.LeadershipGroupsMultiSelect.multiselect("close");
            United.LeadershipDir.OfficeMultiSelect.multiselect("close");
            United.LeadershipDir.SessionsAttendingMultiSelect.multiselect("close");
        },
        open: function () {
            United.LeadershipDir.AlignFilter($("#LeadershipDirectory th.titleCell"), United.LeadershipDir.TitleMultiSelect.multiselect("widget"));

            United.LeadershipDir.IsTitleFilterOpen = true;
        },
        beforeclose: function () {
            return !United.LeadershipDir.IsMouseDownOnFilterIcon;
        },
        close: function () {
            United.LeadershipDir.IsTitleFilterOpen = false;
        },
        click: United.LeadershipDir.TitleFilterChanged,
        checkAll: United.LeadershipDir.TitleFilterChanged,
        uncheckAll: United.LeadershipDir.TitleFilterChanged,
    });

    United.LeadershipDir.LeadershipGroupsMultiSelect = $("#" + United.LeadershipDir.LeadershipGroupsMultiSelectId).multiselect({
        height: "auto",
        beforeopen: function () {
            United.LeadershipDir.DepartmentMultiSelect.multiselect("close");
            United.LeadershipDir.OfficeMultiSelect.multiselect("close");
            United.LeadershipDir.SessionsAttendingMultiSelect.multiselect("close");
            United.LeadershipDir.TitleMultiSelect.multiselect("close");
        },
        open: function () {
            United.LeadershipDir.AlignFilter($("#LeadershipDirectory th.leadershipGroupsCell"), United.LeadershipDir.LeadershipGroupsMultiSelect.multiselect("widget"));

            United.LeadershipDir.IsLeadershipGroupsFilterOpen = true;
        },
        beforeclose: function () {
            return !United.LeadershipDir.IsMouseDownOnFilterIcon;
        },
        close: function () {
            United.LeadershipDir.IsLeadershipGroupsFilterOpen = false;
        },
        click: United.LeadershipDir.LeadershipGroupsFilterChanged,
        checkAll: United.LeadershipDir.LeadershipGroupsFilterChanged,
        uncheckAll: United.LeadershipDir.LeadershipGroupsFilterChanged,
    });

    United.LeadershipDir.OfficeMultiSelect = $("#" + United.LeadershipDir.OfficeMultiSelectId).multiselect({
        height: 270,
        beforeopen: function () {
            United.LeadershipDir.DepartmentMultiSelect.multiselect("close");
            United.LeadershipDir.LeadershipGroupsMultiSelect.multiselect("close");
            United.LeadershipDir.SessionsAttendingMultiSelect.multiselect("close");
            United.LeadershipDir.TitleMultiSelect.multiselect("close");
        },
        open: function () {
            United.LeadershipDir.AlignFilter($("#LeadershipDirectory th.officeCell"), United.LeadershipDir.OfficeMultiSelect.multiselect("widget"));

            United.LeadershipDir.IsOfficeFilterOpen = true;
        },
        beforeclose: function () {
            return !United.LeadershipDir.IsMouseDownOnFilterIcon;
        },
        close: function () {
            United.LeadershipDir.IsOfficeFilterOpen = false;
        },
        click: United.LeadershipDir.OfficeFilterChanged,
        checkAll: United.LeadershipDir.OfficeFilterChanged,
        uncheckAll: United.LeadershipDir.OfficeFilterChanged,
    });

    United.LeadershipDir.SessionsAttendingMultiSelect = $("#" + United.LeadershipDir.SessionsAttendingMultiSelectId).multiselect({
        height: "auto",
        beforeopen: function () {
            United.LeadershipDir.DepartmentMultiSelect.multiselect("close");
            United.LeadershipDir.LeadershipGroupsMultiSelect.multiselect("close");
            United.LeadershipDir.OfficeMultiSelect.multiselect("close");
            United.LeadershipDir.TitleMultiSelect.multiselect("close");
        },
        open: function () {
            United.LeadershipDir.AlignFilter($("#LeadershipDirectory th.sessionsAttendingCell"), United.LeadershipDir.SessionsAttendingMultiSelect.multiselect("widget"));

            United.LeadershipDir.IsSessionsAttendingFilterOpen = true;
        },
        beforeclose: function () {
            return !United.LeadershipDir.IsMouseDownOnFilterIcon;
        },
        close: function () {
            United.LeadershipDir.IsSessionsAttendingFilterOpen = false;
        },
        click: United.LeadershipDir.SessionsAttendingFilterChanged,
        checkAll: United.LeadershipDir.SessionsAttendingFilterChanged,
        uncheckAll: United.LeadershipDir.SessionsAttendingFilterChanged,
    });

    United.LeadershipDir.BuildMiniProfiles();
});