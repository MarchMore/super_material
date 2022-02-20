import 'common.dart';

class ComponentParam {
  final String name;
  final String type;
  final bool required;
  final String defaultValue;
  final bool avoidNullable;
  final String assignPrefix;
  final String assignSuffix;
  final String originalMaterial;
  final String assignmentOnNonMaterial;
  final bool isNewParam;
  final bool isNamed;

  const ComponentParam(
    this.type,
    this.name,
    this.required, {
    this.defaultValue = '',
    this.avoidNullable = false,
    this.assignPrefix = '',
    this.assignSuffix = '',
    this.originalMaterial = '',
    this.assignmentOnNonMaterial = '',
    this.isNewParam = false,
    this.isNamed = true,
  });
}

abstract class Component {
  const Component();
}

class StandardComponent extends Component {
  final String name;
  final List<ComponentParam> componentParams;
  final List<String> namedBuilders;
  final String originalMaterial;
  final String copyOf;
  final bool onlyImplementMaterial;
  final bool hasKey;
  final bool avoidConstConstructor;
  final bool useKeyForNonConst;

  const StandardComponent(
    this.name,
    this.componentParams, {
    this.namedBuilders = const <String>[],
    this.originalMaterial = '',
    this.copyOf = '',
    this.onlyImplementMaterial = false,
    this.hasKey = false,
    this.avoidConstConstructor = false,
    this.useKeyForNonConst = false,
  });

  void generateBuilder(FileWriter fileWriter, String returnType,
      String builderName, String params) {
    fileWriter.writeLine('$returnType $builderName($params) {');

    fileWriter.writeLine(
        'if (SuperControllerBase.modeGetter == ${Constants.prefix}Mode.material) {');
    fileWriter
        .writeLine('return material_components.${Constants.prefix}$name(');

    for (ComponentParam param in componentParams
        .where((ComponentParam element) => !element.isNamed)) {
      fileWriter.writeLine(
          '${param.assignPrefix}${param.name}${param.assignSuffix},');
    }

    fileWriter.writeLine('key: key,');

    for (ComponentParam param
        in componentParams.where((ComponentParam element) => element.isNamed)) {
      if (param.assignmentOnNonMaterial.isNotEmpty) {
        continue;
      }

      fileWriter.writeLine(
          '${param.name}: ${param.assignPrefix}${param.name}${param.assignSuffix},');
    }

    fileWriter.writeLine(');');

    fileWriter.writeLine(
        '} else if (SuperControllerBase.modeGetter == ${Constants.prefix}Mode.cupertino) {');
    fileWriter
        .writeLine('return cupertino_components.${Constants.prefix}$name(');
    for (ComponentParam param in componentParams
        .where((ComponentParam element) => !element.isNamed)) {
      fileWriter.writeLine(
          '${param.assignPrefix}${param.name}${param.assignSuffix},');
    }

    fileWriter.writeLine('key: key,');

    for (ComponentParam param
        in componentParams.where((ComponentParam element) => element.isNamed)) {
      String paramName = param.name;
      if (param.assignmentOnNonMaterial.isNotEmpty) {
        paramName = param.assignmentOnNonMaterial;
      }

      fileWriter.writeLine(
          '${param.name}: ${param.assignPrefix}$paramName${param.assignSuffix},');
    }

    fileWriter.writeLine(');');

    fileWriter.writeLine('} else {');
    fileWriter.writeLine('throw UnimplementedError();');
    fileWriter.writeLine('}');

    fileWriter.writeLine('}');
  }

  void generate(FileWriter fileWriter) {
    fileWriter
        .writeLine('class ${Constants.prefix}$name extends StatelessWidget {');

    for (ComponentParam param in componentParams) {
      if (param.assignmentOnNonMaterial.isNotEmpty) continue;

      fileWriter.writeLine(
          'final ${param.type}${(param.required || param.avoidNullable) ? '' : (param.type != 'dynamic' ? '?' : '')} ${param.name};');
    }

    fileWriter.writeLine(
        '${avoidConstConstructor ? '' : 'const '}${Constants.prefix}$name(');

    for (ComponentParam param in componentParams
        .where((ComponentParam element) => !element.isNamed)) {
      if (param.assignmentOnNonMaterial.isNotEmpty) continue;

      fileWriter.writeLine(
          '${param.required ? 'required' : ''} this.${param.name}${param.defaultValue.isEmpty ? '' : ' = ${param.defaultValue}'},');
    }

    fileWriter.writeLine('{Key? key, ');

    for (ComponentParam param
        in componentParams.where((ComponentParam element) => element.isNamed)) {
      if (param.assignmentOnNonMaterial.isNotEmpty) continue;

      fileWriter.writeLine(
          '${param.required ? 'required' : ''} this.${param.name}${param.defaultValue.isEmpty ? '' : ' = ${param.defaultValue}'},');
    }

    fileWriter.writeLine(
        '}): super(key: key ${useKeyForNonConst ? ' ?? UniqueKey()' : ''});');

    for (String namedBuilder in namedBuilders) {
      generateBuilder(fileWriter, 'dynamic', namedBuilder, '');
    }

    fileWriter.writeLine('@override');
    generateBuilder(fileWriter, 'Widget', 'build', 'BuildContext context');

    fileWriter.writeLine('}');
  }
}

class SpecialComponent extends Component {
  final String name;
  final List<ComponentParam> params;
  final String originalMaterial;

  const SpecialComponent(
    this.name,
    this.params, {
    this.originalMaterial = '',
  });

  void generate(FileWriter fileWriter) {
    fileWriter.writeLine('abstract class ${Constants.prefix}$name {');

    fileWriter.writeLine('dynamic get();');
    fileWriter.writeLine('${Constants.prefix}$name.standard();');

    fileWriter.writeLine('factory ${Constants.prefix}$name({');

    for (ComponentParam param in params) {
      fileWriter.writeLine('${param.type}? ${param.name},');
    }

    fileWriter.writeLine('}){');

    fileWriter.writeLine(
        'if (SuperControllerBase.modeGetter == ${Constants.prefix}Mode.material) {');
    fileWriter
        .writeLine('return material_components.${Constants.prefix}$name(');

    for (ComponentParam param in params) {
      fileWriter.writeLine(
          '${param.name}: ${param.assignPrefix}${param.name}${param.assignSuffix},');
    }

    fileWriter.writeLine(
        ');} else if (SuperControllerBase.modeGetter == ${Constants.prefix}Mode.cupertino) {');
    fileWriter
        .writeLine('return cupertino_components.${Constants.prefix}$name(');

    for (ComponentParam param in params) {
      fileWriter.writeLine(
          '${param.name}: ${param.assignPrefix}${param.name}${param.assignSuffix},');
    }

    fileWriter.writeLine(');} else {');
    fileWriter.writeLine('throw UnimplementedError();');
    fileWriter.writeLine('}}}');
  }
}

class FakeComponent extends Component {
  final String fakeName;
  final String realName;

  const FakeComponent(this.fakeName, {this.realName = ''});
}
