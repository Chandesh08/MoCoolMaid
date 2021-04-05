<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addashboard.aspx.cs" Inherits="mocoolmaid.admindashboard.addashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />

    <title>Dashboard</title>

    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css" />
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css" />
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet" />
    <style>
        .main-sidebar {
            background-image: linear-gradient(0deg, rgba(19,78,21,0.7875525210084033) 0%, rgba(108,240,24,0.8015581232492998) 100%), url(../img/backcard.gif);
        }

        .main-header {
            background-image: linear-gradient(270deg, rgba(19,78,21,0.7875525210084033) 0%, rgba(108,240,24,0.8015581232492998) 100%), url(../img/backcard.gif);
        }
    </style>
</head>
<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
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
                        <a href="../home.aspx" class="nav-link">Home</a>
                    </li>
                </ul>

                <!-- Right navbar links -->
                <ul class="navbar-nav ml-auto">

                    <asp:Button ID="logout" runat="server" OnClick="logout_Click" CssClass="btn btn-danger" Text="Log Out" />
                </ul>

            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-light-primary elevation-4">
                <!-- Brand Logo -->
                <a href="addashboard.aspx" class="brand-link"><i class="fas fa-user-shield"></i>Admin Dashboard
                </a>


                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="info">
                            <h3><b>Welcome: </b><i>
                                <asp:Label ID="session" ForeColor="White" runat="server"></asp:Label></i></h3>
                        </div>
                    </div>

                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                            <li class="nav-item">
                                <a href="addashboard.aspx" class="nav-link">
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
                <a href="pages/examples/holist.aspx" class="nav-link text-dark">
                 <i class="fas fa-user-tie nav-icon"></i>
                  <p>List Of HouseOwners</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/hklist.aspx" class="nav-link text-dark">
                  <i class="fas fa-user nav-icon"></i>
                  <p>List of HouseKeepers</p>
                </a>
              </li>
            </ul>
          </li>

                        <li class="nav-item">
                            <a href="pages/examples/listjob.aspx" class="nav-link">
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
                <a href="pages/examples/addcategory.aspx" class="nav-link text-dark">
                  <i class="fas fa-chart-pie nav-icon"></i>
                  <p>Manage Category</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/addlocation.aspx" class="nav-link text-dark">
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
                <a href="pages/examples/inactiveho.aspx" class="nav-link text-dark">
                 <i class="fas fa-user-tie nav-icon"></i>
                  <p>Inactive HouseOwners</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/examples/inactivehk.aspx" class="nav-link text-dark">
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
                <!-- Content Header (Page header) -->
                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1 class="m-0 text-dark">Welcome</h1>
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">Dashboard</li>
                                </ol>
                            </div>
                            <!-- /.col -->
                        </div>
                        <hr />
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- /.content-header -->

                <!-- Main content -->
                <section class="content">
                    <div class="col-lg-12">
                    </div>

                    <div class="row">
                        <div class="col-lg-4 col-6">
                            <!-- small card -->
                            <div class="small-box bg-info">
                                <div class="inner">
                                    <h3>
                                        <asp:Label ID="cnthk" runat="server" Text=""></asp:Label></h3>

                                    <p>Active HouseKeepers</p>

                                </div>
                                <div class="icon">
                                    <i class="fas fa-file-signature"></i>
                                </div>

                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-4 col-6">
                            <!-- small card -->
                            <div class="small-box bg-success">
                                <div class="inner">
                                    <h3>
                                        <asp:Label ID="cntho" runat="server" Text="Label"></asp:Label></h3>

                                    <p>Active HouseOwners</p>
                                </div>
                                <div class="icon">
                                    <i class="fas fa-eye"></i>
                                </div>

                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-4 col-6">
                            <!-- small card -->
                            <div class="small-box bg-warning">
                                <div class="inner">
                                    <h3>
                                        <asp:Label ID="cntjob" runat="server" Text="Label"></asp:Label></h3>

                                    <p>Jobs</p>
                                </div>
                                <div class="icon">
                                    <i class="fas fa-user-plus"></i>
                                </div>

                            </div>
                        </div>
                        <!-- ./col -->
                        <!-- ./col -->
                    </div>
                    <hr/>
                    <div class="row">
                       <%-- <div class="col-lg-6">

                            <div class="card card-widget">
                                <div class="card-header">
                                    <div class="user-block">
                                        <h3 align="center">Recent Activities</h3>
                                    </div>
                                    <!-- /.user-block -->
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-toggle="tooltip" title="Mark as read">
                                            <i class="far fa-circle"></i>
                                        </button>
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
                                    <img class="img-fluid pad" src="dist/img/photo2.png" alt="Photo">

                                    <p>I took this photo this morning. What do you guys think?</p>
                                    <button type="button" class="btn btn-default btn-sm"><i class="fas fa-share"></i>Share</button>
                                    <button type="button" class="btn btn-default btn-sm"><i class="far fa-thumbs-up"></i>Like</button>
                                    <span class="float-right text-muted">127 likes - 3 comments</span>
                                </div>
                                <!-- /.card-body -->
                                <div class="card-footer card-comments">
                                    <div class="card-comment">
                                        <!-- User image -->
                                        <img class="img-circle img-sm" src="dist/img/user3-128x128.jpg" alt="User Image">

                                        <div class="comment-text">
                                            <span class="username">Maria Gonzales
                     
                                            <span class="text-muted float-right">8:03 PM Today</span>
                                            </span>
                                            <!-- /.username -->
                                            It is a long established fact that a reader will be distracted
                    by the readable content of a page when looking at its layout.
                 
                                        </div>
                                        <!-- /.comment-text -->
                                    </div>
                                    <!-- /.card-comment -->
                                    <div class="card-comment">
                                        <!-- User image -->
                                        <img class="img-circle img-sm" src="dist/img/user4-128x128.jpg" alt="User Image">

                                        <div class="comment-text">
                                            <span class="username">Luna Stark
                     
                                            <span class="text-muted float-right">8:03 PM Today</span>
                                            </span>
                                            <!-- /.username -->
                                            It is a long established fact that a reader will be distracted
                    by the readable content of a page when looking at its layout.
                 
                                        </div>
                                        <!-- /.comment-text -->
                                    </div>
                                    <!-- /.card-comment -->
                                </div>
                                <!-- /.card-footer -->
                                <div class="card-footer">
                                    <form action="#" method="post">
                                        <img class="img-fluid img-circle img-sm" src="dist/img/user4-128x128.jpg" alt="Alt Text">
                                        <!-- .img-push is used to add margin to elements next to floating images -->
                                        <div class="img-push">
                                            <input type="text" class="form-control form-control-sm" placeholder="Press enter to post comment" />
                                        </div>
                                    </form>
                                </div>
                                <!-- /.card-footer -->
                            </div>
                        </div>--%>


                        <asp:Repeater ID="jobv" runat="server">
                            <ItemTemplate>
                                <div class="col-lg-6">
                                    <div class="card card-widget">
                                        <div class="card-header">
                                            <div class="user-block">
                                                <h4 align="center" class="text-primary"><strong><%#Eval("JOB_TITLE") %></strong></h4>
                                            </div>
                                            <!-- /.user-block -->
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
                                                <p class="text-warning">
                                                    <b>Deadline Date:</b> <%#Eval("DEADLINE_DATE") %></pclass="text-primary>
                                            <p><b>Working Hours:</b> <%#Eval("WORKING_HOURS") %></p>
                                            </div>


                                        </div>
                                        <!-- /.card-body -->
                                        <div class="card-footer card-comments">
                                            <div class="text-right">
                                                <a href="#" class="btn btn-sm bg-danger">Delete Job
                                                </a>
                                                <a href="#" class="btn btn-sm btn-primary">
                                                    <i class="fas fa-user"></i>View Job
                                                </a>
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


                <footer class="main-footer">
                    <strong>MoCoolMaid</strong>
                    <div class="float-right d-none d-sm-inline-block">
                        <b>Admin</b>
                    </div>
                </footer>
            </div>
        </div>
        <!-- ./wrapper -->

        <!-- REQUIRED SCRIPTS -->
        <!-- jQuery -->
        <script src="plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- overlayScrollbars -->
        <script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/adminlte.js"></script>

        <!-- OPTIONAL SCRIPTS -->
        <script src="dist/js/demo.js"></script>

        <!-- PAGE PLUGINS -->
        <!-- jQuery Mapael -->
        <script src="plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
        <script src="plugins/raphael/raphael.min.js"></script>
        <script src="plugins/jquery-mapael/jquery.mapael.min.js"></script>
        <script src="plugins/jquery-mapael/maps/usa_states.min.js"></script>
        <!-- ChartJS -->
        <script src="plugins/chart.js/Chart.min.js"></script>

        <!-- PAGE SCRIPTS -->
        <script src="dist/js/pages/dashboard2.js"></script>
    </form>
</body>
</html>
