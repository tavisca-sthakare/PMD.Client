<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Teams.aspx.cs" MasterPageFile="~/Main.Master"
    Inherits="Tavisca.PMD.Client.Teams" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="Scripts/Teams.js"></script>
    <link rel="stylesheet" type="text/css" media="all" href="Styles/EditdashboardUser.css" />
    <script type="text/javascript" src="Scripts/jquery.tokeninput.js"></script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<div class="textarea" style="width: 400px; height: auto; border-style: inset">
        <input type="text" id="txtTeamName" class="addUser" name="blah" />
        <input type="button" value="Add Teams" class="AddToExistingList" />
    </div>
    <form id="form1" runat="server">
    <span class="failureNotification">
        <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
    </span>
    <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="failureNotification"
        ValidationGroup="RegisterUserValidationGroup" />
    <div class="accountInfo">
        <%--<fieldset class="register">
            <legend>Team Imformation</legend>
            <p>
                <asp:Label ID="LblTeamName" runat="server" AssociatedControlID="TxtTeamName">Team Name</asp:Label>
                <asp:TextBox ID="TxtTeamName" runat="server" CssClass="textEntry" Width="192px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="TeamNameRequired" runat="server" ControlToValidate="TxtTeamName"
                    CssClass="failureNotification" ErrorMessage="Team Name is required." ToolTip="Team Name is required."
                    ValidationGroup="TeamValidationGroup">*</asp:RequiredFieldValidator>
            </p>
        </fieldset>--%>
        <%--<div class="ButtonDiv">
            <p class="ButtonDiv">
                <asp:Button ID="CreateTeamButton" runat="server" Text="CreateTeam" ValidationGroup="RegisterUserValidationGroup"
                    OnClick="CreateTeamButton_Click" Width="90px" />
                <asp:Button ID="CancelButton" runat="server" Text="Cancel" OnClick="CancelButton_Click"
                    Width="90px" />
            </p>
        </div>--%>
    </div>
    <div class="EditdashboardUserContainer" id="teamsContainer">
    </div>
    <input type="button" id="send" value="Submit" />
    </form>
    <input id="companyID" value="<%=companyID%>" type="hidden"/>
</asp:Content>
