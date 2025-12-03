<div class="modal" id="modalViewGroups">
	<div class="modal-dialog">
		<div class="modal-content">		
			<!-- Modal Header -->
			<div class="modal-header modal-header-primary">
				<h4 class="modal-title">Grupos</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>		
			<!-- Modal body -->
			<div class="modal-body">
				<fieldset class="scheduler-border">						
					<form class="needs-validation" novalidate>
						<div class="row">
							<div class="col-12 form-group">
								<div class="row center-block">	
									<div class="col-xs-12 col-sm-12">
										<label>GRUPOS</label>
										<select class="form-control" id="cboGrupos" required>
											<option value="0">--Seleccione--</option>
										</select>
									</div>	
								</div>	
							</div>				
						</div>
						<div class="modal-footer">
							<button type="button" id="btnSeleccionarGrupo" class="btn btn-primary">Seleccionar</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
						</div>
					</form>
				</fieldset>
			</div>
		</div>
	</div>
</div>

<script>
	function clearForm() {
		$("#cboGrupos").val("0");
	}
	
	function getGruposBySucursal() {
		var idSucursal = '${usuario.iSucursal}';
		
		if ($('#cboGrupos option').length <= 1) {
	        $.post('listargruposxsede.app', { idSucursal: idSucursal }, function (response) {
	            const data = response.data;
				console.log("data de grupos");
				console.log(data);
	            $('#cboGrupos').empty().append('<option value="0">--Seleccione--</option>');
	            $.each(data, function (i, item) {
	            	$("<option/>")
		                .attr("value", item.id)
		               	.text(item.nombre)
		                .appendTo("#cboGrupos");
	            });
	        });
	    }
	}
	
	function getInitDataViewGroups() {
		clearForm();
		getGruposBySucursal();
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
	
	$("#modalVerGrupos").on("hidden.bs.modal", function() {
		clearForm();
	});
</script>