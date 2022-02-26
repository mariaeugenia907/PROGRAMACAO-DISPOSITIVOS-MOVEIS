import 'dart:io';
import 'package:archive/archive_io.dart';

void main() {
  // Lê o arquivo Zip do disco.
  final bytes = File('test.zip').readAsBytesSync();

  // Decodifique o arquivo Zip
  final archive = ZipDecoder().decodeBytes(bytes);

  // Extraia o conteúdo do arquivo Zip para o disco.
  for (final file in archive) {
    final filename = file.name;
    if (file.isFile) {
      final data = file.content as List<int>;
      File('out/' + filename)
        ..createSync(recursive: true)
        ..writeAsBytesSync(data);
    } else {
      Directory('out/' + filename).create(recursive: true);
    }
  }

  // Codifique o arquivo como um arquivo Tar compactado BZip2.
  final tar_data = TarEncoder().encode(archive);
  final tar_bz2 = BZip2Encoder().encode(tar_data);

  // Grave o arquivo tar compactado no disco.
  final fp = File('test.tbz');
  fp.writeAsBytesSync(tar_bz2);

  // Compacte um diretório para out.zip usando o método de conveniência zipDirectory
  var encoder = ZipFileEncoder();
  encoder.zipDirectory(Directory('out'), filename: 'out.zip');

  // Crie manualmente um zip de um diretório e arquivos individuais.
  encoder.create('out2.zip');
  encoder.addDirectory(Directory('out'));
  encoder.addFile(File('test.zip'));
  encoder.close();
}