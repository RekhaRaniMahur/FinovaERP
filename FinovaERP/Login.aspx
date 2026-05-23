<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FinovaERP.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="login-section">

        <div class="container">

            <div class="row justify-content-center">

                <div class="col-md-5">

                    <div class="login-card">

                        <div class="text-center mb-4">

                            <h2 class="login-title">Welcome Back

                            </h2>

                            <p class="login-subtitle">
                                Login to FinovaERP Dashboard

                            </p>

                        </div>

                        <!-- Email -->
                        <div class="mb-3">

                            <label class="form-label">Email Address</label>
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

                        <!-- Password -->

                        <div class="mb-3">
                            <label class="form-label">Password</label>

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

                        <!-- Remember -->

                        <div class="mb-3 form-check">

                            <input type="checkbox"
                                class="form-check-input" />

                            <label class="form-check-label">
                                Remember Me

                            </label>

                        </div>

                        <!-- Button -->

                        <div class="d-grid">

                            <asp:Button ID="btnLogin" runat="server" Text="Login"
                                CssClass="btn btn-primary login-btn" OnClick="btnLogin_Click" CausesValidation="true" />

                        </div>

                        <!-- Register -->

                        <div class="text-center mt-4">

                            <p>
                                Don't have an account?
                                    
                                <a href="Register.aspx">Register Now

                                </a>

                            </p>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </section>


</asp:Content>
