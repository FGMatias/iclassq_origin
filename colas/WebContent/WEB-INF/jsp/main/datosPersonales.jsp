<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ICLASSQ</title>
    <link href="librerias/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="librerias/css/estilosKiosko.css" rel="stylesheet">
    
    <link rel="stylesheet" href="librerias/jquery-confirm/demo/demo.css">
    <link rel="stylesheet" type="text/css" href="librerias/jquery-confirm/css/jquery-confirm.css"/>
    <script src="librerias/general/general.js"></script> 
</head>
<body>
    <div class="kiosco-container">
        <header class="kiosco-header">
            <div class="logo-container">
                <img id="img_background" alt="Logo" class="logo">		
            </div>
        </header>

        <main class="kiosco-main">
            <div class="form-container">
                <div class="title-section">
                    <h2 class="form-title">
                        <i class="fa fa-user"></i>
                        Complete sus datos personales
                    </h2>
                    <p class="form-subtitle">Por favor, ingrese la información solicitada</p>
                </div>

                <div class="personal-data-form">
                    <div class="input-group">
                        <label class="field-label" for="txtNumeroDocumento">
                            <i class="fa fa-user-o"></i>
                            Número de Documento
                        </label>
                        <input type="text" 
                               id="txtNumeroDocumento" 
                               class="personal-input" 
                               maxlength="50"
                               autocomplete="off">
                        <div class="input-underline"></div>
                    </div>
                    
                    <div class="input-group">
                        <label class="field-label" for="txtNombres">
                            <i class="fa fa-user-o"></i>
                            Nombres
                        </label>
                        <input type="text" 
                               id="txtNombres" 
                               class="personal-input" 
                               placeholder="Ingrese sus nombres"
                               maxlength="50"
                               autocomplete="off">
                        <div class="input-underline"></div>
                    </div>

                    <div class="input-group">
                        <label class="field-label" for="txtApellidoPaterno">
                            <i class="fa fa-user-o"></i>
                            Apellido Paterno
                        </label>
                        <input type="text" 
                               id="txtApellidoPaterno" 
                               class="personal-input" 
                               placeholder="Ingrese su apellido paterno"
                               maxlength="50"
                               autocomplete="off">
                        <div class="input-underline"></div>
                    </div>

                    <div class="input-group">
                        <label class="field-label" for="txtApellidoMaterno">
                            <i class="fa fa-user-o"></i>
                            Apellido Materno
                        </label>
                        <input type="text" 
                               id="txtApellidoMaterno" 
                               class="personal-input" 
                               placeholder="Ingrese su apellido materno"
                               maxlength="50"
                               autocomplete="off">
                        <div class="input-underline"></div>
                    </div>
                </div>

                <div class="action-buttons">
                    <button id="btnRegresar" class="action-btn back-btn">
                        <i class="fa fa-arrow-left"></i>
                        Regresar
                    </button>
                    <button id="btnContinuar" class="action-btn continue-btn">
                        <i class="fa fa-arrow-right"></i>
                        Continuar
                    </button>
                </div>

            </div>
        </main>
    </div>
    
<script src="librerias/admin/plugins/jquery/jquery.min.js"></script>
<script src="librerias/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="librerias/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="librerias/admin/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="librerias/admin/plugins/jqvmap/maps/jquery.vmap.world.js"></script>
<script src="librerias/admin/plugins/jquery-knob/jquery.knob.min.js"></script>
<script src="librerias/admin/plugins/moment/moment.min.js"></script>
<script src="librerias/admin/plugins/daterangepicker/daterangepicker.js"></script>
<script src="librerias/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="librerias/admin/dist/js/adminlte.js"></script>
<script src="librerias/admin/dist/js/demo.js"></script>
<script src="librerias/admin/plugins/datatables/jquery.dataTables.js"></script>
<script src="librerias/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>

<script src="librerias/jquery-confirm/demo/libs/bundled.js"></script>
<script type="text/javascript" src="librerias/jquery-confirm/js/jquery-confirm.js"></script>
    
