<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="InvestmentReport.aspx.cs" Inherits="FinovaERP.Reports.InvestmentReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


<style>

.report-section{
    padding:60px 0;
    background:#0f172a;
    min-height:100vh;
    color:white;
}

.report-title{
    text-align:center;
    margin-bottom:40px;
}

.report-title h1{
    color:#38bdf8;
    font-size:42px;
    font-weight:bold;
}

.report-title p{
    color:#cbd5e1;
}

.report-box{
    background:#1e293b;
    padding:25px;
    border-radius:18px;
    box-shadow:0px 4px 15px rgba(0,0,0,0.3);
}

.table{
    color:white;
}

.table thead{
    background:#38bdf8;
}

.table tbody tr:hover{
    background:#273449;
}

.stats-box{
    background:#0f172a;
    padding:20px;
    border-radius:15px;
    text-align:center;
    margin-bottom:25px;
}

.stats-box h2{
    color:#22c55e;
    font-weight:bold;
}

.stats-box p{
    color:#cbd5e1;
    margin:0;
}

</style>

<section class="report-section">

    <div class="container">

        <!-- TITLE -->

        <div class="report-title">

            <h1>

                <i class="fa-solid fa-chart-line"></i>

                Investment Report

            </h1>

            <p>
                SIP investment analytics and history
            </p>

        </div>

        <!-- STATS -->

        <div class="row">

            <div class="col-md-4">

                <div class="stats-box">

                    <h2>

                        <asp:Label ID="lblTotalInvestments"
                            runat="server"
                            Text="0">
                        </asp:Label>

                    </h2>

                    <p>Total Investments</p>

                </div>

            </div>

            <div class="col-md-4">

                <div class="stats-box">

                    <h2>

                        ₹

                        <asp:Label ID="lblTotalAmount"
                            runat="server"
                            Text="0">
                        </asp:Label>

                    </h2>

                    <p>Total Investment Amount</p>

                </div>

            </div>

            <div class="col-md-4">

                <div class="stats-box">

                    <h2>

                        ₹

                        <asp:Label ID="lblEstimatedReturns"
                            runat="server"
                            Text="0">
                        </asp:Label>

                    </h2>

                    <p>Estimated Returns</p>

                </div>

            </div>

        </div>

        <!-- TABLE -->

        <div class="report-box table-responsive">

            <asp:GridView ID="gvInvestment"
                runat="server"
                CssClass="table table-bordered table-hover table-dark"
                AutoGenerateColumns="False"
                GridLines="None"
                EmptyDataText="No Investment Records Found">

                <Columns>

                    <asp:TemplateField HeaderText="#">

                        <ItemTemplate>

                            <%# Container.DataItemIndex + 1 %>

                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:BoundField
                        DataField="Input1"
                        HeaderText="Monthly Investment" />

                    <asp:BoundField
                        DataField="Input2"
                        HeaderText="Return Rate" />

                    <asp:BoundField
                        DataField="Input3"
                        HeaderText="Years" />

                    <asp:BoundField
                        DataField="Result"
                        HeaderText="Future Value" />

                    <asp:BoundField
                        DataField="CreatedDate"
                        HeaderText="Date"
                        DataFormatString="{0:dd-MMM-yyyy}" />

                </Columns>

            </asp:GridView>

        </div>

    </div>

</section>

</asp:Content>