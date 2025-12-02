<script>
function openAudioPlayer(audioData, audioSrc) {
    var audioPlayerHTML = '<!DOCTYPE html>' +
        '<html>' +
        '<head>' +
            '<title>Reproductor de Audio - ICLASSQ</title>' +
            '<meta charset="UTF-8">' +
            '<meta name="viewport" content="width=device-width, initial-scale=1">' +
            '<style>' +
	            'body { margin: 0; padding: 0; font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; display: flex; align-items: center; justify-content: center; }' +
	            '.player-container { background: white; border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.3); overflow: hidden; width: 90%; max-width: 600px; }' +
	            '.header { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 20px; text-align: center; }' +
	            '.header h2 { margin: 0 0 5px 0; font-size: 24px; font-weight: 300; }' +
	            '.header .subtitle { opacity: 0.9; font-size: 14px; }' +
	            '.content { padding: 30px; }' +
	            '.info-section { background: #f8f9fa; border-radius: 10px; padding: 20px; margin-bottom: 25px; }' +
	            '.info-row { display: flex; justify-content: space-between; align-items: center; margin-bottom: 12px; }' +
	            '.info-row:last-child { margin-bottom: 0; }' +
	            '.info-label { font-weight: 600; color: #495057; font-size: 14px; }' +
	            '.info-value { color: #212529; font-size: 14px; text-align: right; max-width: 60%; word-wrap: break-word; }' +
	            '.audio-section { margin-top: 20px; text-align: center; }' +
	            '.audio-title { color: #495057; font-size: 16px; font-weight: 600; margin-bottom: 15px; }' +
	            '.audio-section audio { width: 100%; max-width: 500px; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); outline: none; margin-bottom: 15px; }' +
	            '.audio-section .download-btn { display: inline-block; padding: 8px 16px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: #fff; text-decoration: none; border-radius: 6px; font-size: 13px; font-weight: 600; transition: background 0.3s ease; }' +
	            '.audio-section .download-btn:hover { background: linear-gradient(135deg, #5a67d8 0%, #6b46c1 100%); }' +
	            '.footer { text-align: center; padding: 15px; background: #f8f9fa; color: #6c757d; font-size: 12px; }' +
	            '@media (max-width: 480px) { .player-container { width: 95%; margin: 10px; } .content { padding: 20px; } .info-row { flex-direction: column; align-items: flex-start; } .info-value { max-width: 100%; text-align: left; margin-top: 5px; } }' +
            '</style>' +
        '</head>' +
        '<body>' +
            '<div class="player-container">' +
                '<div class="header">' +
                    '<h2>Reproductor de Audio</h2>' +
                    '<div class="subtitle">Sistema ICLASSQ - Gestión de Atenciones</div>' +
                '</div>' +
                '<div class="content">' +
                    '<div class="info-section">' +
                        '<div class="info-row">' +
                            '<span class="info-label">ID Ticket:</span>' +
                            '<span class="info-value">' + (audioData.idTicket || 'N/A') + '</span>' +
                        '</div>' +
                        '<div class="info-row">' +
                            '<span class="info-label">Grupo:</span>' +
                            '<span class="info-value">' + (audioData.grupo || 'N/A') + '</span>' +
                        '</div>' +
                        '<div class="info-row">' +
                            '<span class="info-label">Cliente:</span>' +
                            '<span class="info-value">' + (audioData.cliente || 'N/A') + '</span>' +
                        '</div>' +
                        '<div class="info-row">' +
                            '<span class="info-label">Documento:</span>' +
                            '<span class="info-value">' + (audioData.numeroDocumento || 'N/A') + '</span>' +
                        '</div>' +
                        '<div class="info-row">' +
                            '<span class="info-label">Fecha Atención:</span>' +
                            '<span class="info-value">' + (audioData.fechaAtencion || 'N/A') + '</span>' +
                        '</div>' +
                        '<div class="info-row">' +
                            '<span class="info-label">Asesor:</span>' +
                            '<span class="info-value">' + (audioData.asesor || audioData.ejecutivo || 'N/A') + '</span>' +
                        '</div>' +
                        '<div class="info-row">' +
                            '<span class="info-label">Sucursal:</span>' +
                            '<span class="info-value">' + (audioData.sucursal || 'N/A') + '</span>' +
                        '</div>' +
                    '</div>' +
                    '<div class="audio-section">' +
                        '<div class="audio-title">Reproducir Audio de Atención</div>' +
                        '<audio controls preload="auto">' +
	                        '<source src="' + audioSrc + '" type="audio/webm; codecs=opus">' +
	                        '<source src="' + audioSrc + '" type="audio/ogg; codecs=opus">' +
                            'Tu navegador no soporta la reproducción de audio.' +
                        '</audio>' +
                        '<br>' +
                        '<a href="' + audioSrc + '" download class="download-btn">Descargar Audio</a>' +
                    '</div>' +
                '</div>' +
                '<div class="footer">' +
                    'ICLASSQ © 2024 - Todos los derechos reservados' +
                '</div>' +
            '</div>' +
        '</body>' +
        '</html>';
    
    var newWindow = window.open('', '_blank', 'width=650,height=700');
    newWindow.document.write(audioPlayerHTML);
    newWindow.document.close();
}
</script>