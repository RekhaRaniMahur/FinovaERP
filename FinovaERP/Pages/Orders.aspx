<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="FinovaERP.Pages.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">

<style>

    .order-box {
        background: #1e293b;
        padding: 25px;
        border-radius: 18px;
        color: white;
        box-shadow: 0px 4px 15px rgba(0,0,0,0.3);
    }

    .page-title {
        color: #22c55e;
        margin-bottom: 25px;
        font-weight: bold;
    }

    label {
        margin-top: 10px;
        font-weight: 600;
    }

    .form-control,
    .form-select {
        height: 45px;
    }

</style>

<div class="container-fluid">

    <h2 class="page-title">
        Orders Management
    </h2>

    <div class="order-box">

        <!-- FORM -->

        <div class="row">

            <!-- CUSTOMER -->

            <div class="col-md-4">

                <label>Customer Name</label>

                <asp:TextBox ID="txtCustomer"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <!-- PRODUCT -->

            <div class="col-md-4">

                <label>Select Product</label>

                <asp:DropDownList ID="ddlProduct"
                    runat="server"
                    CssClass="form-select">
                </asp:DropDownList>

            </div>

            <!-- QUANTITY -->

            <div class="col-md-4">

                <label>Quantity</label>

                <asp:TextBox ID="txtQuantity"
                    runat="server"
                    TextMode="Number"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <!-- AMOUNT -->

            <div class="col-md-4">

                <label>Total Amount</label>

                <asp:TextBox ID="txtAmount"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <!-- PAYMENT -->

            <div class="col-md-4">

                <label>Payment Status</label>

                <asp:DropDownList ID="ddlPayment"
                    runat="server"
                    CssClass="form-select">

                    <asp:ListItem Text="Paid" Value="Paid" />
                    <asp:ListItem Text="Pending" Value="Pending" />

                </asp:DropDownList>

            </div>

            <!-- ORDER STATUS -->

            <div class="col-md-4">

                <label>Order Status</label>

                <asp:DropDownList ID="ddlStatus"
                    runat="server"
                    CssClass="form-select">

                    <asp:ListItem Text="Processing" Value="Processing" />
                    <asp:ListItem Text="Completed" Value="Completed" />
                    <asp:ListItem Text="Cancelled" Value="Cancelled" />

                </asp:DropDownList>

            </div>

        </div>

        <br />

        <!-- BUTTON -->

        <asp:Button ID="btnAdd"
            runat="server"
            Text="Add Order"
            CssClass="btn btn-success"
            OnClick="btnAdd_Click" />

        <br /><br />

        <!-- GRIDVIEW -->

        <div class="table-responsive">

            <asp:GridView ID="gvOrders"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-bordered table-dark table-hover"
                HeaderStyle-CssClass="table-primary">

                <Columns>

                    <asp:BoundField DataField="OrderId"
                        HeaderText="Order ID" />

                    <asp:BoundField DataField="CustomerName"
                        HeaderText="Customer" />

                    <asp:BoundField DataField="ProductName"
                        HeaderText="Product" />

                    <asp:BoundField DataField="Quantity"
                        HeaderText="Quantity" />

                    <asp:BoundField DataField="TotalAmount"
                        HeaderText="Amount" />

                    <asp:BoundField DataField="PaymentStatus"
                        HeaderText="Payment" />

                    <asp:BoundField DataField="OrderStatus"
                        HeaderText="Status" />

                    <asp:BoundField DataField="OrderDate"
                        HeaderText="Date" />

                </Columns>

            </asp:GridView>

        </div>

    </div>

</div>

</asp:Content>