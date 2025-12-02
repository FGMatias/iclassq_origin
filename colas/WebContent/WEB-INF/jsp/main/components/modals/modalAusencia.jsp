<div class="modal" id="modalAusencia">
	<div class="modal-dialog">
		<div class="modal-content">		
			<!-- Modal Header -->
			<div class="modal-header modal-header-primary">
				<h4 class="modal-title">Registrar Ausencia</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>		
			<!-- Modal body -->
			<div class="modal-body">
				<fieldset class="scheduler-border">						
					<form class="needs-validation" novalidate>
						<div class="row">
							<input class="form-control" type="hidden" id="idAusencia" />
							<div class="col-12 form-group">
								<div class="row center-block">	
									<div class="col-xs-12 col-sm-12">
										<label>MOTIVO AUSENCIA</label>
										<select class="form-control" id="cboMotivoAusencia" required>
											<option value="0">--Seleccione--</option>
										</select>
									</div>																						
								</div>	
							</div>				
						</div>
						<div class="modal-footer">
							<button type="button" id="btnRegisterAbsence" class="btn btn-primary">Registrar</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
						</div>
					</form>
				</fieldset>
			</div>
		</div>
	</div>
</div>

<script>	
	function getMotivoAusencia() {
		if ($('#cboMotivoAusencia option').length <= 1) {
	        $.post('listarMotivoAusencia.app', function (response) {
	            const data = response.data;
	            $('#cboMotivoAusencia').empty().append('<option value="0">--Seleccione--</option>');
	            $.each(data, function (i, item) {
	            	$("<option/>")
		                .attr("value", item.id)
		               	.text(item.descripcion)
		                .appendTo("#cboMotivoAusencia");
	            });
	        });
	    }
	}
	
	function stateButtonNext(data) {
		var estado = data.estado;
		
		usuarioAusente = (estado == 1);
		
	    if (usuarioAusente) {
	    	$('#btnLlamarSiguiente').prop("disabled", true);
	    	$('#btnModalTicket').attr("disabled", true);
	    } else {
	    	$('#btnLlamarSiguiente').prop("disabled", false);
	    	$('#btnModalTicket').attr("disabled", false);
	    }
	}
	
	function clearFormAusencia() {
		$("#idAusencia").val("");
		$("#cboMotivoAusencia").val("0");
	}
	
	function handleAbsence(idUsuario) {
		$.getJSON('getDataUserAbsence.app', {
			idUsuario: idUsuario
		})
		.done(function(res) {
			if (res.success && res.data) {
				var ausenciaId = res.data.id;
				var data = {
					id: ausenciaId,
					idUsuario: idUsuario
				};
				
				$.ajax({
					type: 'POST',
					url: 'registerUserAbsence.app',
					contentType: 'application/json; charset=utf-8',
					data: JSON.stringify(data),
					success: function(res) {
						if (res.success) {
							$.alert({
								title: 'Listo!',
								content: res.message
							});
							
							stateButtonNext(res.data);
							$('#labelBtnAusencia').text('Registrar Ausencia');
							$("#btnAusencia").removeClass("btn-danger").addClass("btn-info"); 
						}
					},
					error: function() {
						$.alert('Error de conexión al actualizar la ausencia.');
					}
				});
			} else {
				getDataUserAbsence(idUsuario);
			}
		})
		.fail(function() {
			$.alert("Error al verificar estado de ausencia.");
		});
	}

	
	function loadUserAbsence(idUsuario) {
		return $.getJSON('getDataUserAbsence.app', {
			idUsuario: idUsuario
		})
		.done(function(res) {
			if (!res.success || res.data == null) return;

			var absence = res.data;
			
			updateNextButton(0);
			stateButtonNext(absence);
			$('#labelBtnAusencia').text('Reanudar Atención');
			$('#idAusencia').val(absence.id);
			$("#btnAusencia").removeClass("btn-info").addClass("btn-danger");
		})
		.fail(function() {
			$.alert("Error al conectar con el servidor");
		});
	}
	
	function getDataUserAbsence(idUsuario) {
		clearFormAusencia();
		getMotivoAusencia();
		
		loadUserAbsence(idUsuario)
			.always(function() {
				$('#modalAusencia').modal('show');
			});
	}
	
	$("#btnRegisterAbsence").click(function() {    	
		var idUsuario = '${usuario.iUsuarioId}';    	
		
		var absence = {
			id: +$("#idAusencia").val() || 0,
			idUsuario: idUsuario,
			idMotivoAusencia: $("#cboMotivoAusencia").val()
		} 				
		
		$.ajax({
			type: 'POST',
			url: 'registerUserAbsence.app', 
			contentType: 'application/json; charset=utf-8',
			data: JSON.stringify(absence),
			success: function(res) {
				if (res.success) {
					$.alert({
						title: 'Éxito!',
						content: res.message
					});
					
					stateButtonNext(res.data);
					
					$('#labelBtnAusencia').text('Reanudar Atención');
	                $("#btnAusencia").removeClass("btn-info").addClass("btn-danger");
	                $("#modalAusencia").modal("hide");
				} else {
					$.alert({
						title: 'Error!',
						content: res.message || "No se pudo guardar"
					});
				}
			},
			error: function() {
				$.alert('Error de conexión al guardar la ausencia.');
			}
		})
	});
	
	$("#modalAusencia").on("hidden.bs.modal", function() {
		clearFormAusencia();
	});
</script>