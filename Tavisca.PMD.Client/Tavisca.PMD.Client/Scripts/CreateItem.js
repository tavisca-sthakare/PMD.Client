function EditItemCall(result) {
    document.getElementById("dashboardItemName").value = result.ItemName;
    var from = new Date(parseInt(result.StartDate.substr(6)));
    document.getElementById("from").value = from.getDate() + "/" + from.getMonth() + "/" + from.getFullYear();
    var to= new Date(parseInt(result.EndDate.substr(6)));
    document.getElementById("to").value = to.getDate() + "/" + to.getMonth() + "/" + to.getFullYear();
    $('itemStatus option[value="' + result.StatusID + '"]').attr("selected", true);
  // document.getElementById("itemStatus").value= result.StatusID;
    for (var i = 0; i < result.Sources.length; i++) {
        var selectedSourceID = result.Sources[i].SourceID;
        var selectedSourceText = result.Sources[i].Source;
        var newSource = '<div class="source" id="source' + selectedSourceID + '" data-id="' + selectedSourceID + '">' + selectedSourceText + '</div>';
        $("#sourcesDiv").append(newSource);
        $("#source" + selectedSourceID).append('<asp:Button class="DeleteButton" Id="DeleteButton' + selectedSourceID + '" runat="server" style="border-style:outset;width:30px">X</asp:button>');
    }
    for (var i = 0; i < result.WorkingTeams.length; i++) {
        var selectedTeamID = result.WorkingTeams[i].TeamID;
        var selectedTeamText = result.WorkingTeams[i].TeamName;
        var newSource = '<div class="team" id="team' + selectedTeamID + '" data-id="' + selectedTeamID + '">' + selectedTeamText + '</div>';
        $("#teamsDiv").append(newSource);
        $("#team" + selectedTeamID).append('<asp:Button class="DeleteButton" Id="DeleteButton' + selectedTeamID + '" runat="server" style="border-style:outset;width:30px">X</asp:button>');
    }
}
function GetTeams(GetTeams) {
    var newOption = "";
    for (var i = 0; i < GetTeams.length; i++) {
        newOption = "<option value='" + GetTeams[i].TeamID + "'>" + GetTeams[i].TeamName + "</option>";
        $("#teams").append(newOption);
    }
}
function GetStatusList(GetStatusList) {
    var newOption = "";
    for (var i = 0; i < GetStatusList.length; i++) {
        newOption = "<option value='" + GetStatusList[i].StatusID + "'>" + GetStatusList[i].Status + "</option>";
        $("#itemStatus").append(newOption);
    }
}
function GetSourcesList(GetSourcesList) {
    var newOption = "";
    for (var i = 0; i < GetSourcesList.length; i++) {
        newOption = "<option value='" + GetSourcesList[i].SourceID + "'>" + GetSourcesList[i].Source + "</option>";
        $("#sources").append(newOption);
    }
}
function ServiceSucceeded(result, functionName) {
    //alert("success");
}
function ServiceFailed(result, functionName) {
    alert("Error:");
}
function CallAjax(varUrl, vartype, jData, functionName) {
    $.ajax({
        cache: false,
        type: vartype,
        async: false,
        dataType: "json",
        data: JSON.stringify(jData),
        contentType: "application/json",
        url: varUrl,
        success: function (result) {
            ServiceSucceeded(result, functionName);
            if (functionName == "GetTeams")
                GetTeams(result);
            else if (functionName == "GetStatusList")
                GetStatusList(result);
            else if (functionName == "GetSourcesList")
                GetSourcesList(result);
            else if (functionName == "EditItemCall")
                EditItemCall(result);
        },
        error: function (result) {
            ServiceFailed(result, functionName);
        }
    });
}
function GetAllTeamsInCompany() {
    var CompanyId = document.getElementById("CompanyId").value;
    var GetTeamsUrl = "http://localhost:45475/TeamsOperations.svc/TeamsOperations/RetreiveTeams/" + CompanyId;
    var jData = {};
    CallAjax(GetTeamsUrl, "GET", jData, "GetTeams");
}
function GetStatusListOfDashboard(DashboardID) {
    //var DashboardID = window.location.search.substring(1).split("=");
    var GetStatusListUrl = "http://localhost:45475/DashboardService.svc/DashboardItemOperations/GetStatusList/" + DashboardID;
    var jData = {};
    CallAjax(GetStatusListUrl, "GET", jData, "GetStatusList");
}
function GetSourcesListOfDashboard(DashboardID) {
    //var DashboardID = window.location.search.substring(1).split("=");
    var GetSourcesListUrl = "http://localhost:45475/DashboardService.svc/DashboardItemOperations/GetSourcesList/" + DashboardID;
    var jData = {};
    CallAjax(GetSourcesListUrl, "GET", jData, "GetSourcesList");
}

