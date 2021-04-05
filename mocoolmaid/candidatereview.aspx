<%@ Page Title="" Language="C#" MasterPageFile="~/homasterpage.Master" AutoEventWireup="true" CodeBehind="candidatereview.aspx.cs" Inherits="mocoolmaid.candidatereview" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .ratingStar {
            font-size: 0pt;
            width: 64px;
            height: 59px;
            margin: 1px;
            padding: 1px;
            cursor: pointer;
            display: block;
            background-repeat: no-repeat;
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

    <asp:Repeater ID="candetail" runat="server" OnItemDataBound="candetail_ItemDataBound">
        <ItemTemplate>
            <div class="bradcam_area bradcam_bg_1">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="bradcam_text">
                                <h3><%#Eval("HK_FNAME") %> <%#Eval("HK_LNAME") %></h3>
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

                                <img src="<%#Eval("HK_PICTURE") %>" id="myImg1" alt="<%#Eval("HK_FNAME") %> <%#Eval("HK_LNAME") %>" style="width: 100%">
                            </div>

                        </div>
                        <div class="col-md-8">
                            <h2><%#Eval("HK_FNAME") %> <%#Eval("HK_LNAME") %></h2>
                            <div>
                                <p><%#Eval("AGE") %> years old</p>
                            </div>
                            <div class="d-none d-lg-block">
                                <button type="button" class="boxed-btn3" data-toggle="modal" data-target="#myModal">
                                    Open CV
                                </button>
                            </div>
                            <hr />

                            <asp:Label ID="rating" runat="server">
                                <h4>Rate the HouseKeeper</h4>


                                <ajaxToolkit:Rating
                                    ID="Rating2"
                                    AutoPostBack="true"
                                    BehaviorID="RatingBehavior1"
                                    runat="server"
                                    CurrentRating="0"
                                    StarCssClass="ratingStar"
                                    WaitingStarCssClass="savedRatingStar"
                                    FilledStarCssClass="filledRatingStar"
                                    EmptyStarCssClass="emptyRatingStar"
                                    OnChanged="Rating1_Changed">
                                </ajaxToolkit:Rating>
                            </asp:Label>

                        </div>


                        <br />
                        <br />

                        <div class="row">

                            <div class="col-lg-10" align="left">
                                <h3 class="text-primary"><%#Eval("HK_FNAME") %> <%#Eval("HK_LNAME") %></h3>
                                <p><b>Address:</b> <%#Eval("HK_STREET") %> <%#Eval("HK_TOWN") %> <%#Eval("DISTRICT_NAME") %> <span class="dot"></span><b>Phone:</b> <%#Eval("HK_PHONE_NUMBER") %> <span class="dot"></span><b>Email:</b> <%#Eval("HK_EMAIL") %></p>
                                <hr class="new4">
                                <p class="text-primary">Professional</p>
                                <p><%#Eval("HK_CATEGORY") %></p>
                                <hr class="new4">
                                <p>Experienced Laundromat Attendant with excellent customer service skills. Adept at maintaining a clean laundry room, getting customer orders completed on time and making sure that customers have the supplies they need to get their laundry done. Specialises in completing customer laundry projects and answering customer questions</p>
                                <hr class="new4">
                                <h4 class="text-primary" align="center">— Skills & Services —</h4>
                                <hr class="new4">
                                <div align="left">
                                    <p><%#Eval("HK_SKILLS") %></p>
                                </div>
                                <hr class="new4">
                                <h4 class="text-primary" align="center">— Experience —</h4>
                                <p align="center">LAUNDRY ATTENDANT Chicago, IL</p>
                                <hr class="new4">
                                <h4 class="text-primary" align="center">— Education —</h4>
                                <p align="center"><%#Eval("CERTIFICATE") %></p>
                                <p align="center"><%#Eval("HIGHEST_QUALIFICATION") %></p>

                                <hr class="new4">
                            </div>
                            <div class="col-lg-2">
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
                        </div>
                    </div>


                 <asp:Timer ID="Timer2" runat="server" Interval="2000"></asp:Timer>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                    <user:advertbig id="Advert1" runat="server" />
                            </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Timer2" EventName="Tick" />
                        </Triggers>
                    </asp:UpdatePanel>

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
            <div class="modal fade" data-backdrop="false" id="myModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h3 class="modal-title text-primary">Curriculum Vitae of <%#Eval("HK_FNAME") %> <%#Eval("HK_LNAME") %></h3>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <iframe src="<%#Eval("CV") %>"
  style="width:100%; height:490px;" frameborder="0"></iframe>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
        </ItemTemplate>
    </asp:Repeater>
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
</asp:Content>
