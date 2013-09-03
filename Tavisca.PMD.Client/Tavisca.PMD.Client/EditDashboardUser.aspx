﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditDashboardUser.aspx.cs"
    MasterPageFile="~/Main.Master" Inherits="Tavisca.PMD.Client.EditDashboardUser" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="Scripts/EditDashboardUser.js"></script>
    <link rel="stylesheet" type="text/css" media="all" href="Styles/EditdashboardUser.css" />
    <link rel="stylesheet" type="text/css" media="all" href="Styles/DashboardGrid.css" />
    <script type="text/javascript" src="Scripts/jquery.tokeninput.js"></script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <div class="textarea" style="width: 400px; height: auto; border-style: inset">
        <input type="text" id="AddUserTextArea" class="addUser" name="blah" />
        <input type="button" value="Add User(s)" class="AddToExistingList" />
    </div>
    <form id="Form1" runat="server">
    <div class="EditdashboardUserContainer" id="EditdashboardUserContainer">
    </div>
    <input type="button" id="send" value="Submit" />
    </form>
      <input id="CompanyId" value="<%=CompanyId %>" type="hidden"/>
       <input id="AccessRight" value="<%=AccessRight%>" type="hidden" />
</asp:Content>