<script>
    function validarCampos() {
        var nombres = $('#txtNombres').val().trim();
        var apellidoPaterno = $('#txtApellidoPaterno').val().trim();
        var apellidoMaterno = $('#txtApellidoMaterno').val().trim();
        
        var camposVacios = [];
        
        if (nombres === '') {
            camposVacios.push('Nombres');
            $('#txtNombres').addClass('error');
        } else {
            $('#txtNombres').removeClass('error');
        }
        
        if (apellidoPaterno === '') {
            camposVacios.push('Apellido Paterno');
            $('#txtApellidoPaterno').addClass('error');
        } else {
            $('#txtApellidoPaterno').removeClass('error');
        }
        
        if (apellidoMaterno === '') {
            camposVacios.push('Apellido Materno');
            $('#txtApellidoMaterno').addClass('error');
        } else {
            $('#txtApellidoMaterno').removeClass('error');
        }
        
        return camposVacios;
    }

    function limpiarError(input) {
        $(input).removeClass('error');
    }

    function formatearNombre(texto) {
        return texto.toLowerCase().replace(/\b\w/g, function(l) {
            return l.toUpperCase();
        });
    }

    $('.personal-input').on('input', function() {
        limpiarError(this);
        var valorFormateado = formatearNombre($(this).val());
        $(this).val(valorFormateado);
    });

    $("#btnContinuar").click(function() {
        var camposVacios = validarCampos();
        
        if (camposVacios.length > 0) {
            $.alert({
                title: 'Campos Requeridos',
                content: 'Por favor complete los siguientes campos: ' + camposVacios.join(', '),
                type: 'orange',
                typeAnimated: true,
                buttons: {
                    ok: {
                        text: 'Entendido',
                        btnClass: 'btn-orange'
                    }
                }
            });
            return;
        }
        
        var numeroDocumento = $('#txtNumeroDocumento').val().trim();
        var nombres = $('#txtNombres').val().trim();
        var aPaterno = $('#txtApellidoPaterno').val().trim();
        var aMaterno = $('#txtApellidoMaterno').val().trim();
        var numDoc = '${numDoc}';
        var tipoDoc = '${tipoDoc}';
        
        $.ajax({
        	type: 'POST',
        	url: 'savePerson.app',
        	data: { 
        		dni: numeroDocumento,
        		nombres: nombres,
        		aPaterno: aPaterno,
        		aMaterno: aMaterno
       		},
        	success: function(response) {
        		console.log(response);
        		if (response.success) {
                    window.location.href = 'menugrupos.app?numDoc=' + numDoc + '&tipoDoc=' + tipoDoc;
        		} else {
        			$.alert({
                        title: 'Ocurrió un error!',
                        content: 'Intentelo de nuevo más tarde',
                        type: 'red',
                        typeAnimated: true,
                        buttons: {
                            ok: {
                                text: 'Entendido',
                                btnClass: 'btn-red'
                            }
                        }
                    });
                    return;
        		}
        	}
        });
        
    });

    $("#btnRegresar").click(function() {
        $.confirm({
            title: 'Confirmar',
            content: '¿Está seguro que desea regresar? Los datos ingresados se perderán.',
            type: 'blue',
            typeAnimated: true,
            buttons: {
                si: {
                    text: 'Sí, regresar',
                    btnClass: 'btn-blue',
                    action: function() {
                        window.history.back();
                    }
                },
                no: {
                    text: 'Cancelar',
                    btnClass: 'btn-light'
                }
            }
        });
    });
    
    $(document).ready(function() {
        var idEmpresa = '${usuario.iEmpresa}';
        var numDoc = '${numDoc}';
        var tipoDoc = '${tipoDoc}';
        
        $.ajax({
            type: 'POST',
            url: 'getempresabyid.app',
            data: { idEmpresa: idEmpresa }, 
            success: function (response) {
                var data = response.data;
                $('#img_background').attr("src", data.urlLogo);
            }
        });
        
        $('#txtNumeroDocumento').val(numDoc);
        $('#txtNombres').focus();
    });
</script>
        
</body>
</html>
