<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>ICLASSQ</title>
    
    <script src="librerias/essalud/js/jquery.min.js"></script>
    <link rel="stylesheet" href="librerias/essalud/css/boostrap.min.css">
    <link href="librerias/css/estilosKiosko.css" rel="stylesheet">
</head>
<body>

    <div class="kiosk-container">
        <form id="formKiosko" class="kiosk-card" action="generarticketatencion.app" method="post">
            
            <div class="col-info">
                <div class="logo-area">
                    <img id="img_background" src="librerias/imagenes/essalud.png" alt="Logo">
                    <h2>Bienvenido</h2>
                    <p style="color:#777; font-size: 1.1em;">Ingrese sus datos para generar el ticket</p>
                </div>

                <div class="form-group-kiosk">
                    <label class="kiosk-label" for="cboTipoDocumento">Tipo de Documento</label>
                    <select id="cboTipoDocumento" name="tipoDoc" class="kiosk-select"></select>
                </div>

                <div class="form-group-kiosk">
                    <label class="kiosk-label" for="txtNumeroDocumento">Número de Documento</label>
                    <input type="text" 
                           id="txtNumeroDocumento" 
                           name="nroDoc" 
                           class="kiosk-input" 
                           placeholder="Ingrese su número" 
                           readonly 
                           autocomplete="off" 
                           maxlength="15">
                </div>

                <div id="msgError" class="error-msg" style="display:none;"></div>
            </div>

            <div class="col-numpad">
                <div class="numpad-grid">
                    <button type="button" class="num-btn" onclick="teclado.add('1')">1</button>
                    <button type="button" class="num-btn" onclick="teclado.add('2')">2</button>
                    <button type="button" class="num-btn" onclick="teclado.add('3')">3</button>

                    <button type="button" class="num-btn" onclick="teclado.add('4')">4</button>
                    <button type="button" class="num-btn" onclick="teclado.add('5')">5</button>
                    <button type="button" class="num-btn" onclick="teclado.add('6')">6</button>

                    <button type="button" class="num-btn" onclick="teclado.add('7')">7</button>
                    <button type="button" class="num-btn" onclick="teclado.add('8')">8</button>
                    <button type="button" class="num-btn" onclick="teclado.add('9')">9</button>

                    <button type="button" class="num-btn btn-c" onclick="teclado.clearAll()">BORRAR<br>TODO</button>
                    <button type="button" class="num-btn" onclick="teclado.add('0')">0</button>
                    <button type="button" class="num-btn btn-back" onclick="teclado.backspace()">&#9003;</button>

                    <button id="btnKioskoContinuar" type="button" class="btn-action">
                        CONTINUAR
                    </button>
                </div>
            </div>

        </form>
    </div>
    
    <jsp:include page="utils/inputValidators.jsp" />

    <script>
        var teclado = {
            config: {
                '1': { max: 8, name: 'DNI', pattern: /\d/ },
                '2': { max: 9, name: 'PTP', pattern: /\d/ },
                '3': { max: 9, name: 'CE', pattern: /\d/ },
                '4': { max: 11, name: 'RUC', pattern: /\d/ } 
            },

            init: function() {
                var self = this;
                var idSucursal = '${usuario.iSucursal}';
                var idEmpresa = '${usuario.iEmpresa}';

                this.loadLogo(idSucursal);

                this.loadTiposDocumento();

                aplicarRestriccionDocumento('#cboTipoDocumento', '#txtNumeroDocumento');

                $('#cboTipoDocumento').on('change', function() {
                    self.clearAll();
                    self.actualizarModoInput();
                });

                $('#btnKioskoContinuar').click(function() {
                    self.submit();
                });

                $('#txtNumeroDocumento').on('focus', function(e) {
                    $(this).blur();
                });

                this.actualizarModoInput();
            },

            loadLogo: function(idSucursal) {
                $.ajax({
                    type: 'POST',
                    url: 'getempresabyidsucursal.app',
                    data: {idSucursal: idSucursal},
                    success: function(response) {
                        var idEmpresa = response.data;
                        $.ajax({
                            type: 'POST',
                            url: 'getempresabyid.app',
                            data: {idEmpresa: idEmpresa},
                            success: function(response) {
                                var data = response.data;
                                $('#img_background').attr("src", data.urlLogo);
                            }
                        });
                    }
                });
            },

            loadTiposDocumento: function() {
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
            },

            actualizarModoInput: function() {
                var tipo = $('#cboTipoDocumento').val();
                var $input = $('#txtNumeroDocumento');
                var config = this.config[tipo];

                if (tipo == '4') {
                    $input.prop('readonly', false)
                          .attr('inputmode', 'text')
                          .removeAttr('pattern');
                } else {
                    $input.prop('readonly', true)
                          .attr('inputmode', 'numeric')
                          .attr('pattern', '\\d*');
                }
                
                if (config) {
                    $input.attr('maxlength', config.max);
                }
            },

            add: function(digit) {
                var $input = $('#txtNumeroDocumento');
                var currentVal = $input.val();
                var tipoDoc = $('#cboTipoDocumento').val();
                var config = this.config[tipoDoc];

                if (!config) return;

                if (!config.pattern.test(digit)) {
                    return;
                }

                if (currentVal.length < config.max) {
                    var newVal = currentVal + digit;
                    $input.val(newVal);
                    
                    $input.trigger('input');
                    
                    this.showError('');
                }
            },

            backspace: function() {
                var $input = $('#txtNumeroDocumento');
                var val = $input.val();
                $input.val(val.slice(0, -1));
                
                $input.trigger('input');
                
                this.showError('');
            },

            clearAll: function() {
                $('#txtNumeroDocumento').val('');
                this.showError('');
            },

            showError: function(msg) {
                var $error = $('#msgError');
                if (msg) {
                    $error.html('⚠ ' + msg).fadeIn();
                } else {
                    $error.fadeOut();
                }
            },

            submit: function() {
                var numDoc = $('#txtNumeroDocumento').val();
                var tipoDoc = $('#cboTipoDocumento').val();
                var config = this.config[tipoDoc];

                if (!numDoc || numDoc.trim() === '') {
                    this.showError('Por favor, ingrese su número de documento');
                    return;
                }

                if (!isValidInputLength(numDoc)) {
                    this.showError('El documento debe tener entre 7 y 12 caracteres');
                    return;
                }

                if (config && numDoc.length !== config.max) {
                    this.showError('El ' + config.name + ' debe tener ' + config.max + ' dígitos');
                    return;
                }

                var self = this;
                window.location.href = 'menugrupos.app?numDoc=' + numDoc + '&tipoDoc=' + tipoDoc;
            }
        };

        $(document).ready(function() {
            teclado.init();
        });
    </script>

</body>
</html>