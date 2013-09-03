<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="CreateItem.aspx.cs" Inherits="Tavisca.PMD.Client.CreateItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Styles/DashBoardCSS.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="Scripts/CreateItem.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <form runat="server">
        <fieldset>
            <legend>Create New Item</legend>
            <label for="dashboardItemName">
                <span class="required">*</span>Item Name</label>
            <input name="dashboardItemName" id="dashboardItemName" class="txt" />
            <br />
            <label for="from">
                From</label>
            <input type="text" id="from" name="from" />
            <label for="to">
                to</label>
            <input type="text" id="to" name="to" />
            <button id="send" class="button">
                Create</button>
        </fieldset>
        <div>
        <fieldset class="left">
        <p>Enter Status :</p>
       <select id="itemStatus" class="">
                <option value="">Select A status</option>
            </select>
        </fieldset>
        <div id="sourcesDiv">
        <fieldset class="leftCol">
        <p>Sources:</p>
        <select id="sources" class="">
                <option value="">Select A source</option>
            </select>
        </fieldset>
        </div>
         <div id="teamsDiv">
        <fieldset class="leftCol">
        <p>Teams:</p>
        <select id="teams" class="">
                <option value="">Select A Team</option>
            </select>
        </fieldset>
        </div>
        </div>
    <input id="CompanyId" value="<%=CompanyId %>" type="hidden" />
        </form>
    </div>
</asp:Content>
