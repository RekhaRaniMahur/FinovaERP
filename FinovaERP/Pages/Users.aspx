<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="FinovaERP.Pages.Users" EnableEventValidation="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<style>

    .user-box {
        background: #1e293b;
        padding: 25px;
        border-radius: 18px;
        color: white;
        box-shadow: 0px 4px 15px rgba(0,0,0,0.3);
    }

    .page-title {
        font-weight: bold;
        margin-bottom: 25px;
        color: #22c55e;
    }

    .table td,
    .table th {
        vertical-align: middle;
    }

    label {
        margin-bottom: 6px;
        margin-top: 10px;
        font-weight: 600;
    }

    .form-control,
    .form-select {
        height: 45px;
    }

    .user-img {
        border-radius: 50%;
        object-fit: cover;
        border: 2px solid #fff;
    }

</style>

<div class="container-fluid">

    <h2 class="page-title">
        User Management
    </h2>

    <div class="user-box">

        <!-- SEARCH SECTION -->

        <div class="row mb-4">

            <div class="col-md-4">

                <asp:TextBox ID="txtSearch"
                    runat="server"
                    CssClass="form-control"
                    placeholder="Search User">
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

            <div class="col-md-2">

                <asp:Button ID="btnExportExcel"
                    runat="server"
                    Text="Export Excel"
                    CssClass="btn btn-info w-100"
                    OnClick="btnExportExcel_Click" />

            </div>

            <div class="col-md-2">

                <asp:Button ID="btnPrint"
                    runat="server"
                    Text="Print"
                    CssClass="btn btn-dark w-100"
                    OnClientClick="window.print(); return false;" />

            </div>

        </div>

        <!-- FORM -->

        <div class="row">

            <div class="col-md-4">

                <label>Full Name</label>

                <asp:TextBox ID="txtFullName"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>Email</label>

                <asp:TextBox ID="txtEmail"
                    runat="server"
                    TextMode="Email"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>Mobile Number</label>

                <asp:TextBox ID="txtMobile"
                    runat="server"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>Password</label>

                <asp:TextBox ID="txtPassword"
                    runat="server"
                    TextMode="Password"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>Role</label>

                <asp:DropDownList ID="ddlRole"
                    runat="server"
                    CssClass="form-select">

                    <asp:ListItem Text="Select Role" Value="" />
                    <asp:ListItem Text="Admin" Value="Admin" />
                    <asp:ListItem Text="Manager" Value="Manager" />
                    <asp:ListItem Text="Staff" Value="Staff" />

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

                <label>Gender</label>

                <asp:DropDownList ID="ddlGender"
                    runat="server"
                    CssClass="form-select">

                    <asp:ListItem Text="Select Gender" Value="" />
                    <asp:ListItem Text="Male" Value="Male" />
                    <asp:ListItem Text="Female" Value="Female" />

                </asp:DropDownList>

            </div>

            <div class="col-md-4">

                <label>Date Of Birth</label>

                <asp:TextBox ID="txtDOB"
                    runat="server"
                    TextMode="Date"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-4">

                <label>Joining Date</label>

                <asp:TextBox ID="txtJoiningDate"
                    runat="server"
                    TextMode="Date"
                    CssClass="form-control">
                </asp:TextBox>

            </div>

            <div class="col-md-6">

                <label>Address</label>

                <asp:TextBox ID="txtAddress"
                    runat="server"
                    CssClass="form-control"
                    TextMode="MultiLine"
                    Rows="3">
                </asp:TextBox>

            </div>

            <div class="col-md-6">

                <label>User Image</label>

                <asp:FileUpload ID="fuUserImage"
                    runat="server"
                    CssClass="form-control" />

            </div>

        </div>

        <br />

        <!-- BUTTONS -->

        <asp:Button ID="btnAdd"
            runat="server"
            Text="Add User"
            CssClass="btn btn-primary"
            OnClick="btnAdd_Click" />

        <asp:Button ID="btnReset"
            runat="server"
            Text="Reset"
            CssClass="btn btn-secondary ms-2"
            OnClick="btnReset_Click" />

        <br /><br />

        <!-- TOTAL RECORD -->

        <asp:Label ID="lblTotal"
            runat="server"
            CssClass="fw-bold text-warning">
        </asp:Label>

        <br /><br />

        <!-- GRIDVIEW -->

        <div class="table-responsive">

            <asp:GridView ID="gvUsers"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-bordered table-hover table-dark"
                HeaderStyle-CssClass="table-primary"
                DataKeyNames="UserId"
                EmptyDataText="No Record Found"
                OnRowDeleting="gvUsers_RowDeleting"
                OnRowEditing="gvUsers_RowEditing"
                OnRowCancelingEdit="gvUsers_RowCancelingEdit"
                OnRowUpdating="gvUsers_RowUpdating">

                <Columns>

                    <asp:TemplateField HeaderText="S.No">

                        <ItemTemplate>

                            <%# Container.DataItemIndex + 1 %>

                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="User ID">

                        <ItemTemplate>

                            USR<%# Eval("UserId") %>

                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:BoundField DataField="FullName"
                        HeaderText="Full Name" />

                    <asp:BoundField DataField="Email"
                        HeaderText="Email" />

                    <asp:BoundField DataField="Mobile"
                        HeaderText="Mobile" />

                    <asp:BoundField DataField="Role"
                        HeaderText="Role" />

                    <asp:TemplateField HeaderText="Status">

                        <ItemTemplate>

                            <span class='badge bg-success'>
                                <%# Eval("Status") %>
                            </span>

                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:BoundField DataField="Gender"
                        HeaderText="Gender" />

                    <asp:BoundField DataField="DOB"
                        HeaderText="DOB" />

                    <asp:BoundField DataField="JoiningDate"
                        HeaderText="Joining Date" />

                    <asp:BoundField DataField="Address"
                        HeaderText="Address" />

                    <asp:TemplateField HeaderText="Image">

                        <ItemTemplate>

                            <img src='../UserImages/<%# string.IsNullOrEmpty(Eval("UserImage").ToString()) ? "noimage.png" : Eval("UserImage") %>'
                                width="60"
                                height="60"
                                class="user-img" />

                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:BoundField DataField="CreatedDate"
                        HeaderText="Created Date" />

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