<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="FinovaERP.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


<style>

.products-section{
    padding:60px 0;
    background:#0f172a;
    min-height:100vh;
    color:white;
}

.products-title{
    text-align:center;
    margin-bottom:50px;
}

.products-title h1{
    color:#38bdf8;
    font-size:45px;
    font-weight:bold;
}

.products-title p{
    color:#cbd5e1;
    font-size:18px;
}

.product-card{
    background:#1e293b;
    border-radius:18px;
    padding:25px;
    text-align:center;
    transition:0.3s;
    height:100%;
    box-shadow:0px 4px 15px rgba(0,0,0,0.3);
}

.product-card:hover{
    transform:translateY(-5px);
}

.product-card i{
    font-size:50px;
    color:#38bdf8;
    margin-bottom:20px;
}

.product-card h3{
    font-size:24px;
    margin-bottom:15px;
    font-weight:bold;
}

.product-card p{
    color:#cbd5e1;
    min-height:70px;
}

.btn-product{
    border-radius:10px;
    margin-top:15px;
    font-weight:bold;
    padding:10px 25px;
}

.empty-box{
    text-align:center;
    padding:80px 20px;
}

.empty-box i{
    font-size:70px;
    color:#38bdf8;
    margin-bottom:20px;
}

.empty-box h2{
    color:white;
    margin-bottom:15px;
}

.empty-box p{
    color:#cbd5e1;
}

</style>

<section class="products-section">

    <div class="container">

        <div class="products-title">

            <h1>

                <i class="fa-solid fa-box-open"></i>

                Financial Products

            </h1>

            <p>
                Explore smart financial services
                and investment solutions
            </p>

        </div>

        <div class="row g-4">

            <!-- REPEATER -->

            <asp:Repeater ID="rptProducts"
                runat="server">

                <ItemTemplate>

                    <div class="col-md-4">

                        <div class="product-card">

                            <i class='fa-solid <%# Eval("ProductIcon") %>'>
                            </i>

                            <h3>

                                <%# Eval("ProductName") %>

                            </h3>

                            <p>

                                <%# Eval("ProductDescription") %>

                            </p>

                            <a href='<%# Eval("ButtonLink") %>'
                                class="btn btn-info btn-product">

                                <%# Eval("ButtonText") %>

                            </a>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

            <!-- NO PRODUCTS -->

            <asp:Panel ID="pnlNoProducts"
                runat="server"
                Visible="false">

                <div class="col-12">

                    <div class="empty-box">

                        <i class="fa-solid fa-box-open"></i>

                        <h2>
                            No Products Found
                        </h2>

                        <p>
                            Products are not available right now.
                        </p>

                    </div>

                </div>

            </asp:Panel>

        </div>

    </div>

</section>

</asp:Content>