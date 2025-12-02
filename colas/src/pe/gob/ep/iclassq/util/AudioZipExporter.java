package pe.gob.ep.iclassq.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.util.Date;
import java.util.List;
import java.util.function.Function;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletResponse;

public final class AudioZipExporter {
	private AudioZipExporter() {}

    private static final String[] HEADERS = new String[] {
	    "audio_name",
	    "Date",
	    "Duration",
	    "Conversation StartTime",
	    "Conversation EndTime",
	    "UserId",
	    "ClientId",
	    "Wrap Up Code",
	    "ID_recording"
    };

    private static final DateTimeFormatter TIME_FMT = new DateTimeFormatterBuilder()
    														.appendPattern("H:mm")
										                    .optionalStart().appendPattern(":ss").optionalEnd()
										                    .toFormatter();

    public static final class Extractors<T> {
        public final Function<T, String> audio;        
        public final Function<T, String> fecha;        
        public final Function<T, String> horaInicio;   
        public final Function<T, String> horaFin;      
        public final Function<T, String> userId;       
        public final Function<T, String> clientId;     
        public final Function<T, String> wrapCode;     
        public final Function<T, String> idRecording;  

        private Extractors(
    		Function<T, String> audio,
    		Function<T, String> fecha,
    		Function<T, String> horaInicio,
    		Function<T, String> horaFin,
    		Function<T, String> userId,
   			Function<T, String> clientId,
   			Function<T, String> wrapCode,
   			Function<T, String> idRecording
		) {
            this.audio = audio;
            this.fecha = fecha;
            this.horaInicio = horaInicio;
            this.horaFin = horaFin;
            this.userId = userId;
            this.clientId = clientId;
            this.wrapCode = wrapCode;
            this.idRecording = idRecording;
        }

    	public static <T> Extractors<T> of(
    		Function<T, String> audio,
    		Function<T, String> fecha,
			Function<T, String> horaInicio,
			Function<T, String> horaFin,
			Function<T, String> userId,
			Function<T, String> clientId,
			Function<T, String> wrapCode,
			Function<T, String> idRecording
		) {
            return new Extractors<>(audio, fecha, horaInicio, horaFin, userId, clientId, wrapCode, idRecording);
        }
    }

    public static <T> void exportZipWithCsv(
			List<T> filas,
	        HttpServletResponse response,
	        String baseDir,
	        String zipPrefix,
	        Extractors<T> ex
    ) throws IOException {

        String zipName = zipPrefix + "_" + new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date()) + ".zip";

        response.setContentType("application/zip");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + zipName + "\"");

        ByteArrayOutputStream csvBaos = new ByteArrayOutputStream();
        writeCsvLineToStream(csvBaos, HEADERS);

        try (ZipOutputStream zos = new ZipOutputStream(response.getOutputStream())) {
            for (T row : filas) {
                String ruta = safe(ex.audio.apply(row));
                if (ruta.isEmpty()) {
                    appendCsvForRow(csvBaos, ex, row, "", ""); 
                    continue;
                }

                String fileName = extractFileName(ruta);
                String audioStatus = fileName;

                Path filePath = Paths.get(baseDir, fileName);
                if (!Files.exists(filePath)) {
                    filePath = Paths.get(baseDir, ruta);
                }

                if (Files.exists(filePath)) {
                    try {
                        ZipEntry audioEntry = new ZipEntry("audios/" + fileName);
                        zos.putNextEntry(audioEntry);
                        Files.copy(filePath, zos);
                        zos.closeEntry();
                    } catch (Exception e) {
                        audioStatus = fileName + " (error)";
                    }
                } else {
                    audioStatus = fileName + " (missing)";
                }

                appendCsvForRow(csvBaos, ex, row, audioStatus, fileName);
            }

            ZipEntry csvEntry = new ZipEntry("metadata.csv");
            zos.putNextEntry(csvEntry);
            zos.write(csvBaos.toByteArray());
            zos.closeEntry();
        }
    }

    private static <T> void appendCsvForRow(
			ByteArrayOutputStream csvBaos, 
			Extractors<T> ex, 
			T row,
		    String audioStatus, 
		    String fileName
    ) throws IOException {
        String fecha = safe(ex.fecha.apply(row));
        String startTime = safe(ex.horaInicio.apply(row));
        String endTime = safe(ex.horaFin.apply(row));

        String durationSeconds = durationSeconds(startTime, endTime);

        String userId = safe(ex.userId.apply(row));
        String clientId = safe(ex.clientId.apply(row));
        String wrapCode = safe(ex.wrapCode.apply(row));
        String idRec = safe(ex.idRecording.apply(row));

        String[] cols = new String[] {
            audioStatus,
            fecha,
            durationSeconds,
            fechaTimeConcat(fecha, startTime),
            fechaTimeConcat(fecha, endTime),
            userId,
            clientId,
            wrapCode,
            idRec
        };
        writeCsvLineToStream(csvBaos, cols);
    }

    private static String extractFileName(String ruta) {
        int slash = Math.max(ruta.lastIndexOf('/'), ruta.lastIndexOf('\\'));
        return (slash >= 0 && slash < ruta.length() - 1) ? ruta.substring(slash + 1) : ruta;
    }

    private static String durationSeconds(String start, String end) {
        try {
            if (start.isEmpty() || end.isEmpty()) return "";
            LocalTime ini = LocalTime.parse(start, TIME_FMT);
            LocalTime fin = LocalTime.parse(end, TIME_FMT);
            long secs = Duration.between(ini, fin).getSeconds();
            return String.valueOf(Math.max(secs, 0));
        } catch (Exception e) {
            return "";
        }
    }

    private static void writeCsvLineToStream(ByteArrayOutputStream baos, String[] cols) throws IOException {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < cols.length; i++) {
            if (i > 0) sb.append(",");
            sb.append(csvEscape(cols[i]));
        }
        sb.append("\r\n");
        baos.write(sb.toString().getBytes(StandardCharsets.UTF_8));
    }

    private static String csvEscape(String v) {
        if (v == null) v = "";
        boolean needQuotes = v.contains(",") || v.contains("\"") || v.contains("\n") || v.contains("\r");
        String s = v.replace("\"", "\"\"");
        return needQuotes ? "\"" + s + "\"" : s;
    }

    private static String fechaTimeConcat(String fecha, String time) {
        if (fecha == null || fecha.isEmpty() || time == null || time.isEmpty()) return "";
        return fecha + " " + time;
    }

    private static String safe(String v) {
        return v == null ? "" : v;
    }
}
