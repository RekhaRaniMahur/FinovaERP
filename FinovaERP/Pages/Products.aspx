<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="FinovaERP.Pages.Products" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<style>
    .product-box {
        background: #1e293b;
        padding: 25px;
        border-radius: 18px;
        color: white;
        box-shadow: 0px 4px 15px rgba(0,0,0,0.3);
    }

    .page-title {
        font-weight: bold;
        margin-bottom: 25px;
        color: #0d8f52;
        display: inline-block;
    }

    .add-product-btn {
        float: right;
        margin-top: 5px;
        background: linear-gradient(135deg, #2563eb, #06b6d4);
        border: none;
        padding: 10px 25px;
        border-radius: 40px;
        font-weight: 600;
        color: white;
        cursor: pointer;
    }

    .add-product-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(37,99,235,0.4);
    }

    .table td, .table th {
        vertical-align: middle;
    }

    label {
        margin-bottom: 6px;
        margin-top: 10px;
        font-weight: 600;
        color: #e2e8f0;
    }

    .product-img {
        border-radius: 10px;
        object-fit: cover;
        border: 2px solid #fff;
    }

    .form-control, .form-select {
        height: 45px;
        background: #fff;
        border: 1px solid #334155;
        color: white;
    }

    .form-control:focus, .form-select:focus {
        border-color: #2563eb;
        color: #1e293b;
        box-shadow: 0 0 0 0.2rem rgba(37,99,235,0.25);
    }

    /* Modal Styles */
    .modal-content {
        background: linear-gradient(135deg, #1e293b, #0f172a);
        border: none;
        border-radius: 24px;
        color: white;
    }

    .modal-header {
        border-bottom: 1px solid rgba(255,255,255,0.1);
        padding: 20px 25px;
    }

    .modal-header .btn-close {
        background: rgba(255,255,255,0.2);
        border-radius: 50%;
        opacity: 1;
    }

    .modal-title {
        font-weight: 700;
        font-size: 1.5rem;
    }

    .modal-title i {
        color: #06b6d4;
        margin-right: 10px;
    }

    .modal-body {
        padding: 25px;
        max-height: 70vh;
        overflow-y: auto;
    }

    .modal-footer {
        border-top: 1px solid rgba(255,255,255,0.1);
        padding: 20px 25px;
    }

    .modal-footer .btn-primary {
        background: linear-gradient(135deg, #2563eb, #06b6d4);
        border: none;
        padding: 10px 30px;
        border-radius: 40px;
    }

    .modal-footer .btn-secondary {
        background: #334155;
        border: none;
        padding: 10px 25px;
        border-radius: 40px;
    }

    .form-section {
        background: rgba(255,255,255,0.03);
        border-radius: 16px;
        padding: 15px;
        margin-bottom: 20px;
    }

    .form-section-title {
        font-size: 14px;
        font-weight: 600;
        color: #06b6d4;
        margin-bottom: 15px;
        padding-bottom: 8px;
        border-bottom: 1px solid rgba(255,255,255,0.1);
    }

    .modal-body::-webkit-scrollbar {
        width: 5px;
    }

    .modal-body::-webkit-scrollbar-track {
        background: rgba(255,255,255,0.05);
        border-radius: 10px;
    }

    .modal-body::-webkit-scrollbar-thumb {
        background: #2563eb;
        border-radius: 10px;
    }

    @media (max-width: 768px) {
        .add-product-btn {
            float: none;
            display: block;
            margin-bottom: 15px;
            width: 100%;
        }
        
        .page-title {
            display: block;
            text-align: center;
        }
        
        .modal-body {
            padding: 15px;
        }
    }
</style>

<div class="container-fluid">
    <!-- Header with Add Button -->
    <div class="d-flex justify-content-between align-items-center flex-wrap mb-4">
        <h2 class="page-title">
            <i class="fas fa-box me-2"></i>Product Management
        </h2>
        <!-- Button to open modal - using standard HTML button with data-bs-toggle -->
        <button type="button" class="btn add-product-btn" data-bs-toggle="modal" data-bs-target="#addProductModal">
            <i class="fas fa-plus-circle me-2"></i>Add New Product
        </button>
    </div>

    <div class="product-box">
        <!-- SEARCH SECTION -->
        <div class="row mb-4">
            <div class="col-md-4">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search Product...">
                </asp:TextBox>
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-success w-100" OnClick="btnSearch_Click" />
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnShowAll" runat="server" Text="Show All" CssClass="btn btn-warning w-100" OnClick="btnShowAll_Click" />
            </div>
        </div>

        <!-- GRIDVIEW -->
        <div class="table-responsive">
            <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" 
                CssClass="table table-bordered table-hover table-dark"
                HeaderStyle-CssClass="table-primary" DataKeyNames="ProductId"
                EmptyDataText="No Record Found" OnRowDeleting="gvProducts_RowDeleting"
                OnRowEditing="gvProducts_RowEditing" OnRowCancelingEdit="gvProducts_RowCancelingEdit"
                OnRowUpdating="gvProducts_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>REQ<%# Eval("ProductId") %></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                    <asp:BoundField DataField="ProductCode" HeaderText="Code" />
                    <asp:BoundField DataField="Brand" HeaderText="Brand" />
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:BoundField DataField="Quantity" HeaderText="Qty" />
                    <asp:BoundField DataField="StockStatus" HeaderText="Stock" />
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <img src='../ProductImages/<%# Eval("ProductImage") %>' width="50" height="50" class="product-img" onerror="this.src='https://placehold.co/50x50/334155/white?text=No+Image'" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" HeaderText="Edit" ButtonType="Button" ControlStyle-CssClass="btn btn-warning btn-sm" />
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" 
                                CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('Are you sure to delete?');">
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</div>

<!-- ============================================ -->
<!-- ADD PRODUCT MODAL - POPUP FORM              -->
<!-- ============================================ -->
<div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addProductModalLabel">
                    <i class="fas fa-plus-circle"></i> Add New Product
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Basic Information Section -->
                <div class="form-section">
                    <div class="form-section-title">
                        <i class="fas fa-info-circle me-2"></i>Basic Information
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label>Product Name *</label>
                            <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" placeholder="Enter product name"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label>Product Code *</label>
                            <asp:TextBox ID="txtProductCode" runat="server" CssClass="form-control" placeholder="PROD-001"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label>SKU</label>
                            <asp:TextBox ID="txtSKU" runat="server" CssClass="form-control" placeholder="SKU-001"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Brand</label>
                            <asp:TextBox ID="txtBrand" runat="server" CssClass="form-control" placeholder="Brand name"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Category *</label>
                            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
                                <asp:ListItem Text="Select Category" Value="" />
                                <asp:ListItem Text="Electronics" Value="Electronics" />
                                <asp:ListItem Text="Fashion" Value="Fashion" />
                                <asp:ListItem Text="Furniture" Value="Furniture" />
                                <asp:ListItem Text="Mobile" Value="Mobile" />
                                <asp:ListItem Text="Laptop" Value="Laptop" />
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <!-- Pricing & Stock Section -->
                <div class="form-section">
                    <div class="form-section-title">
                        <i class="fas fa-tag me-2"></i>Pricing & Stock
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <label>Price (₹) *</label>
                            <asp:TextBox ID="txtPrice" runat="server" TextMode="Number" CssClass="form-control" placeholder="0.00"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label>Sale Price (₹)</label>
                            <asp:TextBox ID="txtSalePrice" runat="server" TextMode="Number" CssClass="form-control" placeholder="0.00"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label>Quantity *</label>
                            <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" CssClass="form-control" placeholder="0"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label>Stock Status</label>
                            <asp:DropDownList ID="ddlStockStatus" runat="server" CssClass="form-select">
                                <asp:ListItem Text="In Stock" Value="In Stock" />
                                <asp:ListItem Text="Low Stock" Value="Low Stock" />
                                <asp:ListItem Text="Out Of Stock" Value="Out Of Stock" />
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-3">
                            <label>GST (%)</label>
                            <asp:TextBox ID="txtGST" runat="server" CssClass="form-control" placeholder="18"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label>Discount (%)</label>
                            <asp:TextBox ID="txtDiscount" runat="server" CssClass="form-control" placeholder="0"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label>Status</label>
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select">
                                <asp:ListItem Text="Active" Value="Active" />
                                <asp:ListItem Text="Inactive" Value="Inactive" />
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <!-- Additional Details Section -->
                <div class="form-section">
                    <div class="form-section-title">
                        <i class="fas fa-truck me-2"></i>Supplier & Warranty
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Supplier Name</label>
                            <asp:TextBox ID="txtSupplier" runat="server" CssClass="form-control" placeholder="Supplier name"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <label>Manufacturer</label>
                            <asp:TextBox ID="txtManufacturer" runat="server" CssClass="form-control" placeholder="Manufacturer name"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <label>Warranty</label>
                            <asp:TextBox ID="txtWarranty" runat="server" CssClass="form-control" placeholder="1 Year"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <!-- Specifications Section -->
                <div class="form-section">
                    <div class="form-section-title">
                        <i class="fas fa-cog me-2"></i>Specifications
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <label>Barcode</label>
                            <asp:TextBox ID="txtBarcode" runat="server" CssClass="form-control" placeholder="Barcode number"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label>Weight (kg)</label>
                            <asp:TextBox ID="txtWeight" runat="server" CssClass="form-control" placeholder="0.00"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label>Color</label>
                            <asp:TextBox ID="txtColor" runat="server" CssClass="form-control" placeholder="Color"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                            <label>Size</label>
                            <asp:TextBox ID="txtSize" runat="server" CssClass="form-control" placeholder="S, M, L, XL"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Expiry Date</label>
                            <asp:TextBox ID="txtExpiryDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <label>Product Image</label>
                            <asp:FileUpload ID="fuProductImage" runat="server" CssClass="form-control" />
                            <small class="text-muted">Supported formats: JPG, PNG, GIF (Max 2MB)</small>
                        </div>
                    </div>
                </div>

                <!-- Description Section -->
                <div class="form-section">
                    <div class="form-section-title">
                        <i class="fas fa-align-left me-2"></i>Description
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Product description..."></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    <i class="fas fa-times me-2"></i>Cancel
                </button>
                <asp:Button ID="btnAdd" runat="server" Text="Save Product" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
                <asp:Button ID="btnReset" runat="server" Text="Reset Form" CssClass="btn btn-secondary" OnClick="btnReset_Click" />
            </div>
        </div>
    </div>
</div>

<!-- Hidden fields for proper code-behind -->
<asp:HiddenField ID="hfProductId" runat="server" Value="0" />

<!-- Ensure Bootstrap JS is loaded -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
    // Function to open modal manually if needed
    function openAddProductModal() {
        var myModal = new bootstrap.Modal(document.getElementById('addProductModal'));
        myModal.show();
    }

    // Function to close modal
    function closeAddProductModal() {
        var myModal = bootstrap.Modal.getInstance(document.getElementById('addProductModal'));
        if (myModal) {
            myModal.hide();
        }
    }

    // Show success message and close modal
    function showSuccessAndClose(message) {
        alert(message);
        closeAddProductModal();
        // Optionally refresh the page or grid
        window.location.reload();
    }

    // Show error message
    function showErrorMessage(message) {
        alert('Error: ' + message);
    }

    // Ensure modal works when button is clicked
    document.addEventListener('DOMContentLoaded', function() {
        var addBtn = document.querySelector('.add-product-btn');
        if (addBtn) {
            addBtn.addEventListener('click', function(e) {
                // Bootstrap will handle it automatically with data-bs-toggle
                console.log('Add button clicked');
            });
        }
    });
</script>

</asp:Content>
