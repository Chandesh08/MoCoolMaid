<%@ Page Title="" Language="C#" MasterPageFile="~/guestmasterpage.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="mocoolmaid.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>HomePage</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!-- slider_area_start -->
    <div class="slider_area">
        <div class="single_slider  d-flex align-items-center slider_bg_1">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-7 col-md-6">
                        <div class="slider_text">
                            <h5 class="wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".2s">Jobs listed</h5>
                            <h3 class="wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".3s"><span>Hire a maid<div class="typed-words"></div>
                            </span></h3>
                            <p class="wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".4s">
                                MyCoolMaid is here for you<br>
                                Humble, Reliable, Hardworking maids
                            </p>
                            <div class="sldier_btn wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".5s">
                                <a href="#" class="boxed-btn3">Upload your Resume</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ilstration_img wow fadeInRight d-none d-lg-block text-right" data-wow-duration="1s" data-wow-delay=".2s">
            <img src="img/banner/illustration.png" alt="">
        </div>
    </div>
    <!-- slider_area_end -->

    <!-- catagory_area -->
    <div class="catagory_area">
        <div class="container">
            <div class="row cat_search">
                <div class="col-lg-3 col-md-4">
                    <div class="single_input">
                        <input type="text" placeholder="Search keyword">
                    </div>
                </div>
                <div class="col-lg-3 col-md-4">
                    <div class="single_input">
                        <asp:DropDownList ID="location" class="wide" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4">
                    <div class="single_input">
                            <asp:DropDownList ID="category" class="wide" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <div class="col-lg-3 col-md-12">
                    <div class="job_btn">
                        <a href="#" class="boxed-btn3">Find Job</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="popular_search d-flex align-items-center">
                        <span>Popular Search:</span>
                        <ul>
                            <li><a href="#">Cleanig</a></li>
                            <li><a href="#">Gardening</a></li>
                            <li><a href="#">Ironing</a></li>
                            <li><a href="#">Laundry</a></li>
                            <li><a href="#">Babysitting</a></li>
                            <li><a href="#">Elderly people's caretaker</a></li>
                            <li><a href="#">Cooking</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ catagory_area -->

    <!-- popular_catagory_area_start  -->
    <div class="popular_catagory_area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section_title mb-40">
                        <h3>Popular Categories</h3>
                    </div>
                </div>
            </div>
            <div class="row">

                <asp:Repeater ID="categorygrid" runat="server">
                    <itemtemplate>
                        <div class="col-lg-4 col-xl-3 col-md-6">
                    <div class="single_catagory">
                       
                            <h4><%#Eval("CATEGORY_NAME") %></h4>
                        
                        </div>
                </div>
                    </itemtemplate>
                </asp:Repeater>
 
            </div>
        </div>
    </div>
    <!-- popular_catagory_area_end  -->

    <!-- job_listing_area_start  -->
    <div class="job_listing_area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="section_title">
                        <h3>Job Listing</h3>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="brouse_job text-right">
                        <a href="jobs.html" class="boxed-btn4">Browse More Job</a>
                    </div>
                </div>
            </div>
            <div class="job_lists">
                <div class="row">
        <asp:Repeater ID="joblist" runat="server" OnItemDataBound="joblist_ItemDataBound">
                        <ItemTemplate>
                             <div class="col-lg-12 col-md-12">
                        <div class="single_jobs white-bg d-flex justify-content-between">
                            <div class="jobs_left d-flex align-items-center">
                                <div class="thumb">
                                    <img src="img/svg_icon/1.svg" alt="">
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
                                    <a class="heart_mark" href="#"><i class="ti-heart"></i></a>
                                    <asp:HyperLink ID="id" runat="server"  class="boxed-btn3" NavigateUrl='<%#Eval("JOB_ID", "~/jobdetails.aspx?JOB_ID={0}") %>' Text="DETAILS" />
                                    <asp:Label ID="Label2" runat="server" class="boxed-btn2" Visible="false"></asp:Label>
                                </div>
                                <div class="date">
                                    <p style="color: blue;">Deadline Date: <asp:Label ID="ddate" runat="server"><%#Eval("DEADLINE_DATE", "{0:dd/MM/yyyy}") %></asp:Label></p>
                                    
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
            </div>
        </div>
    </div>
    <!-- job_listing_area_end  -->

    <!-- featured_candidates_area_start  -->
    <div class="featured_candidates_area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section_title text-center mb-40">
                        <h3>Featured Maids</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="candidate_active owl-carousel">
                       
                        
                        <asp:Repeater ID="candidatecarou" runat="server">
                        <ItemTemplate>
                        <div class="single_candidates text-center">
                            <div class="thumb">
                                <img src="<%#Eval("HK_PICTURE") %>" alt="" height="100">
                            </div>
                            <asp:HyperLink ID="hkidC" runat="server" NavigateUrl='<%#Eval("HK_ID", "~/candidatedetails.aspx?HK_ID={0}") %>'>
                                <h4><%#Eval("HK_FNAME") %> <%#Eval("HK_LNAME") %></h4>
                            </asp:HyperLink>
                            <p><%#Eval("HK_CATEGORY") %></p>
                        </div>
                            </ItemTemplate>
                    </asp:Repeater>

                        
                        
                      
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- job_searcing_wrap  -->
    <div class="job_searcing_wrap overlay">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 offset-lg-1 col-md-6">
                    <div class="searching_text">
                        <h3>Looking for a Job?</h3>
                        <p>We provide many jobs in differents categories </p>
                        <a href="#" class="boxed-btn3">Browse Job</a>
                    </div>
                </div>
                <div class="col-lg-5 offset-lg-1 col-md-6">
                    <div class="searching_text">
                        <h3>Looking for a Expert?</h3>
                        <p>We provide the best rated maids </p>
                        <a href="#" class="boxed-btn3">Post a Job</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- job_searcing_wrap end  -->

    <!-- testimonial_area  -->
    <div class="testimonial_area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section_title text-center mb-40">
                        <h3>Testimonial</h3>
                    </div>
                </div>
                <div class="col-xl-12">
                    <div class="testmonial_active owl-carousel">
                       
                        
                        <asp:Repeater ID="testimonial" runat="server">
                        <ItemTemplate>
                        <div class="single_carousel">
                            <div class="row">
                                <div class="col-lg-11">
                                    <div class="single_testmonial d-flex align-items-center">
                                        <div class="thumb">
                                            <img src="<%#Eval("HO_PICTURE") %>" class="img-circle" alt="" height="180">
                                            <div class="quote_icon">
                                                <i class="Flaticon flaticon-quote"></i>
                                            </div>
                                        </div>
                                        <div class="info">
                                            <p><%#Eval("TESTIMONIAL_DESC") %></p>
                                            <span>- <%#Eval("HO_FNAME") %> <%#Eval("HO_LNAME") %></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                            </ItemTemplate>
                    </asp:Repeater>


                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /testimonial_area  -->
    <script src="js/type.js"></script>
    <script>
            var typed = new Typed('.typed-words', {
                strings: [" or be hired"],
                typeSpeed: 80,
                backSpeed: 80,
                backDelay: 4000,
                startDelay: 1000,
                loop: true,
                showCursor: true
            });
        </script>
</asp:Content>
