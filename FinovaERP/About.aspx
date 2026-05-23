<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="FinovaERP.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

.about-section{
    padding:60px 0;
    background:#0f172a;
    min-height:100vh;
    color:white;
}

.about-title{
    text-align:center;
    margin-bottom:50px;
}

.about-title h1{
    color:#38bdf8;
    font-size:45px;
    font-weight:bold;
}

.about-title p{
    color:#cbd5e1;
    font-size:18px;
}

.about-card{
    background:#1e293b;
    border-radius:18px;
    padding:30px;
    height:100%;
    box-shadow:0px 4px 15px rgba(0,0,0,0.3);
    transition:0.3s;
}

.about-card:hover{
    transform:translateY(-5px);
}

.about-card i{
    font-size:50px;
    color:#38bdf8;
    margin-bottom:20px;
}

.about-card h3{
    font-weight:bold;
    margin-bottom:15px;
}

.about-card p{
    color:#cbd5e1;
    line-height:28px;
}

.stats-box{
    background:#1e293b;
    border-radius:18px;
    padding:25px;
    text-align:center;
    margin-top:30px;
}

.stats-box h2{
    color:#38bdf8;
    font-size:40px;
    font-weight:bold;
}

.stats-box p{
    color:#cbd5e1;
    margin:0;
}

</style>

<section class="about-section">

    <div class="container">

        <div class="about-title">

            <h1>

                <i class="fa-solid fa-circle-info"></i>

                About FinovaERP

            </h1>

            <p>
                Smart financial management and planning platform
            </p>

        </div>

        <div class="row g-4">

            <!-- COMPANY -->

            <div class="col-md-4">

                <div class="about-card">

                    <i class="fa-solid fa-building"></i>

                    <h3>
                        Who We Are
                    </h3>

                    <p>
                        FinovaERP is a modern financial platform
                        designed to simplify investment planning,
                        tax management, EMI calculation and
                        retirement analysis.
                    </p>

                </div>

            </div>

            <!-- MISSION -->

            <div class="col-md-4">

                <div class="about-card">

                    <i class="fa-solid fa-bullseye"></i>

                    <h3>
                        Our Mission
                    </h3>

                    <p>
                        Our mission is to provide easy and smart
                        financial tools for users to manage
                        investments, loans and financial reports
                        efficiently.
                    </p>

                </div>

            </div>

            <!-- SERVICES -->

            <div class="col-md-4">

                <div class="about-card">

                    <i class="fa-solid fa-chart-line"></i>

                    <h3>
                        Our Services
                    </h3>

                    <p>
                        We provide SIP calculators, EMI tools,
                        tax reports, retirement planning and
                        financial product management systems.
                    </p>

                </div>

            </div>

        </div>

        <!-- STATS -->

        <div class="row mt-5 g-4">

            <div class="col-md-3">

                <div class="stats-box">

                    <h2>10K+</h2>

                    <p>
                        Active Users
                    </p>

                </div>

            </div>

            <div class="col-md-3">

                <div class="stats-box">

                    <h2>25+</h2>

                    <p>
                        Financial Tools
                    </p>

                </div>

            </div>

            <div class="col-md-3">

                <div class="stats-box">

                    <h2>99%</h2>

                    <p>
                        Accuracy Rate
                    </p>

                </div>

            </div>

            <div class="col-md-3">

                <div class="stats-box">

                    <h2>24/7</h2>

                    <p>
                        Support System
                    </p>

                </div>

            </div>

        </div>

    </div>

</section>

</asp:Content>