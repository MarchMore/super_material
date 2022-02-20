import 'common.dart';
import 'configuration_classes.dart';
import 'configuration.dart';

void generateExportHelperFakes() {
  List<String> designs = <String>['super', 'material'];

  for (String design in designs) {
    FileWriter fileWriter = FileWriter('export_helper/${design}_fake');

    fileWriter.writeLine(
        "export 'package:${Constants.packageName}/src/implementation/${design}_components.g.dart' show");

    List<FakeComponent> fakeComponents = CodeGenerationConfiguration()
        .getComponentList()
        .whereType<FakeComponent>()
        .where((FakeComponent element) => element.realName.isNotEmpty)
        .toList();

    for (FakeComponent component in fakeComponents) {
      if (component == fakeComponents.last) {
        fileWriter.writeLine('${Constants.prefix}${component.fakeName};');
      } else {
        fileWriter.writeLine('${Constants.prefix}${component.fakeName},');
      }
    }

    fileWriter.close();
  }
}
