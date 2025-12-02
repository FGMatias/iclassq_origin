<script>
	function findPersonByDocument(numeroDocumento) {
		return $.ajax({ 
			type: 'POST', 
			url: 'getPersonabydni.app',
			data: { dniCliente: numeroDocumento }
		});
	}
</script>