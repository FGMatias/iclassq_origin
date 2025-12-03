<script>
	function onlyNumbersMaxLength(input) {
		input.value = input.value.replace(/[^0-9@._\/-]/g, '').slice(0, 12);
	}
	
	function onlyNumbers(input) {
		input.value = input.value.replace(/\D/g, '');
	}
	
	function isValidTelefono(input) {
		input.value = input.value.replace(/\D/g, '').slice(0, 9);
	}
		
	function aplicarRestriccionDocumento(tipoDocSelector, inputSelector) {
		$(inputSelector).on("input", function () {
			const tipoDoc = $(tipoDocSelector).val();
			let valor = $(this).val();

			switch (tipoDoc) {
				case "1": // DNI: solo 8 números
					valor = valor.replace(/\D/g, '').slice(0, 8);
					break;
				case "2": // PTP: solo 9 números
				case "3": // Carnet Extranjería
					valor = valor.replace(/\D/g, '').slice(0, 9);
					break;
// 				case "4": // Pasaporte: letras y números, máx 12 caracteres
// 					valor = valor.replace(/[^a-zA-Z0-9]/g, '').slice(0, 12);
// 					break;
				case "4": // RUC: solo 11 números
					valor = valor.replace(/\D/g, '').slice(0, 11);
				default:
					valor = valor.replace(/\D/g, '');
			}

			$(this).val(valor);
		});
	}

	function isValidInputLength(value) {
		return value.length >= 7 && value.length <= 12;
	}

</script>