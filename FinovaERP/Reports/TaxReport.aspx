<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="TaxReport.aspx.cs" Inherits="FinovaERP.Reports.TaxReport" %>
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
    font-size:18px;
}

.report-box{
    background:#1e293b;
    padding:30px;
    border-radius:18px;
    box-shadow:0px 4px 15px rgba(0,0,0,0.3);
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

.table{
    color:white;
}

.table thead{
    background:#334155;
}

.table tbody tr:hover{
    background:#273449;
}

</style>

<section class="report-section">

    <div class="container">

        <div class="report-title">

            <h1>

                <i class="fa-solid fa-file-invoice-dollar"></i>

                Tax Report

            </h1>

            <p>
                Tax calculation and income analytics
            </p>

        </div>

        <div class="row mb-4">

            <div class="col-md-4">

                <div class="summary-card">

                    <h2>

                        <asp:Label ID="lblTotalTaxRecords"
                            runat="server"
                            Text="0">
                        </asp:Label>

                    </h2>

                    <p>Total Tax Calculations</p>

                </div>

            </div>

            <div class="col-md-4">

                <div class="summary-card">

                    <h2>

                        ₹
                        <asp:Label ID="lblTotalIncome"
                            runat="server"
                            Text="0">
                        </asp:Label>

                    </h2>

                    <p>Total Income Checked</p>

                </div>

            </div>

            <div class="col-md-4">

                <div class="summary-card">

                    <h2>

                        ₹
                        <asp:Label ID="lblTotalTax"
                            runat="server"
                            Text="0">
                        </asp:Label>

                    </h2>

                    <p>Total Estimated Tax</p>

                </div>

            </div>

        </div>

        <div class="report-box table-responsive">

            <asp:GridView ID="gvTaxReport"
                runat="server"
                CssClass="table table-bordered table-hover table-dark"
                AutoGenerateColumns="False"
                GridLines="None"
                EmptyDataText="No Tax Report Found">

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
                        HeaderText="Income" />

                    <asp:BoundField
                        DataField="Input2"
                        HeaderText="Tax Rate" />

                    <asp:BoundField
                        DataField="Result"
                        HeaderText="Tax Result" />

                    <asp:BoundField
                        DataField="CreatedDate"
                        HeaderText="Created Date"
                        DataFormatString="{0:dd-MMM-yyyy hh:mm tt}" />

                </Columns>

            </asp:GridView>

        </div>

    </div>

</section>

</asp:Content>
