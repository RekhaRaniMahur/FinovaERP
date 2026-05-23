<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="EMIReport.aspx.cs" Inherits="FinovaERP.Reports.EMIReport" %>
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

.report-box{
    background:#1e293b;
    padding:30px;
    border-radius:18px;
    box-shadow:0px 4px 15px rgba(0,0,0,0.3);
}

.table{
    color:white;
}

.table thead{
    background:#334155;
}

.table tbody tr:hover{
    background:#273449;
}

.summary-card{
    background:#0f172a;
    border:1px solid #334155;
    border-radius:14px;
    padding:20px;
    text-align:center;
    margin-bottom:20px;
}

.summary-card h2{
    color:#22c55e;
    font-weight:bold;
}

.summary-card p{
    color:#cbd5e1;
}

</style>

<section class="report-section">

    <div class="container">

        <div class="report-title">

            <h1>
                <i class="fa-solid fa-money-bill-wave"></i>
                EMI Report
            </h1>

            <p>
                Loan and EMI calculation analytics
            </p>

        </div>

        <div class="row mb-4">

            <div class="col-md-4">

                <div class="summary-card">

                    <h2>
                        <asp:Label ID="lblTotalLoans"
                            runat="server"
                            Text="0">
                        </asp:Label>
                    </h2>

                    <p>Total EMI Calculations</p>

                </div>

            </div>

            <div class="col-md-4">

                <div class="summary-card">

                    <h2>
                        ₹
                        <asp:Label ID="lblTotalLoanAmount"
                            runat="server"
                            Text="0">
                        </asp:Label>
                    </h2>

                    <p>Total Loan Amount</p>

                </div>

            </div>

            <div class="col-md-4">

                <div class="summary-card">

                    <h2>
                        ₹
                        <asp:Label ID="lblAverageEMI"
                            runat="server"
                            Text="0">
                        </asp:Label>
                    </h2>

                    <p>Average EMI</p>

                </div>

            </div>

        </div>

        <div class="report-box table-responsive">

            <asp:GridView ID="gvEMIReport"
    runat="server"
    CssClass="table table-bordered table-hover table-dark"
    AutoGenerateColumns="False">

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
            HeaderText="Loan Amount" />

        <asp:BoundField
            DataField="Input2"
            HeaderText="Interest Rate" />

        <asp:BoundField
            DataField="Input3"
            HeaderText="Months" />

        <asp:BoundField
            DataField="Result"
            HeaderText="Result" />

        <asp:BoundField
            DataField="CreatedDate"
            HeaderText="Date"
            DataFormatString="{0:dd-MMM-yyyy hh:mm tt}" />

    </Columns>

</asp:GridView>

        </div>

    </div>

</section>

</asp:Content>