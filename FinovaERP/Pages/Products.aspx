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
    }

    .table td,
    .table th {
        vertical-align: middle;
    }

    label{
        margin-bottom:6px;
        margin-top:10px;
        font-weight:600;
    }

    .product-img {
        border-radius: 10px;
        object-fit: cover;
        border: 2px solid #fff;
    }

    .form-control,
    .form-select{
        height:45px;
    }

</style>

<div class="container-fluid">

    <h2 class="page-title">
        Product Management
    </h2>

    <div class="product-box">

        <!-- SEARCH -->

        <div class="row mb-4">

            <div class="col-md-4">

                <asp:TextBox ID="txtSearch"
                    runat="server"
                    CssClass="form-control"
                    placeholder="Search Product">
                </asp:TextBox>

            </div>

            <div class="col-md-2">

                <asp:Button ID="btnSearch"
                    runat="server"
                    Text="Search"
                    CssClass="btn btn-success w-100"
                    OnClick="btnSearch_Click" />

            </div>

            <div class="col-md-2">

                <asp:Button ID="btnShowAll"
                    runat="server"
                    Text="Show All"
                    CssClass="btn btn-warning w-100"
                    OnClick="btnShowAll_Click" />

            </div>

        </div>

        <!-- FORM -->

        <div class="row">

            <div class="col-md-4">

                <label>Product Name</label>

                <asp:TextBox ID="txtProductName"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>Product Code</label>

                <asp:TextBox ID="txtProductCode"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>Brand</label>

                <asp:TextBox ID="txtBrand"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>Price</label>

                <asp:TextBox ID="txtPrice"
                    runat="server"
                    TextMode="Number"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>Sale Price</label>

                <asp:TextBox ID="txtSalePrice"
                    runat="server"
                    TextMode="Number"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>Quantity</label>

                <asp:TextBox ID="txtQuantity"
                    runat="server"
                    TextMode="Number"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>Category</label>

                <asp:DropDownList ID="ddlCategory"
                    runat="server"
                    CssClass="form-select">

                    <asp:ListItem Text="Select Category" Value="" />
                    <asp:ListItem Text="Electronics" Value="Electronics" />
                    <asp:ListItem Text="Fashion" Value="Fashion" />
                    <asp:ListItem Text="Furniture" Value="Furniture" />
                    <asp:ListItem Text="Mobile" Value="Mobile" />
                    <asp:ListItem Text="Laptop" Value="Laptop" />

                </asp:DropDownList>

            </div>

            <div class="col-md-4">

                <label>Status</label>

                <asp:DropDownList ID="ddlStatus"
                    runat="server"
                    CssClass="form-select">

                    <asp:ListItem Text="Active" Value="Active" />
                    <asp:ListItem Text="Inactive" Value="Inactive" />

                </asp:DropDownList>

            </div>

            <div class="col-md-4">

                <label>Stock Status</label>

                <asp:DropDownList ID="ddlStockStatus"
                    runat="server"
                    CssClass="form-select">

                    <asp:ListItem Text="In Stock" Value="In Stock" />
                    <asp:ListItem Text="Out Of Stock" Value="Out Of Stock" />
                    <asp:ListItem Text="Low Stock" Value="Low Stock" />

                </asp:DropDownList>

            </div>

            <div class="col-md-4">

                <label>Supplier Name</label>

                <asp:TextBox ID="txtSupplier"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>Warranty</label>

                <asp:TextBox ID="txtWarranty"
                    runat="server"
                    CssClass="form-control"
                    placeholder="1 Year">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>SKU</label>

                <asp:TextBox ID="txtSKU"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>Barcode</label>

                <asp:TextBox ID="txtBarcode"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>GST %</label>

                <asp:TextBox ID="txtGST"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>Discount %</label>

                <asp:TextBox ID="txtDiscount"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>Weight</label>

                <asp:TextBox ID="txtWeight"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>Color</label>

                <asp:TextBox ID="txtColor"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>Size</label>

                <asp:TextBox ID="txtSize"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>Manufacturer</label>

                <asp:TextBox ID="txtManufacturer"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>Expiry Date</label>

                <asp:TextBox ID="txtExpiryDate"
                    runat="server"
                    TextMode="Date"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>Product Image</label>

                <asp:FileUpload ID="fuProductImage"
                    runat="server"
                    CssClass="form-control" />

            </div>

            <div class="col-md-12">

                <label>Description</label>

                <asp:TextBox ID="txtDescription"
                    runat="server"
                    CssClass="form-control"
                    TextMode="MultiLine"
                    Rows="4">
                </asp:TextBox>

            </div>

        </div>

        <br />

        <!-- BUTTONS -->

        <asp:Button ID="btnAdd"
            runat="server"
            Text="Add Product"
            CssClass="btn btn-primary"
            OnClick="btnAdd_Click" />

        <asp:Button ID="btnReset"
            runat="server"
            Text="Reset"
            CssClass="btn btn-secondary ms-2"
            OnClick="btnReset_Click" />

        <br /><br />

        <!-- GRIDVIEW -->

        <div class="table-responsive">

            <asp:GridView ID="gvProducts"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-bordered table-hover table-dark"
                HeaderStyle-CssClass="table-primary"
                DataKeyNames="ProductId"
                EmptyDataText="No Record Found"
                OnRowDeleting="gvProducts_RowDeleting"
                OnRowEditing="gvProducts_RowEditing"
                OnRowCancelingEdit="gvProducts_RowCancelingEdit"
                OnRowUpdating="gvProducts_RowUpdating">

                <Columns>

                    <asp:TemplateField HeaderText="Request ID">

    <ItemTemplate>

        REQ<%# Eval("ProductId") %>

    </ItemTemplate>

