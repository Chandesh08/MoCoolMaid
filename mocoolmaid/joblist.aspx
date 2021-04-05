<%@ Page Title="" Language="C#" MasterPageFile="~/guestmasterpage.Master" AutoEventWireup="true" CodeBehind="joblist.aspx.cs" Inherits="mocoolmaid.joblist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Job List</title>
    <style>
        .job_listing_area {
            background-image: url(img/backweb.jpg);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!-- bradcam_area  -->
    <div class="bradcam_area bradcam_bg_1">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text">
                        <h3>Jobs Available</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->

    <!-- job_listing_area_start  -->
    <div class="job_listing_area plus_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="job_filter">
                        <div class="form_inner">
                            <h2 class="text-primary">Filter</h2>
                            <form action="#">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="single_field">
                                            <asp:TextBox ID="search" placeholder="Search keyword" runat="server" TextMode="Search" OnTextChanged="search_TextChanged"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="single_field">
                                            <asp:DropDownList ID="location" OnSelectedIndexChanged="search_TextChanged" AutoPostBack="true" class="wide" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="single_field">
                                            <asp:DropDownList ID="category" AutoPostBack="true" OnSelectedIndexChanged="search_TextChanged" class="wide" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="single_field">
                                            <asp:DropDownList ID="jobtype" class="wide" OnSelectedIndexChanged="search_TextChanged" AutoPostBack="true" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="single_field">
                                            <asp:DropDownList ID="gender" AutoPostBack="true" class="wide" OnSelectedIndexChanged="search_TextChanged" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <%-- <div class="range_wrap">
                            <label for="amount">Salary range:</label>
                            <div class="slidecontainer">
                                <input type="range" min="5000" max="25000" value="5000" class="slider" id="myRange">
                                 <p>Salary: Rs <span id="demo"></span></p>

                            </div>
                            </div>--%>
                        
                    </div>
                    <asp:Timer ID="Timer1" runat="server" Interval="2000"></asp:Timer>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                    <user:advert id="ads" runat="server" />
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div class="col-lg-9">
                    <div class="recent_joblist_wrap">
                        <div class="recent_joblist">
                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <h2 class="text-primary">Job Listing</h2>
                                </div>
                                <div class="col-md-6">
                                    <div class="serch_cat d-flex justify-content-end">
                                        <select>
                                            <option data-display="Most Recent">Most Recent</option>
                                            <option value="1">Marketer</option>
                                            <option value="2">Wordpress </option>
                                            <option value="4">Designer</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="job_lists m-0">
                        <div class="row">



                            <asp:Repeater ID="joblist1" runat="server" OnItemDataBound="joblist1_ItemDataBound">
                                <ItemTemplate>
                                    <div class="col-lg-12 col-md-12">
                                        <div class="single_jobs white-bg d-flex justify-content-between">
                                            <div class="jobs_left d-flex align-items-center">
                                                <div class="thumb">
                                                    <img src="img/svg_icon/home.png" alt="">
                                                </div>
                                                <div class="jobs_conetent">
                                                    <a href="job_details.html">
                                                        <h4><%#Eval("JOB_TITLE") %></h4>
                                                    </a>
                                                    <div class="links_locat d-flex align-items-center">
                                                        <div class="location">
                                                            <p><i class="fa fa-map-marker"></i><%#Eval("DISTRICT_NAME") %></p>
                                                        </div>
                                                        <div class="location">
                                                            <p><i class="fa fa-clock-o"></i><%#Eval("JOB_TYPE") %></p>
                                                            <asp:Label ID="Label1" runat="server" class="boxed-btn2" Visible="false"><%#Eval("JOB_STATUS") %></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="jobs_right">
                                                <div class="apply_now">
                                                    <asp:HyperLink ID="id" runat="server" class="boxed-btn3" NavigateUrl='<%#Eval("JOB_ID", "~/jobdetails.aspx?JOB_ID={0}") %>' Text="DETAILS" />
                                                    <asp:Label ID="Label2" runat="server" class="boxed-btn2" Visible="false"></asp:Label>
                                                </div>
                                                <div class="date">
                                                    <p style="color: blue;">Deadline Date: <%#Eval("DEADLINE_DATE", "{0:dd/MM/yyyy}") %></p>
                                                </div>
                                                <div class="date">
                                                    <p style="color: darkred;">Posted Date: <%#Eval("POSTED_DATE", "{0:dd/MM/yyyy}") %></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>


                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="pagination_wrap">
                                    <ul>
                                        <li><a href="#"><i class="ti-angle-left"></i></a></li>
                                        <li><a href="#"><span>01</span></a></li>
                                        <li><a href="#"><span>02</span></a></li>
                                        <li><a href="#"><i class="ti-angle-right"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- job_listing_area_end  -->
    <%--<script>
            var slider = document.getElementById("myRange");
            var output = document.getElementById("demo");
            output.innerHTML = slider.value; // Display the default slider value

            // Update the current slider value (each time you drag the slider handle)
            slider.oninput = function () {
                output.innerHTML = this.value;
            }
        </script>--%>
</asp:Content>