$(document).ready(function () {
    var urlData = window.location.search.substring(1).split("&");
    var dashboardID = "";
    var item = {};
    var itemID = "";
    if (urlData.length == 2) {
        DashboardID = urlData[0].split("=")[1];
        itemID = urlData[1].split("=")[1];
        item.ItemID = itemID;
        var jData = {};
        var GetItemUrl = 'http://localhost:45475/DashboardService.svc/DashboardItemOperations/RetreiveDashboardItem/id=' + itemID;
        CallAjax(GetItemUrl, "GET", jData, "EditItemCall");
    }
    else {
        item.ItemID = 0;
        DashboardID = urlData[0].split("=")[1];
    }
    GetAllTeamsInCompany();
    GetStatusListOfDashboard(DashboardID);
    GetSourcesListOfDashboard(DashboardID);
    $("#sources").change(function () {
        var selectedSourceID = $("#sources").val();
        var selectedSourceText = $("#sources option:selected").text();
        var sourceIDs = $(".source").map(function () { return $(this).data("id"); }).get();
        if (jQuery.inArray(parseInt(selectedSourceID), sourceIDs) == -1) {
            var newSource = '<div class="source" id="source' + selectedSourceID + '" data-id="' + selectedSourceID + '">' + selectedSourceText + '</div>';
            $("#sourcesDiv").append(newSource);
            $("#source" + selectedSourceID).append('<asp:Button class="DeleteButton" Id="DeleteButton' + selectedSourceID + '" runat="server" style="border-style:outset;width:30px">X</asp:button>');
        }
    });
    $("#teams").change(function () {
        var selectedTeamID = $("#teams").val();
        var selectedTeamText = $("#teams option:selected").text();
        var teams = $(".team").map(function () { return $(this).data("id"); }).get();
        if (jQuery.inArray(parseInt(selectedTeamID), teams) == -1) {
            var newTeam = '<div class="team" id="team' + selectedTeamID + '" data-id="' + selectedTeamID + '">' + selectedTeamText + '</div>';
            $("#teamsDiv").append(newTeam);
            $("#team" + selectedTeamID).append('<asp:Button class="DeleteButton" Id="DeleteButton' + selectedTeamID + '" runat="server" style="border-style:outset;width:30px">X</asp:button>');
        }
    });
    $("#send").on("click", function () {
        item.ItemName = $("#dashboardItemName").val();
        var from = new Date($("#from").val());
        var to = new Date($("#to").val());
        item.StartDate = "/Date(" + from.getTime() + ")/";
        item.EndDate = "/Date(" + to.getTime() + ")/";
        item.DashboardID = DashboardID;
        item.StatusID = $("#itemStatus").val();
        var sourceIDs = $(".source").map(function () { return $(this).data("id"); }).get();
        var teams = $(".team").map(function () { return $(this).data("id"); }).get();
        var jData = {};
        jData.Item = item;
        jData.Sources = sourceIDs;
        jData.WorkingTeams = teams;
        var CreateDashboardItemUrl = "http://localhost:45475/DashboardService.svc/DashboardItemOperations/AddDashboardItem";
        CallAjax(CreateDashboardItemUrl, "POST", jData, "AddDashboardItem");
        //window.location.href = 'DashboardItems.aspx?id=' + DashboardID;
        window.location.href = "DashboardItems.aspx?id=" + DashboardID;
    });
    $(".DeleteButton").live("click", "button", function () {
        var UserDataId = $(this).parent().attr("id");
        $('#' + UserDataId).remove();
    });
});
