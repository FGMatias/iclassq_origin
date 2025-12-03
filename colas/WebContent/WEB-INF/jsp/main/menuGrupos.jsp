<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>ICLASSQ</title>
    
    <script src="librerias/essalud/js/jquery.min.js"></script>
    <link rel="stylesheet" href="librerias/essalud/css/boostrap.min.css">
    <link href="librerias/css/estilosGrupos.css" rel="stylesheet">
</head>
<body>

    <input type="hidden" id="h_idSucursal" value="${usuario.iSucursal}">
    <input type="hidden" id="h_idRol" value="${usuario.iRolEquipo}">
    <input type="hidden" id="h_pideDoc" value="${usuario.iPideDocumento}">
    <input type="hidden" id="h_numDoc" value="${numDoc}">
    <input type="hidden" id="h_tipoDoc" value="${tipoDoc}">

    <div class="kiosk-container">
        <div class="kiosk-header">
            <div class="logo-container">
                <img id="img_background" src="" alt="Logo Empresa">
            </div>
            <div class="user-info">
                <h2>NÚMERO DE DOCUMENTO: <p id="txtNumeroDocumento"></p></h2>
            </div>
        </div>

        <div class="groups-wrapper">
            <div id="loadingMsg">
                <i class="fa fa-spinner fa-spin"></i> Cargando servicios...
            </div>
            
            <div id="gridContainer" class="groups-grid">
            </div>
        </div>

        <div class="pagination-controls">
            <a href="teclado.app" class="back-btn" id="btnRegresar">
                <i class="fa fa-arrow-left" style="margin-right:10px;"></i> REGRESAR
            </a>

            <button id="btnPrev" class="nav-btn btn-prev" onclick="pagination.prev()">
                <i class="fa fa-chevron-left"></i> &nbsp; ANTERIOR
            </button>
            
            <div id="pageIndicator" class="page-indicator"></div>
            
            <button id="btnNext" class="nav-btn btn-next" onclick="pagination.next()">
                SIGUIENTE &nbsp; <i class="fa fa-chevron-right"></i>
            </button>
        </div>
    </div>

    <script>
        function fnAbrirSubGrupos(prefijo) {
            var numDoc = $('#h_numDoc').val();
            var pideDoc = $('#h_pideDoc').val();
            var tipoDoc = $('#h_tipoDoc').val();
            
            if (pideDoc != 1) {  
                tipoDoc = 0;
                numDoc = '00000000';
            }

            window.location.href = 'kiosco.app?numDoc=' + numDoc + '&tipoDoc=' + tipoDoc + '&prefijo=' + prefijo;
        }

        var pagination = {
            currentPage: 1,
            itemsPerPage: 6,
            items: [],
            totalPages: 0,

            init: function() {
                if (window.innerWidth >= 1280) { this.itemsPerPage = 6; }
                
                this.items = document.querySelectorAll('.group-card');
                var totalItems = this.items.length;
                
                if (totalItems > 0) {
                    this.totalPages = Math.ceil(totalItems / this.itemsPerPage);
                    this.showPage(1);
                } else {
                    document.getElementById('pageIndicator').innerText = '';
                }
            },

            showPage: function(page) {
                this.currentPage = page;
                
                this.items.forEach(item => item.classList.remove('visible'));

                var start = (page - 1) * this.itemsPerPage;
                var end = start + this.itemsPerPage;

                for (var i = start; i < end; i++) {
                    if (this.items[i]) {
                        this.items[i].classList.add('visible');
                    }
                }
                this.updateControls();
            },

            next: function() {
                if (this.currentPage < this.totalPages) this.showPage(this.currentPage + 1);
            },

            prev: function() {
                if (this.currentPage > 1) this.showPage(this.currentPage - 1);
            },

            updateControls: function() {
                var btnPrev = document.getElementById('btnPrev');
                var btnNext = document.getElementById('btnNext');
                var indicator = document.getElementById('pageIndicator');

                indicator.innerText = 'Página ' + this.currentPage + ' de ' + this.totalPages;

                if (this.currentPage > 1) btnPrev.classList.add('show');
                else btnPrev.classList.remove('show');

                if (this.currentPage < this.totalPages) btnNext.classList.add('show');
                else btnNext.classList.remove('show');
            }
        };

        $(document).ready(function() {
            var idSucursal = $('#h_idSucursal').val();
            
            $.ajax({
                type: 'POST',
                url: 'getempresabyidsucursal.app',
                data: {idSucursal: idSucursal},
                success: function (response) {
                    var idEmpresa = response.data;
                    
                    var pideDoc = $('#h_pideDoc').val();
                    var numDoc = $('#h_numDoc').val();
                    var tipoDoc = $('#h_tipoDoc').val();
                    $('#txtNumeroDocumento').html("<strong>" + numDoc + "</strong>");

                    $.ajax({
                        type: 'POST',
                        url: 'getempresabyid.app',
                        data: {idEmpresa: idEmpresa},
                        success: function (resImg) {
                            if(resImg.data && resImg.data.urlLogo){
                                $('#img_background').attr("src", resImg.data.urlLogo);
                            }
                        }
                    });

                    var idRol = $('#h_idRol').val();
                    $.ajax({
                        type: 'POST',
                        url: 'listargruposxtiempo.app',                
                        data: {idRol: idRol}, 
                        success: function (resGrupos) {
                            var data = resGrupos.data;       
                            var html = '';
                            
                            if(data && data.length > 0){
                                for(var i=0; i<data.length; i++){
                                    html += '<div class="group-card" onclick="fnAbrirSubGrupos(\'' + data[i].prefijo + '\')">' +
                                                '<div class="group-text">' + data[i].nombre + '</div>' +
                                            '</div>';
                                }
                            } else {
                                html = '<div style="width:100%; text-align:center;">No hay grupos disponibles</div>';
                            }
                            
                            $('#loadingMsg').hide();
                            $('#gridContainer').html(html);
                            
                            pagination.init();
                        },
                        error: function() {
                            $('#loadingMsg').html('Error al cargar los grupos.');
                        }
                    });
                }
            }); 
        });
    </script>
</body>
</html>