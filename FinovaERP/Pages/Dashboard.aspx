<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FinovaERP.Pages.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

<style>

    body{
        background:#0f172a;
    }

    .dashboard-title {
        font-size: 35px;
        font-weight: bold;
        margin-bottom: 10px;
        color:white;
    }

    .welcome-text{
        color:#cbd5e1;
        margin-bottom:30px;
    }

    .dashboard-card {
        background: #1e293b;
        padding: 30px;
        border-radius: 18px;
        color: white;
        text-align: center;
        box-shadow: 0px 4px 15px rgba(0,0,0,0.3);
        transition: 0.3s;
        margin-bottom:25px;
    }

    .dashboard-card:hover {
        transform: translateY(-8px);
    }

    .dashboard-card i{
        font-size:40px;
        margin-bottom:15px;
        color:#38bdf8;
    }

    .dashboard-card h2 {
        font-size: 38px;
        margin-bottom: 10px;
        color: #38bdf8;
    }

    .dashboard-card p {
        font-size: 18px;
        color: #cbd5e1;
    }

    .section-box{
        background:#1e293b;
        padding:25px;
        border-radius:18px;
        margin-top:30px;
        color:white;
        box-shadow:0px 4px 15px rgba(0,0,0,0.3);
    }

    .section-title{
        margin-bottom:20px;
        font-weight:bold;
    }

    .quick-btn{
        width:100%;
        margin-bottom:15px;
        height:50px;
        font-weight:600;
    }

    .progress{
        height:25px;
        border-radius:20px;
    }

    .table td,
    .table th{
        vertical-align:middle;
    }

    .alert-box{
        padding:18px;
        border-radius:15px;
        font-weight:600;
        margin-top:20px;
    }

</style>


<div class="container-fluid">

    <!-- TITLE -->

    <h2 class="dashboard-title">
        Admin Dashboard
    </h2>

    <p class="welcome-text">
        Welcome Back Admin Manage your ERP system easily.
    </p>

    <!-- TOP CARDS -->

    <div class="row">

        <!-- TOTAL PRODUCTS -->

        <div class="col-md-3">

            <div class="dashboard-card">

                <i class="fa-solid fa-box"></i>

                <h2>

                    <asp:Label ID="lblTotalProducts"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </h2>

                <p>Total Products</p>

            </div>

        </div>

        <!-- TOTAL USERS -->

        <div class="col-md-3">

            <div class="dashboard-card">

                <i class="fa-solid fa-users"></i>

                <h2>

                    <asp:Label ID="lblTotalUsers"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </h2>

                <p>Total Users</p>

            </div>

        </div>

        <!-- TOTAL ORDERS -->

        <div class="col-md-3">

            <div class="dashboard-card">

                <i class="fa-solid fa-cart-shopping"></i>

                <h2>

                    <asp:Label ID="lblTotalOrders"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </h2>

                <p>Total Orders</p>

            </div>

        </div>

        <!-- SUCCESS RATE -->

        <div class="col-md-3">

            <div class="dashboard-card">

                <i class="fa-solid fa-chart-line"></i>

                <h2>

                    <asp:Label ID="lblSuccessRate"
                        runat="server"
                        Text="0%">
                    </asp:Label>

                </h2>

                <p>Success Rate</p>

            </div>

        </div>

    </div>

    <!-- SECOND ROW -->

    <div class="row">

        <!-- REVENUE -->

        <div class="col-md-3">

            <div class="dashboard-card">

                <i class="fa-solid fa-money-bill"></i>

                <h2>

                    <asp:Label ID="lblRevenue"
                        runat="server"
                        Text="₹0">
                    </asp:Label>

                </h2>

                <p>Total Revenue</p>

            </div>

        </div>

        <!-- PENDING ORDERS -->

        <div class="col-md-3">

            <div class="dashboard-card">

                <i class="fa-solid fa-clock"></i>

                <h2>

                    <asp:Label ID="lblPendingOrders"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </h2>

                <p>Pending Orders</p>

            </div>

        </div>

        <!-- COMPLETED ORDERS -->

        <div class="col-md-3">

            <div class="dashboard-card">

                <i class="fa-solid fa-circle-check"></i>

                <h2>

                    <asp:Label ID="lblCompletedOrders"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </h2>

                <p>Completed Orders</p>

            </div>

        </div>

        <!-- LOW STOCK -->

        <div class="col-md-3">

            <div class="dashboard-card">

                <i class="fa-solid fa-triangle-exclamation"></i>

                <h2>

                    <asp:Label ID="lblLowStock"
                        runat="server"
                        Text="0">
                    </asp:Label>

                </h2>

                <p>Low Stock</p>

            </div>

        </div>

    </div>

    <!-- QUICK ACTIONS -->

    <div class="section-box">

        <h4 class="section-title">
            Quick Actions
        </h4>

        <div class="row">

            <div class="col-md-3">

                <a href="/Pages/Products.aspx"
                    class="btn btn-primary quick-btn">

                    Add Product

                </a>

            </div>

            <div class="col-md-3">

                <a href="/Pages/Users.aspx"
                    class="btn btn-success quick-btn">

                    Add User

                </a>

            </div>

            <div class="col-md-3">

                <a href="/Pages/Reports.aspx"
                    class="btn btn-warning quick-btn">

                    Reports

                </a>

            </div>

            <div class="col-md-3">

                <a href="/Logout.aspx"
                    class="btn btn-danger quick-btn">

                    Logout

                </a>

            </div>

        </div>

    </div>

    <!-- SALES PROGRESS -->

    <div class="section-box">

        <h4 class="section-title">
            Sales Progress
        </h4>

        <div class="mb-3">

            <label>Total Sales</label>

            <div class="progress">

                <div class="progress-bar bg-success"
                    style="width:75%">

                    75%

                </div>

            </div>

        </div>

        <div class="mb-3">

            <label>Orders Completed</label>

            <div class="progress">

                <div class="progress-bar bg-info"
                    style="width:60%">

                    60%

                </div>

            </div>

        </div>

        <div>

            <label>User Growth</label>

            <div class="progress">

                <div class="progress-bar bg-warning"
                    style="width:85%">

                    85%

                </div>

            </div>

        </div>

    </div>

    <!-- ALERTS -->

    <div class="alert alert-danger alert-box">

        ⚠ Products are Low in Stock

    </div>

    <div class="alert alert-warning alert-box">

        ⚠ Pending Orders Need Approval

    </div>

</div>

</asp:Content>
