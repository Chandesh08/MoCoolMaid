<%@ Page Title="" Language="C#" MasterPageFile="~/homasterpage.Master" AutoEventWireup="true" CodeBehind="testimonial.aspx.cs" Inherits="mocoolmaid.testimonial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="bradcam_area bradcam_bg_1">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text">
                        <h3>Testimonial</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->
  <!-- ================ contact section start ================= -->
  <section class="contact-section section_padding">
    <div class="container">
      <div class="d-none d-sm-block mb-5 pb-4">
      
        
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14981.112141723012!2d57.49857818704211!3d-20.164145856972645!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x217c504941d601ef%3A0xfdc5186c91bdbb3d!2sPort%20Louis!5e0!3m2!1sen!2smu!4v1597671110778!5m2!1sen!2smu" width="100%" height="400" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>


      <div class="row">
        <div class="col-12">
          <h2 class="contact-title">Write A Testimonial</h2>
        </div>
        <div class="col-lg-8">
          <form class="form-contact contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  
                   <%-- <textarea class="form-control w-100" name="message" id="message" cols="30" rows="9" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Message'" placeholder = 'Enter Message'></textarea>--%>
                    <asp:TextBox ID="txttestimonial" class="form-control w-100" placeholder = 'Enter Message' cols="30" rows="9" TextMode="MultiLine" runat="server"></asp:TextBox>
                </div>
              </div>
             
             
              
            </div>
            <div class="form-group mt-3">
              <%--<button type="submit" class="button button-contactForm btn_4 boxed-btn">Send Message</button>--%>
            <asp:Button ID="submit" class="button button-contactForm btn_4 boxed-btn" OnClick="submit_Click" runat="server" Text="Submit" />
            </div>
          </form>
        </div>
        <div class="col-lg-4">
          <div class="media contact-info">
            <span class="contact-info__icon"><i class="ti-home"></i></span>
            <div class="media-body">
              <h3>Port Louis, Mauritius</h3>
              <p>Rosemead, CA 91770</p>
            </div>
          </div>
          <div class="media contact-info">
            <span class="contact-info__icon"><i class="ti-tablet"></i></span>
            <div class="media-body">
              <h3>(+230) 52622325</h3>
              <p>Mon to Fri 9am to 6pm</p>
            </div>
          </div>
          <div class="media contact-info">
            <span class="contact-info__icon"><i class="ti-email"></i></span>
            <div class="media-body">
              <h3>mocoolmaidcompany@gmail.com</h3>
              <p>Send us your query anytime!</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</asp:Content>
