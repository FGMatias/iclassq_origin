<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <title>ICLASSQ</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  
  <link href="librerias/css/bootstrap.min.css" rel="stylesheet">
  <link href="librerias/css/estilosGrupos.css" rel="stylesheet">

  <script src="librerias/libBase/include.js"></script>
  <script src="librerias/libBase/include.essalud.js"></script>

  <style>
    .centered { position: absolute; left: 50%; margin-left: -100px; }
    .modal-dialog { margin-top: 10vh; }
    .modal-content { border-radius: 15px; padding: 20px; text-align: center; }
    .myButton4, .myButton5, .myButton6 {
        display: inline-block; cursor: pointer; color: #fff; font-size: 20px;
        font-weight: bold; padding: 15px 30px; text-decoration: none;
        border-radius: 10px; margin: 10px;
    }
    .myButton4 { background-color: #28a745; } 
    .myButton5 { background-color: #dc3545; } 
    .myButton6 { color: #333; font-size: 24px; display: block; margin-bottom: 20px; pointer-events: none;}
  </style>
</head>
<body>  

    <div class="kiosk-container">
        <div class="kiosk-header">
            <div class="logo-container">
                <img id="img_background" alt="Logo" onerror="this.style.display='none'">
            </div>
            <div class="user-info">
                <h2 id="nombreGrupo"></h2>
            </div>
        </div>

        <div class="groups-wrapper">
            <div id="loadingMsg">
                <i class="fa fa-circle-o-notch fa-spin"></i> Cargando trámites...
            </div>

            <div id="panelListadoSubGrupos" class="groups-grid">
                </div>
        </div>

        <div class="pagination-controls">
            <a id="btnKioskoAtras" class="back-btn">
                ATRÁS
            </a>

            <button id="btnPrev" class="nav-btn btn-prev" onclick="pagination.prev()">
                <i class="fa fa-chevron-left"></i> ANTERIOR
            </button>
            
            <div id="pageIndicator" class="page-indicator"></div>
            
            <button id="btnNext" class="nav-btn btn-next" onclick="pagination.next()">
                SIGUIENTE <i class="fa fa-chevron-right"></i>
            </button>
        </div>

        <form class="needs-validation" novalidate style="display:none;">
			<input class="form-control" type="hidden" id="idGrupo" />
		</form>
    </div>

    <div class="modal" id="nuevoTicket" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div id="ticket">
                        <div class="">
                            <span>BIENVENIDOS</span><br>
                            <img src="librerias/imagenes/upc.png" height="70px"><br>

                            <div id="divDocumento" class="">
                                <p>
                                    <span id="tipoDoc"></span>
                                    <span id="numDoc"></span>
                                </p>
                            </div>
                            <span>ATENCIÓN</span><br>

                            <b><span style="font-size:70px" id="codigo"></span></b><br>
                            <b><span style="font-size:30px" id="nombreGrupoModal"></span></b><br>
                            <span id="fecha"></span><br>
                            <span class="myButton6" >Desea Imprimir Ticket?</span>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <a style="color:#fff" class="myButton5">No</a>
                            </div>
                            <div class="col-sm-6">
                                <a style="color:#fff" id="btnImpresion" class="myButton4">Si</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="librerias/admin/plugins/jquery/jquery.min.js"></script>
    <script src="librerias/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
    <script src="librerias/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
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
                if (this.items[i]) this.items[i].classList.add('visible');
            }
            this.updateControls();
        },

        next: function() { if (this.currentPage < this.totalPages) this.showPage(this.currentPage + 1); },
        prev: function() { if (this.currentPage > 1) this.showPage(this.currentPage - 1); },

        updateControls: function() {
            var btnPrev = document.getElementById('btnPrev');
            var btnNext = document.getElementById('btnNext');
            document.getElementById('pageIndicator').innerText = 'Página ' + this.currentPage + ' / ' + this.totalPages;

            if (this.currentPage > 1) btnPrev.classList.add('show'); else btnPrev.classList.remove('show');
            if (this.currentPage < this.totalPages) btnNext.classList.add('show'); else btnNext.classList.remove('show');
        }
    };

    var retornoUrl = "";

	$("#btnKioskoAtras").click(function() {
		var numDoc = '${numDoc}';
		var tipoDoc = '${tipoDoc}';
    	window.location.href = 'menugrupos.app?numDoc='+numDoc+'&tipoDoc='+tipoDoc;
    });
    
	function fnGenerarTicket(idSubgrupo, prefijo, nombre){
	    var iConfirmaImpresion = '${usuario.iConfirmaImpresion}';
	    var validaDoc = '${usuario.iValidaDocumento}';
	    var idSucursal = '${usuario.iSucursal}';
	    var numDoc ='${numDoc}';
	    var tipoDoc = '${tipoDoc}';
	    var pideDoc = '${usuario.iPideDocumento}';

	    $('#nombreGrupoModal').html(nombre);

	    $.ajax({
	        type: 'POST', 
	        url: 'generarticketatencion.app',	
	        data: {
	            idSubgrupo: idSubgrupo, 
	            idSucursal: idSucursal, 
	            prefijo: prefijo, 
	            nombre: nombre, 
	            numDoc: numDoc, 
	            tipoDoc: tipoDoc, 
	            validaDoc: validaDoc
	        },	
	        success: function (response) {
	            var msg = response.success;
	            var data = response.data;

	            if(msg == true){
	                var parts1 = data.codigo.split("-");
	                var codigo = parts1[0] + parts1[1];
	                var date = new Date(data.fechaAtencion);
	                var fecha = date.toLocaleDateString();
	                
	                if(iConfirmaImpresion == 2){
	                    imprimirTicketSilencioso(codigo, nombre, fecha, numDoc, tipoDoc, pideDoc);
	                    window.location.href = retornoUrl;
	                } 
	                else {
	                    $("#codigo").html(codigo);
	                    $("#fecha").html(fecha);
	                    
	                    var divDocumento = document.getElementById('divDocumento');
	                    if(pideDoc == 2){
	                        divDocumento.style.display = 'none';
	                    } else {
	                        divDocumento.style.display = 'block';
	                        $("#tipoDoc").html(tipoDoc == 1 ? 'DNI: ' : 'C.E: ');
	                        $("#numDoc").html(numDoc);
	                    }
	                    
	                    $('#ticket').prop('hidden', false);
	                    $('#ticket').show();
	                    $("#nuevoTicket").modal("show");
	                }
	            }	
	        },
	        error: function() {
	            alert('Error al generar el ticket. Intente nuevamente.');
	        }
	    });		
	}

	function imprimirTicketSilencioso(codigo, nombreGrupo, fecha, numDoc, tipoDoc, pideDoc) {
	    var logoSrc = $("#img_background").attr("src") || "librerias/imagenes/upc.png";
	    
	    var iframe = document.createElement('iframe');
	    iframe.style.position = 'absolute';
	    iframe.style.width = '0px';
	    iframe.style.height = '0px';
	    iframe.style.border = 'none';
	    document.body.appendChild(iframe);
	    
	    var doc = iframe.contentWindow.document;
	    doc.open();
	    doc.write('<html><head><title>Ticket</title>');
	    doc.write('<style>');
	    doc.write('body { font-family: Arial, sans-serif; text-align: center; padding: 20px; width: 80mm; }');
	    doc.write('img { max-width: 70px !important; max-height: 70px !important; width: auto !important; height: auto !important; display: block; margin: 10px auto; }');
	    doc.write('.bienvenida { font-size: 14px; margin: 10px 0; }');
	    doc.write('.codigo { font-size: 48px; font-weight: bold; margin: 15px 0; }');
	    doc.write('.servicio { font-size: 18px; font-weight: bold; margin: 10px 0; }');
	    doc.write('.fecha { font-size: 12px; margin: 10px 0; }');
	    doc.write('.documento { font-size: 12px; margin: 8px 0; }');
	    doc.write('@page { size: 80mm auto; margin: 0; }');
	    doc.write('@media print { body { width: 80mm; } }');
	    doc.write('</style>');
	    doc.write('</head><body>');
	    doc.write('<div class="bienvenida">BIENVENIDOS</div>');
	    doc.write('<img src="' + logoSrc + '" alt="Logo">');
	    
	    if(pideDoc != 2 && numDoc) {
	        doc.write('<div class="documento">' + (tipoDoc == 1 ? 'DNI: ' : 'C.E: ') + numDoc + '</div>');
	    }
	    
	    doc.write('<div>ATENCIÓN</div>');
	    doc.write('<div class="codigo">' + codigo + '</div>');
	    doc.write('<div class="servicio">' + nombreGrupo + '</div>');
	    doc.write('<div class="fecha">' + fecha + '</div>');
	    doc.write('</body></html>');
	    doc.close();
	    
	    iframe.contentWindow.focus();
	    iframe.contentWindow.print();
	    
	    setTimeout(function() {
	        document.body.removeChild(iframe);
	    }, 100);
	}

	function imprimirTicket() {
	    $("#btnImpresion").hide();
	    $(".myButton5").hide();
	    $(".myButton6").hide();
	    
	    var printContents = document.getElementById('ticket').innerHTML;
	    var w = window.open('', '_blank', 'width=400,height=600');
	    
	    w.document.write('<html><head><title>Ticket de Atención</title>');
	    w.document.write('<style>');
	    w.document.write('body { font-family: Arial, sans-serif; text-align: center; padding: 20px; }');
	    w.document.write('img { max-width: 70px !important; max-height: 70px !important; width: auto !important; height: auto !important; }');
	    w.document.write('</style>');
	    w.document.write('</head><body>');
	    w.document.write(printContents);
	    w.document.write('</body></html>');
	    w.document.close();
	    
	    w.onload = function() {
	        w.focus();
	        w.print();
	        setTimeout(function() {
	            w.close();
	            window.location.href = retornoUrl;
	        }, 1000);
	    };
	}

	$("#btnImpresion").click(function() {
	    imprimirTicket();
	});

	$(".myButton5").click(function(e) {
	    e.preventDefault();
	    $("#nuevoTicket").modal("hide");
	    window.location.href = retornoUrl;
	});

    $(document).ready(function() {	
		var iConfirmaImpresion = '${usuario.iConfirmaImpresion}';
		var pideDoc = '${usuario.iPideDocumento}';
		
        if(pideDoc == 1){
			retornoUrl = "teclado.app";
		}else{
			retornoUrl = "menugrupos.app?dni=00000000&tipoDoc=1";
		}

		$('.myButton5').attr('href',retornoUrl);	

		if(iConfirmaImpresion == 2){
			$("#btnImpresion").css("display", "none");
			$('.myButton6').css("display", "none");	
			$('.myButton5').css("display", "none");
		}
    	
    	var idSucursal = '${usuario.iSucursal}';
		var prefijo = '${prefijo}';

    	$.ajax({ 
    		type: 'POST', 
    		url: 'getgrupobyprefijo.app',	
    		data: {prefijo: prefijo, idSucursal: idSucursal},	
    		success: function (response) {
    			var data = response.data;
    			$('#idGrupo').val(data.id);
    			var idGrupo = $("#idGrupo").val();
    			$('#nombreGrupo').html(data.nombre); 
    			
    			$.ajax({ 
    	    		type: 'POST', 
    	    		url: 'listarsubgruposxgrupoandsucursal.app',	
    	    		data: {idSucursal: idSucursal, idGrupo: idGrupo},	
    	    		success: function (response) {
    	    			var data = response.data;
    	    			var html='';    				
    	    			
                        if(data && data.length > 0){
                            for(var i=0; i<data.length; i++){
                                html += '<div class="group-card" onclick="fnGenerarTicket('+data[i].iSubGrupo+', \''+data[i].vPrefijo+'\', \''+data[i].vNombreSubGrupo+'\')">' +
                                            '<div class="group-text">' + data[i].vNombreSubGrupo + '</div>' +
                                        '</div>';
                            }
                        } else {
                            html = '<div style="grid-column:1/-1; text-align:center; font-size:1.5em; color:#777;">No hay trámites disponibles.</div>';
                        }

                        $('#loadingMsg').hide();
   	                	$('#panelListadoSubGrupos').html(html);
                        pagination.init();
    	    		}
    	    	});
    		}
    	});

    	var idEmpresa = '${usuario.iEmpresa}';
    	console.log(idEmpresa);
    	$.ajax({
            type: 'POST',
            url: 'getempresabyid.app',
            data: {idEmpresa: idEmpresa},
            success: function(response) {
                var data = response.data;
                console.log(response);
                $('#img_background').attr("src", data.urlLogo);
            }
        });

    	$.ajax({
    		type: 'POST', url: 'getsucursalbyid.app', data: {idSucursal: idSucursal},
    		success: function (response) {
    			$("#lblSucursal").html(response.data.nombre);    		
    		}
    	});
    });
    </script>
	
</body>
</html>