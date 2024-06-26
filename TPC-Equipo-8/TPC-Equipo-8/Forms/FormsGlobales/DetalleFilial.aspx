﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/FormsGlobales/SiteMaster.Master" AutoEventWireup="true" CodeBehind="DetalleFilial.aspx.cs" Inherits="TPC_Equipo_8.Forms.FormsGlobales.DetalleFilial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../Estilos/EstilosGlobales.css" />
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <div class="text-center mt-4">
        <h3>Detalle de la Filial</h3>
    </div>

    <div class="container">

        <div class="row row-cols-1 row-cols-md-2 g-4">
            <asp:Repeater ID="repDetalle" runat="server" ClientIDMode="Static">
                <ItemTemplate>

                    <div class="col mb-3">
                        <div class="card" style="height: 650px; border: 0;">
                            <img src='<%# Eval("UrlImagen") %>' class="card-img-top" style="height: 410px; object-fit: cover; max-width: 100%; margin: auto;" alt="...">
                            <div class="card-body">
                                <h5 class="card-title  text-center" style="font-size: 30px;"><strong><%# Eval("Nombre") %></strong></h5>
                                <p class="card-text" style="margin-bottom: -2px; font-size: 13px;"><strong>Direccion:</strong> <%# Eval("direccion.calle") %> <%# Eval("direccion.altura") %>, <%# Eval("direccion.localidad") %></p>
                                <p class="card-text" style="margin-bottom: -2px; font-size: 13px;"><strong>Teléfono:</strong> <%# Eval("Telefono") %></p>
                                <p class="card-text" style="margin-bottom: -2px; font-size: 13px;"><strong>Correo:</strong> <%# Eval("Correo") %></p>
                                <p class="card-text" style="font-size: 13px;"><strong>Horario de atención:</strong> <%# Eval("HorarioAtencion") %></p>

                                <div class="d-grid">
                                    <asp:Button ID="btnVerPublicaciones" Text="Ver publicaciones" runat="server" CssClass="btn btn-customPublicaciones" OnClick="btnVerPublicaciones_Click" CommandArgument='<%# Eval("IdFilial") %>' CommandName="IdFilial" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- API MAP -->
                    <div id="map-<%# Container.ItemIndex %>" class="w-50" style="height: 410px;" data-direccion='<%# ObtenerDireccionFilial(Convert.ToInt32(Eval("IdFilial"))) %>'>
                        <p>Mapa</p>
                    </div>
                    </div>
                <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        var mapId = 'map-<%# Container.ItemIndex %>';
                        var direccion = document.getElementById(mapId).getAttribute('data-direccion');

                        var mapElement = document.getElementById(mapId);
                        if (mapElement) {
                            fetch(`https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(direccion)}`)
                                .then(response => response.json())
                                .then(data => {
                                    if (data && data.length > 0) {
                                        var latlng = [data[0].lat, data[0].lon];
                                        var map = L.map(mapId).setView(latlng, 15);
                                        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                                            attribution: '&copy; OpenStreetMap contributors'
                                        }).addTo(map);
                                        L.marker(latlng).addTo(map);
                                    } else {
                                        console.error('Geocode was not successful');
                                    }
                                })
                                .catch(error => {
                                    console.error('Error fetching geocode: ', error);
                                });
                        }
                    });
                </script>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
