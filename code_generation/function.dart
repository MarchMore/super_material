import 'common.dart';
import 'configuration.dart';

class FunctionParam {
  String type;
  String name;
  bool isRequired;
  bool isNamed;

  FunctionParam(this.type, this.name,
      {required this.isRequired, required this.isNamed});
}

class FunctionDefinition {
  String name;
  String returnType;
  List<FunctionParam> params;
  String originalMaterial;
  List<String> templateNameList;
  bool noSuperComponent;

  FunctionDefinition(
    this.name,
    this.returnType,
    this.params, {
    this.originalMaterial = '',
    this.templateNameList = const <String>[],
    this.noSuperComponent = false,
  });

  void generate(FileWriter fileWriter) {
    if (noSuperComponent) {
      return;
    }

    fileWriter.writeLine('$returnType $name');

    if (templateNameList.isNotEmpty) {
      String templates = '';

      for (String templateName in templateNameList) {
        templates += templateName;
        if (templateName != templateNameList.last) {
          templates += ',';
        }
      }

      fileWriter.writeLine('<$templates>');
    }

    fileWriter.writeLine('({');

    for (FunctionParam functionParam in params) {
      fileWriter.writeLine(
          '${functionParam.isRequired ? 'required' : ''} ${functionParam.type} ${functionParam.name},');
    }

    fileWriter.writeLine('}) {');
    fileWriter.writeLine(
        '  if (SuperControllerBase.modeGetter == ${Constants.prefix}Mode.material) {');
    fileWriter.writeLine('    return material_components.$name(');
    fileWriter.writeLine('        ');

    for (FunctionParam functionParam in params) {
      fileWriter.writeLine('${functionParam.name}: ${functionParam.name},');
    }

    fileWriter.writeLine(');');
    fileWriter.writeLine(
        '  } else if (SuperControllerBase.modeGetter == ${Constants.prefix}Mode.cupertino) {');
    fileWriter.writeLine('    return cupertino_components.$name(');
    fileWriter.writeLine('        ');

    for (FunctionParam functionParam in params) {
      fileWriter.writeLine('${functionParam.name}: ${functionParam.name},');
    }

    fileWriter.writeLine(');');
    fileWriter.writeLine('  } else {');
    fileWriter.writeLine('    throw UnimplementedError();');
    fileWriter.writeLine('  }');
    fileWriter.writeLine('}');
  }
}

void generateFunctions(FileWriter fileWriter, bool switchNames) {
  List<FunctionDefinition> functions =
      CodeGenerationConfiguration().getFunctionList();

  for (FunctionDefinition functionDefinition in functions) {
    if (functionDefinition.noSuperComponent && !switchNames) {
      continue;
    }

    String templates = '';

    if (functionDefinition.templateNameList.isNotEmpty) {
      for (String templateName in functionDefinition.templateNameList) {
        templates += templateName;
        if (templateName != functionDefinition.templateNameList.last) {
          templates += ',';
        }
      }

      templates = '<$templates>';
    }

    if (switchNames) {
      fileWriter.writeLine(
          '${functionDefinition.returnType} ${functionDefinition.originalMaterial}$templates');
    } else {
      fileWriter.writeLine(
          '${functionDefinition.returnType} ${functionDefinition.name}$templates');
    }

    fileWriter.writeLine('(');
    for (FunctionParam functionParam in functionDefinition.params
        .where((FunctionParam element) => !element.isNamed)) {
      fileWriter.writeLine(
          '${functionParam.isRequired ? 'required ' : ''} ${functionParam.type} ${functionParam.name},');
    }

    if (functionDefinition.params
        .where((FunctionParam element) => element.isNamed)
        .isNotEmpty) {
      fileWriter.writeLine('{');
      for (FunctionParam functionParam in functionDefinition.params
          .where((FunctionParam element) => element.isNamed)) {
        fileWriter.writeLine(
            '${functionParam.isRequired ? 'required ' : ''} ${functionParam.type} ${functionParam.name},');
      }
      fileWriter.writeLine('}');
    }

    if (switchNames) {
      fileWriter.writeLine(') => ${functionDefinition.name}(');
    } else {
      fileWriter.writeLine(') => ${functionDefinition.originalMaterial}(');
    }

    for (FunctionParam functionParam in functionDefinition.params) {
      if (functionParam.isNamed) {
        fileWriter.writeLine('${functionParam.name}:${functionParam.name},');
      } else {
        fileWriter.writeLine('${functionParam.name},');
      }
    }

    fileWriter.writeLine(');');
  }
}
