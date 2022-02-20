import 'common.dart';
import 'function.dart';
import 'configuration.dart';
import 'configuration_classes.dart';

void generateImport(FileWriter fileWriter) {
  fileWriter.writeLine("import 'package:flutter/material.dart';");
  fileWriter.writeLine(
      "import 'package:${Constants.packageName}/src/general/common.dart';");
  fileWriter.writeLine(
      "import 'package:${Constants.packageName}/src/implementation/super_components.g.dart';");
  fileWriter.writeLine(
      "import 'package:${Constants.packageName}/src/general/super_app.dart';");
  fileWriter.writeLine(
      "import 'package:${Constants.packageName}/src/implementation/function_override.dart';");
}

void generateMaterialComponentExport(
    List<FunctionDefinition> functionDefinitions) {
  FileWriter fileWriter = FileWriter('export_helper/material_component_export');

  fileWriter.writeLine("export 'package:flutter/material.dart' hide");

  List<StandardComponent> components = CodeGenerationConfiguration()
      .getComponentList()
      .whereType<StandardComponent>()
      .toList();

  List<FakeComponent> fakeComponents = CodeGenerationConfiguration()
      .getComponentList()
      .whereType<FakeComponent>()
      .toList();

  for (StandardComponent component in components) {
    if (component.originalMaterial.isNotEmpty) {
      fileWriter.writeLine('${component.originalMaterial},');
    }
  }

  for (FakeComponent component in fakeComponents) {
    if (component.realName.isEmpty) {
      fileWriter.writeLine('${component.fakeName},');
    }
  }

  for (FunctionDefinition functionDefinition in functionDefinitions) {
    if (functionDefinition == functionDefinitions.last) {
      fileWriter.writeLine('${functionDefinition.originalMaterial};');
    } else {
      fileWriter.writeLine('${functionDefinition.originalMaterial},');
    }
  }

  fileWriter.close();
}

void generateOverlayHelpers(
    List<String> components, List<FunctionDefinition> functionDefinitions) {
  List<String> typedefCollection = <String>[];

  generateMaterialComponentExport(functionDefinitions);

  FileWriter fileWriter = FileWriter('conversion/super_to_material');

  generateImport(fileWriter);

  List<Component> componentList =
      CodeGenerationConfiguration().getComponentList();

  for (Component component in componentList) {
    if (component is StandardComponent) {
      if (component.originalMaterial.isNotEmpty) {
        if (!typedefCollection.contains(component.originalMaterial)) {
          typedefCollection.add(component.originalMaterial);
          fileWriter.writeLine(
              'typedef ${component.originalMaterial} = ${Constants.prefix}${component.name};');
        }
      }
    } else if (component is FakeComponent) {
      if (component.realName.isEmpty) {
        if (!typedefCollection.contains(component.fakeName)) {
          typedefCollection.add(component.fakeName);
          fileWriter.writeLine(
              'typedef ${component.fakeName} = ${Constants.prefix}${component.fakeName};');
        }
      }
    }
  }

  generateFunctions(fileWriter, true);

  fileWriter.close();
}
