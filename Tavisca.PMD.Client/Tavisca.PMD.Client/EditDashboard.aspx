<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="EditDashboard.aspx.cs" Inherits="Tavisca.PMD.Client.EditDashboard1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <ul>
    <li><a href="DashboardItems.aspx?id=<%=dashboardID %>" >Status</a></li>
    <li><a href="DashboardDescription.aspx?id=<%=dashboardID %>">Sources</a></li>
    <li><a href="EditDashboardUser.aspx?id=<%=dashboardID %>">User Details</a></li>
    <li><a href="DashboardItemTeams.aspx?id=<%=dashboardID %>">Team Details</a></li>
    <li><a href="DashboardItemTeams.aspx?id=<%=dashboardID %>">Team Details</a></li>
  </ul>
</asp:Content>
