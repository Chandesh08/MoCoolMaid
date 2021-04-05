<%@ Page Title="" Language="C#" MasterPageFile="~/homasterpage.Master" AutoEventWireup="true" CodeBehind="candidatedetails1.aspx.cs" Inherits="mocoolmaid.candidatedetails1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .job_listing_area{
            background-image:url(img/backweb.jpg);
        }
        .ratingStar {
            font-size: 0pt;
            width: 30px;
            height: 30px;
            cursor: pointer;
            display: block;
            background-repeat: no-repeat;
            background-size:cover;
        }

        .filledRatingStar {
            background-image: url(img/starfilled.png);
        }

        .emptyRatingStar {
            background-image: url(img/starempty.png);
        }

        .savedRatingStar {
            background-image: url(img/starwaiting.png);
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
                        <h3><asp:Label ID="lblcount" runat="server" Text=""></asp:Label></h3>
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
                                            <asp:TextBox ID="searchcan" OnTextChanged="searchcan_TextChanged" placeholder="Search keyword" runat="server"></asp:TextBox>
                                            
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="single_field">
                                            <asp:DropDownList ID="loca" AutoPostBack="true" OnSelectedIndexChanged="searchcan_TextChanged" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="single_field">
                                            <asp:DropDownList ID="cate" AutoPostBack="true" OnSelectedIndexChanged="searchcan_TextChanged" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="single_field">
                                            <asp:DropDownList ID="age" AutoPostBack="true" OnSelectedIndexChanged="searchcan_TextChanged" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                   
                                </div>
                            </form>
                        </div>
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
                                    <h2 class="text-primary">Candidate Listing</h2>
                                </div>
                                <div class="col-md-6">
                                    <div class="serch_cat d-flex justify-content-end">
                                       <%-- <select>
                                            <option data-display="Most Recent">Most Recent</option>
                                            <option value="1">Marketer</option>
                                            <option value="2">Wordpress </option>
                                            <option value="4">Designer</option>
                                        </select>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <asp:Repeater ID="candidatelist" runat="server">
                    <itemtemplate>

                    <div class="container1 list">

                        <div class="card1">
                            <div class="imgBx">
                                <img src="<%#Eval("HK_PICTURE") %>">
                            </div>
                            <div class="contentBx">
                                <div class="content">
                                    <h2 class="name"><%#Eval("HK_FNAME") %> <%#Eval("HK_LNAME") %></h2>
                                    <hr class="new5">
                                    <p class="card-text">
                                        <%#Eval("AGE") %> years old<br>
                                        <span class="location"><%#Eval("HK_STREET") %> <%#Eval("HK_TOWN") %> <%#Eval("DISTRICT_NAME") %></span><br>
                                        

                                        <br>
                                        <%#Eval("HK_CATEGORY") %>
                                    </p>
                                    <ajaxtoolkit:rating id="Rating2"
                                                    runat="server"
                                                    currentrating='<%#Eval("RATE") %>'
                                                    starcssclass="ratingStar"
                                                    waitingstarcssclass="savedRatingStar"
                                                    filledstarcssclass="filledRatingStar"
                                                    emptystarcssclass="emptyRatingStar"
                                                    ></ajaxtoolkit:rating>
                                    <asp:HyperLink ID="hkid" runat="server" class="btn btn-default"  NavigateUrl='<%#Eval("HK_ID", "~/candidatereview.aspx?HK_ID={0}") %>' Text="Read More"/>
                                </div>
                            </div>
                        </div>
                    </div>

                        </itemtemplate>
                </asp:Repeater>
 

                </div>
            </div>
        </div>
    </div>
</asp:Content>
