<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addlocation.aspx.cs" Inherits="mocoolmaid.admindashboard.pages.examples.addlocation" %>

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
                                <h1>Location</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">Location</li>
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
                          
                             <div class="row">
                                <div class="col-lg-6 col-8">
                                    <!-- small card -->
                                    <div class="small-box bg-primary">
                                        <div class="inner">
                                            <br />
                                            <h5><b>Manage Location</b></h5>
                                            <asp:TextBox ID="lbl" Visible="false" class="form-control" BackColor="Transparent" Width="70%" runat="server"></asp:TextBox>
                                            <asp:TextBox ID="txttinputcat" class="form-control" BackColor="Transparent" Width="70%" runat="server"></asp:TextBox>

                                            <br />
                                            <asp:Button ID="addloc" class="btn btn-sm btn-secondary" runat="server" OnClick="addloc_Click" Text="Add Category" />
                                            <asp:Button ID="updateloc" class="btn btn-sm btn-warning" runat="server" OnClick="updateloc_Click" Text="Update Category" />
                                            <asp:Button ID="delete1" class="btn btn-sm btn-danger" runat="server" OnClick="delete1_Click" Text="Delete Category" />
                                            <asp:Button ID="cancel1" class="btn btn-sm btn-info" runat="server" OnClick="cancel1_Click" Text="Cancel" />




                                        </div>
                                        <div class="icon">
                                            <i class="fas fa-plus"></i>
                                        </div>


                                    </div>
                                </div>


                                <div class="col-lg-6 col-8">
                                    <h2>
                                        <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label></h2>
                                </div>



                            </div>


                             <div class="row d-flex align-items-stretch">





                                <asp:ListView ID="locgrid1" runat="server">
                                    <ItemTemplate>

                                        <div class="col-lg-4 col-6">
                                            <!-- small card -->
                                            <div class="small-box bg-secondary">
                                                <div class="inner">
                                                    <br />
                                                    <h5><b>
                                                        <asp:Label ID="catname" runat="server" Text=""><%#Eval("DISTRICT_NAME") %></asp:Label></b></h5>
                                                    <br />

                                                    <asp:LinkButton ID="btnselectloc" class="btn btn-sm btn-info" runat="server" CommandName="id" CommandArgument='<%#Eval("LOCATION_ID") + ";" + Eval("DISTRICT_NAME")%>' OnCommand="btnselectloc_Command" Text="Select Location" />



                                                </div>
                                                <div class="icon">
                                                    <i class="fas fa-map-marked-alt"></i>
                                                </div>


                                            </div>
                                        </div>

                                    </ItemTemplate>

                                </asp:ListView>


                            </div>


                        </div>
                        <!-- /.card-body -->

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
