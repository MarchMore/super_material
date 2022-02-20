import 'function.dart';
import 'configuration_classes.dart';
import 'common.dart';

class CodeGenerationConfiguration {
  List<Component> getComponentList() => const <Component>[
        StandardComponent(
          'IconButton',
          <ComponentParam>[
            ComponentParam('Widget', 'icon', true),
            ComponentParam('void Function()', 'onPressed', false),
            ComponentParam('String', 'tooltip', false),
          ],
          originalMaterial: 'IconButton',
          hasKey: true,
        ),
        StandardComponent(
          'ListTile',
          <ComponentParam>[
            ComponentParam('Widget', 'leading', false),
            ComponentParam('Widget', 'title', false),
            ComponentParam('Text', 'subtitle', false),
            ComponentParam('void Function()', 'onTap', false),
            ComponentParam('Widget', 'trailing', false),
          ],
          originalMaterial: 'ListTile',
          hasKey: true,
        ),
        StandardComponent(
          'CheckboxListTile',
          <ComponentParam>[
            ComponentParam('Widget', 'title', false),
            ComponentParam('Text', 'subtitle', false),
            ComponentParam('void Function(bool?)', 'onChanged', false),
            ComponentParam('bool', 'value', false),
          ],
          originalMaterial: 'CheckboxListTile',
          hasKey: true,
        ),
        StandardComponent(
          'TextField',
          <ComponentParam>[
            ComponentParam('TextEditingController', 'controller', false),
            ComponentParam('InputDecoration', 'decoration', false),
            ComponentParam(
              'int',
              'maxLines',
              false,
              defaultValue: '1',
            ),
            ComponentParam('bool', 'obscureText', false,
                defaultValue: 'false', avoidNullable: true),
            ComponentParam('TextInputType', 'keyboardType', false),
            ComponentParam('void Function(String)', 'onChanged', false),
            ComponentParam('bool', 'enabled', false),
          ],
          originalMaterial: 'TextField',
          hasKey: true,
        ),
        StandardComponent(
          'ElevatedButton',
          <ComponentParam>[
            ComponentParam('Widget', 'child', true),
            ComponentParam('void Function()', 'onPressed', false),
          ],
          originalMaterial: 'ElevatedButton',
          hasKey: true,
        ),
        StandardComponent(
          'AlertDialog',
          <ComponentParam>[
            ComponentParam('Widget', 'content', false),
            ComponentParam('Widget', 'title', false),
            ComponentParam('List<Widget>', 'actions', false),
          ],
          originalMaterial: 'AlertDialog',
          hasKey: true,
        ),
        StandardComponent(
          'DialogAction',
          <ComponentParam>[
            ComponentParam('Widget', 'child', true),
            ComponentParam('void Function()', 'onPressed', false),
            ComponentParam('bool', 'isDestructiveAction', false,
                defaultValue: 'false', isNewParam: true),
          ],
          copyOf: 'ElevatedButton',
          hasKey: true,
        ),
        StandardComponent(
          'CircularProgressIndicator',
          <ComponentParam>[],
          originalMaterial: 'CircularProgressIndicator',
          hasKey: true,
        ),
        StandardComponent(
          'Card',
          <ComponentParam>[
            ComponentParam('Widget', 'child', false),
            ComponentParam('Color', 'color', false),
          ],
          originalMaterial: 'Card',
          hasKey: true,
        ),
        StandardComponent(
          'Icon',
          <ComponentParam>[
            ComponentParam('IconData', 'icon', false, isNamed: false),
            ComponentParam('double', 'size', false),
          ],
          originalMaterial: 'Icon',
          hasKey: true,
        ),
        StandardComponent(
          'AppBar',
          <ComponentParam>[
            ComponentParam('List<Widget>', 'actions', false,
                assignPrefix: 'ModifiableList<Widget>(',
                assignSuffix: '  ?? <Widget>[]).get()'),
            ComponentParam('Widget', 'title', false),
            ComponentParam('Widget', 'leading', false),
            ComponentParam('List<Widget>', 'emptyAction', true,
                assignPrefix: 'ModifiableList<Widget>(',
                assignSuffix: ').get()',
                assignmentOnNonMaterial: '<Widget>[]'),
          ],
          namedBuilders: <String>['get'],
          originalMaterial: 'AppBar',
          hasKey: true,
          useKeyForNonConst: true,
          avoidConstConstructor: true,
        ),
        StandardComponent(
          'App',
          <ComponentParam>[
            ComponentParam('Widget', 'home', true),
            ComponentParam('String', 'title', false,
                defaultValue: "''", avoidNullable: true),
            ComponentParam('${Constants.prefix}ThemeData', 'theme', false,
                assignSuffix: ' == null ? null : theme!.get()',
                originalMaterial: 'ThemeData'),
            ComponentParam('dynamic', 'darkTheme', false,
                assignSuffix: ' == null ? null : darkTheme!.get()'),
            ComponentParam('ThemeMode', 'themeMode', false),
            ComponentParam('bool', 'debugShowCheckedModeBanner', false,
                defaultValue: 'true', avoidNullable: true),
          ],
          originalMaterial: 'MaterialApp',
          onlyImplementMaterial: true,
          hasKey: true,
        ),
        StandardComponent(
          'Scaffold',
          <ComponentParam>[
            ComponentParam('Widget', 'body', true),
            ComponentParam('${Constants.prefix}AppBar', 'appBar', false,
                assignPrefix: 'appBar != null ? ',
                assignSuffix: '!.get() : null'),
            ComponentParam('Widget', 'floatingActionButton', false),
            ComponentParam('BottomNavigationBar', 'bottomNavigationBar', false),
          ],
          namedBuilders: <String>['get'],
          originalMaterial: 'Scaffold',
          hasKey: true,
        ),
        SpecialComponent(
          'ThemeData',
          <ComponentParam>[
            ComponentParam('Brightness', 'brightness', false),
            ComponentParam('MaterialColor', 'primarySwatch', false),
            ComponentParam('VisualDensity', 'visualDensity', false),
          ],
          originalMaterial: 'ThemeData',
        ),
        FakeComponent('DialogAction', realName: 'ElevatedButton'),
        FakeComponent('ThemeData'),
      ];

  List<FunctionDefinition> getFunctionList() => <FunctionDefinition>[
        FunctionDefinition(
          'show${Constants.prefix}Dialog',
          'Future<T?>',
          <FunctionParam>[
            FunctionParam('BuildContext', 'context',
                isNamed: true, isRequired: true),
            FunctionParam('Widget Function(BuildContext)', 'builder',
                isNamed: true, isRequired: true),
          ],
          originalMaterial: 'showDialog',
          templateNameList: <String>['T'],
        ),
        FunctionDefinition(
          'run${Constants.prefix}App',
          'void',
          <FunctionParam>[
            FunctionParam('SuperApp Function()', 'appProvider',
                isNamed: false, isRequired: false),
            FunctionParam('SuperControllerBase', 'superController',
                isRequired: false, isNamed: false)
          ],
          originalMaterial: 'runApp',
          noSuperComponent: true,
        ),
      ];
}
