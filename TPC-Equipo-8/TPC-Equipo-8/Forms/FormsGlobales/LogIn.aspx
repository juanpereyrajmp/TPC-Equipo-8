﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsGlobales/SiteMaster.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsGlobales.LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="form-wrapper">
        <div class="content-wrapper">
            <div class="text-center mt-4">
                <h3 style="margin-top: 60px;">Ingresá tu cuenta</h3>
            </div>
            <div class="container d-flex justify-content-center">
                <div class="form-container mt-4 custom-login">
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Email</label>
                        <asp:TextBox runat="server" placeholder="ejemplo@gmail.com" ID="txtEmail" CssClass="form-control" />
                          <asp:RequiredFieldValidator ErrorMessage="Campo Requerido" ControlToValidate="txtEmail" runat="server" Display="Dynamic" ForeColor="Red" />
                        <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="Formato de correo electrónico no válido." ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" Display="Dynamic" ForeColor="Red" />
                    </div>
                    <div class="mb-5">
                        <label for="exampleInputPassword1" class="form-label">Contraseña</label>
                        <asp:TextBox runat="server" type="password" placeholder="******" ID="txtPass" CssClass="form-control" />
                        <asp:RequiredFieldValidator ErrorMessage="Campo Requerido" ControlToValidate="txtPass" runat="server" Display="Dynamic" ForeColor="Red" />
                    </div>

                    <div class="text-center" style="margin-top: -10px; margin-bottom: 20px;">
                        <a href="RecuperacionContraseña.aspx" style="color: #c12222;">Olvidé mi contraseña</a>
                    </div>

                    <div class="d-grid" style="margin-bottom: 20px;">

                        <asp:Button Text="Continuar" ID="btnContinuar" OnClick="btnContinuar_Click" runat="server" CssClass="btn btn-customContinuar" />
                    </div>

                    <div class="d-flex justify-content-between">
                        <a href="Default.aspx" style="color: #c12222;">Cancelar</a>
                        <a href="Registro.aspx" style="color: #c12222;">No tengo cuenta</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
