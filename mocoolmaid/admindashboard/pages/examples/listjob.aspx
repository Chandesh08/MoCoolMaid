<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="listjob.aspx.cs" Inherits="mocoolmaid.admindashboard.pages.examples.listjob" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />

    <title>Dashboard</title>

    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css" />
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="../../plugins/overlayScrollbars/css/OverlayScrollbars.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css" />
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet" />
     <style>
        .main-sidebar {
            background-image: linear-gradient(0deg, rgba(19,78,21,0.7875525210084033) 0%, rgba(108,240,24,0.8015581232492998) 100%), url(../../../img/backcard.gif);
        }
        .main-header{
            background-image: linear-gradient(270deg, rgba(19,78,21,0.7875525210084033) 0%, rgba(108,240,24,0.8015581232492998) 100%), url(../../../img/backcard.gif);
        }
    </style>
</head>
<body>
    <form runat="server">
    <div class="wrapper">
        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <a href="../../../home.aspx" class="nav-link">Home</a>
                </li>
            </ul>


            <!-- SEARCH FORM -->
            <div class="form-inline ml-3">
                <div class="input-group input-group-sm">
                    
                    <asp:TextBox ID="searchjob" class="form-control form-control-navbar" placeholder="Search Job" OnTextChanged="searchjob_TextChanged" type="search" runat="server"></asp:TextBox>
                    <div class="input-group-append">
                        <button class="btn btn-navbar" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </div>
            </div>
            <!-- Right navbar links -->

            <ul class="navbar-nav ml-auto">

                    <asp:Button ID="logout" runat="server" OnClick="logout_Click" CssClass="btn btn-danger" Text="Log Out" />
                    </ul>

        </nav>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-light-primary elevation-4">
            <!-- Brand Logo -->
            <a href="addashboard.aspx" class="brand-link">
                <h3>Admin Dashboard</h3>
                <span class="brand-text font-weight-light"></span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
               <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="info">
                        <h3><b>Welcome: </b><i><asp:Label ID="session" ForeColor="White" runat="server"></asp:Label></i></h3>
                    </div>
                </div>

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                        <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                        <li class="nav-item">
                            <a href="../../addashboard.aspx" class="nav-link">
                                <i class="nav-icon fas fa-tachometer-alt"></i>
                                <p>Dashboard</p>
                            </a>
                        </li>
                       <li class="nav-item has-treeview menu-close">
            <a href="#" class="nav-link">
              <i class="fas fa-list-ul nav-icon"></i>
              <p>
                List of Users
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="holist.aspx" class="nav-link text-dark">
                 <i class="fas fa-user-tie nav-icon"></i>
                  <p>List Of HouseOwners</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="hklist.aspx" class="nav-link text-dark">
                  <i class="fas fa-user nav-icon"></i>
                  <p>List of HouseKeepers</p>
                </a>
              </li>
            </ul>
          </li>

                        <li class="nav-item">
                            <a href="listjob.aspx" class="nav-link">
                                <i class="nav-icon fas fa-file-import"></i>
                                <p>
                                    List of Jobs
			
                            
                                </p>
                            </a>
                        </li>
                      

                        <li class="nav-item has-treeview menu-close">
            <a href="#" class="nav-link">
              <i class="fas fa-cogs nav-icon"></i>
              <p>
                Maintenance
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="addcategory.aspx" class="nav-link text-dark">
                  <i class="fas fa-chart-pie nav-icon"></i>
                  <p>Manage Category</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="addlocation.aspx" class="nav-link text-dark">
                  <i class="fas fa-map-marked-alt nav-icon"></i>
                  <p>Manage Location</p>
                </a>
              </li>
            </ul>
          </li>

                        
                        <li class="nav-item has-treeview menu-close">
            <a href="#" class="nav-link">
              <i class="fas fa-list-ul nav-icon"></i>
              <p>
                List of Inactive Users
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="inactiveho.aspx" class="nav-link text-dark">
                 <i class="fas fa-user-tie nav-icon"></i>
                  <p>Inactive HouseOwners</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="inactivehk.aspx" class="nav-link text-dark">
                  <i class="fas fa-user nav-icon"></i>
                  <p>Inactive HouseKeepers</p>
                </a>
              </li>
            </ul>
          </li>
                        
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0 text-dark">Job List</h1>
                            <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Job List</li>
                            </ol>
                        </div>
                        <!-- /.col -->
                    </div>
                    <hr/>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>

            <section class="content">



                <div class="row">
                    <asp:Repeater ID="jobgrid" runat="server">
                        <ItemTemplate>
                            <div class="col-lg-6">
                                <div class="card card-widget">
                                    <div class="card-header">
                                        <div class="user-block">
                                            <h4 align="center" class="text-primary"><strong><%#Eval("JOB_TITLE") %></strong></h4>
                                        </div>
                                        <div class="card-tools">

                                            <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                            <button type="button" class="btn btn-tool" data-card-widget="remove">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </div>
                                        <!-- /.card-tools -->
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <!-- post text -->
                                        <h5><b>Description</b></h5>
                                        <p><i><%#Eval("JOB_DESCRIPTION") %></i></p>

                                        <!-- Attachment -->
                                        <div class="attachment-block clearfix">
                                            <p><b>Location:</b> <%#Eval("DISTRICT_NAME") %></p>
                                            <p><b>Category:</b> <%#Eval("CATEGORY_NAME") %></p>
                                            <p><b>Salary:</b> Rs <%#Eval("SALARY") %></p>
                                            <p><b>Job Type:</b> <%#Eval("JOB_TYPE") %></p>
                                            <p><b>Posted Date:</b> <%#Eval("POSTED_DATE") %></p>
                                            <p class="text-warning"><b>Deadline Date:</b> <%#Eval("DEADLINE_DATE") %></pclass="text-primary>
                                            <p><b>Working Hours:</b> <%#Eval("WORKING_HOURS") %></p>
                                        </div>
                                        <p><b>Posted by: </b><span class="text-success"><%#Eval("HO_FNAME") %> <%#Eval("HO_LNAME") %></span></p>

                                    </div>
                                    <!-- /.card-body -->
                                    <div class="card-footer card-comments">
                                        <div class="text-right">
                                            <asp:LinkButton ID="djob" class="btn btn-sm bg-danger" runat="server" CommandName="locid" CommandArgument='<%#Eval("JOB_ID") + ";" + Eval("JOB_TITLE") %>' OnCommand="djob_Command" Text="Delete Job" />
                                            
                                        </div>
                                    </div>
                                    <!-- /.card-footer -->

                                    <!-- /.card-footer -->
                                </div>


                            </div>
                        </ItemTemplate>
                    </asp:Repeater>



                </div>




            </section>


            </div>

            <footer class="main-footer">
                <strong>MoCoolMaid</strong>
                <div class="float-right d-none d-sm-inline-block">
                    <b>Admin</b>
                </div>
            </footer>
        
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
