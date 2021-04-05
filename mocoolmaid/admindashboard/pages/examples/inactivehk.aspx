<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inactivehk.aspx.cs" Inherits="mocoolmaid.admindashboard.pages.examples.inactivehk" %>

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
    <!-- overlayScrollbars -->
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
    <form id="form1" runat="server">
        <!-- Site wrapper -->
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
                    <%--<asp:Label ID="Label1" runat="server" Text="Search "></asp:Label>--%>
                    <asp:TextBox ID="searchjob" class="form-control form-control-navbar" placeholder="Search HouseKeeper" OnTextChanged="searchjob_TextChanged" type="search" runat="server"></asp:TextBox>
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
             <a href="addashboard.aspx" class="brand-link"><i class="fas fa-user-shield"></i> Admin Dashboard
    </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user (optional) -->
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
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>List of HouseKeepers</h1>
                             <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">List of HouseKeepers</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">

                <!-- Default box -->
                <div class="card card-solid">
                    <div class="card-body pb-0">
                        <div class="row d-flex align-items-stretch">


                            <asp:Repeater ID="hkgrid" runat="server">
                                <ItemTemplate>
                                    <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
                                        <div class="card bg-light">
                                            <div class="card-header text-muted border-bottom-0">
                                                <p class="text-danger"><i class="fas fa-user-times"></i> <i><%#Eval("HK_STATUS") %></i></p>
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
                                                    <asp:LinkButton ID="btnselectHK" class="btn btn-sm btn-success" runat="server" CommandName="id" CommandArgument='<%#Eval("HK_ID") + ";" + Eval("HK_FNAME") + ";" + Eval("HK_LNAME")%>' OnCommand="btnselectHK_Command" Text="Activate Membership" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </ItemTemplate>
                            </asp:Repeater>





                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <nav aria-label="Contacts Page Navigation">
                            <ul class="pagination justify-content-center m-0">
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">4</a></li>
                                <li class="page-item"><a class="page-link" href="#">5</a></li>
                                <li class="page-item"><a class="page-link" href="#">6</a></li>
                                <li class="page-item"><a class="page-link" href="#">7</a></li>
                                <li class="page-item"><a class="page-link" href="#">8</a></li>
                            </ul>
                        </nav>
                    </div>
                    <!-- /.card-footer -->
                </div>
                <!-- /.card -->

            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

        <footer class="main-footer">
            <strong>MoCoolMaid</strong>
            <div class="float-right d-none d-sm-inline-block">
                <b>Admin</b>
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
