<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="Calculators.aspx.cs" Inherits="FinovaERP.Calculators" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script>

    function isNumber(evt) {

        var charCode =
            (evt.which) ? evt.which : evt.keyCode;

        if (charCode > 31 &&
            (charCode < 48 || charCode > 57) &&
            charCode != 46) {

            return false;
        }

        return true;
    }

</script>

<style>

    .calculator-section {
        padding: 60px 0;
        background: #0f172a;
        min-height: 100vh;
        color: white;
    }

    .calculator-title {
        text-align: center;
        margin-bottom: 40px;
    }

    .calculator-title h1 {
        color: #38bdf8;
        font-weight: bold;
        font-size: 45px;
    }

    .calculator-title p {
        color: #cbd5e1;
        font-size: 18px;
    }

    .calc-box {
        background: #1e293b;
        padding: 25px;
        border-radius: 18px;
        box-shadow: 0px 4px 15px rgba(0,0,0,0.3);
        margin-bottom: 30px;
        transition: 0.3s;
    }

    .calc-box:hover {
        transform: translateY(-5px);
    }

    .calc-box h3 {
        color: #22c55e;
        margin-bottom: 20px;
        font-weight: bold;
    }

    .form-control {
        height: 50px;
        margin-bottom: 15px;
        border-radius: 10px;
    }

    .btn-calc {
        width: 100%;
        height: 50px;
        font-weight: bold;
        border-radius: 10px;
        transition: 0.3s;
    }

    .btn-calc:hover {
        transform: scale(1.02);
    }

    .result-box {
        margin-top: 20px;
        background: #0f172a;
        padding: 15px;
        border-radius: 12px;
        border: 1px solid #334155;
    }

    .result-box h4 {
        color: #facc15;
        margin: 0;
        line-height: 35px;
        font-size: 20px;
        font-weight: bold;
    }

    #MainContent_btnClear {
        font-weight: bold;
        border-radius: 12px;
    }

</style>

<section class="calculator-section">

    <div class="container">

        <div class="calculator-title">

            <h1>
                <i class="fa-solid fa-calculator"></i>
                Financial Calculators
            </h1>

            <p>
                Smart tools for financial planning
            </p>

        </div>

        <div class="row">

            <!-- SIP -->

            <div class="col-md-6">

                <div class="calc-box">

                    <h3>
                        <i class="fa-solid fa-chart-line"></i>
                        SIP Calculator
                    </h3>

                    <asp:TextBox ID="txtSipAmount"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Monthly Investment"
                        onkeypress="return isNumber(event)">
                    </asp:TextBox>

                    <asp:TextBox ID="txtSipRate"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Expected Return Rate (%)"
                        onkeypress="return isNumber(event)">
                    </asp:TextBox>

                    <asp:TextBox ID="txtSipYears"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Investment Years"
                        onkeypress="return isNumber(event)">
                    </asp:TextBox>

                    <asp:Button ID="btnSip"
                        runat="server"
                        Text="Calculate SIP"
                        CssClass="btn btn-success btn-calc"
                        OnClick="btnSip_Click" />

                    <div class="result-box">

                        <h4>

                            <asp:Label ID="lblSipResult"
                                runat="server"
                                Text="Result Will Show Here">
                            </asp:Label>

                        </h4>

                    </div>

                </div>

            </div>

            <!-- EMI -->

            <div class="col-md-6">

                <div class="calc-box">

                    <h3>
                        <i class="fa-solid fa-money-bill-wave"></i>
                        EMI Calculator
                    </h3>

                    <asp:TextBox ID="txtLoanAmount"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Loan Amount"
                        onkeypress="return isNumber(event)">
                    </asp:TextBox>

                    <asp:TextBox ID="txtInterest"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Interest Rate (%)"
                        onkeypress="return isNumber(event)">
                    </asp:TextBox>

                    <asp:TextBox ID="txtMonths"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Loan Duration (Months)"
                        onkeypress="return isNumber(event)">
                    </asp:TextBox>

                    <asp:Button ID="btnEmi"
                        runat="server"
                        Text="Calculate EMI"
                        CssClass="btn btn-primary btn-calc"
                        OnClick="btnEmi_Click" />

                    <div class="result-box">

                        <h4>

                            <asp:Label ID="lblEmiResult"
                                runat="server"
                                Text="Result Will Show Here">
                            </asp:Label>

                        </h4>

                    </div>

                </div>

            </div>

            <!-- RETIREMENT -->

            <div class="col-md-6">

                <div class="calc-box">

                    <h3>
                        <i class="fa-solid fa-piggy-bank"></i>
                        Retirement Calculator
                    </h3>

                    <asp:TextBox ID="txtRetirementMonthly"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Monthly Saving"
                        onkeypress="return isNumber(event)">
                    </asp:TextBox>

                    <asp:TextBox ID="txtRetirementRate"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Interest Rate (%)"
                        onkeypress="return isNumber(event)">
                    </asp:TextBox>

                    <asp:TextBox ID="txtRetirementYears"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Years"
                        onkeypress="return isNumber(event)">
                    </asp:TextBox>

                    <asp:Button ID="btnRetirement"
                        runat="server"
                        Text="Calculate Retirement"
                        CssClass="btn btn-warning btn-calc"
                        OnClick="btnRetirement_Click" />

                    <div class="result-box">

                        <h4>

                            <asp:Label ID="lblRetirementResult"
                                runat="server"
                                Text="Result Will Show Here">
                            </asp:Label>

                        </h4>

                    </div>

                </div>

            </div>

            <!-- TAX -->

            <div class="col-md-6">

                <div class="calc-box">

                    <h3>
                        <i class="fa-solid fa-file-invoice-dollar"></i>
                        Tax Calculator
                    </h3>

                    <asp:TextBox ID="txtIncome"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Annual Income"
                        onkeypress="return isNumber(event)">
                    </asp:TextBox>

                    <asp:TextBox ID="txtTaxRate"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Tax Percentage"
                        onkeypress="return isNumber(event)">
                    </asp:TextBox>

                    <asp:Button ID="btnTax"
                        runat="server"
                        Text="Calculate Tax"
                        CssClass="btn btn-danger btn-calc"
                        OnClick="btnTax_Click" />

                    <div class="result-box">

                        <h4>

                            <asp:Label ID="lblTaxResult"
                                runat="server"
                                Text="Result Will Show Here">
                            </asp:Label>

                        </h4>

                    </div>

                </div>

            </div>

        </div>

        <!-- CLEAR BUTTON -->

        <div class="text-center mt-4">

            <asp:Button ID="btnClear"
                runat="server"
                Text="Clear All"
                CssClass="btn btn-light px-5 py-3"
                OnClick="btnClear_Click" />

        </div>

        <!-- HISTORY BUTTON -->

        <div class="text-center mt-3">

            <a href="CalculatorHistory.aspx"
               class="btn btn-info px-5 py-3">

                <i class="fa-solid fa-clock-rotate-left"></i>
                View Calculator History

            </a>

        </div>

    </div>

</section>

</asp:Content>
