<%@ Page Title="" Language="C#" MasterPageFile="~/homasterpage.Master" AutoEventWireup="true" CodeBehind="jobregister.aspx.cs" Inherits="mocoolmaid.jobregister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
       
    <!-- bradcam_area  -->
    <div class="bradcam_area bradcam_bg_1">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text">
                        <h3>Create Job</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="catagory_area">
        <div class="container">
            <div class="row cat_search">
                <div class="col-lg-12 col-md-8">
                    <h3 class="mb-30">Enter Job Details</h3>
                    <%--<form>--%>
                        <div class="row">
                         <div class="col-lg-12">
                                        <div class="single_field">
                            <label>Job Title</label>
                            <asp:TextBox CssClass="wide form-control" placeholder="*" ID="jobtitle" runat="server" required></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqLname" ControlToValidate="jobtitle" CssClass="text-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </div>
                             </div>
                         <div class="col-lg-12">
                                        <div class="single_field">
                            <label>Job Description</label>
                            <asp:TextBox CssClass="wide form-control" ID="jobdesc" TextMode="MultiLine" runat="server" required></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="jobdesc" CssClass="text-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </div>
                             </div>
                        <div class="col-lg-12">
                                        <div class="single_field">
                            <label>Salary</label>
                            <asp:TextBox CssClass="wide form-control" ID="salary" runat="server" required></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="salary" CssClass="text-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </div>
                             </div>
                           <div class="col-lg-12">
                                        <div class="single_field">
                            <label>Job Type</label>
                            <asp:DropDownList CssClass="wide" ID="jobtype" runat="server">
                   <asp:ListItem Text="Select Job Type" Value="-1"></asp:ListItem>
                   <asp:ListItem Text="Full Time" Value="Full Time"></asp:ListItem>
                   <asp:ListItem Text="Part Time" Value="Part Time"></asp:ListItem>
               </asp:DropDownList>
                        </div>
                             </div>
                        <div class="col-lg-12">
                                        <div class="single_field">
                            <label>Skills Required</label>
                            <asp:TextBox CssClass="wide form-control" ID="skill" runat="server" required></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="skill" CssClass="text-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </div>
                             </div>
                        <div class="col-lg-12">
                                        <div class="single_field">
                            <label>Job Responsibility</label>
                            <asp:TextBox CssClass="wide form-control" TextMode="MultiLine" ID="jobres" runat="server" required></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="jobres" CssClass="text-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </div>
                             </div>
                        <div class="col-lg-12">
                                        <div class="single_field">
                            <label>Job Gender</label>
                            <asp:DropDownList CssClass="wide" ID="genderlist" runat="server">
                    <asp:ListItem Text="Select Gender" Value="-1"></asp:ListItem>
                   <asp:ListItem Text="Any" Value="Any"></asp:ListItem>
                   <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                </asp:DropDownList>
                        </div>
                             </div>
                       
                        <div class="col-lg-12">
                                        <div class="single_field">
                            <label>Experience Required</label>
                            <asp:TextBox CssClass="wide form-control" TextMode="MultiLine" ID="exrequired" runat="server" required></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="exrequired" CssClass="text-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </div>
                             </div>
                         <div class="col-lg-12">
                                        <div class="single_field">
                            <label>Category</label>
                            <asp:DropDownList ID="cat" CssClass="wide" runat="server"></asp:DropDownList>
                        </div>
                             </div>
                        <div class="col-lg-12">
                                        <div class="single_field">
                            <label>Deadline Date</label>
                            <asp:TextBox CssClass="wide form-control" ID="ddate" TextMode="Date" runat="server" required></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="ddate" CssClass="text-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </div>
                             </div>
                        <div class="col-lg-12">
                                        <div class="single_field">
                            <label>Working Hours</label>
                            <asp:TextBox CssClass="wide form-control" ID="whours" runat="server" required></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="whours" CssClass="text-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </div>
                             </div>
                        <div class="col-lg-12">
                                        <div class="single_field">
                            <label>Location</label>
                                            <asp:DropDownList ID="loc" CssClass="wide" runat="server"></asp:DropDownList>
                        </div>
                             </div>
                            </div>
                            <%--</form>--%>
                        </div>
                </div>
                        <br />
                        <asp:Button ID="btnClear" runat="server" CssClass="btn btn-danger"
                            Text="Clear All" CausesValidation="false" />
            <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" OnClick="btnSubmit_Click"
                            Text="Register" /><br />
                
            </div>
        </div>
    
   
</asp:Content>
