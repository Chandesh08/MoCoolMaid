<%@ Page Title="" Language="C#" MasterPageFile="~/hkmasterpage.Master" AutoEventWireup="true" CodeBehind="jobdetails1.aspx.cs" Inherits="mocoolmaid.jobdetails1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    
    <!-- bradcam_area  --><asp:Label ID="lblMsg" runat="server"></asp:Label>
    <asp:Repeater ID="jobdetail" runat="server" OnItemDataBound="jobdetail_ItemDataBound">
                    <itemtemplate>
    <div class="bradcam_area bradcam_bg_1">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text">
                        <h3><%#Eval("JOB_TITLE") %></h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
                         
                       
    <!--/ bradcam_area  -->
   
    <div class="job_details_area">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="job_details_header">
                        <div class="single_jobs white-bg d-flex justify-content-between">
                            <div class="jobs_left d-flex align-items-center">
                                <div class="thumb">
                                    <img src="img/svg_icon/1.svg" alt="">
                                </div>
                                <div class="jobs_conetent">
                                    <a href="#">
                                        <h4><%#Eval("JOB_TITLE") %></h4>
                                    </a>
                                    <div class="links_locat d-flex align-items-center">
                                        <div class="location">
                                            <p><i class="fa fa-map-marker"></i><%#Eval("DISTRICT_NAME") %></p>
                                        </div>
                                        <div class="location">
                                            <p><i class="fa fa-clock-o"></i><%#Eval("JOB_TYPE") %></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="jobs_right">
                                <div class="apply_now">
                                    <a class="heart_mark" href="#"><i class="ti-heart"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="descript_wrap white-bg">
                        <div class="single_wrap">
                            <h4>Job description</h4>
                            <p><%#Eval("JOB_DESCRIPTION") %></p>
                        </div>
                        <div class="single_wrap">
                            <h4>Responsibility</h4>
                           <p><%#Eval("JOB_RESPONSIBILITY") %></p>
                        </div>
                        <div class="single_wrap">
                            <h4>Skills Required</h4>
                            <p><%#Eval("SKILLS_REQUIRED") %></p>
                        </div>
                        <div class="single_wrap">
                            <h4>Experience Required</h4>
                            <p><%#Eval("EXPERIENCE_REQUIRED") %></p>
                        </div>
                       
                    </div>
                    <div class="apply_job_form white-bg">
                        <h4>Apply for the job</h4>
                        <form action="#">
                            <div class="row">
                                
                                <div class="col-md-12">
                                    <div class="submit_btn">
                                        <%--<button class="boxed-btn3 w-100" type="submit">Apply Now</button>--%>
                                        <asp:Button ID="applybtn" OnClick="applybtn_Click" class="boxed-btn3 w-100" runat="server" Text="Apply Now" />
                                        <asp:Label ID="deadline" class="btn btn-block btn-danger w-100" runat="server" Visible="false" Text="DeadLine Date Expired"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="job_sumary">
                        <div class="summery_header">
                            <h3>Job Summery</h3>
                        </div>
                        <div class="job_content">
                            <ul>
                                <li>Published on: <span><%#Eval("POSTED_DATE") %></span></li>
                                <li>Deadline : <span><%#Eval("DEADLINE_DATE") %></span></li>
                                <li>Vacancy: <span>OPEN!</span></li>
                                <li>Salary: Rs <span><%#Eval("SALARY") %></span></li>
                                <li>Location: <span><%#Eval("DISTRICT_NAME") %></span></li>
                                <li>Gender: <span><%#Eval("JOB_GENDER") %></span></li>
                                <li>Working Hours: <span><%#Eval("WORKING_HOURS") %></span></li>
                                <li>Working Hours: <span><%#Eval("JOB_STATUS") %></span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="share_wrap d-flex">
                        <span>Share at:</span>
                        <ul>
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
       </itemtemplate>
        </asp:Repeater>             
</asp:Content>
