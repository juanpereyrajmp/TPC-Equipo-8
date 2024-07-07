﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsDonante/MasterDonante.Master" AutoEventWireup="true" CodeBehind="DonanteFormularioDonacion.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsDonante.DonanteFormularioDonacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .custom-checkbox {
            padding: 10px;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
            margin-bottom: 10px;
            transition: all 0.3s ease;
        }

            .custom-checkbox:hover {
                background-color: #f8f9fa;
            }

            .custom-checkbox input[type="checkbox"] {
                margin-right: 10px;
            }

            .custom-checkbox label {
                font-weight: 500;
                color: #333;
            }

        .requirements-list {
            list-style-type: none;
            padding: 0;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background-color: white; border-radius: 20px; box-shadow: 0 0 20px rgba(0,0,0,0.1); padding: 40px; margin-top: 30px;">
        <h2 class="text-center mb-4" style="color: #c12222;">Declaración Jurada para Donación de Sangre</h2>
        <div class="mb-4">
            <p class="lead text-center">Por favor, confirme que cumple con los siguientes requisitos:</p>
            <ul class="requirements-list">
                <li class="custom-checkbox">
                    <asp:CheckBox ID="chkEdad" runat="server" Text="Tengo entre 16 y 65 años" />
                </li>
                <li class="custom-checkbox">
                    <asp:CheckBox ID="chkPeso" runat="server" Text="Peso más de 50 Kilos" />
                </li>
                <li class="custom-checkbox">
                    <asp:CheckBox ID="chkDNI" runat="server" Text="Dispongo de mi DNI actualizado para presentar" />
                </li>
                <li class="custom-checkbox">
                    <asp:CheckBox ID="chkEmbarazo" runat="server" Text="No estoy embarazada ni en período de lactancia" />
                </li>
                <li class="custom-checkbox">
                    <asp:CheckBox ID="chkAnemia" runat="server" Text="No estoy anémico/a" />
                </li>
                <li class="custom-checkbox">
                    <asp:CheckBox ID="chkSueno" runat="server" Text="Tendré más de 6 horas de sueño al momento de presentarme" />
                </li>
                <li class="custom-checkbox">
                    <asp:CheckBox ID="chkUltimaDonacion" runat="server" Text="No he donado sangre en los últimos 2 meses" />
                </li>
                <li class="custom-checkbox">
                    <asp:CheckBox ID="chkDesayuno" runat="server" Text="Ingeriré mi desayuno habitual el día de presentarme a donar" />
                </li>
                <li class="custom-checkbox">
                    <asp:CheckBox ID="chkTatuaje" runat="server" Text="Han pasado 6 meses o más desde mi último tatuaje (si aplica)" />
                </li>
            </ul>
        </div>
        <div class="text-center">
            <asp:Button ID="btnConfirmar" runat="server" Text="Acepto los requisitos y estoy en condiciones de donar sangre"
                CssClass="btn btn-customDonar btn-lg" Onclick="btnConfirmar_Click"/>
        </div>
    </div>
</asp:Content>
