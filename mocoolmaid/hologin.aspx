<%@ Page Title="" Language="C#" MasterPageFile="~/guestmasterpage.Master" AutoEventWireup="true" CodeBehind="hologin.aspx.cs" Inherits="mocoolmaid.hologin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <style>
        html, body {
            font-family: 'Numans', sans-serif;
        }

        .job_details_area{
           background-image: url(img/login.gif);
            background-size: cover;
            background-repeat: no-repeat;
            height: 100%; 
        }

        .container {
            height: 100%;
            align-content: center;
            padding-top: 60px;
        }

        .card {
            height: 370px;
            margin-top: auto;
            margin-bottom: auto;
            width: 400px;
            background-color: rgba(0,0,0,0.5) !important;
        }

        .social_icon span {
            font-size: 60px;
            margin-left: 10px;
            color: #FFC312;
        }

            .social_icon span:hover {
                color: white;
                cursor: pointer;
            }

        .card-header h3 {
            color: white;
        }

        .social_icon {
            position: absolute;
            right: 20px;
            top: -45px;
        }

        .input-group-prepend span {
            width: 50px;
            background-color: #FFC312;
            color: black;
            border: 0 !important;
        }

        input:focus {
            outline: 0 0 0 0 !important;
            box-shadow: 0 0 0 0 !important;
        }

        .remember {
            color: white;
        }

            .remember input {
                width: 20px;
                height: 20px;
                margin-left: 15px;
                margin-right: 5px;
            }

        .login_btn {
            color: black;
            background-color: #FFC312;
            width: 100px;
        }

            .login_btn:hover {
                color: black;
                background-color: white;
            }

        .links {
            color: white;
        }

            .links a {
                margin-left: 4px;
            }
    </style>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    
    <div class="job_details_area">
        <div class="container">
            <div class="row">


                <div class="container">
                    <div class="d-flex justify-content-center h-100">
                        <div class="card">
                            <div class="card-header">
                                <h3>Sign In</h3>
                                <div class="d-flex justify-content-end social_icon">
                                    <span><i class="fab fa-facebook-square"></i></span>
                                    <span><i class="fab fa-google-plus-square"></i></span>
                                    <span><i class="fab fa-twitter-square"></i></span>
                                </div>
                            </div>
                            <div class="card-body">
                                <form>
                                    <div class="input-group form-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                                        </div>

                                        <asp:TextBox ID="houser" class="form-control" runat="server"></asp:TextBox>

                                    </div>
                                    <div class="input-group form-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                                        </div>

                                        <asp:TextBox ID="hopwd" Type="password" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="row align-items-center remember">

                                        <asp:CheckBox ID="cc" runat="server" />
                                        Remember Me
				
                                    </div>
                                    <div class="form-group">

                                        <asp:Button ID="Submit" OnClick="Submit_Click" class="btn float-right login_btn" runat="server" Text="Log In" />
                                        <asp:Label ID="lblmsg" runat="server" CssClass="text-danger"></asp:Label>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer">
                                <div class="d-flex justify-content-center links">
                                    Don't have an account?<a href="#">Sign Up</a>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <a href="#">Forgot your password?</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>

        </div>
    </div>
</asp:Content>
