<%@ Page Title="" Language="C#" MasterPageFile="~/hkmasterpage.Master" AutoEventWireup="true" CodeBehind="holist1.aspx.cs" Inherits="mocoolmaid.holist1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .job_listing_area{
            background-image:url(img/backweb.jpg);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="bradcam_area bradcam_bg_1">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text">
                        <h3>List of House Owners</h3>
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
                                        <asp:TextBox ID="search" TextMode="Search" placeholder="Search Keyword" OnTextChanged="search_TextChanged" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="single_field">
                                        <asp:DropDownList ID="loc" AutoPostBack="true" OnSelectedIndexChanged="search_TextChanged" runat="server"></asp:DropDownList>
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
                                        <%--<select>
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

                    <asp:Repeater ID="holists" runat="server">
                        <ItemTemplate>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>

                                
                            <div class="container1 list">

                                <div class="card1">
                                    <div class="imgBx">
                                        <img src="<%#Eval("HO_PICTURE") %>">
                                    </div>
                                    <div class="contentBx">
                                        <div class="content">
                                            <h2 class="name"><%#Eval("HO_FNAME") %> <%#Eval("HO_LNAME") %></h2>
                                            <hr class="new5">
                                            <p class="card-text">
                                                <span class="location"><%#Eval("HO_STREET") %> <%#Eval("HO_TOWN") %> <%#Eval("DISTRICT_NAME") %></span><br>
                                            </p>
                                            <asp:HyperLink ID="hoid" runat="server" class="btn btn-default" NavigateUrl='<%#Eval("HO_ID", "~/hodetail1.aspx?H0_ID={0}") %>' Text="Read More" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                                    </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="search" EventName="TextChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="loc" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>

                        </ItemTemplate>
                    </asp:Repeater>


                </div>
            </div>
        </div>
    </div>
</asp:Content>
