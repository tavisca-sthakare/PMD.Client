<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateNewDashboard.aspx.cs"
    MasterPageFile="~/Main.Master" Inherits="Tavisca.PMD.Client.CreateNewDashboard" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="Scripts/DashboardHome.js"></script>
    <link rel="stylesheet" type="text/css" media="all" href="Styles/styleDashboardPopUp.css" />
    <link rel="stylesheet" type="text/css" media="all" href="fancybox/jquery.fancybox.css" />
    <link rel="stylesheet" type="text/css" href="Styles/CreateNewDashboard.css" />
    <script type="text/javascript" src="fancybox/jquery.fancybox.js?v=2.0.6"></script>
    <script type="text/javascript" src="Scripts/custom.js"></script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <form id="CreateDashboard" name="CreateDashboard" action="#" method="post" runat="server">
    <div id="FieldsetContainerdiv" class="FieldsetContainerdiv">
        <fieldset>
            <legend>Create your Dashboard</legend>
            <div class="LabelContainer">
                <label for="dashboardName" style="height: 20px">
                    <span class="required">*</span> Enter Dashboard Name</label>
                <div class="spacewithinlabel">
                </div>
                <label for="comments">
                    <span class="required">*</span>Start Month</label>
                <div class="spacewithinlabel">
                </div>
                <label for="comments">
                    <span class="required">*</span>Start Year</label>
                <div class="spacewithinlabel">
                </div>
                <label for="comments">
                    <span class="required">*</span>End Month</label>
                <div class="spacewithinlabel">
                </div>
                <label for="comments">
                    <span class="required">*</span>End Year</label>
                <div class="spacewithinlabel">
                </div>
                <label for="comments">
                    <span class="required"></span>Description</label>
            </div>
            <div class="TextContainer">
            <asp:TextBox id="dashboardName" class="txt" runat="server" ></asp:TextBox>
               <%-- <input name="dashboardName" id="dashboardName" class="txt" />--%>
                <div class="space">
                </div>
                <asp:DropDownList runat="server" ID="startMonth" class="DateDropDown">
                        <asp:ListItem value="1">1</asp:ListItem>
                    <asp:ListItem value="2">2</asp:ListItem>
                    <asp:ListItem value="3">3</asp:ListItem>
                    <asp:ListItem value="4">4</asp:ListItem>
                    <asp:ListItem value="5">5</asp:ListItem>
                    <asp:ListItem value="6">6</asp:ListItem>
                    <asp:ListItem value="7">7</asp:ListItem>
                    <asp:ListItem value="8">8</asp:ListItem>
                    <asp:ListItem value="9">9</asp:ListItem>
                    <asp:ListItem value="10">10</asp:ListItem>
                    <asp:ListItem value="11">11</asp:ListItem>
                    <asp:ListItem value="12">12</asp:ListItem>
                 </asp:DropDownList>
                <div class="space">
                </div>
                <asp:TextBox id="startYear" runat="server" class="txt"></asp:TextBox>
            
                <div class="space">
                </div>
                <asp:DropDownList ID="endMonth" class="DateDropDown" runat="server">
                    <asp:ListItem value="1">1</asp:ListItem>
                    <asp:ListItem value="2">2</asp:ListItem>
                    <asp:ListItem value="3">3</asp:ListItem>
                    <asp:ListItem value="4">4</asp:ListItem>
                    <asp:ListItem value="5">5</asp:ListItem>
                    <asp:ListItem value="6">6</asp:ListItem>
                    <asp:ListItem value="7">7</asp:ListItem>
                    <asp:ListItem value="8">8</asp:ListItem>
                    <asp:ListItem value="9">9</asp:ListItem>
                    <asp:ListItem value="10">10</asp:ListItem>
                    <asp:ListItem value="11">11</asp:ListItem>
                    <asp:ListItem value="12">12</asp:ListItem>
                </asp:DropDownList>
                <div class="space">
                </div>
               <asp:TextBox id="endYear" class="txt" runat="server" 
                    ontextchanged="endYear_TextChanged"></asp:TextBox>
                <div class="space">
                </div>
                <textarea name="Description" id="Description" class="txtarea" rows="3" cols=""></textarea>
            </div>
            <div>
            <asp:Label ID="displayWeeks" Text="" runat="server"></asp:Label>
            </div>
        </fieldset>
        <div>
        <asp:TextBox id="SDate" class="txt" runat="server" type="hidden"></asp:TextBox>
        <asp:TextBox id="EDate" class="txt" runat="server" type="hidden" ></asp:TextBox>

      <%--  <asp:Button id="Testbutton" runat="server" Text="TEST"  onclick="Testbutton_Click"/>--%>
            <button id="send" class="button">
                Create</button>
        </div>
    </div> <input id="UserID" value="<%=UserId %>" type="hidden" />
    </form>
   
</asp:Content>
