<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="login.ascx.cs" Inherits="mocoolmaid.control.login" %>
<asp:Label ID="lblUsername" runat="server"><span class="glyphicon glyphiconuser"></
span> User Name</asp:Label>
<div class="div_texbox">
<asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="log" runat="server"
SetFocusOnError="true" ErrorMessage="Username cannot be empty"
ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
</div>
<asp:Label ID="lblPassword" runat="server" Text="Password"><span class="glyphicon
glyphicon-eye-open"></span> Password</asp:Label>
<div class="div_texbox">
<asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="formcontrol"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="log" runat="server"
SetFocusOnError="true" ErrorMessage="Password cannot be empty" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
</div>
<asp:CheckBox ID="chkremem" runat="server" Text="Remember me" />