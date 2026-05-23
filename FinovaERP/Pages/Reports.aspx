<%@ Page Title="" Language="C#"  MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="FinovaERP.Pages.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

<style>

    .report-box {
        background: #1e293b;
        padding: 25px;
        border-radius: 18px;
        color: white;
        box-shadow: 0px 4px 15px rgba(0,0,0,0.3);
    }

    .page-title {
        font-weight: bold;
        margin-bottom: 25px;
        color: #22c55e;
    }

    .card-box {
        background: #0f172a;
        padding: 20px;
        border-radius: 15px;
        text-align: center;
        color: white;
        transition: 0.3s;
        border: 1px solid #334155;
    }

    .card-box:hover {
        transform: translateY(-5px);
        background: #111827;
    }

    .card-box i {
        font-size: 40px;
        margin-bottom: 15px;
        color: #38bdf8;
    }

    .report-btn {
        margin-top: 15px;
        width: 100%;
    }

    .table th,
    .table td {
        vertical-align: middle;
    }

    .summary-box {
        background: #0f172a;
        padding: 18px;
        border-radius: 15px;
        text-align: center;
        margin-bottom: 20px;
        border: 1px solid #334155;
    }

    .summary-box h3 {
        margin: 0;
        font-size: 28px;
        color: #22c55e;
    }

    .summary-box p {
        margin: 0;
        color: #cbd5e1;
    }

</style>

<div class="container-fluid">

    <h2 class="page-title">
        Reports Management
    </h2>

    <div class="report-box">

        <!-- SUMMARY -->

        <div class="row mb-4">

            <div class="col-md-3">
                <div class="summary-box">

                    <h3>
                        <asp:Label ID="lblTotalProducts"
                            runat="server"
                            Text="0">
                        </asp:Label>
                    </h3>

                    <p>Total Products</p>

                </div>
            </div>

            <div class="col-md-3">
                <div class="summary-box">

                    <h3>
                        <asp:Label ID="lblTotalUsers"
                            runat="server"
                            Text="0">
                        </asp:Label>
                    </h3>

                    <p>Total Users</p>

                </div>
            </div>

            <div class="col-md-3">
                <div class="summary-box">

                    <h3>
                        <asp:Label ID="lblActiveProducts"
                            runat="server"
                            Text="0">
                        </asp:Label>
                    </h3>

                    <p>Active Products</p>

                </div>
            </div>

            <div class="col-md-3">
                <div class="summary-box">

                    <h3>
                        <asp:Label ID="lblLowStock"
                            runat="server"
                            Text="0">
                        </asp:Label>
                    </h3>

                    <p>Low Stock</p>

                </div>
            </div>

        </div>

        <!-- REPORT CARDS -->

        <div class="row">

            <!-- PRODUCT REPORT -->

            <div class="col-md-4 mb-4">

                <div class="card-box">

                    <i class="fa-solid fa-box"></i>

                    <h4>Product Report</h4>

                    <p>View all product details and stock reports.</p>

                    <asp:Button ID="btnProductReport"
                        runat="server"
                        Text="View Report"
                        CssClass="btn btn-primary report-btn"
                        OnClick="btnProductReport_Click" />

                </div>

            </div>

            <!-- USER REPORT -->

            <div class="col-md-4 mb-4">

                <div class="card-box">

                    <i class="fa-solid fa-users"></i>

                    <h4>User Report</h4>

                    <p>View all registered user details.</p>

                    <asp:Button ID="btnUserReport"
                        runat="server"
                        Text="View Report"
                        CssClass="btn btn-success report-btn"
                        OnClick="btnUserReport_Click" />

                </div>

            </div>

            <!-- SALES REPORT -->

            <div class="col-md-4 mb-4">

                <div class="card-box">

                    <i class="fa-solid fa-money-bill"></i>

                    <h4>Sales Report</h4>

                    <p>Check sales and revenue reports.</p>

                    <asp:Button ID="btnSalesReport"
                        runat="server"
                        Text="View Report"
                        CssClass="btn btn-warning report-btn"
                        OnClick="btnSalesReport_Click" />

                </div>

            </div>

            <!-- EXPORT EXCEL -->

            <div class="col-md-4 mb-4">

                <div class="card-box">

                    <i class="fa-solid fa-file-excel"></i>

                    <h4>Export Excel</h4>

                    <p>Download reports in Excel format.</p>

                    <asp:Button ID="btnExportExcel"
                        runat="server"
                        Text="Export Excel"
                        CssClass="btn btn-success report-btn"
                        OnClick="btnExportExcel_Click" />

                </div>

            </div>

            <!-- EXPORT PDF -->

            <div class="col-md-4 mb-4">

                <div class="card-box">

                    <i class="fa-solid fa-file-pdf"></i>

                    <h4>Export PDF</h4>

                    <p>Download reports in PDF format.</p>

                    <asp:Button ID="btnExportPDF"
                        runat="server"
                        Text="Export PDF"
                        CssClass="btn btn-danger report-btn"
                        OnClick="btnExportPDF_Click" />

                </div>

            </div>

            <!-- ANALYTICS -->

            <div class="col-md-4 mb-4">

                <div class="card-box">

                    <i class="fa-solid fa-chart-line"></i>

                    <h4>Analytics</h4>

                    <p>View charts and business analytics.</p>

                    <asp:Button ID="btnAnalytics"
                        runat="server"
                        Text="View Analytics"
                        CssClass="btn btn-info report-btn"
                        OnClick="btnAnalytics_Click" />

                </div>

            </div>

        </div>

        <br />

        <div class="d-flex justify-content-between align-items-center mb-3">

            <h4>
                Recent Product Reports
            </h4>

            <asp:Button ID="btnRefresh"
                runat="server"
                Text="Refresh"
                CssClass="btn btn-warning"
                OnClick="btnRefresh_Click" />

        </div>

        <!-- GRID -->

        <div class="table-responsive">

            <asp:GridView ID="gvReports"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-bordered table-hover table-dark"
                HeaderStyle-CssClass="table-primary"
                EmptyDataText="No Reports Found">

                <Columns>

                    <asp:TemplateField HeaderText="Report ID">

                        <ItemTemplate>

                            REP<%# Container.DataItemIndex + 1 %>

                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:BoundField DataField="ProductName"
                        HeaderText="Product Name" />

                    <asp:BoundField DataField="Category"
                        HeaderText="Category" />

                    <asp:BoundField DataField="Price"
                        HeaderText="Price" />

                    <asp:BoundField DataField="Quantity"
                        HeaderText="Quantity" />

                    <asp:BoundField DataField="Status"
                        HeaderText="Status" />

                </Columns>

            </asp:GridView>

        </div>

    </div>

</div>

</asp:Content>