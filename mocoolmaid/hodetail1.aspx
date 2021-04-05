<%@ Page Title="" Language="C#" MasterPageFile="~/hkmasterpage.Master" AutoEventWireup="true" CodeBehind="hodetail1.aspx.cs" Inherits="mocoolmaid.hodetail1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:Repeater ID="candetail" runat="server">
        <ItemTemplate>
            <div class="bradcam_area bradcam_bg_1">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="bradcam_text">
                                <h3><%#Eval("HO_FNAME") %> <%#Eval("HO_LNAME") %></h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="myModal1" class="modal modal1">

                <!-- The Close Button -->
                <span class="close close1">&times;</span>

                <!-- Modal Content (The Image) -->
                <img class="modal-content modal1-content" id="img01">

                <!-- Modal Caption (Image Text) -->
                <div id="caption"></div>
            </div>
            <div class="job_listing_area plus_padding">
                <div class="container">


                    <div class="row">
                        <div class="col-md-4">
                            <div class="thumbnail">

                                <img src="<%#Eval("HO_PICTURE") %>" id="myImg1" alt="<%#Eval("HO_FNAME") %> <%#Eval("HO_LNAME") %>" style="width: 100%">
                            </div>

                        </div>
                        <div class="col-md-8">
                            <h2><%#Eval("HO_FNAME") %> <%#Eval("HO_LNAME") %></h2>
                            <div>
                            </div>
                            <div class="d-none d-lg-block">
                                <p><b>Location:</b> <%#Eval("HO_STREET") %> <%#Eval("HO_TOWN") %> <%#Eval("DISTRICT_NAME") %></p> 
                                <p><b>Phone Number:</b> <%#Eval("HO_PHONE_NUMBER") %></p>
                                <p><b>Email:</b> <%#Eval("HO_EMAIL") %></p>
                               
                            </div>
                        </div>
                        </div>

                        <br />
                        <br />
                   
                         </ItemTemplate>
    </asp:Repeater>

                        <div class="row">

                            <div class="col-lg-12">
                               

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
                                    <asp:HyperLink ID="id" runat="server"  class="boxed-btn3" NavigateUrl='<%#Eval("JOB_ID", "~/jobdetails.aspx?JOB_ID={0}") %>' Text="DETAILS"/>
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
                          
                        </div>
                    </div>
                </div>
                </div>
                <script>
                    // Get the modal
                    var modal = document.getElementById("myModal1");

                    // Get the image and insert it inside the modal - use its "alt" text as a caption
                    var img = document.getElementById("myImg1");
                    var modalImg = document.getElementById("img01");
                    var captionText = document.getElementById("caption");
                    img.onclick = function () {
                        modal.style.display = "block";
                        modalImg.src = this.src;
                        captionText.innerHTML = this.alt;
                    }

                    // Get the <span> element that closes the modal
                    var span = document.getElementsByClassName("close")[0];

                    // When the user clicks on <span> (x), close the modal
                    span.onclick = function () {
                        modal.style.display = "none";
                    }
                </script>

</asp:Content>
