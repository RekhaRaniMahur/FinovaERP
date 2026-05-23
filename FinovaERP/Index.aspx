<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="FinovaERP.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="hero-section">

        <div class="container text-center">

            <h1 class="hero-title">Smart Financial Planning Made Easy
            </h1>

            <p class="hero-subtitle mt-4">
                Manage Investments, SIP, EMI,
                Retirement & Wealth Growth
                with FinovaERP

            </p>

            <a href="/Products.aspx"
                class="btn btn-info text-white mt-4 px-4 py-2">View Products
            </a>

        </div>

    </section>


    <!-- Services Section -->
    <section class="services-section">

        <div class="container">

            <div class="text-center mb-5">

                <h2 class="service-heading">Our Financial Services
                </h2>

                <p>
                    Smart solutions for your future planning
                </p>

            </div>

            <div class="row">

                <!-- Card 1 -->

                <div class="col-md-3">

                    <div class="service-card text-center">

                        <h4>SIP Planner</h4>

                        <p>
                            Plan your investments with smart SIP calculations.
                        </p>

                    </div>

                </div>

                <!-- Card 2 -->

                <div class="col-md-3">

                    <div class="service-card text-center">

                        <h4>EMI Calculator</h4>

                        <p>
                            Easily calculate your monthly loan EMI.
                        </p>

                    </div>

                </div>

                <!-- Card 3 -->

                <div class="col-md-3">

                    <div class="service-card text-center">

                        <h4>Retirement Planning</h4>

                        <p>
                            Secure your future with retirement planning tools.
                        </p>

                    </div>

                </div>

                <!-- Card 4 -->

                <div class="col-md-3">

                    <div class="service-card text-center">

                        <h4>Tax Saving</h4>

                        <p>
                            Smart tax-saving investment strategies.
                        </p>

                    </div>

                </div>

            </div>

        </div>

    </section>


    <!-- About Section -->
    <section class="about-section">

        <div class="container">

            <div class="row align-items-center">

                <!-- Left Side -->

                <div class="col-md-6">

                    <h2 class="about-title">About FinovaERP
                    </h2>

                    <p class="about-text">
                        FinovaERP is a smart financial management platform
                    designed to help users manage investments,
                    retirement planning, SIP calculations,
                    EMI tracking and wealth growth.

                    </p>

                    <p class="about-text">
                        Our mission is to simplify financial planning
                    with modern technology and user-friendly tools.

                    </p>

                    <button class="btn btn-primary px-4 py-2 mt-3">
                        Learn More

                    </button>

                </div>

                <!-- Right Side -->

                <div class="col-md-6 text-center">

                    <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
                        class="img-fluid about-img" />

                </div>

            </div>

        </div>

    </section>



    <!-- Statistics Section -->
    <section class="stats-section">

        <div class="container">

            <div class="row text-center">

                <!-- Box 1 -->

                <div class="col-md-3">

                    <div class="stats-box">

                        <h2>10K+</h2>

                        <p>Active Users</p>

                    </div>

                </div>

                <!-- Box 2 -->

                <div class="col-md-3">

                    <div class="stats-box">

                        <h2>500+</h2>

                        <p>Investment Plans</p>

                    </div>

                </div>

                <!-- Box 3 -->

                <div class="col-md-3">

                    <div class="stats-box">

                        <h2>50+</h2>

                        <p>Financial Tools</p>

                    </div>

                </div>

                <!-- Box 4 -->

                <div class="col-md-3">

                    <div class="stats-box">

                        <h2>99%</h2>

                        <p>Customer Satisfaction</p>

                    </div>

                </div>

            </div>

        </div>

    </section>

    <!-- FEATURE SECTION -->
    <section class="feature-section">

        <div class="container">

            <div class="row align-items-center">

                <!-- Left -->

                <div class="col-md-6">

                    <img src="https://cdn-icons-png.flaticon.com/512/6009/6009864.png"
                        class="img-fluid feature-img" />

                </div>

                <!-- Right -->

                <div class="col-md-6">

                    <h2 class="feature-title">Why Choose FinovaERP?

                    </h2>

                    <p class="feature-text">
                        FinovaERP helps users manage investments,
                    financial goals, SIP planning,
                    EMI calculations and wealth growth
                    with modern smart tools.

                    </p>

                    <!-- Feature List -->

                    <div class="feature-box">

                        <i class="fa-solid fa-circle-check"></i>
                        Smart Investment Planning

                    </div>

                    <div class="feature-box">

                        <i class="fa-solid fa-circle-check"></i>
                        Secure Financial Reports

                    </div>

                    <div class="feature-box">

                        <i class="fa-solid fa-circle-check"></i>
                        Real-time Wealth Tracking

                    </div>

                    <div class="feature-box">

                        <i class="fa-solid fa-circle-check"></i>
                        Professional Dashboard Analytics

                    </div>

                    <button class="btn btn-primary px-4 py-2 mt-4">
                        Explore Features

                    </button>

                </div>

            </div>

        </div>

    </section>



    <!-- CALL TO ACTION -->
    <section class="cta-section">

        <div class="container text-center">

            <h2 class="cta-title">Start Your Financial Journey Today

            </h2>

            <p class="cta-text mt-3">
                Join FinovaERP and manage your
            financial future professionally.

            </p>

            <button class="btn btn-light px-5 py-3 mt-4">
                Create Free Account

            </button>

        </div>

    </section>

</asp:Content>
