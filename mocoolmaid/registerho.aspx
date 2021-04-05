<%@ Page Title="" Language="C#" MasterPageFile="~/guestmasterpage.Master" AutoEventWireup="true" CodeBehind="registerho.aspx.cs" Inherits="mocoolmaid.registerho" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .register {
            background-image: url(img/reg.gif);
            background-size: cover;
            margin-top: 3%;
            padding: 3%;
            border-radius: 5%;
        }

        .register-left {
            text-align: center;
            color: #fff;
            margin-top: 4%;
        }

            .register-left input {
                border: none;
                border-radius: 1.5rem;
                padding: 2%;
                width: 60%;
                background: #f8f9fa;
                font-weight: bold;
                color: #383d41;
                margin-top: 30%;
                margin-bottom: 3%;
                cursor: pointer;
            }

        .register-right {
            background: #f8f9fa;
            border-top-left-radius: 10% 50%;
            border-bottom-left-radius: 10% 50%;
            border-bottom-right-radius: 5%;
            border-top-right-radius: 5%;
        }

        .register-left img {
            margin-top: 15%;
            margin-bottom: 5%;
            width: 25%;
            -webkit-animation: mover 2s infinite alternate;
            animation: mover 1s infinite alternate;
        }

        .job_details_area {
            background: linear-gradient(180deg, rgba(0,0,0,1) 2%, rgba(231,231,231,1) 46%, rgba(255,255,255,1) 99%);
        }

        @-webkit-keyframes mover {
            0% {
                transform: translateY(0);
            }

            100% {
                transform: translateY(-20px);
            }
        }

        @keyframes mover {
            0% {
                transform: translateY(0);
            }

            100% {
                transform: translateY(-20px);
            }
        }

        .register-left p {
            font-weight: lighter;
            padding: 12%;
            margin-top: -9%;
        }

        .register .register-form {
            padding: 10%;
            margin-top: 10%;
        }

        .btnRegister {
            float: right;
            margin-top: 10%;
            border: none;
            border-radius: 1.5rem;
            padding: 2%;
            background: #0062cc;
            color: #fff;
            font-weight: 600;
            width: 50%;
            cursor: pointer;
        }

        .register .nav-tabs {
            margin-top: 3%;
            border: none;
            background: #0062cc;
            border-radius: 1.5rem;
            width: 28%;
            float: right;
        }

            .register .nav-tabs .nav-link {
                padding: 2%;
                height: 34px;
                font-weight: 600;
                color: #fff;
                border-top-right-radius: 1.5rem;
                border-bottom-right-radius: 1.5rem;
            }

                .register .nav-tabs .nav-link:hover {
                    border: none;
                }

                .register .nav-tabs .nav-link.active {
                    width: 100px;
                    color: #0062cc;
                    border: 2px solid #0062cc;
                    border-top-left-radius: 1.5rem;
                    border-bottom-left-radius: 1.5rem;
                }

        .register-heading {
            text-align: center;
            margin-top: 8%;
            margin-bottom: -15%;
            color: #495057;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">


    <div class="job_details_area">
        <div class="container">
            <div class="row">

                <div class="container register">
                    <div class="row">
                        <div class="col-md-3 register-left">
                            <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
                            <h3>Welcome</h3>
                            <p class="text-light">You are 30 seconds away from creating your own account!</p>
                            <input type="submit" name="" value="Login" /><br />
                        </div>
                        <div class="col-md-9 register-right">

                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                    <h3 class="register-heading">Apply as a House Owner</h3>
                                    <div class="row register-form form">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <%--<input type="text" class="form-control" placeholder="First Name *" value="" />--%>
                                                <asp:TextBox ID="hofname" class="form-control" placeholder="First Name *" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="reqLname" ControlToValidate="hofname" CssClass="text-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group">
                                                <%--<input type="text" class="form-control" placeholder="Last Name *" value="" />--%>
                                                <asp:TextBox ID="holname" class="form-control" placeholder="Last Name *" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" ControlToValidate="holname" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                            </div>

                                            <div class="form-group">
                                                <%--<input type="password" class="form-control" placeholder="Confirm Password *" value="" />--%>
                                                <asp:TextBox ID="hophone" class="form-control" placeholder="Phone Number *" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="hophone" CssClass="text-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="hoemail" class="form-control" placeholder="Email *" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="hoemail" CssClass="text-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator><br />
                                                <asp:RegularExpressionValidator ID="RegEmail" runat="server" CssClass="text-danger" ControlToValidate="hoemail" ValidationExpression="^[a-zA-Z][\w\.-]*[a-zAZ0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$" ErrorMessage="Not Valid"></asp:RegularExpressionValidator>
                                            </div>

                                            <div class="form-group">
                                                <asp:TextBox ID="hostreet" class="form-control" placeholder="Street *" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="text-danger" ControlToValidate="hostreet" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="hotown" class="form-control" placeholder="Town *" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="hotown" CssClass="text-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group">
                                                <asp:DropDownList ID="holocation" class="wide" runat="server" Width="100%"></asp:DropDownList>
                                                <%--<asp:Label ID="val" runat="server" Text=""></asp:Label>--%>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <h4>Log In Informations</h4>
                                            <hr />
                                            <div class="form-group">
                                                <asp:TextBox ID="houser" class="form-control" placeholder="Username *" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="houser" runat="server" CssClass="text-danger" ErrorMessage="Required"></asp:RequiredFieldValidator><br />
                                                <asp:RegularExpressionValidator ID="regUsername" ControlToValidate="houser" ValidationExpression="^[a-zA-Z]{5,}$" runat="server" CssClass="text-danger" ErrorMessage="Username must be minimum 5 characters"></asp:RegularExpressionValidator>
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="textbox" class="form-control" placeholder="Password *" TextMode="Password" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="textbox" runat="server" CssClass="text-danger" ErrorMessage="Required"></asp:RequiredFieldValidator><br />
                                                <asp:RegularExpressionValidator ID="regPassword" ControlToValidate="textbox" CssClass="text-danger" ValidationExpression="^(?=.*\d{2})(?=.*[a-zA-Z]{2}).{6,}$" runat="server" ErrorMessage="Password Not Strong"></asp:RegularExpressionValidator>
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="hopass" class="form-control" placeholder="Confirm Password *" TextMode="Password" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" CssClass="text-danger" ControlToValidate="hopass" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator><br />
                                                <asp:CompareValidator ID="conPassword" runat="server" CssClass="text-danger" ControlToCompare="textbox" ControlToValidate="hopass" ErrorMessage="Password does not match"></asp:CompareValidator>
                                            </div>

                                            <div class="form-group">
                                                <asp:Label ID="Label1" runat="server" Text="Upload picture"></asp:Label>
                                                <asp:FileUpload ID="hophoto" BackColor="Transparent" BorderColor="Transparent" runat="server" CssClass="form-control" />
                                            </div>
                                            <asp:Button ID="hkregister" runat="server" OnClick="hkregister_Click" CssClass="btn btn-info align-right" Text="Sign Up" />
                                            <asp:Button ID="clearbtn" runat="server" OnClick="clearbtn_Click" CssClass="btn btn-danger align-right" Text="Clear" />
                                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
