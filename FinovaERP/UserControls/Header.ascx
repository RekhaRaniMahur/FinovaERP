<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="FinovaERP.UserControls.Header" %>

<style>
    .admin-header {
        background: #1e293b;
        padding: 18px 25px;
        border-radius: 15px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0px 4px 10px rgba(0,0,0,0.3);
    }

    .admin-title {
        font-size: 28px;
        font-weight: bold;
        color: white;
    }

    .admin-user {
        color: #cbd5e1;
        font-size: 16px;
    }
</style>

<div class="admin-header">

    <div class="admin-title">
        FinovaERP Admin Panel

    </div>

    <div class="admin-user">

        <i class="fa-solid fa-user"></i>
        Welcome Admin

    </div>

</div>
