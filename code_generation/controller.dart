import 'common.dart';

void generateSuperClass(FileWriter fileWriter, String mode) {
  fileWriter.writeLine(
      "import 'package:${Constants.packageName}/src/general/common.dart';");
  fileWriter.writeLine('class SuperController extends SuperControllerBase {');
  fileWriter.writeLine(
      'const SuperController([${Constants.prefix}Mode? initialMode]) : super(initialMode);');
  fileWriter.writeLine(
      '@override ${Constants.prefix}Mode getStandardMode() => ${Constants.prefix}Mode.$mode;');
  fileWriter.writeLine('}');
}

void generateController() {
  Map<String, String> controller = <String, String>{
    'super': 'unknown',
    'material': 'material',
    'cupertino': 'cupertino',
  };

  controller.forEach((String key, String value) {
    FileWriter fileWriter = FileWriter('super_controller/$key');
    generateSuperClass(fileWriter, value);
    fileWriter.close();
  });
}
