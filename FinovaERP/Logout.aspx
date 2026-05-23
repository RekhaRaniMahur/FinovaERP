<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="FinovaERP.Logout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section class="login-section">

        <div class="container">

            <div class="row justify-content-center">

                <div class="col-md-5">

                    <div class="login-card text-center">

                        <h2 class="login-title">Logged Out

                        </h2>

                        <p class="mt-3 text-white">
                            You Have Been Logged Out Successfully

                        </p>

                        <a href="Login.aspx"
                            class="btn btn-primary mt-4">Login Again

                        </a>

                    </div>

                </div>

            </div>

        </div>

    </section>

</asp:Content>
