import 'dart:io';

import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';

void createZip() {
  final logDir = Directory.current.path + '/log';
  final zipLocation = Directory.current.path + '/log.zip';

  var encoder = ZipFileEncoder(); //cria um arquivo zip no arquivo de destino  a partir da linha 7, que é um diretório que pode conter aqrquivos txt
  encoder.zipDirectory(Directory(logDir), filename: zipLocation);

  // Crie manualmente um zip de um diretório e arquivos individuais.
  encoder.create(Directory.current.path + '/log2.zip');
  encoder.addFile(File('another_file.txt'));
  
  encoder.close();
}



