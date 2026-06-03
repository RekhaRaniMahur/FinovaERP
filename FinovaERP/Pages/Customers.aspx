<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="FinovaERP.Pages.Customers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .customer-box {
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

    textarea.form-control {
        height: auto;
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

    .status-badge {
        padding: 4px 12px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: 600;
        display: inline-block;
    }

    .status-active {
        background: rgba(34,197,94,0.2);
        color: #22c55e;
    }

    .status-inactive {
        background: rgba(239,68,68,0.2);
        color: #ef4444;
    }

    @media (max-width: 768px) {
        .customer-box {
            padding: 15px;
        }
    }
</style>

<div class="container-fluid">
    <h2 class="page-title">
        <i class="fas fa-users me-2"></i>Customer Management
    </h2>

    <div class="customer-box">
        <!-- SEARCH SECTION -->
        <div class="row search-section">
            <div class="col-md-4">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by Customer Name, Email or Mobile...">
                </asp:TextBox>
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-success w-100" OnClick="btnSearch_Click" />
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnShowAll" runat="server" Text="Show All" CssClass="btn btn-secondary w-100" OnClick="btnShowAll_Click" />
            </div>
            <div class="col-md-4 text-end">
                <asp:Label ID="lblTotalCustomers" runat="server" CssClass="text-info" Font-Bold="true"></asp:Label>
            </div>
        </div>

        <!-- ADD/EDIT FORM -->
        <div class="row">
            <div class="col-md-4">
                <label><i class="fas fa-user me-2"></i>Customer Name *</label>
                <asp:TextBox ID="txtCustomerName" runat="server" CssClass="form-control" placeholder="Enter customer name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtCustomerName" 
                    ErrorMessage="Customer name required" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="Customer" />
            </div>

            <div class="col-md-4">
                <label><i class="fas fa-envelope me-2"></i>Email *</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="customer@example.com"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                    ErrorMessage="Email required" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="Customer" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" 
                    ErrorMessage="Invalid email format" ForeColor="#ef4444" Display="Dynamic" 
                    ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" ValidationGroup="Customer" />
            </div>

            <div class="col-md-4">
                <label><i class="fas fa-phone me-2"></i>Mobile *</label>
                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" TextMode="Phone" placeholder="9876543210"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile" 
                    ErrorMessage="Mobile number required" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="Customer" />
                <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="txtMobile" 
                    ErrorMessage="Enter valid 10-digit mobile number" ForeColor="#ef4444" Display="Dynamic" 
                    ValidationExpression="^[6-9]\d{9}$" ValidationGroup="Customer" />
            </div>

            <div class="col-md-3">
                <label><i class="fas fa-city me-2"></i>City</label>
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="City name"></asp:TextBox>
            </div>

            <div class="col-md-3">
                <label><i class="fas fa-map-marker-alt me-2"></i>State</label>
                <asp:TextBox ID="txtState" runat="server" CssClass="form-control" placeholder="State name"></asp:TextBox>
            </div>

            <div class="col-md-3">
                <label><i class="fas fa-code me-2"></i>Pincode</label>
                <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control" TextMode="Number" placeholder="110001"></asp:TextBox>
            </div>

            <div class="col-md-3">
                <label><i class="fas fa-toggle-on me-2"></i>Status</label>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select">
                    <asp:ListItem Text="Active" Value="Active" />
                    <asp:ListItem Text="Inactive" Value="Inactive" />
                </asp:DropDownList>
            </div>

            <div class="col-md-12">
                <label><i class="fas fa-address-card me-2"></i>Address</label>
                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" placeholder="Full address..."></asp:TextBox>
            </div>
        </div>

        <br />

        <!-- BUTTONS -->
        <asp:Button ID="btnAdd" runat="server" Text="Add Customer" CssClass="btn btn-success" OnClick="btnAdd_Click" ValidationGroup="Customer" />
        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-secondary ms-2" OnClick="btnReset_Click" />
        <asp:Button ID="btnUpdate" runat="server" Text="Update Customer" CssClass="btn btn-warning ms-2" Visible="false" OnClick="btnUpdate_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger ms-2" Visible="false" OnClick="btnCancel_Click" />

        <br /><br />

        <!-- HIDDEN FIELD FOR CUSTOMER ID -->
        <asp:HiddenField ID="hfCustomerId" runat="server" Value="0" />

        <!-- GRIDVIEW -->
        <div class="table-responsive">
            <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False" 
                CssClass="table table-bordered table-dark table-hover"
                HeaderStyle-CssClass="table-primary" DataKeyNames="CustomerId"
                EmptyDataText="No customers found" OnRowDeleting="gvCustomers_RowDeleting"
                OnRowCommand="gvCustomers_RowCommand">
                <Columns>
                    <asp:BoundField DataField="CustomerId" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                    <asp:BoundField DataField="City" HeaderText="City" />
                    <asp:BoundField DataField="State" HeaderText="State" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <span class='status-badge status-<%# Eval("Status").ToString().ToLower() %>'>
                                <%# Eval("Status") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditCustomer" 
                                CommandArgument='<%# Eval("CustomerId") %>' CssClass="btn btn-warning btn-sm me-1">
                                <i class="fas fa-edit"></i> Edit
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" 
                                CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('Are you sure to delete this customer?');">
                                <i class="fas fa-trash"></i> Delete
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</div>

<script>
    function clearForm() {
        document.getElementById('<%= txtCustomerName.ClientID %>').value = '';
        document.getElementById('<%= txtEmail.ClientID %>').value = '';
        document.getElementById('<%= txtMobile.ClientID %>').value = '';
        document.getElementById('<%= txtCity.ClientID %>').value = '';
        document.getElementById('<%= txtState.ClientID %>').value = '';
        document.getElementById('<%= txtPincode.ClientID %>').value = '';
        document.getElementById('<%= txtAddress.ClientID %>').value = '';
        document.getElementById('<%= ddlStatus.ClientID %>').selectedIndex = 0;
    }
</script>

</asp:Content>
