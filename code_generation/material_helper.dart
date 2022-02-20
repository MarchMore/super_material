import 'common.dart';
import 'function.dart';
import 'configuration.dart';
import 'configuration_classes.dart';

void generateMaterialInterface() {
  FileWriter fileWriter = FileWriter('export_helper/material_interface');

  fileWriter.writeLine(
      "export 'package:super_material/src/conversion/material_to_super.g.dart' hide");

  List<FakeComponent> fakeComponents = CodeGenerationConfiguration()
      .getComponentList()
      .whereType<FakeComponent>()
      .toList();

  for (FakeComponent component in fakeComponents) {
    if (component.realName.isEmpty) {
      if (component == fakeComponents.last) {
        fileWriter.writeLine('${Constants.prefix}${component.fakeName};');
      } else {
        fileWriter.writeLine('${Constants.prefix}${component.fakeName},');
      }
    }
  }

  fileWriter.close();
}

void generateMaterialHelpers(
    List<String> components, List<FunctionDefinition> functionDefinitions) {
  List<String> typedefCollection = <String>[];
  List<String> replacedCollection = <String>[];

  generateMaterialInterface();

  FileWriter fileWriter = FileWriter('conversion/material_to_super');

  fileWriter.writeLine("import 'package:flutter/material.dart';");

  List<Component> componentList =
      CodeGenerationConfiguration().getComponentList();

  for (Component component in componentList) {
    if (component is StandardComponent) {
      if (component.originalMaterial.isNotEmpty) {
        if (!typedefCollection
            .contains('${Constants.prefix}${component.name}')) {
          typedefCollection.add('${Constants.prefix}${component.name}');
          fileWriter.writeLine(
              'typedef ${Constants.prefix}${component.name} = ${component.originalMaterial};');
          replacedCollection.add(component.originalMaterial);
        }
      }
    } else if (component is FakeComponent) {
      if (!typedefCollection.contains(Constants.prefix + component.fakeName)) {
        typedefCollection.add(Constants.prefix + component.fakeName);

        if (component.realName.isEmpty) {
          replacedCollection.add(component.fakeName);

          fileWriter.writeLine(
              'typedef ${Constants.prefix}${component.fakeName} = ${component.fakeName};');
        }
      }
    }
  }

  generateFunctions(fileWriter, false);
  fileWriter.close();

  fileWriter = FileWriter('export_helper/replaced_components');
  fileWriter.writeLine('export \'package:flutter/material.dart\' show');

  for (String data in replacedCollection) {
    if (data == replacedCollection.last) {
      fileWriter.writeLine('$data;');
    } else {
      fileWriter.writeLine('$data,');
    }
  }

  fileWriter.close();
  replacedCollection.clear();

  fileWriter = FileWriter('export_helper/material_export');
  fileWriter.writeLine("export 'package:flutter/material.dart' hide");

  for (FunctionDefinition functionDefinition in functionDefinitions) {
    if (!functionDefinition.noSuperComponent) {
      continue;
    }

    if (functionDefinition == functionDefinitions.last) {
      fileWriter.writeLine('${functionDefinition.originalMaterial};');
    } else {
      fileWriter.writeLine('${functionDefinition.originalMaterial},');
    }
  }

  fileWriter.writeLine(
      "export 'package:${Constants.packageName}/src/conversion/super_to_material.g.dart' show");

  for (FunctionDefinition functionDefinition in functionDefinitions) {
    if (!functionDefinition.noSuperComponent) {
      continue;
    }

    if (functionDefinition == functionDefinitions.last) {
      fileWriter.writeLine('${functionDefinition.originalMaterial};');
    } else {
      fileWriter.writeLine('${functionDefinition.originalMaterial},');
    }
  }
  fileWriter.close();
}
