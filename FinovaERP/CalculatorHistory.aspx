<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="CalculatorHistory.aspx.cs" Inherits="FinovaERP.CalculatorHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

    .history-section {
        padding: 60px 0;
        background: #0f172a;
        min-height: 100vh;
        color: white;
    }

    .history-title {
        text-align: center;
        margin-bottom: 40px;
    }

    .history-title h1 {
        color: #38bdf8;
        font-weight: bold;
        font-size: 42px;
    }

    .history-title p {
        color: #cbd5e1;
        font-size: 18px;
    }

    .history-box {
        background: #1e293b;
        padding: 25px;
        border-radius: 18px;
        box-shadow: 0px 4px 15px rgba(0,0,0,0.3);
    }

    .table {
        color: white;
        margin-bottom: 0;
    }

    .table thead {
        background: #38bdf8;
        color: white;
    }

    .table tbody tr:hover {
        background: #273449;
    }

    .table td,
    .table th {
        vertical-align: middle;
        padding: 14px;
    }

    .empty-row {
        text-align: center;
        color: #facc15;
        padding: 20px;
        font-size: 18px;
    }

    .top-actions {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 25px;
        gap: 15px;
        flex-wrap: wrap;
    }

    .search-box {
        display: flex;
        gap: 10px;
        flex-wrap: wrap;
    }

    .search-input {
        width: 280px;
        height: 45px;
        border-radius: 10px;
        border: none;
        padding-left: 15px;
    }

    .btn-custom {
        border-radius: 10px;
        font-weight: bold;
        padding: 10px 20px;
    }

</style>

<section class="history-section">

    <div class="container">

        <div class="history-title">

            <h1>
                <i class="fa-solid fa-clock-rotate-left"></i>
                Calculator History
            </h1>

            <p>
                Previous calculation records
            </p>

        </div>

        <div class="history-box">

            <div class="top-actions">

                <div class="search-box">

                    <asp:TextBox ID="txtSearch"
                        runat="server"
                        CssClass="search-input"
                        placeholder="Search Calculator Type">
                    </asp:TextBox>

                    <asp:Button ID="btnSearch"
                        runat="server"
                        Text="Search"
                        CssClass="btn btn-info btn-custom"
                        OnClick="btnSearch_Click" />

                    <asp:Button ID="btnRefresh"
                        runat="server"
                        Text="Refresh"
                        CssClass="btn btn-success btn-custom"
                        PostBackUrl="~/CalculatorHistory.aspx" />

                </div>

                <div>

                    <span class="badge bg-info p-3 fs-6">

                        Total Records :

                        <asp:Label ID="lblTotalRecords"
                            runat="server"
                            Text="0">
                        </asp:Label>

                    </span>

                    <asp:Button ID="btnClearHistory"
                        runat="server"
                        Text="Clear All History"
                        CssClass="btn btn-danger btn-custom ms-2"
                        OnClick="btnClearHistory_Click"
                        OnClientClick="return confirm('Are you sure you want to delete all history?');" />

                </div>

            </div>

            <div class="table-responsive">

                <asp:GridView ID="gvHistory"
                    runat="server"
                    CssClass="table table-bordered table-hover table-dark align-middle"
                    AutoGenerateColumns="False"
                    GridLines="None"
                    EmptyDataText="No History Found">

                    <HeaderStyle CssClass="table-primary text-dark" />

                    <Columns>

                        <asp:TemplateField HeaderText="#">

                            <ItemTemplate>

                                <%# Container.DataItemIndex + 1 %>

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:BoundField
                            DataField="CalculatorType"
                            HeaderText="Calculator" />

                        <asp:BoundField
                            DataField="Input1"
                            HeaderText="Input 1" />

                        <asp:BoundField
                            DataField="Input2"
                            HeaderText="Input 2" />

                        <asp:BoundField
                            DataField="Input3"
                            HeaderText="Input 3" />

                        <asp:BoundField
                            DataField="Result"
                            HeaderText="Result" />

                        <asp:BoundField
                            DataField="CreatedDate"
                            HeaderText="Created Date"
                            DataFormatString="{0:dd-MMM-yyyy hh:mm tt}" />

                        <asp:TemplateField HeaderText="Action">

                            <ItemTemplate>

                                <asp:LinkButton ID="btnDelete"
                                    runat="server"
                                    Text="Delete"
                                    CssClass="btn btn-danger btn-sm"
                                    CommandArgument='<%# Eval("Id") %>'
                                    OnClick="btnDelete_Click"
                                    OnClientClick="return confirm('Delete this record?');">

                                </asp:LinkButton>

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>

                    <EmptyDataTemplate>

                        <div class="text-center py-5">

                            <i class="fa-solid fa-clock-rotate-left"
                               style="font-size:70px;color:#38bdf8;">
                            </i>

                            <h3 class="mt-4">
                                No Calculator History Found
                            </h3>

                            <p style="color:#cbd5e1; font-size:18px;">

                                No calculations available right now.

                                <br />

                                Start using calculators to generate records.

                            </p>

                            <a href="Calculators.aspx"
                               class="btn btn-info mt-3 px-4 py-2">

                                <i class="fa-solid fa-calculator"></i>

                                Go To Calculators

                            </a>

                        </div>

                    </EmptyDataTemplate>

                    <EmptyDataRowStyle CssClass="empty-row" />

                </asp:GridView>

            </div>

        </div>

    </div>

</section>

</asp:Content>