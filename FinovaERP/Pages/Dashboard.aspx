<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FinovaERP.Pages.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Chart.js Library -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

<style>

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .dashboard-wrapper {
        background: linear-gradient(135deg, #0a0f2a 0%, #0f172a 100%);
        min-height: 100vh;
        padding: 30px 20px;
    }

    /* Header Section */
    .dashboard-header {
        margin-bottom: 35px;
        padding-bottom: 20px;
        border-bottom: 1px solid rgba(255,255,255,0.08);
    }

    .dashboard-title {
        font-size: 32px;
        font-weight: 800;
        margin-bottom: 8px;
        background: linear-gradient(135deg, #ffffff, #bfdbfe, #60a5fa);
        -webkit-background-clip: text;
        background-clip: text;
        color: transparent;
        display: inline-block;
    }

    .welcome-text {
        color: #94a3b8;
        margin-bottom: 5px;
        font-size: 16px;
    }

    .date-badge {
        background: rgba(255,255,255,0.08);
        padding: 8px 18px;
        border-radius: 50px;
        font-size: 14px;
        color: #cbd5e1;
        display: inline-block;
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255,255,255,0.1);
    }

    /* Premium Cards */
    .dashboard-card {
        background: linear-gradient(135deg, #1e293b, #0f172a);
        padding: 25px 20px;
        border-radius: 24px;
        color: white;
        text-align: center;
        box-shadow: 0 10px 25px -5px rgba(0,0,0,0.3);
        transition: all 0.3s ease;
        margin-bottom: 25px;
        border: 1px solid rgba(255,255,255,0.06);
        position: relative;
        overflow: hidden;
    }

    .dashboard-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 3px;
        background: linear-gradient(90deg, #2563eb, #06b6d4, #8b5cf6);
        transform: scaleX(0);
        transition: transform 0.4s ease;
    }

    .dashboard-card:hover::before {
        transform: scaleX(1);
    }

    .dashboard-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 20px 35px -10px rgba(0,0,0,0.4);
        border-color: rgba(37,99,235,0.3);
    }

    .card-icon {
        width: 60px;
        height: 60px;
        background: rgba(37,99,235,0.15);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 15px;
        transition: all 0.3s ease;
    }

    .dashboard-card:hover .card-icon {
        background: linear-gradient(135deg, #2563eb, #06b6d4);
        transform: scale(1.05);
    }

    .card-icon i {
        font-size: 28px;
        color: #38bdf8;
        transition: all 0.3s ease;
    }

    .dashboard-card:hover .card-icon i {
        color: white;
    }

    .dashboard-card h2 {
        font-size: 36px;
        font-weight: 800;
        margin-bottom: 8px;
        background: linear-gradient(135deg, #ffffff, #cbd5e1);
        -webkit-background-clip: text;
        background-clip: text;
        color: transparent;
    }

    .dashboard-card p {
        font-size: 14px;
        color: #94a3b8;
        margin: 0;
        font-weight: 500;
        letter-spacing: 0.5px;
    }

    .card-trend {
        display: inline-block;
        font-size: 11px;
        padding: 3px 10px;
        border-radius: 20px;
        margin-top: 10px;
        font-weight: 600;
    }

    .trend-up { background: rgba(16,185,129,0.15); color: #10b981; }
    .trend-down { background: rgba(239,68,68,0.15); color: #ef4444; }

    /* Section Boxes */
    .section-box {
        background: linear-gradient(135deg, #1e293b, #0f172a);
        padding: 25px;
        border-radius: 24px;
        margin-top: 30px;
        color: white;
        box-shadow: 0 10px 25px -5px rgba(0,0,0,0.2);
        border: 1px solid rgba(255,255,255,0.06);
        transition: all 0.3s ease;
    }

    .section-box:hover {
        border-color: rgba(37,99,235,0.2);
        box-shadow: 0 15px 35px -10px rgba(0,0,0,0.3);
    }

    .section-title {
        margin-bottom: 20px;
        font-weight: 700;
        font-size: 18px;
        color: white;
        border-left: 4px solid #2563eb;
        padding-left: 15px;
    }

    /* Quick Action Buttons */
    .quick-btn {
        width: 100%;
        margin-bottom: 15px;
        height: 48px;
        font-weight: 600;
        border-radius: 14px;
        transition: all 0.3s ease;
        border: none;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        text-decoration: none;
    }

    .quick-btn-primary {
        background: linear-gradient(135deg, #2563eb, #1d4ed8);
        color: white;
    }

    .quick-btn-success {
        background: linear-gradient(135deg, #10b981, #059669);
        color: white;
    }

    .quick-btn-warning {
        background: linear-gradient(135deg, #f59e0b, #d97706);
        color: white;
    }

    .quick-btn-danger {
        background: linear-gradient(135deg, #ef4444, #dc2626);
        color: white;
    }

    .quick-btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        color: white;
        text-decoration: none;
    }

    /* Progress Bars */
    .progress-item {
        margin-bottom: 20px;
    }

    .progress-label {
        display: flex;
        justify-content: space-between;
        margin-bottom: 8px;
        font-size: 13px;
        color: #cbd5e1;
    }

    .progress {
        height: 10px;
        border-radius: 20px;
        background: rgba(255,255,255,0.1);
        overflow: hidden;
    }

    .progress-bar {
        border-radius: 20px;
        transition: width 1.2s ease;
        position: relative;
        overflow: hidden;
    }

    .progress-bar::after {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
        animation: shimmer 2s infinite;
    }

    @keyframes shimmer {
        0% { transform: translateX(-100%); }
        100% { transform: translateX(100%); }
    }

    .bg-success-grad { background: linear-gradient(90deg, #10b981, #34d399); }
    .bg-info-grad { background: linear-gradient(90deg, #06b6d4, #22d3ee); }
    .bg-warning-grad { background: linear-gradient(90deg, #f59e0b, #fbbf24); }
    .bg-primary-grad { background: linear-gradient(90deg, #2563eb, #60a5fa); }

    /* Alerts */
    .alert-box {
        padding: 18px 22px;
        border-radius: 16px;
        font-weight: 600;
        margin-top: 20px;
        display: flex;
        align-items: center;
        gap: 12px;
        border: none;
        backdrop-filter: blur(10px);
    }

    .alert-danger {
        background: rgba(239,68,68,0.12);
        color: #f87171;
        border-left: 4px solid #ef4444;
    }

    .alert-warning {
        background: rgba(245,158,11,0.12);
        color: #fbbf24;
        border-left: 4px solid #f59e0b;
    }

    .alert-success {
        background: rgba(16,185,129,0.12);
        color: #34d399;
        border-left: 4px solid #10b981;
    }

    .alert-box i {
        font-size: 20px;
    }

    /* Chart Containers */
    .chart-container {
        background: rgba(255,255,255,0.03);
        border-radius: 20px;
        padding: 15px;
        margin-bottom: 15px;
    }

    canvas {
        max-height: 250px;
        width: 100%;
    }

    /* Revenue Stats */
    .revenue-stats {
        display: flex;
        justify-content: space-around;
        margin-top: 15px;
        padding-top: 15px;
        border-top: 1px solid rgba(255,255,255,0.08);
    }

    .revenue-item {
        text-align: center;
        flex: 1;
    }

    .revenue-item span {
        display: block;
        font-size: 12px;
        color: #64748b;
        margin-bottom: 5px;
    }

    .revenue-item strong {
        font-size: 18px;
        color: white;
        font-weight: 700;
    }

    .text-success { color: #10b981 !important; }
    .text-warning { color: #f59e0b !important; }
    .text-info { color: #06b6d4 !important; }

    /* Recent Orders Table */
    .recent-table {
        width: 100%;
        color: #cbd5e1;
        font-size: 13px;
    }

    .recent-table th {
        color: #94a3b8;
        font-weight: 600;
        padding: 12px 8px;
        border-bottom: 1px solid rgba(255,255,255,0.08);
        text-align: left;
    }

    .recent-table td {
        padding: 10px 8px;
        border-bottom: 1px solid rgba(255,255,255,0.05);
    }

    .status-badge {
        padding: 4px 12px;
        border-radius: 20px;
        font-size: 11px;
        font-weight: 600;
        display: inline-block;
    }

    .status-completed { background: rgba(16,185,129,0.15); color: #10b981; }
    .status-pending { background: rgba(245,158,11,0.15); color: #f59e0b; }
    .status-processing { background: rgba(6,182,212,0.15); color: #06b6d4; }

    /* Activity Item */
    .activity-item {
        padding: 12px 0;
        border-bottom: 1px solid rgba(255,255,255,0.05);
    }

    .activity-item:last-child {
        border-bottom: none;
    }

    /* Responsive */
    @media (max-width: 992px) {
        .dashboard-title { font-size: 28px; }
        .dashboard-card h2 { font-size: 28px; }
    }

    @media (max-width: 768px) {
        .dashboard-wrapper { padding: 20px 15px; }
        .dashboard-title { font-size: 24px; }
        .card-icon { width: 50px; height: 50px; }
        .card-icon i { font-size: 22px; }
        .dashboard-card h2 { font-size: 24px; }
        .revenue-stats { flex-direction: column; gap: 10px; }
        .recent-table { font-size: 11px; }
        .status-badge { padding: 2px 8px; font-size: 9px; }
    }
</style>

<div class="dashboard-wrapper">
    <div class="container-fluid">

        <!-- HEADER SECTION -->
        <div class="dashboard-header">
            <div class="row align-items-center">
                <div class="col-md-7">
                    <h1 class="dashboard-title">
                        <i class="fas fa-chart-line me-2"></i>Admin Dashboard
                    </h1>
                    <p class="welcome-text">
                        Welcome back! Here's what's happening with your business today.
                    </p>
                </div>
                <div class="col-md-5 text-md-end">
                    <div class="date-badge">
                        <i class="fas fa-calendar-alt me-2"></i>
                        <asp:Label ID="lblCurrentDate" runat="server" Text="Loading..."></asp:Label>
                    </div>
                </div>
            </div>
        </div>

        <!-- STATS CARDS - ROW 1 -->
        <div class="row">
            <div class="col-xl-3 col-md-6">
                <div class="dashboard-card">
                    <div class="card-icon">
                        <i class="fas fa-box"></i>
                    </div>
                    <h2>
                        <asp:Label ID="lblTotalProducts" runat="server" Text="0"></asp:Label>
                    </h2>
                    <p>Total Products</p>
                    <span class="card-trend trend-up"><i class="fas fa-arrow-up me-1"></i>+12%</span>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="dashboard-card">
                    <div class="card-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <h2>
                        <asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label>
                    </h2>
                    <p>Total Users</p>
                    <span class="card-trend trend-up"><i class="fas fa-arrow-up me-1"></i>+8%</span>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="dashboard-card">
                    <div class="card-icon">
                        <i class="fas fa-shopping-cart"></i>
                    </div>
                    <h2>
                        <asp:Label ID="lblTotalOrders" runat="server" Text="0"></asp:Label>
                    </h2>
                    <p>Total Orders</p>
                    <span class="card-trend trend-up"><i class="fas fa-arrow-up me-1"></i>+23%</span>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="dashboard-card">
                    <div class="card-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <h2>
                        <asp:Label ID="lblSuccessRate" runat="server" Text="0%"></asp:Label>
                    </h2>
                    <p>Success Rate</p>
                    <span class="card-trend trend-up"><i class="fas fa-arrow-up me-1"></i>+5%</span>
                </div>
            </div>
        </div>

        <!-- STATS CARDS - ROW 2 -->
        <div class="row">
            <div class="col-xl-3 col-md-6">
                <div class="dashboard-card">
                    <div class="card-icon">
                        <i class="fas fa-money-bill-wave"></i>
                    </div>
                    <h2>
                        <asp:Label ID="lblRevenue" runat="server" Text="₹0"></asp:Label>
                    </h2>
                    <p>Total Revenue</p>
                    <span class="card-trend trend-up"><i class="fas fa-arrow-up me-1"></i>+18%</span>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="dashboard-card">
                    <div class="card-icon">
                        <i class="fas fa-clock"></i>
                    </div>
                    <h2>
                        <asp:Label ID="lblPendingOrders" runat="server" Text="0"></asp:Label>
                    </h2>
                    <p>Pending Orders</p>
                    <span class="card-trend trend-down"><i class="fas fa-arrow-down me-1"></i>-3%</span>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="dashboard-card">
                    <div class="card-icon">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <h2>
                        <asp:Label ID="lblCompletedOrders" runat="server" Text="0"></asp:Label>
                    </h2>
                    <p>Completed Orders</p>
                    <span class="card-trend trend-up"><i class="fas fa-arrow-up me-1"></i>+15%</span>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="dashboard-card">
                    <div class="card-icon">
                        <i class="fas fa-exclamation-triangle"></i>
                    </div>
                    <h2>
                        <asp:Label ID="lblLowStock" runat="server" Text="0"></asp:Label>
                    </h2>
                    <p>Low Stock Items</p>
                    <span class="card-trend trend-down"><i class="fas fa-arrow-down me-1"></i>-2%</span>
                </div>
            </div>
        </div>

        <!-- CHARTS SECTION - ROW 3 -->
        <div class="row">
            <!-- Revenue Chart - Line Chart -->
            <div class="col-xl-6">
                <div class="section-box">
                    <h4 class="section-title">
                        <i class="fas fa-chart-line me-2"></i>Revenue Overview (2024)
                    </h4>
                    <div class="chart-container">
                        <canvas id="revenueChart" style="width:100%; height:250px;"></canvas>
                    </div>
                    <div class="revenue-stats">
                        <div class="revenue-item">
                            <span>This Month</span>
                            <strong>₹2,45,000</strong>
                        </div>
                        <div class="revenue-item">
                            <span>Last Month</span>
                            <strong>₹1,98,000</strong>
                        </div>
                        <div class="revenue-item">
                            <span>Growth</span>
                            <strong class="text-success">+23.7%</strong>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Orders Chart - Doughnut Chart -->
            <div class="col-xl-6">
                <div class="section-box">
                    <h4 class="section-title">
                        <i class="fas fa-chart-pie me-2"></i>Order Distribution
                    </h4>
                    <div class="chart-container">
                        <canvas id="ordersChart" style="width:100%; height:250px;"></canvas>
                    </div>
                    <div class="revenue-stats">
                        <div class="revenue-item">
                            <span>Completed</span>
                            <strong class="text-success">1,284</strong>
                        </div>
                        <div class="revenue-item">
                            <span>Pending</span>
                            <strong class="text-warning">456</strong>
                        </div>
                        <div class="revenue-item">
                            <span>Processing</span>
                            <strong class="text-info">342</strong>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- QUICK ACTIONS & PROGRESS SECTION -->
        <div class="row">
            <!-- Quick Actions -->
            <div class="col-xl-4">
                <div class="section-box">
                    <h4 class="section-title">
                        <i class="fas fa-bolt me-2"></i>Quick Actions
                    </h4>
                    <div class="row">
                        <div class="col-md-6">
                            <a href="/Pages/Products.aspx" class="btn quick-btn quick-btn-primary">
                                <i class="fas fa-plus-circle me-2"></i>Add Product
                            </a>
                        </div>
                        <div class="col-md-6">
                            <a href="/Pages/Users.aspx" class="btn quick-btn quick-btn-success">
                                <i class="fas fa-user-plus me-2"></i>Add User
                            </a>
                        </div>
                        <div class="col-md-6">
                            <a href="/Pages/Reports.aspx" class="btn quick-btn quick-btn-warning">
                                <i class="fas fa-chart-bar me-2"></i>View Reports
                            </a>
                        </div>
                        <div class="col-md-6">
                            <a href="/Pages/Settings.aspx" class="btn quick-btn quick-btn-primary">
                                <i class="fas fa-cog me-2"></i>Settings
                            </a>
                        </div>
                        <div class="col-md-12">
                            <a href="/Logout.aspx" class="btn quick-btn quick-btn-danger">
                                <i class="fas fa-sign-out-alt me-2"></i>Logout
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sales Progress -->
            <div class="col-xl-4">
                <div class="section-box">
                    <h4 class="section-title">
                        <i class="fas fa-chart-simple me-2"></i>Performance Metrics
                    </h4>
                    <div class="progress-item">
                        <div class="progress-label">
                            <span>Total Sales Target</span>
                            <span>75%</span>
                        </div>
                        <div class="progress">
                            <div class="progress-bar bg-success-grad" style="width: 75%"></div>
                        </div>
                    </div>
                    <div class="progress-item">
                        <div class="progress-label">
                            <span>Orders Completed</span>
                            <span>60%</span>
                        </div>
                        <div class="progress">
                            <div class="progress-bar bg-info-grad" style="width: 60%"></div>
                        </div>
                    </div>
                    <div class="progress-item">
                        <div class="progress-label">
                            <span>User Growth</span>
                            <span>85%</span>
                        </div>
                        <div class="progress">
                            <div class="progress-bar bg-warning-grad" style="width: 85%"></div>
                        </div>
                    </div>
                    <div class="progress-item">
                        <div class="progress-label">
                            <span>Customer Satisfaction</span>
                            <span>92%</span>
                        </div>
                        <div class="progress">
                            <div class="progress-bar bg-primary-grad" style="width: 92%"></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent Activity -->
            <div class="col-xl-4">
                <div class="section-box">
                    <h4 class="section-title">
                        <i class="fas fa-clock me-2"></i>Recent Activity
                    </h4>
                    <div class="recent-activity">
                        <div class="activity-item">
                            <i class="fas fa-shopping-cart me-2" style="color: #10b981;"></i>
                            <span style="font-size: 13px;">New order #ORD-001 placed</span>
                            <small style="display: block; color: #64748b; font-size: 11px;">5 minutes ago</small>
                        </div>
                        <div class="activity-item">
                            <i class="fas fa-user-plus me-2" style="color: #3b82f6;"></i>
                            <span style="font-size: 13px;">New user registered</span>
                            <small style="display: block; color: #64748b; font-size: 11px;">1 hour ago</small>
                        </div>
                        <div class="activity-item">
                            <i class="fas fa-box me-2" style="color: #f59e0b;"></i>
                            <span style="font-size: 13px;">Product "SIP Planner" updated</span>
                            <small style="display: block; color: #64748b; font-size: 11px;">3 hours ago</small>
                        </div>
                        <div class="activity-item">
                            <i class="fas fa-chart-line me-2" style="color: #06b6d4;"></i>
                            <span style="font-size: 13px;">Monthly report generated</span>
                            <small style="display: block; color: #64748b; font-size: 11px;">Yesterday</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- RECENT ORDERS TABLE -->
        <div class="section-box">
            <h4 class="section-title">
                <i class="fas fa-truck me-2"></i>Recent Orders
            </h4>
            <div class="table-responsive">
                <table class="recent-table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Product</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#ORD-001</td>
                            <td>Rahul Sharma</td>
                            <td>SIP Plan - Growth</td>
                            <td>₹25,000</td>
                            <td><span class="status-badge status-completed"><i class="fas fa-check me-1"></i>Completed</span></td>
                            <td>2024-01-15</td>
                        </tr>
                        <tr>
                            <td>#ORD-002</td>
                            <td>Priya Mehta</td>
                            <td>Retirement Plan</td>
                            <td>₹50,000</td>
                            <td><span class="status-badge status-processing"><i class="fas fa-spinner me-1"></i>Processing</span></td>
                            <td>2024-01-14</td>
                        </tr>
                        <tr>
                            <td>#ORD-003</td>
                            <td>Ankit Verma</td>
                            <td>Insurance Plus</td>
                            <td>₹15,000</td>
                            <td><span class="status-badge status-pending"><i class="fas fa-clock me-1"></i>Pending</span></td>
                            <td>2024-01-14</td>
                        </tr>
                        <tr>
                            <td>#ORD-004</td>
                            <td>Neha Gupta</td>
                            <td>Mutual Fund - Bluechip</td>
                            <td>₹1,00,000</td>
                            <td><span class="status-badge status-completed"><i class="fas fa-check me-1"></i>Completed</span></td>
                            <td>2024-01-13</td>
                        </tr>
                        <tr>
                            <td>#ORD-005</td>
                            <td>Vikram Singh</td>
                            <td>Tax Saver Plan</td>
                            <td>₹35,000</td>
                            <td><span class="status-badge status-processing"><i class="fas fa-spinner me-1"></i>Processing</span></td>
                            <td>2024-01-13</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- ALERTS SECTION -->
        <div class="row">
            <div class="col-md-6">
                <div class="alert-box alert-danger">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span><strong>⚠ Low Stock Alert!</strong> 5 products are running low on stock. Please restock soon.</span>
                </div>
            </div>
            <div class="col-md-6">
                <div class="alert-box alert-warning">
                    <i class="fas fa-clock"></i>
                    <span><strong>⚠ Pending Orders!</strong> 12 orders need approval and processing.</span>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Hidden Label for Current Date (Server Side) -->
<asp:Label ID="lblCurrentDateHidden" runat="server" Visible="false"></asp:Label>

<!-- Chart Initialization Script -->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Revenue Line Chart
        const revenueCtx = document.getElementById('revenueChart').getContext('2d');
        new Chart(revenueCtx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                datasets: [{
                    label: 'Revenue (₹)',
                    data: [65000, 72000, 85000, 92000, 108000, 125000, 145000, 168000, 185000, 210000, 228000, 245000],
                    borderColor: '#2563eb',
                    backgroundColor: 'rgba(37, 99, 235, 0.05)',
                    borderWidth: 3,
                    fill: true,
                    tension: 0.4,
                    pointRadius: 4,
                    pointBackgroundColor: '#2563eb',
                    pointBorderColor: '#ffffff',
                    pointBorderWidth: 2,
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: true,
                plugins: {
                    legend: { display: false },
                    tooltip: {
                        backgroundColor: '#1e293b',
                        titleColor: '#ffffff',
                        bodyColor: '#cbd5e1',
                        callbacks: {
                            label: function (context) {
                                return 'Revenue: ₹' + context.raw.toLocaleString();
                            }
                        }
                    }
                },
                scales: {
                    y: {
                        grid: { color: 'rgba(255, 255, 255, 0.05)' },
                        ticks: { color: '#94a3b8', callback: function (value) { return '₹' + value.toLocaleString(); } }
                    },
                    x: {
                        grid: { display: false },
                        ticks: { color: '#94a3b8' }
                    }
                }
            }
        });

        // Orders Doughnut Chart
        const ordersCtx = document.getElementById('ordersChart').getContext('2d');
        new Chart(ordersCtx, {
            type: 'doughnut',
            data: {
                labels: ['Completed Orders', 'Pending Orders', 'Processing Orders'],
                datasets: [{
                    data: [1284, 456, 342],
                    backgroundColor: ['#10b981', '#f59e0b', '#06b6d4'],
                    borderWidth: 0,
                    hoverOffset: 10,
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: true,
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: { color: '#cbd5e1', font: { size: 11 } }
                    },
                    tooltip: {
                        backgroundColor: '#1e293b',
                        titleColor: '#ffffff',
                        bodyColor: '#cbd5e1',
                        callbacks: {
                            label: function (context) {
                                return context.label + ': ' + context.raw + ' orders';
                            }
                        }
                    }
                },
                cutout: '60%',
            }
        });
    });

    // Set current date using JavaScript only (no server control)
    const dateElement = document.querySelector('.date-badge');
    if (dateElement) {
        const today = new Date();
        const options = { year: 'numeric', month: 'long', day: 'numeric' };
        const formattedDate = today.toLocaleDateString('en-IN', options);

        // Update the date badge content
        const dateSpan = dateElement.querySelector('span');
        if (dateSpan) {
            dateSpan.innerHTML = formattedDate;
        } else {
            // If no span, update the whole element
            dateElement.innerHTML = '<i class="fas fa-calendar-alt me-2"></i> ' + formattedDate;
        }
    }
</script>

</asp:Content>
