<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hodashboard.aspx.cs" Inherits="mocoolmaid.admindashboard.hodashboard" %>

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
            background-image: linear-gradient(180deg, rgba(245,202,71,0.7875525210084033) 0%, rgba(128,133,0,0.8183648459383753) 100%), url(../img/backcard.gif);
        }
        .main-header{
            background-image: linear-gradient(90deg, rgba(245,202,71,0.7875525210084033) 0%, rgba(128,133,0,0.8183648459383753) 100%), url(../img/backcard.gif);
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
                        <a href="../hohome.aspx" class="nav-link">Home</a>
                    </li>
                     <li class="nav-item d-none d-sm-inline-block">
                        <a href="../candidatedetails1.aspx" class="nav-link">Browse Maid</a>
                    </li>
                     <li class="nav-item d-none d-sm-inline-block">
                        <a href="../jobregister.aspx" class="nav-link">Post a Job</a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">

                    <asp:Button ID="logout" runat="server" CssClass="btn btn-danger" OnClick="logout_Click" Text="Log Out" />
                    </ul>

            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-light-primary elevation-4">
                <!-- Brand Logo -->
                <a href="hodashboard.aspx" class="brand-link">HouseOwner Dashboard
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
                                <a href="hodashboard.aspx" class="nav-link">
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
                                    <li class="breadcrumb-item active">HouseOwner Profile</li>
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
                                                        src="../<%#Eval("HO_PICTURE") %>"
                                                        alt="User profile picture" />
                                                </div>

                                                <h3 class="profile-username text-center"><%#Eval("HO_FNAME") %> <%#Eval("HO_LNAME") %></h3>


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
                                                    <b>Email: </b><%#Eval("HO_EMAIL") %>
                                                </p>
                                                <p class="text-muted">
                                                    <b>Phone: </b>(+230) <%#Eval("HO_PHONE_NUMBER") %>
                                                </p>
                                                <hr />

                                                <strong><i class="fas fa-map-marker-alt mr-1"></i>Location</strong>

                                                <p class="text-muted"><%#Eval("HO_STREET") %> <%#Eval("HO_TOWN") %> <%#Eval("DISTRICT_NAME") %></p>

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
                                            <li class="nav-item"><a class="nav-link active" href="#activity" data-toggle="tab">Job Posted</a></li>

                                            <li class="nav-item"><a class="nav-link" href="#settings" data-toggle="tab">Update Profile</a></li>
                                        </ul>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <div class="tab-content">
                                            <div class="active tab-pane" id="activity">
                                                <!-- Post -->


                                                <asp:Repeater ID="jobdetail" runat="server" OnItemDataBound="jobdetail_ItemDataBound">
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
                                                            
                                                            <asp:Label ID="status" runat="server" Visible="false"><%#Eval("JOB_STATUS") %></asp:Label>
                                                            <p>
                                                                <%--<button class="btn btn-info">View Applicant</button>--%>
                                                                <asp:HyperLink ID="HyperLink1" runat="server" class="btn btn-info"  NavigateUrl='<%#Eval("JOB_ID", "pages/examples/listapplicant.aspx?JOB_ID={0}") %>' Text="View Applicant"/>
                                                                <%--<button class="btn btn-warning">Update Job</button>--%>
                                                                <asp:HyperLink ID="jobid" runat="server" class="btn btn-warning"  NavigateUrl='<%#Eval("JOB_ID", "pages/examples/updatejob.aspx?JOB_ID={0}") %>' Text="Update Job"/>
                                                                <asp:Label ID="app" runat="server" Visible="false" class="btn btn-secondary"></asp:Label>
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
                                                        <label for="inputName" class="col-sm-2 col-form-label">Password</label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox ID="pass" class="form-control" TextMode="Password" runat="server"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ValidationGroup="ho" ID="RequiredFieldValidator12" ControlToValidate="pass" CssClass="text-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="regPassword" ValidationGroup="ho" ControlToValidate="pass" CssClass="text-danger" ValidationExpression="^(?=.*\d{2})(?=.*[a-zA-Z]{2}).{6,}$" runat="server" ErrorMessage="Password Not Strong"></asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label for="inputName" class="col-sm-2 col-form-label">Confirm Password</label>

                                                        <div class="col-sm-10">
                                                            <asp:TextBox ID="cpass" class="form-control" TextMode="Password" runat="server"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ValidationGroup="ho" ID="RequiredFieldValidator13" ControlToValidate="cpass" CssClass="text-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="conPassword" ValidationGroup="ho" runat="server" CssClass="text-danger" ControlToCompare="pass" ControlToValidate="cpass" ErrorMessage="Password does not match"></asp:CompareValidator>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <div class="offset-sm-2 col-sm-10">
                                                            <%--<button type="submit" class="btn btn-danger">Update</button>--%>
                                                            <asp:Button ID="update" class="btn btn-warning" ValidationGroup="ho" OnClick="update_Click" runat="server" Text="Update" />
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
                    <b>House Owner</b>
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
