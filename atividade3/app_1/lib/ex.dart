import 'dart:io';
import 'package:archive/archive_io.dart';

/// Imprimir as entradas no arquivo tar fornecido.
void listFiles(String path) {
  final file = File(path);
  if (!file.existsSync()) fail('$path does not exist');

  final input = InputFileStream(path);
  final dir = Directory.systemTemp.createTempSync('foo');
  final tempTarPath = '${dir.path}${Platform.pathSeparator}temp.tar';
  final output = OutputFileStream(tempTarPath);

    if (path.endsWith('tar.gz') || path.endsWith('tgz')) {
    GZipDecoder().decodeStream(input, output);
  } else if (path.endsWith('tar.bz2') || path.endsWith('tbz')) {
    BZip2Decoder().decodeStream(input, output);
  }

  final tarInput = InputFileStream(tempTarPath);

  final tarArchive = TarDecoder();
  // Diga ao decodificador para não armazenar os dados reais do arquivo, pois não precisamos
  tarArchive.decodeBuffer(tarInput, storeData: false);

  print('${tarArchive.files.length} file(s)');
  tarArchive.files.forEach((f) => print('  $f'));
}

/// Extraia as entradas no arquivo tar fornecido para um diretório.
Directory extractFiles(String inputPath, String outputPath) {
  Directory? tempDir;
  var tarPath = inputPath;

  if (inputPath.endsWith('tar.gz') || inputPath.endsWith('tgz')) {
    tempDir = Directory.systemTemp.createTempSync('dart_archive');
    tarPath = '${tempDir.path}${Platform.pathSeparator}temp.tar';
    final input = InputFileStream(inputPath);
    final tarOutput = OutputFileStream(tarPath);
    GZipDecoder().decodeStream(input, tarOutput);
    input.close();
    tarOutput.close();
  }

  final outDir = Directory(outputPath);
  if (!outDir.existsSync()) {
    outDir.createSync(recursive: true);
  }

  final input = InputFileStream(tarPath);
  final tarArchive = TarDecoder().decodeBuffer(input);

  for (final file in tarArchive.files) {
    if (!file.isFile) {
      continue;
    }

    final filePath = '$outputPath${Platform.pathSeparator}${file.name}';
    final output = OutputFileStream(filePath);
    file.writeContent(output);
    print('  extracted ${file.name}');
    output.close();
  }

  input.close();
  tarArchive.clear();

  return outDir;
}

void createTarFile(String dirPath) {
  final dir = Directory(dirPath);
  if (!dir.existsSync()) fail('$dirPath does not exist');

  // Codifique um diretório de disco para disco, sem memória
  final encoder = TarFileEncoder();
  encoder.tarDirectory(dir, compression: TarFileEncoder.GZIP);
}

void fail(String message) {
  print(message);
  exit(1);
}