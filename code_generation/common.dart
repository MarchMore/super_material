import 'dart:io';

class Constants {
  static const String prefix = 'SuperMaterial';
  static const String packageName = 'super_material';
}

class FileWriter {
  late final File _file;
  late final IOSink _sink;

  FileWriter(String filename) {
    _file = File('lib/src/$filename.g.dart');
    _sink = _file.openWrite();
  }

  void writeLine(String content) {
    _sink.write('$content\n');
  }

  void close() {
    _sink.close();
  }
}
