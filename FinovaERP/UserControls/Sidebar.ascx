<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Sidebar.ascx.cs" Inherits="FinovaERP.UserControls.Sidebar" %>

<style>
    .sidebar {
        width: 250px;
        height: 100vh;
        position: fixed;
        left: 0;
        top: 0;
        background: #111827;
        padding-top: 30px;
        box-shadow: 4px 0px 10px rgba(0,0,0,0.3);
    }

    .sidebar-logo {
        text-align: center;
        color: white;
        font-size: 28px;
        font-weight: bold;
        margin-bottom: 40px;
    }

    .sidebar-menu {
        list-style: none;
        padding: 0;
        margin: 0;
    }

        .sidebar-menu li {
            margin-bottom: 10px;
        }

            .sidebar-menu li a {
                color: #cbd5e1;
                text-decoration: none;
                display: block;
                padding: 14px 25px;
                font-size: 16px;
                transition: 0.3s;
                border-left: 4px solid transparent;
            }

                .sidebar-menu li a:hover {
                    background: #1e293b;
                    color: white;
                    border-left: 4px solid #2563eb;
                }

                .sidebar-menu li a i {
                    margin-right: 10px;
                }
</style>

<div class="sidebar">

    <div class="sidebar-logo">
        FinovaERP

    </div>

    <ul class="sidebar-menu">

        <li>

            <a href="/Pages/Dashboard.aspx">

                <i class="fa-solid fa-chart-line"></i>
                Dashboard

            </a>

        </li>

        <li>

            <a href="/Pages/Products.aspx">

                <i class="fa-solid fa-box"></i>
                Products

            </a>

        </li>

        <li>

            <a href="/Pages/Users.aspx">

                <i class="fa-solid fa-users"></i>
                Users

            </a>

        </li>

        <li>

            <a href="/Pages/Reports.aspx">

                <i class="fa-solid fa-file-lines"></i>
                Reports

            </a>

        </li>
        <li class="nav-item">

            <a href="../Pages/Orders.aspx" class="nav-link">

                <i class="fa-solid fa-cart-shopping"></i>

                <span>Orders</span>

            </a>

        </li>
         <li class="nav-item">

     <a href="../Pages/Customers.aspx" class="nav-link">

         <i class="fa-solid fa-cart-shopping"></i>

         <span>Customers</span>

     </a>

 </li>

        <li>

            <a href="/Logout.aspx">

                <i class="fa-solid fa-right-from-bracket"></i>
                Logout

            </a>

        </li>

    </ul>

</div>
