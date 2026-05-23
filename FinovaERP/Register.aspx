<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FinovaERP.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="register-section">

        <div class="container">

            <div class="row justify-content-center">

                <div class="col-md-6">

                    <div class="register-card">

                        <div class="text-center mb-4">

                            <h2 class="register-title">Create Account

                            </h2>

                            <p class="register-subtitle">
                                Join FinovaERP Today

                            </p>

                        </div>

                        <!-- Full Name -->

                        <div class="mb-3">

                            <label class="form-label">
                                Full Name

                            </label>

                            <asp:TextBox ID="txtName"
                                runat="server"
                                CssClass="form-control"
                                placeholder="Enter Full Name">

                            </asp:TextBox>

                            <asp:RequiredFieldValidator
                                ID="rfvName"
                                runat="server"
                                ControlToValidate="txtName"
                                ErrorMessage="Please Enter Full Name"
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>

                        <!-- Email -->

                        <div class="mb-3">

                            <label class="form-label">
                                Email Address

                            </label>

                            <asp:TextBox ID="txtEmail"
                                runat="server"
                                CssClass="form-control"
                                placeholder="Enter Email">

                            </asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="rfvEmail"
                                runat="server"
                                ControlToValidate="txtEmail"
                                ErrorMessage="Please Enter Email"
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>

                        </div>

                        <!-- Mobile -->

                        <div class="mb-3">

                            <label class="form-label">
                                Mobile Number
                            </label>

                            <asp:TextBox ID="txtMobile"
                                runat="server"
                                CssClass="form-control"
                                placeholder="Enter Mobile Number">

                            </asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="rfvMobile"
                                runat="server"
                                ControlToValidate="txtMobile"
                                ErrorMessage="Please Enter Mobile Number"
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>

                        </div>

                        <!-- Password -->

                        <div class="mb-3">

                            <label class="form-label">
                                Password

                            </label>
                            <asp:TextBox ID="txtPassword"
                                runat="server"
                                TextMode="Password"
                                CssClass="form-control"
                                placeholder="Enter Password">

                            </asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="rfvPassword"
                                runat="server"
                                ControlToValidate="txtPassword"
                                ErrorMessage="Please Enter Password"
                                ForeColor="Red"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>

                        </div>

                        <!-- Confirm Password -->

                        <div class="mb-4">

                            <label class="form-label">
                                Confirm Password
                            </label>

                            <asp:TextBox ID="txtConfirmPassword"
                                runat="server"
                                TextMode="Password"
                                CssClass="form-control"
                                placeholder="Confirm Password">

                            </asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="rfvConfirmPassword"
                                runat="server"
                                ControlToValidate="txtConfirmPassword"
                                ErrorMessage="Please Confirm Password"
                                ForeColor="Red"
                                Display="Dynamic">
    </asp:RequiredFieldValidator>

                            <asp:CompareValidator
                                ID="cvPassword"
                                runat="server"
                                ControlToCompare="txtPassword"
                                ControlToValidate="txtConfirmPassword"
                                ErrorMessage="Passwords Do Not Match"
                                ForeColor="Red"
                                Display="Dynamic">
    </asp:CompareValidator>

                        </div>

                        <!-- Button -->

                        <div class="d-grid">

                            <asp:Button ID="btnRegister" runat="server" Text="Create Account"
                                CssClass="btn btn-primary register-btn" OnClick="btnRegister_Click" CausesValidation="true" />

                        </div>

                        <!-- Login -->

                        <div class="text-center mt-4">

                            <p>
                                Already have an account?

                                <a href="Login.aspx">Login Here

                                </a>

                            </p>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </section>

</asp:Content>
