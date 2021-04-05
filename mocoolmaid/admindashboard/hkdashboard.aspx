<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hkdashboard.aspx.cs" Inherits="mocoolmaid.admindashboard.hkdashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Dashboard</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css" />
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet" />
    <style>
        .main-sidebar {
            background-image: linear-gradient(180deg, rgba(71,177,245,0.7875525210084033) 0%, rgba(0,16,133,0.8183648459383753) 100%), url(../img/backcard.gif);
        }
        .main-header{
            background-image: linear-gradient(90deg, rgba(71,177,245,0.7875525210084033) 0%, rgba(0,16,133,0.8183648459383753) 100%), url(../img/backcard.gif);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
         <div class="wrapper">
            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="../hkhome.aspx" class="nav-link">Home</a>
                    </li>
                     <li class="nav-item d-none d-sm-inline-block">
                        <a href="../holist1.aspx" class="nav-link">Browse Employer</a>
                    </li>
                     <li class="nav-item d-none d-sm-inline-block">
                        <a href="../jobapply.aspx" class="nav-link">Browse Job</a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">

                    <asp:Button ID="logout" runat="server" OnClick="logout_Click" CssClass="btn btn-danger" Text="Log Out" />
                    </ul>
            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-light-primary elevation-4">
                <!-- Brand Logo -->
                <a href="hodashboard.aspx" class="brand-link">HouseKeeper Dashboard
    </a>

                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar user (optional) -->
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="info">
                            <h4><b>Welcome: </b><i>
                                <asp:Label ID="session" ForeColor="White" runat="server"></asp:Label></i></h4>
                        </div>
                    </div>

                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                            <li class="nav-item has-treeview">
                                <a href="hkdashboard.aspx" class="nav-link">
                                    <i class="nav-icon fas fa-tachometer-alt"></i>
                                    <p>
                                        Dashboard
               
                                        <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>


                            </li>
                        </ul>
                    </nav>
                    <!-- /.sidebar-menu -->
                </div>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Profile</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">HouseKeeper Profile</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="row">

                            <asp:Repeater ID="hodetail" runat="server">
                                <ItemTemplate>

                                    <div class="col-md-3">

                                        <!-- Profile Image -->
                                        <div class="card card-primary card-outline">
                                            <div class="card-body box-profile">
                                                <div class="text-center">
                                                    <img class="profile-user-img img-fluid img-rounded"
                                                        src="../<%#Eval("HK_PICTURE") %>"
                                                        alt="User profile picture" />
                                                </div>

                                                <h3 class="profile-username text-center"><%#Eval("HK_FNAME") %> <%#Eval("HK_LNAME") %></h3>


                                                <ul class="list-group list-group-unbordered mb-3">
                                                    <li class="list-group-item">
                                                        
                                                    </li>

                                                </ul>


                                            </div>
                                            <!-- /.card-body -->
                                        </div>
                                        <!-- /.card -->

                                        <!-- About Me Box -->
                                        <div class="card card-primary">
                                            <div class="card-header">
                                                <h3 class="card-title">About Me</h3>
                                            </div>
                                            <!-- /.card-header -->
                                            <div class="card-body">
                                                <strong><i class="fas fa-book mr-1"></i>Contact</strong>

                                                <p class="text-muted">
                                                    <b>Email: </b><%#Eval("HK_EMAIL") %>
                                                </p>
                                                <p class="text-muted">
                                                    <b>Phone: </b>(+230) <%#Eval("HK_PHONE_NUMBER") %>
                                                </p>
                                                <hr />

                                                <strong><i class="fas fa-map-marker-alt mr-1"></i>Location</strong>

                                                <p class="text-muted"><%#Eval("HK_STREET") %> <%#Eval("HK_TOWN") %> <%#Eval("DISTRICT_NAME") %></p>

                                                <hr />



                                            </div>
                                            <!-- /.card-body -->
                                        </div>
                                        <!-- /.card -->
                                    </div>


                                </ItemTemplate>
                            </asp:Repeater>


                            <!-- /.col -->
                            <div class="col-md-9">
                                <div class="card">
                                    <div class="card-header p-2">
                                        <ul class="nav nav-pills">
                                            <li class="nav-item"><a class="nav-link active" href="#activity" data-toggle="tab">Jobs Applied</a></li>

                                            <li class="nav-item"><a class="nav-link" href="#settings" data-toggle="tab">Update Profile</a></li>
                                        </ul>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <div class="tab-content">
                                            <div class="active tab-pane" id="activity">
                                                <!-- Post -->

                                                <asp:Label ID="lblMsg1" runat="server"></asp:Label>
                                                <asp:Repeater ID="jobdetail" runat="server">
                                                    <ItemTemplate>

                                                        <div class="post">
                                                            <div class="user-block">

                                                                <span class="username">
                                                                    <p><%#Eval("JOB_TITLE") %></p>

                                                                </span>
                                                                <span class="description">Posted date: <%#Eval("POSTED_DATE") %></span>
                                                            </div>
                                                            <!-- /.user-block -->
                                                            <p><b>Job Description:</b></p>
                                                            <p>

                                                                <%#Eval("JOB_DESCRIPTION") %>
                                                            </p>

                                                            <p>
                                                                
                                                                <%--<asp:Button ID="cancelbtn" class="btn btn-warning" runat="server" Text="Cancel Application" />--%>
                                                                <asp:LinkButton ID="btnselect" class="btn btn-warning" runat="server" CommandName="id" CommandArgument='<%#Eval("JOB_ID")%>' OnCommand="btnselect_Command" Text="Cancel Application" />
                                                                <span class="float-right">Deadline Date: <%#Eval("DEADLINE_DATE") %>
                        </span>
                                                            </p>


                                                        </div>


                                                    </ItemTemplate>
                                                </asp:Repeater>

                                              </div>

                                            <div class="tab-pane" id="settings">
                                                <form class="form-horizontal">
                                                    <div class="form-group row">
                                                        <label for="inputName" class="col-sm-2 col-form-label">Last Name</label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox ID="lname" class="form-control" BorderColor="SkyBlue" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputName" class="col-sm-2 col-form-label">First Name</label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox ID="fname" class="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputName" class="col-sm-2 col-form-label">Phone Number</label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox ID="pnum" class="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputName" class="col-sm-2 col-form-label">Email</label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox ID="email" class="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputName" class="col-sm-2 col-form-label">Street</label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox ID="street" class="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputName" class="col-sm-2 col-form-label">Town</label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox ID="town" class="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputName" class="col-sm-2 col-form-label">Location</label>
                                                        <div class="col-sm-10">
                                                            <asp:DropDownList ID="loclist" class="form-control" runat="server"></asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputName" class="col-sm-2 col-form-label">Skills</label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox ID="skill" class="form-control" TextMode="MultiLine" Height="100px" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputName" class="col-sm-2 col-form-label">Certificate</label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox ID="certificate" TextMode="MultiLine" class="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputName" class="col-sm-2 col-form-label">Highest Qualification</label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox ID="hq" TextMode="MultiLine" class="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputName" class="col-sm-2 col-form-label">Professional</label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox ID="cat" class="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputName" class="col-sm-2 col-form-label">Password</label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox ID="pass" class="form-control" TextMode="Password" runat="server"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ValidationGroup="hk" ID="RequiredFieldValidator12" ControlToValidate="pass" CssClass="text-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="regPassword" ValidationGroup="hk" ControlToValidate="pass" CssClass="text-danger" ValidationExpression="^(?=.*\d{2})(?=.*[a-zA-Z]{2}).{6,}$" runat="server" ErrorMessage="Password Not Strong"></asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputName" class="col-sm-2 col-form-label">Confirm Password</label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox ID="cpass" class="form-control" TextMode="Password" runat="server"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ValidationGroup="hk" ID="RequiredFieldValidator13" ControlToValidate="cpass" CssClass="text-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="conPassword" ValidationGroup="hk" runat="server" CssClass="text-danger" ControlToCompare="pass" ControlToValidate="cpass" ErrorMessage="Password does not match"></asp:CompareValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="offset-sm-2 col-sm-10">
                                                            <%--<button type="submit" class="btn btn-danger">Update</button>--%>
                                                            <asp:Button ID="update" class="btn btn-warning" ValidationGroup="hk" OnClick="update_Click" runat="server" Text="Update" />
                                                            <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <!-- /.tab-pane -->
                                        </div>
                                        <!-- /.tab-content -->
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                                <!-- /.nav-tabs-custom -->
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
             <footer class="main-footer">
                <strong>MoCoolMaid</strong>
                <div class="float-right d-none d-sm-inline-block">
                    <b>House Keeper</b>
                </div>
            </footer>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- /.control-sidebar -->
        </div>
        <!-- ./wrapper -->

        <!-- jQuery -->
        <script src="plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/adminlte.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="dist/js/demo.js"></script>

    </form>
</body>
</html>
