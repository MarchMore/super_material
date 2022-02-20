import 'dart:io';
import 'configuration.dart';
import 'material_helper.dart';
import 'overlay_interface.dart';
import 'material_component.dart';
import 'configuration_classes.dart';
import 'common.dart';
import 'function.dart';
import 'controller.dart';
import 'export_helper_fake.dart';

void generateImport(FileWriter fileWriter) {
  fileWriter.writeLine("import 'package:flutter/material.dart';");
  fileWriter.writeLine(
      "import 'package:${Constants.packageName}/src/implementation/cupertino_components.dart' as cupertino_components;");
  fileWriter.writeLine(
      "import 'package:${Constants.packageName}/src/general/common.dart';");
  fileWriter.writeLine(
      "import 'package:${Constants.packageName}/src/implementation/material_components.g.dart' as material_components;");
  fileWriter.writeLine(
      "import 'package:${Constants.packageName}/src/export_helper/material_interface.g.dart' as material_components;");
}

void main() {
  FileWriter fileWriter = FileWriter('implementation/super_components');

  generateImport(fileWriter);
  fileWriter.writeLine(
      'class ModifiableList<T> {List<T> _values = <T>[];ModifiableList(List<T> values) {_values = values.toList();}List<T> get() => _values;}');

  List<String> components = <String>[];
  List<FunctionDefinition> functionDefinitions = <FunctionDefinition>[];

  for (Component component
      in CodeGenerationConfiguration().getComponentList()) {
    if (component is StandardComponent) {
      components.add('${Constants.prefix}${component.name}');
      component.generate(fileWriter);
    } else if (component is SpecialComponent) {
      component.generate(fileWriter);
    }
  }

  for (FunctionDefinition functionDefinition
      in CodeGenerationConfiguration().getFunctionList()) {
    functionDefinitions.add(functionDefinition);
    functionDefinition.generate(fileWriter);
  }

  fileWriter.close();

  generateController();
  generateExportHelperFakes();
  generateMaterialComponents();
  generateMaterialHelpers(components, functionDefinitions);
  generateOverlayHelpers(components, functionDefinitions);

  Process.run('dart', <String>['format', 'lib/']);
}
