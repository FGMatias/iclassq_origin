<div class="modal" id="modalGenerarAnulacion">
	<div class="modal-dialog">
		<div class="modal-content">		
			<!-- Modal Header -->
			<div class="modal-header modal-header-primary">
				<h4 class="modal-title">Registrar Anulación</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>		
			<!-- Modal body -->
			<div class="modal-body">
				<fieldset class="scheduler-border">						
					<form class="needs-validation" novalidate>
						<div class="row">
							<input type="hidden" id="idTicket"/>
							<div class="col-12 form-group">
								<div class="row center-block">	
									<div class="col-xs-12 col-sm-12">
										<label>MOTIVO ANULACIÓN</label>
										<select class="form-control" id="cboMotivoAnulacion" required>
											<option value="0">--Seleccione--</option>
											<option value="92">CANCELADO</option>
											<option value="93">AUSENTE</option>
										</select>
									</div>	
								</div>	
							</div>				
						</div>
						<div class="modal-footer">
							<button type="button" id="btnGenerarAnulacion" class="btn btn-primary">Anular</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
						</div>
					</form>
				</fieldset>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../scripts/toAudioRecord.jsp" />

<script>
	function clearFormAnulacion() {
		$("#cboMotivoAnulacion").val("0");
	}
	
	function getInitDataGenerateCancellation(idTicket) {
		clearFormAnulacion();
		$("#idTicket").val(idTicket);
	}
	
	$("#btnGenerarAnulacion").click(function() {    	
		var idUsuario = '${usuario.iUsuarioId}';
		var idEvalua='${usuario.iEvalua}';
		var iAnula = '${usuario.iAnula}';		
		var tipoAnulacion =11;
		var descripcion = 'Se retiro sin Motivo';
		var idSucursal = '${usuario.iSucursal}';
		var iAtencion = '${usuario.iAtencion}';
		var TextooApellido_sino=$('#txtApellido_sino').val();	
		var idTicket = $('#idTicket').val();	
		var motivo = $('#cboMotivoAnulacion').val();	
		
		v_tieneAudio=$('#txtTieneAudio').val();

		if (v_tieneAudio=='1') {
			fnFinGrabacionAudio();
        }
		
		$.ajax({ 
	 		type: 'POST', 
	 		url: 'anularatencion.app',
	 		data: {
	 			idTicket: idTicket, 
   				idUsuario: idUsuario,  
   				idSucursal: idSucursal,
   				tipoAnulacion: tipoAnulacion, 
   				descripcion: descripcion,
   				motivo: motivo
	     	},
	 		success: function (response) { 
	 			$('#modalGenerarAnulacion').modal('hide');
	 			var data = response.data;

				var TextooApellido_sino=$('#txtApellido_sino').val();	
				
				Construyehtml(data,'S',idEvalua, TextooApellido_sino, iAtencion, iAnula);
				stopMaximumAttentionTimer();
	 		}	
		});    					  
	});
	
	$("#modalGenerarAnulacion").on("hidden.bs.modal", function() {
		clearFormAnulacion();
	});
</script>