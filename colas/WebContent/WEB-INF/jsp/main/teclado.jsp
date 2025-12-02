
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
                <div class="document-section">
                    <label class="document-label">Seleccione su documento:</label>
                    <select class="document-select" id="cboTipoDocumento">
                    </select>
                </div>

                <div class="input-section">
                    <label class="input-label">INGRESE EL NRO:</label>
                    <input type="text" 
                           autocomplete="off" 
                           id="txtNumeroDocumento" 
                           class="document-input" 
                           maxlength="12"
                           readonly
                           inputmode="numeric"
                           pattern="\d*">
                </div>

                <div class="keyboard-container">
                    <div class="keyboard-grid">
                        <button type="button" class="key-btn number-key" onclick="mostrarValor(1)">1</button>
                        <button type="button" class="key-btn number-key" onclick="mostrarValor(2)">2</button>
                        <button type="button" class="key-btn number-key" onclick="mostrarValor(3)">3</button>
                        <button type="button" class="key-btn number-key" onclick="mostrarValor(4)">4</button>
                        <button type="button" class="key-btn number-key" onclick="mostrarValor(5)">5</button>
                        <button type="button" class="key-btn number-key" onclick="mostrarValor(6)">6</button>
                        <button type="button" class="key-btn number-key" onclick="mostrarValor(7)">7</button>
                        <button type="button" class="key-btn number-key" onclick="mostrarValor(8)">8</button>
                        <button type="button" class="key-btn number-key" onclick="mostrarValor(9)">9</button>
                        <button type="button" class="key-btn action-key" onclick="document.getElementById('txtNumeroDocumento').value=document.getElementById('txtNumeroDocumento').value.slice(0, -1);">
                            <i class="fa fa-backspace"></i> Borrar
                        </button>
                        <button type="button" class="key-btn number-key zero-key" onclick="mostrarValor(0)">0</button>
                    </div>
                </div>

                <div class="continue-section">
                    <button id="btnKioskoContinuar" class="continue-btn">
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
    function mostrarValor(num) {
        var cantDigitos = 0;
        if ($('#cboTipoDocumento').val() == 1) {
            cantDigitos = 8;
            if ($('#txtNumeroDocumento').val().length < cantDigitos) {
                $('#txtNumeroDocumento').val($('#txtNumeroDocumento').val() + num);
            }
        }
        if ($('#cboTipoDocumento').val() == 2) {
            cantDigitos = 9;
            if ($('#txtNumeroDocumento').val().length < cantDigitos) {
                $('#txtNumeroDocumento').val($('#txtNumeroDocumento').val() + num);
            }
        }
        if ($('#cboTipoDocumento').val() == 3) {
            cantDigitos = 12;
            if ($('#txtNumeroDocumento').val().length < cantDigitos) {
                $('#txtNumeroDocumento').val($('#txtNumeroDocumento').val() + num);
            }
        }
        if ($('#cboTipoDocumento').val() == 4) {
            cantDigitos = 12;
            if ($('#txtNumeroDocumento').val().length < cantDigitos) {
                $('#txtNumeroDocumento').val($('#txtNumeroDocumento').val() + num);
            }
        }
    }

    function actualizarModoInput() {
        var tipo = $('#cboTipoDocumento').val();
        var $input = $('#txtNumeroDocumento');

        if (tipo == '4') {
            $input.prop('readonly', false)
                  .attr('inputmode', 'text')   
                  .removeAttr('pattern');       
        } else {
            $input.prop('readonly', true)
                  .attr('inputmode', 'numeric')
                  .attr('pattern', '\\d*');
        }
        $input.val('').focus();
    }
    
    $('#cboTipoDocumento').on('change', function() {
        $('#txtNumeroDocumento').val("");
        $('#txtNumeroDocumento').focus();
        console.log(this.value);
    });

    $('#txtNumeroDocumento').on('input', function() {
        var valor = $(this).val();
        var cantDigitos = $('#cboTipoDocumento').val() == 1 ? 8 : 12; 

        if (valor.length > cantDigitos) {
            $(this).val(valor.slice(0, cantDigitos));
        }
    });

    $("#btnKioskoContinuar").click(function() {
        var tipoDoc = $("#cboTipoDocumento").val();
        var iValidaDoc = '${usuario.iValidaDocumento}';
        var idUsuario = '${usuario.iUsuarioId}';
        var idSucursal = '${usuario.iSucursal}';
        var numDoc = $("#txtNumeroDocumento").val();
        
        $.ajax({
        	type: 'POST',
        	url: 'existsPerson.app',
        	data: { numeroDocumento: numDoc },
        	success: function(response) {
        		if (response.data) {
                    window.location.href = 'menugrupos.app?numDoc=' + numDoc + '&tipoDoc=' + tipoDoc;
        		} else {
        			window.location.href = 'datosPersonales.app?numDoc=' + numDoc + '&tipoDoc=' + tipoDoc;
        		}
        	}
        });
    });    
    
    $(document).ready(function() {
        var idSucursal = '${usuario.iSucursal}';
        var idEmpresa = '${usuario.iEmpresa}';
        $('#txtNumeroDocumento').focus();
        actualizarModoInput();

        $('#cboTipoDocumento').on('change', function() {
            actualizarModoInput();
        });
        
        $.ajax({
            type: 'POST',
            url: 'getempresabyid.app',
            data: { idEmpresa: idEmpresa }, 
            success: function (response) {
                var data = response.data;
                $('#img_background').attr("src", data.urlLogo);
            }
        });
        
        $.ajax({ 
    		type: 'POST', 
    		url: 'listarTipoDocumentoXGeneraTicket.app',   		
    		success: function (response) {
    			var data = response.data;
    			$.each(data, function (index, item) {
                    $("<option/>")
                            .attr("value", item.id)
                        	.text(item.descripcion)
                            .appendTo("#cboTipoDocumento");
                });	
    		}
    	});
    });
</script>
        
</body>
</html>
