import 'configuration.dart';
import 'configuration_classes.dart';
import 'common.dart';

void generateMaterialComponents() {
  List<Component> components = CodeGenerationConfiguration().getComponentList();
  List<FakeComponent> fakeComponents = CodeGenerationConfiguration()
      .getComponentList()
      .whereType<FakeComponent>()
      .toList();

  FileWriter fileWriter = FileWriter('implementation/material_components');

  fileWriter.writeLine("import 'package:flutter/material.dart';");
  fileWriter.writeLine(
      "import 'package:${Constants.packageName}/src/implementation/super_components.g.dart' as super_components;");

  bool found = false;

  for (Component component in components) {
    if (component is StandardComponent) {
      found = false;

      for (FakeComponent fakeComponent in fakeComponents) {
        if (component.name == fakeComponent.fakeName) {
          found = true;
          break;
        }
      }

      if (!found) {
        continue;
      }

      String extendName = component.originalMaterial.isNotEmpty
          ? component.originalMaterial
          : component.copyOf;

      List<ComponentParam> namedParams = component.componentParams
          .where((ComponentParam element) => element.isNamed)
          .toList();

      fileWriter.writeLine(
          'class ${Constants.prefix}${component.name} extends $extendName {');

      fileWriter.writeLine(
          '${component.avoidConstConstructor ? '' : 'const '} ${Constants.prefix}${component.name}(');

      for (ComponentParam param in component.componentParams
          .where((ComponentParam element) => !element.isNamed)) {
        if (param.assignmentOnNonMaterial.isNotEmpty) {
          continue;
        }

        String typeTemp = param.type;
        if (param.originalMaterial.isNotEmpty) {
          typeTemp = param.originalMaterial;
        }

        fileWriter.writeLine(
            '$typeTemp${param.avoidNullable || param.type == 'dynamic' ? '' : '?'} ${param.name},');
      }

      if (namedParams.isNotEmpty || component.hasKey) {
        fileWriter.writeLine('{');
      }

      if (component.hasKey) {
        fileWriter.writeLine('Key? key,');
      }
      for (ComponentParam param in namedParams) {
        if (param.assignmentOnNonMaterial.isNotEmpty) {
          continue;
        }

        String typeTemp = param.type;
        if (param.originalMaterial.isNotEmpty) {
          typeTemp = param.originalMaterial;
        }

        if (param.required) {
          fileWriter.writeLine('required $typeTemp ${param.name},');
        } else {
          if (param.defaultValue.isNotEmpty) {
            fileWriter.writeLine(
                '$typeTemp${param.avoidNullable || param.type == 'dynamic' ? '' : '?'} ${param.name} = ${param.defaultValue},');
          } else {
            fileWriter.writeLine(
                '$typeTemp${param.avoidNullable || param.type == 'dynamic' ? '' : '?'} ${param.name},');
          }
        }
      }

      if (namedParams.isNotEmpty || component.hasKey) {
        fileWriter.writeLine('}');
      }

      fileWriter.writeLine(') : super(');

      for (ComponentParam param in component.componentParams
          .where((ComponentParam element) => !element.isNamed)) {
        if (param.assignmentOnNonMaterial.isNotEmpty) {
          continue;
        }

        if (param.isNewParam) {
          continue;
        }

        fileWriter.writeLine('${param.name},');
      }

      if (component.hasKey) {
        fileWriter.writeLine(
            'key:key ${component.useKeyForNonConst ? ' ?? UniqueKey()' : ''},');
      }
      for (ComponentParam param in component.componentParams
          .where((ComponentParam element) => element.isNamed)) {
        if (param.assignmentOnNonMaterial.isNotEmpty) {
          continue;
        }

        if (param.isNewParam) {
          continue;
        }

        fileWriter.writeLine('${param.name}:${param.name},');
      }

      fileWriter.writeLine(');}');
    } else if (component is SpecialComponent) {
      fileWriter.writeLine(
          'class ${Constants.prefix}${component.name} extends super_components.${Constants.prefix}${component.name} {');

      for (ComponentParam param in component.params) {
        String typeTemp = param.type;
        if (param.originalMaterial.isNotEmpty) {
          typeTemp = param.originalMaterial;
        }

        fileWriter.writeLine('late final $typeTemp? ${param.name};');
      }

      fileWriter.writeLine('${Constants.prefix}${component.name}({');

      for (ComponentParam param in component.params) {
        fileWriter.writeLine('this.${param.name},');
      }
      fileWriter.writeLine('}) : super.standard();');

      fileWriter.writeLine('@override');
      fileWriter.writeLine('get() => ${component.originalMaterial}(');

      for (ComponentParam param in component.params) {
        fileWriter.writeLine('${param.name}:${param.name},');
      }

      fileWriter.writeLine(');}');
    }
  }

  fileWriter.close();
}
