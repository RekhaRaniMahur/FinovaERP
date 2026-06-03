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
        color: #e2e8f0;
    }

    .form-control,
    .form-select {
        height: 45px;
        background: #0f172a;
        border: 1px solid #334155;
        color: white;
    }

    .form-control:focus,
    .form-select:focus {
        background: #1e293b;
        border-color: #22c55e;
        color: white;
        box-shadow: 0 0 0 0.2rem rgba(34,197,94,0.25);
    }

    .table {
        color: #cbd5e1;
    }

    .table-dark {
        background: #0f172a;
    }

    .table-primary {
        background: #1e293b;
        color: white;
    }

    .btn-success {
        background: linear-gradient(135deg, #22c55e, #16a34a);
        border: none;
        padding: 10px 25px;
        border-radius: 40px;
        font-weight: 600;
    }

    .btn-success:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(34,197,94,0.4);
    }

    .search-section {
        margin-bottom: 25px;
        padding-bottom: 20px;
        border-bottom: 1px solid rgba(255,255,255,0.1);
    }

    @media (max-width: 768px) {
        .order-box {
            padding: 15px;
        }
    }
</style>

<div class="container-fluid">
    <h2 class="page-title">
        <i class="fas fa-shopping-cart me-2"></i>Orders Management
    </h2>

    <div class="order-box">
        <!-- SEARCH SECTION -->
        <div class="row search-section">
            <div class="col-md-4">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by Customer Name...">
                </asp:TextBox>
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-success w-100" OnClick="btnSearch_Click" />
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnShowAll" runat="server" Text="Show All" CssClass="btn btn-secondary w-100" OnClick="btnShowAll_Click" />
            </div>
        </div>

        <!-- FORM -->
        <div class="row">
            <div class="col-md-4">
                <label><i class="fas fa-user me-2"></i>Customer Name *</label>
                <asp:TextBox ID="txtCustomer" runat="server" CssClass="form-control" placeholder="Enter customer name"></asp:TextBox>
            </div>

            <div class="col-md-4">
                <label><i class="fas fa-box me-2"></i>Select Product *</label>
                <asp:DropDownList ID="ddlProduct" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged">
                </asp:DropDownList>
            </div>

            <div class="col-md-4">
                <label><i class="fas fa-calculator me-2"></i>Quantity *</label>
                <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" CssClass="form-control" placeholder="Enter quantity" AutoPostBack="True" OnTextChanged="txtQuantity_TextChanged"></asp:TextBox>
            </div>

            <div class="col-md-3">
                <label><i class="fas fa-tag me-2"></i>Unit Price</label>
                <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="form-control" ReadOnly="True" BackColor="#334155"></asp:TextBox>
            </div>

            <div class="col-md-3">
                <label><i class="fas fa-rupee-sign me-2"></i>Total Amount</label>
                <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" ReadOnly="True" BackColor="#334155"></asp:TextBox>
            </div>

            <div class="col-md-3">
                <label><i class="fas fa-credit-card me-2"></i>Payment Method</label>
                <asp:DropDownList ID="ddlPayment" runat="server" CssClass="form-select">
                    <asp:ListItem Text="Cash" Value="Cash" />
                    <asp:ListItem Text="Card" Value="Card" />
                    <asp:ListItem Text="UPI" Value="UPI" />
                    <asp:ListItem Text="Net Banking" Value="Net Banking" />
                </asp:DropDownList>
            </div>

            <div class="col-md-3">
                <label><i class="fas fa-truck me-2"></i>Order Status</label>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select">
                    <asp:ListItem Text="Processing" Value="Processing" />
                    <asp:ListItem Text="Completed" Value="Completed" />
                    <asp:ListItem Text="Cancelled" Value="Cancelled" />
                </asp:DropDownList>
            </div>
        </div>

        <br />

        <!-- BUTTONS -->
        <asp:Button ID="btnAdd" runat="server" Text="Add Order" CssClass="btn btn-success" OnClick="btnAdd_Click" />
        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-secondary ms-2" OnClick="btnReset_Click" />

        <br /><br />

        <!-- GRIDVIEW -->
        <div class="table-responsive">
            <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" 
                CssClass="table table-bordered table-dark table-hover"
                HeaderStyle-CssClass="table-primary" DataKeyNames="OrderId"
                EmptyDataText="No orders found" OnRowDeleting="gvOrders_RowDeleting"
                OnRowEditing="gvOrders_RowEditing" OnRowCancelingEdit="gvOrders_RowCancelingEdit"
                OnRowUpdating="gvOrders_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="Order ID">
                        <ItemTemplate>ORD<%# Eval("OrderId") %></ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Customer">
                        <ItemTemplate><%# Eval("CustomerName") %></ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditCustomer" runat="server" Text='<%# Eval("CustomerName") %>' CssClass="form-control" Width="150px"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Product">
                        <ItemTemplate><%# Eval("ProductName") %></ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditProduct" runat="server" Text='<%# Eval("ProductName") %>' CssClass="form-control" Width="150px"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate><%# Eval("Quantity") %></ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditQuantity" runat="server" Text='<%# Eval("Quantity") %>' CssClass="form-control" Width="80px" TextMode="Number"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Amount">
                        <ItemTemplate>₹<%# Eval("TotalAmount", "{0:N2}") %></ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditAmount" runat="server" Text='<%# Eval("TotalAmount") %>' CssClass="form-control" Width="100px"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Payment">
                        <ItemTemplate><%# Eval("PaymentMethod") %></ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEditPayment" runat="server" SelectedValue='<%# Eval("PaymentMethod") %>' CssClass="form-select">
                                <asp:ListItem Text="Cash" Value="Cash" />
                                <asp:ListItem Text="Card" Value="Card" />
                                <asp:ListItem Text="UPI" Value="UPI" />
                                <asp:ListItem Text="Net Banking" Value="Net Banking" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <span class='badge bg-<%# GetStatusClass(Eval("Status").ToString()) %>'>
                                <%# Eval("Status") %>
                            </span>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlEditStatus" runat="server" SelectedValue='<%# Eval("Status") %>' CssClass="form-select">
                                <asp:ListItem Text="Processing" Value="Processing" />
                                <asp:ListItem Text="Completed" Value="Completed" />
                                <asp:ListItem Text="Cancelled" Value="Cancelled" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:BoundField DataField="OrderDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" ReadOnly="True" />
                    
                    <asp:CommandField ShowEditButton="True" HeaderText="Edit" ButtonType="Button" ControlStyle-CssClass="btn btn-warning btn-sm" />
                    
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" 
                                CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('Are you sure to delete this order?');">
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</div>

<script>
    function calculateTotal() {
        var quantity = document.getElementById('<%= txtQuantity.ClientID %>').value;
        var unitPrice = document.getElementById('<%= txtUnitPrice.ClientID %>').value;
        
        if (quantity && unitPrice) {
            var total = parseFloat(quantity) * parseFloat(unitPrice);
            document.getElementById('<%= txtAmount.ClientID %>').value = total.toFixed(2);
        }
    }
    
    document.getElementById('<%= txtQuantity.ClientID %>')?.addEventListener('keyup', calculateTotal);
    document.getElementById('<%= txtQuantity.ClientID %>')?.addEventListener('change', calculateTotal);
</script>

</asp:Content>