</asp:TemplateField>

                    <asp:BoundField DataField="ProductName"
                        HeaderText="Product Name" />

                    <asp:BoundField DataField="ProductCode"
                        HeaderText="Code" />

                    <asp:BoundField DataField="Brand"
                        HeaderText="Brand" />

                    <asp:BoundField DataField="Category"
                        HeaderText="Category" />

                    <asp:BoundField DataField="Price"
                        HeaderText="Price" />

                    <asp:BoundField DataField="SalePrice"
                        HeaderText="Sale Price" />

                    <asp:BoundField DataField="Quantity"
                        HeaderText="Quantity" />

                    <asp:BoundField DataField="StockStatus"
                        HeaderText="Stock" />

                    <asp:BoundField DataField="Status"
                        HeaderText="Status" />

                    <asp:BoundField DataField="SupplierName"
                        HeaderText="Supplier" />

                    <asp:BoundField DataField="Warranty"
                        HeaderText="Warranty" />

                    <asp:BoundField DataField="SKU"
                        HeaderText="SKU" />

                    <asp:BoundField DataField="Barcode"
                        HeaderText="Barcode" />

                    <asp:BoundField DataField="GST"
                        HeaderText="GST %" />

                    <asp:BoundField DataField="Discount"
                        HeaderText="Discount %" />

                    <asp:BoundField DataField="Weight"
                        HeaderText="Weight" />

                    <asp:BoundField DataField="Color"
                        HeaderText="Color" />

                    <asp:BoundField DataField="Size"
                        HeaderText="Size" />

                    <asp:BoundField DataField="Manufacturer"
                        HeaderText="Manufacturer" />

                    <asp:BoundField DataField="ExpiryDate"
                        HeaderText="Expiry Date" />

                    <asp:BoundField DataField="CreatedDate"
                        HeaderText="Created Date"
                        ReadOnly="True" />

                    <asp:TemplateField HeaderText="Image">

                        <ItemTemplate>

                            <img src='../ProductImages/<%# Eval("ProductImage") %>'
                                width="70"
                                height="70"
                                class="product-img" />

                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:CommandField ShowEditButton="True"
                        HeaderText="Edit" />

                    <asp:TemplateField HeaderText="Delete">

                        <ItemTemplate>

                            <asp:LinkButton ID="btnDelete"
                                runat="server"
                                CommandName="Delete"
                                Text="Delete"
                                CssClass="btn btn-danger btn-sm"
                                OnClientClick="return confirm('Are you sure to delete?');">

                            </asp:LinkButton>

                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </div>

</div>

</asp:Content>
