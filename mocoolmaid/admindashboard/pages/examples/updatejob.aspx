<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updatejob.aspx.cs" Inherits="mocoolmaid.admindashboard.pages.examples.updatejob" %>

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

                <!-- SEARCH FORM -->
                <ul class="navbar-nav ml-auto">

                    <asp:Button ID="logout" runat="server" CssClass="btn btn-danger" OnClick="logout_Click" Text="Log Out" />
                </ul>
                <!-- Right navbar links -->

            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-light-primary elevation-4">
                <!-- Brand Logo -->
                <a href="../../hodashboard.aspx" class="brand-link">HouseOwner Dashboard
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
                                <h1>Job Edit</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="../../hodashboard.aspx">Home</a></li>
                                    <li class="breadcrumb-item active">Job Edit</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">Overview</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="inputName">Job Title</label>
                                        <asp:TextBox ID="title" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputDescription">Job Description</label>
                                        <asp:TextBox ID="desc" CssClass="form-control" TextMode="MultiLine" Height="180px" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputStatus">Job Type</label>
                                        <asp:DropDownList ID="jobtype" CssClass="form-control" runat="server">
                                            <asp:ListItem Text="Select Job Type" Value="-1"></asp:ListItem>
                                            <asp:ListItem Text="Full Time" Value="Full Time"></asp:ListItem>
                                            <asp:ListItem Text="Part Time" Value="Part Time"></asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                    <div class="form-group">
                                        <label for="inputClientCompany">Gender</label>
                                        <asp:DropDownList ID="genderlist" CssClass="form-control" runat="server">
                                            <asp:ListItem Text="Select Gender" Value="-1"></asp:ListItem>
                                            <asp:ListItem Text="Any" Value="Any"></asp:ListItem>
                                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputProjectLeader">Salary</label>
                                        <asp:TextBox ID="salary" TextMode="Number" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputProjectLeader">Deadline Date</label>
                                        <asp:TextBox ID="ddate" TextMode="DateTime" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputClientCompany" class="text-info">Status</label>
                                        <asp:DropDownList ID="status" CssClass="form-control" BackColor="LightSteelBlue" runat="server">
                                            <asp:ListItem Text="Select Status" Value="-1"></asp:ListItem>
                                            <asp:ListItem Text="Vacant" Value="Vacant"></asp:ListItem>
                                            <asp:ListItem Text="Occupied" Value="Occupied"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                        <div class="col-md-6">
                            <div class="card card-secondary">
                                <div class="card-header">
                                    <h3 class="card-title">More Details</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="inputEstimatedBudget">Skills Required</label>
                                        <asp:TextBox ID="skill" TextMode="MultiLine" CssClass="form-control" Height="100px" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputSpentBudget">Job Responsibility</label>
                                        <asp:TextBox ID="jrespon" TextMode="MultiLine" CssClass="form-control" Height="100px" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEstimatedDuration">Experience Required</label>
                                        <asp:TextBox ID="erequired" TextMode="MultiLine" CssClass="form-control" Height="80px" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                            <div class="card card-info">
                                <div class="card-header">
                                    <h3 class="card-title">Specification</h3>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="inputEstimatedBudget">Working Hours</label>
                                        <asp:TextBox ID="whours" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputSpentBudget">Location</label>
                                        <asp:DropDownList ID="loc" CssClass="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEstimatedDuration">Category</label>
                                        <asp:DropDownList ID="cat" CssClass="form-control" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <a href="#" class="btn btn-secondary">Cancel</a>
                            <%--<input type="submit" value="Save Changes" class="btn btn-success float-right">--%>
                            <asp:Label ID="lblMsg" runat="server"></asp:Label>
                            <asp:Button ID="update" OnClick="update_Click" runat="server" class="btn btn-success float-right" Text="Update" />
                        </div>
                    </div>
                </section>
                <!-- /.content -->
                <br />
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
