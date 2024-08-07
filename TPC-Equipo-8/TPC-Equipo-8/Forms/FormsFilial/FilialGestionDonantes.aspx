﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsFilial/MasterFilial.Master" AutoEventWireup="true" CodeBehind="FilialGestionDonantes.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsFilial.FilialGestionDonantes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2 class="text-center" style="margin: 30px;">Posibles donantes</h2>
    <div class="container-fluid" style="width: 80%">
        <asp:GridView ID="dgvFilialDonantes" runat="server" CssClass="table table-bordered table-hover custom-table" AutoGenerateColumns="false">
            <Columns>
                <asp:TemplateField HeaderText="Nombre">
                    <HeaderStyle CssClass="table-header text-center" />
                    <ItemStyle CssClass="table-item text-center" />
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Eval("Username") %>' CssClass="label-text"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="DNI">
                    <HeaderStyle CssClass="table-header text-center" Width="100px" />
                    <ItemStyle CssClass="table-item text-center" />
                    <ItemTemplate>
                        <asp:Label ID="lblDNI" runat="server" Text='<%# Eval("DNI") %>' CssClass="label-text"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Fecha Registro">
                    <HeaderStyle CssClass="table-header text-center" Width="150px" />
                    <ItemStyle CssClass="table-item text-center"/>
                    <ItemTemplate>
                        <asp:Label ID="lblFRegistro" runat="server" Text='<%# Eval("FechaRegistro", "{0:dd/MM/yyyy}") %>' CssClass="label-text"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Grupo">
                    <HeaderStyle CssClass="table-header text-center" Width="50px" />
                    <ItemStyle CssClass="table-item text-center"/>
                    <ItemTemplate>
                        <asp:Label ID="lblGSD" runat="server" Text='<%# Eval("GrupoSanguineoDonante") %>' CssClass="label-text"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Receptor">
                    <HeaderStyle CssClass="table-header text-center" Width="150px" />
                    <ItemStyle CssClass="table-item text-center" Width="150px" />
                    <ItemTemplate>
                        <asp:Label ID="lblReceptor" runat="server" Text='<%# Eval("NombreReceptor") %>' CssClass="label-text"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Necesarios">
                    <HeaderStyle CssClass="table-header text-center" Width="100px" />
                    <ItemStyle CssClass="table-item text-center" />
                    <ItemTemplate>
                        <asp:Label ID="lblDonantesNecesarios" runat="server" Text='<%# Eval("DonantesNecesarios") %>' CssClass="label-text"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Urgencia">
                    <HeaderStyle CssClass="table-header text-center" Width="80px" />
                    <ItemStyle CssClass="table-item text-center" />
                    <ItemTemplate>
                        <asp:Label ID="lblUrgencia" runat="server" Text='<%# Eval("Urgencia") %>' CssClass="label-text"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Fecha Límite">
                    <HeaderStyle CssClass="table-header text-center" Width="150px" />
                    <ItemStyle CssClass="table-item text-center" Width="150px" />
                    <ItemTemplate>
                        <asp:Label ID="lblFlimite" runat="server" Text='<%# Eval("FechaLimite", "{0:dd/MM/yyyy}") %>' CssClass="label-text"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <HeaderStyle Width="50px" />
                    <ItemStyle CssClass="d-flex justify-content-center align-items-center border-0" />
                    <ItemTemplate>
                        <asp:LinkButton ID="btnDono" runat="server" CssClass="btn btn-success btn-sm mx-1" OnClick="btnDono_Click" CommandArgument='<%# Eval("id") %>' CommandName="id" ToolTip="Donó">
            <i class="fa-solid fa-check"></i>
        </asp:LinkButton>
                        <asp:LinkButton ID="btnNoDono" runat="server" CssClass="btn btn-danger btn-sm mx-1" OnClick="btnNoDono_Click" CommandArgument='<%# Eval("id") %>' CommandName="id" ToolTip="No Donó">
            <i class="fa-solid fa-xmark"></i>
        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>






    <%--<div class="container" style="margin-top: 35px;">
    <h3 class="text-center">Lista de Próximas Donaciones: </h3>
    <asp:Repeater ID="RepProximasDonaciones" runat="server">
        <HeaderTemplate>
            <div class="table">
                <div class="row">
                    <div class="col">Nombre Donante</div>
                    <div class="col">Apellido Donante</div>
                    <div class="col">DNI</div>
                    <div class="col">Grupo Sanguíneo Donante</div>
                    <div class="col">Nombre Receptor</div>
                    <div class="col">Grupo Sanguíneo Receptor</div>
                    <div class="col">Donantes Necesarios</div>
                    <div class="col">Urgencia</div>
                    <div class="col">Fecha Registro</div>
                    <div class="col">Fecha Límite</div>
                </div>
            </div>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="table">
                <div class="row">
                    <div class="col"><%# Eval("NombreDonante") %></div>
                    <div class="col"><%# Eval("ApellidoDonante") %></div>
                    <div class="col"><%# Eval("DIN") %></div>
                    <div class="col"><%# Eval("GrupoSanguineoDonante") %></div>
                    <div class="col"><%# Eval("NombreReceptor") %></div>
                    <div class="col"><%# Eval("GrupoSanguineoReceptor") %></div>
                    <div class="col"><%# Eval("DonantesNecesarios") %></div>
                    <div class="col"><%# Eval("Urgencia") %></div>
                    <div class="col"><%# Eval("FechaRegistro", "{0:dd/MM/yyyy}") %></div>
                    <div class="col"><%# Eval("FechaLimite", "{0:dd/MM/yyyy}") %></div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>--%>
</asp:Content>
