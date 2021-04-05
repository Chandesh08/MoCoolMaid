<%@ Page Title="" Language="C#" MasterPageFile="~/guestmasterpage.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="mocoolmaid.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        TextBox{
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <!-- bradcam_area  -->
    <div class="bradcam_area bradcam_bg_1">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text">
                        <h3>Register</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="catagory_area">
        <div class="container">
            <div class="row cat_search">
                <div class="col-lg-12 col-md-8">
                    <h3 class="mb-30">Register</h3>
                    <form action="#">
                        <div class="mt-10">
                            <label>First Name</label>
                            <input type="text" name="first_name" placeholder="First Name" id="hkfname" 
                                onfocus="this.placeholder = ''" onblur="this.placeholder = 'First Name'" required
                                class="single-input">
                        </div>
                        <div class="mt-10">
                            <label>Last Name</label>
                            <input type="text" name="last_name" placeholder="Last Name" id="hklname" 
                                onfocus="this.placeholder = ''" onblur="this.placeholder = 'Last Name'" required
                                class="single-input">
                        </div>
                        <div class="mt-10">
                            <label>Age</label>
                            <input type="text" name="age" placeholder="Age" id="hkage" 
                                onfocus="this.placeholder = ''" onblur="this.placeholder = 'Age'" required
                                class="single-input">
                        </div>
                        <div class="mt-10">
                            <label>Phone Number</label>
                            <input type="text" name="phone_number" placeholder="55555555" id="hkph" 
                                onfocus="this.placeholder = ''" onblur="this.placeholder = '55555555'" required
                                class="single-input">
                        </div>
                         <div class="col-lg-12">
                                        <div class="single_field">
                            <label>Email address</label>
                            <asp:TextBox CssClass="wide" ID="txtEmail" runat="server"></asp:TextBox>
                        </div>
                             </div>
                        <asp:RequiredFieldValidator ID="reqEmail"
                            ControlToValidate="txtEmail" runat="server"
                            ErrorMessage="Required"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="RegEmail" runat="server"
                            ControlToValidate="txtEmail" ValidationExpression="^[a-zA-Z][\w\.-]*[a-zAZ0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
                            ErrorMessage="Not Valid"></asp:RegularExpressionValidator>
                        <div class="input-group-icon mt-10">
                            <label>Street</label>
                            <input type="text" name="street" placeholder="Eg.'Royal Road'" onfocus="this.placeholder = ''" id="hkstreet" 
                                onblur="this.placeholder = 'Street'" required class="single-input">
                        </div>
                        <div class="input-group-icon mt-10">
                            <label>Town</label>
                            <input type="text" name="town" placeholder="Eg.'Curepipe, Rose Hill, Port Louis'" onfocus="this.placeholder = ''" id="hktown" 
                                onblur="this.placeholder = 'town'" required class="single-input">
                        </div>
                        <div class="input-group-icon mt-10">
                            <div class="icon"><i class="fa fa-globe" aria-hidden="true"></i></div>
                            <div class="form-select" id="default-select">
                                <asp:DropDownList ID="district" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="input-group-icon mt-10">
                            <label>Status</label>
                            <input type="text" name="status" placeholder="Active/Inactive" onfocus="this.placeholder = ''" id="hkstatus"
                                onblur="this.placeholder = 'Status'" required class="single-input">
                        </div>
                        <div class="input-group-icon mt-10">
                            <div class="icon"><i class="fa fa-globe" aria-hidden="true"></i></div>
                            <div class="form-select" id="default-select1">
                                <asp:DropDownList ID="categories" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="mt-10">
                            <textarea class="single-textarea" placeholder="Skills" onfocus="this.placeholder = ''" id="hkskills" 
                                onblur="this.placeholder = 'Skills'" required></textarea>
                        </div>
                        <div class="mt-10">
                            <textarea class="single-textarea" placeholder="Certificates" onfocus="this.placeholder = ''" id="hkcertificate"
                                onblur="this.placeholder = 'Certificates'" required></textarea>
                        </div>
                        <div class="mt-10">
                            <textarea class="single-textarea" placeholder="Qualifications" onfocus="this.placeholder = ''" id="hkqualification" 
                                onblur="this.placeholder = 'Qualifications'" required></textarea>
                        </div>
                        <hr />
                        <div class="mt-10">
                            <label>Username</label>
                            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="reqUsername"
                            ControlToValidate="txtUsername" runat="server"
                            ErrorMessage="Required"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="regUsername"
                            ControlToValidate="txtUsername" ValidationExpression="^[a-zA-Z]{5,}$" runat="server" ErrorMessage="Username must be minimum 5 characters"></asp:RegularExpressionValidator>
                        <div class="mt-10">
                            <label>Password</label>
                            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="reqPassword"
                            ControlToValidate="txtPassword" runat="server"
                            ErrorMessage="Required"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="regPassword"
                            ControlToValidate="txtPassword" ValidationExpression="^(?=.*\d{2})(?=.*[azA-Z]{2}).{6,}$"
                            runat="server" ErrorMessage="Password Not Strong"></asp:RegularExpressionValidator>
                        <div class="mt-10">
                            <label>Confirm Password</label>
                            <asp:TextBox ID="txtCpassword" runat="server"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="ReqCpassword"
                            ControlToValidate="txtCpassword" runat="server"
                            ErrorMessage="Required"></asp:RequiredFieldValidator><br />
                        <asp:CompareValidator ID="conPassword" runat="server"
                            ControlToCompare="txtPassword" ControlToValidate="txtCpassword"
                            ErrorMessage="Password does not match"></asp:CompareValidator>
                        <div class="mt-10">
                            <form>
                                <label for="myfile">Upload Resume:</label>
                                <input type="file" id="myFile" name="filename" value="Upload CV">
                                <br />
                                <label for="myfile">Upload Image:</label>
                                <input type="file" id="myFile1" name="filename" value="Upload Image">
                            </form>
                        </div>
                        <br />
                        <asp:Button ID="btnClear" OnClick="btnClear_Click" runat="server" CssClass="btn btn-danger"
                            Text="Clear All" CausesValidation="false" />
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary"
                            Text="Register" /><br />
                </div>
            </div>
        </div>
    </div>


</asp:Content>
