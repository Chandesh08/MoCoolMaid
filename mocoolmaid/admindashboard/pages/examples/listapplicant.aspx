<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="listapplicant.aspx.cs" Inherits="mocoolmaid.admindashboard.pages.examples.listapplicant" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Dashboard</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css" />
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet" />
    <style>
        .main-sidebar {
            background-image: linear-gradient(180deg, rgba(245,202,71,0.7875525210084033) 0%, rgba(128,133,0,0.8183648459383753) 100%), url(../../../img/backcard.gif);
        }

        .main-header {
            background-image: linear-gradient(90deg, rgba(245,202,71,0.7875525210084033) 0%, rgba(128,133,0,0.8183648459383753) 100%), url(../../../img/backcard.gif);
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
                        <a href="../../../hohome.aspx" class="nav-link">Home</a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="../../../candidatedetails1.aspx" class="nav-link">Browse Maid</a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="../../../jobregister.aspx" class="nav-link">Post a Job</a>
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
                <a href="../../index3.html" class="brand-link">HouseOwner Dashboard
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
                            <li class="nav-item">
                                <a href="../../hodashboard.aspx" class="nav-link">
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
                                <h1>List of applicants</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">List of applicants</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>

                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">



                                <!-- Main content -->
                                <div class="invoice p-3 mb-3">
                                    <!-- title row -->

                                    <asp:Repeater ID="jobdetail" runat="server">
                                        <ItemTemplate>

                                            <div class="row">
                                                <div class="col-12">
                                                    <h4>
                                                        <i class="fas fa-globe"></i> <%#Eval("JOB_TITLE") %>
                                                        <small class="float-right"><b>Deadline Date:</b> <%#Eval("DEADLINE_DATE") %></small>
                                                    </h4>
                                                </div>
                                                <!-- /.col -->
                                            </div>
                                            <!-- info row -->
                                            <div class="row invoice-info">
                                                <div class="col-sm-4 invoice-col">

                                                    <address>

                                                        <b>Location:</b> <%#Eval("DISTRICT_NAME") %><br />
                                                        <b>Category:</b> <%#Eval("CATEGORY_NAME") %><br />
                                                        <b>Gender:</b> <%#Eval("JOB_GENDER") %><br />
                                                        <b>Job Type:</b> <%#Eval("JOB_TYPE") %>
                                                        <br />
                                                        <b>Salary:</b> Rs <%#Eval("SALARY") %>
                                                        <br />
                                                        <b>Working Hours:</b> <%#Eval("WORKING_HOURS") %>
                                                    </address>
                                                </div>
                                                <!-- /.col -->
                                                <div class="col-sm-8 invoice-col">
                                                    <b>Job Description:</b>
                                                    <address>
                                                        <i><%#Eval("JOB_DESCRIPTION") %></i><br />
                                                        <b>Posted Date: </b><%#Eval("POSTED_DATE") %>
                                                    </address>

                                                </div>
                                                <!-- /.col -->
                                            </div>
                                            <div class="row invoice-info">
                                                <div class="col-sm-6 invoice-col">
                                                    <b>Job Responsibility:</b>
                                                    <address>
                                                        <i><%#Eval("JOB_RESPONSIBILITY") %></i>
                                                    </address>

                                                </div>
                                                <div class="col-sm-6 invoice-col">
                                                    <b>Skills Required:</b>
                                                    <address>
                                                        <i><%#Eval("SKILLS_REQUIRED") %></i>
                                                    </address>

                                                </div>
                                            </div>
                                            <!-- /.row -->

                                        </ItemTemplate>
                                    </asp:Repeater>


                                    <!-- Table row -->
                                    <hr />
                                    <h2><i class="fas fa-users"></i> Applicants</h2>
                                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                    <div class="card-body pb-0">
                                        <div class="row d-flex align-items-stretch">

                                            <asp:Repeater ID="applicant" runat="server" OnItemDataBound="applicant_ItemDataBound">
                                                <ItemTemplate>

                                                    <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
                                                        <div class="card bg-light">
                                                            <div class="card-header text-muted border-bottom-0">
                                                                <p class="text-primary"><asp:Label ID="sta" runat="server"><b><i class="fas fa-exclamation-circle"></i> <i><%#Eval("JOB_STATUS") %></i></b></asp:Label></p>
                                                                
                                                            </div>
                                                            <div class="card-body pt-0">
                                                                <div class="row">
                                                                    <div class="col-7">
                                                                        <h2 class="lead"><b><%#Eval("HK_FNAME") %> <%#Eval("HK_LNAME") %></b></h2>
                                                                        <p class="text-muted text-sm"><b>Email: </b><%#Eval("HK_EMAIL") %> </p>
                                                                        <ul class="ml-4 mb-0 fa-ul text-muted">
                                                                            <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span>Address: <%#Eval("HK_STREET") %> <%#Eval("HK_TOWN") %> <%#Eval("DISTRICT_NAME") %></li>
                                                                            <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>Phone: (+230)<%#Eval("HK_PHONE_NUMBER") %></li>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="col-5 text-center">
                                                                        <img src="../../../<%#Eval("HK_PICTURE") %>" alt="" class="img-rounded img-fluid" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="card-footer">
                                                                <div class="text-right">
                                                                    <%--<asp:LinkButton ID="btnselectHK" class="btn btn-sm btn-danger" runat="server" Text="Freeze Membership" />--%>
                                                                    <%--<asp:Button ID="acceptbtn" class="btn btn-sm btn-success" OnClick="acceptbtn_Click" runat="server" Text="Accept" />--%>
                                                                    <asp:LinkButton ID="btnapply" class="btn btn-sm btn-success" runat="server" CommandName="id" CommandArgument='<%#Eval("HK_JOB_ID") + ";" + Eval("JOB_ID")+ ";" + Eval("HK_EMAIL")+ ";" + Eval("HK_LNAME")+ ";" + Eval("HK_FNAME")+ ";" + Eval("JOB_TITLE")%>' OnCommand="btnapply_Command" Text="Accept" />
                                                                    <%--<asp:Button ID="declinebtn" class="btn btn-sm btn-danger" runat="server" Text="Decline" />--%>
                                                                    <asp:LinkButton ID="btndecline" class="btn btn-sm btn-danger" runat="server" CommandName="decline" CommandArgument='<%#Eval("HK_JOB_ID") + ";" + Eval("JOB_ID")+ ";" + Eval("HK_EMAIL")+ ";" + Eval("HK_LNAME")+ ";" + Eval("HK_FNAME")+ ";" + Eval("JOB_TITLE")%>' OnCommand="btndecline_Command" Text="Decline" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </ItemTemplate>
                                            </asp:Repeater>

                                        </div>
                                    </div>
                                </div>
                                <!-- /.invoice -->
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
        </div>

        <!-- jQuery -->
        <script src="../../plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="../../dist/js/adminlte.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="../../dist/js/demo.js"></script>

    </form>
</body>
</html>
