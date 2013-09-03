$(document).ready(function () {
    Global();
});
var Global = function () {
    ready();
    this.counterForNewTeams = 1000;
    function ServiceSucceeded(teams) {
        var NumberOfTeams = teams.length;
        var i = 0;
        $('#teamsContainer').append('<div Id="Header"style="height:30pt;width:100%;border-style:outset;float:left;margin-right:10px; margin-bottom:10px;text-align:center;color:Black;font-size:large"></div>');
        $('#Header').append('<asp:Label class="UserNameTitle" Id="UserNameLabel" runat="server" >Team Name</asp:Label>');
        //$('#Header').append('<asp:Label class="DeleteButton" Id="DeleteLabel" runat="server" style="width:75px" >Delete</asp:Label>');
        for (i = 0; i < NumberOfTeams; i++) {
            var teamName = teams[i].TeamName;
            var teamID = teams[i].TeamID;
            $('#teamsContainer').append('<div class="Userdata" Id="teamID' + i + '"style="height:30pt;width:100%;border-style:outset;float:left;margin-right:10px; margin-bottom:10px;text-align:center;color:Black;font-size:large"></div>');
            $("#teamID" + i).append('<div Id="UserName" class="UserName" data-id="' + teamID + '" runat="server">' + teamName + '</div>');
            //$("#teamID" + i).append('<asp:Button class="DeleteButton" Id="DeleteButton' + i + '" runat="server" style="border-style:outset;width:30px">X</asp:button>');
        }
        alert("sucess!!");
    }
    function ServiceFailed(result) {
        alert("Error:");
    }
    function CallAjax(varUrl, vartype) {
        $.ajax({
            cache: false,
            type: "GET",
            async: false,
            dataType: "json",
            url: varUrl,
            success: function (result) {
                ServiceSucceeded(result);
                teamsInDatabase = result;
            },
            error: function (result) {
                ServiceFailed(result);
            }
        });
    }
    function ServiceSucceededPost(result) {
        alert("Team Added:");
    }
    function ServiceFailedPost(result) {
        alert("Error:");
    }
    function CallAjaxPost(varUrl, vartype, jData) {
        $.ajax({
            cache: false,
            type: vartype,
            async: false,
            dataType: "json",
            data: JSON.stringify(jData),
            contentType: "application/json",
            url: varUrl,
            success: function (result) {
                ServiceSucceededPost(result);
            },
            error: function (result) {
                ServiceFailedPost(result);
            }
        });
    }
    function ready() {
        var search_string = window.location.search.substring(1);
        var DashboardID = search_string.split("=");
        var incoming_dashboard_rights = {};
        var AutoCompleteList = {};
        var companyID = document.getElementById("companyID").value;
        var getTeams = "http://localhost:45475/TeamsOperations.svc/TeamsOperations/RetreiveTeams/" + companyID;
        this.teamsInDatabase = "";
        CallAjax(getTeams, "GET");
        $("#send").on("click", function () {
            //code to retreive teamlist
            var teams = [];
            var names = document.getElementsByClassName("UserName");
            var idTosend = $(".UserName").map(function () {
                return $(this).data("id");
            }).get();
            var l = teamsInDatabase.length;
            for (; l < names.length; l++) {
                teams.push({ TeamID: idTosend[l], TeamName: names[l].innerHTML, CompanyID: companyID });
            }
            var jData = {};
            jData.teamsToAdd = teams;
            var AddTeamUrl = "http://localhost:45475/TeamsOperations.svc/TeamsOperations/AddTeams";
            CallAjaxPost(AddTeamUrl, "POST", jData);
        });
        $(".AddToExistingList").click(function () {
            var teamNameEntered = document.getElementById("txtTeamName").value;
            document.getElementById("txtTeamName").value = "";
            $('#teamsContainer').append('<div class="Userdata" Id="teamID' + counterForNewTeams + '"style="height:30pt;width:100%;border-style:outset;float:left;margin-right:10px; margin-bottom:10px;text-align:center;color:Black;font-size:large"></div>');
            $("#teamID" + counterForNewTeams).append('<div Id="UserName" class="UserName" data-id="' + counterForNewTeams + '" runat="server">' + teamNameEntered + '</div>');
            //$("#teamID" + counterForNewTeams).append('<asp:Button class="DeleteButton" Id="DeleteButton' + counterForNewTeams + '" runat="server" style="border-style:outset;width:30px">X</asp:button>');
            counterForNewTeams++;
        });
        $(".DeleteButton").live("click", "button", function () {
            var UserDataId = $(this).parent().attr("id");
            $('#' + UserDataId).remove();
        });
    }
}