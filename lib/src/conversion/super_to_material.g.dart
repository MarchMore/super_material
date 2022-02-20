import 'package:flutter/material.dart';
import 'package:super_material/src/general/common.dart';
import 'package:super_material/src/implementation/super_components.g.dart';
import 'package:super_material/src/general/super_app.dart';
import 'package:super_material/src/implementation/function_override.dart';

typedef IconButton = SuperMaterialIconButton;
typedef ListTile = SuperMaterialListTile;
typedef CheckboxListTile = SuperMaterialCheckboxListTile;
typedef TextField = SuperMaterialTextField;
typedef ElevatedButton = SuperMaterialElevatedButton;
typedef AlertDialog = SuperMaterialAlertDialog;
typedef CircularProgressIndicator = SuperMaterialCircularProgressIndicator;
typedef Card = SuperMaterialCard;
typedef Icon = SuperMaterialIcon;
typedef AppBar = SuperMaterialAppBar;
typedef MaterialApp = SuperMaterialApp;
typedef Scaffold = SuperMaterialScaffold;
typedef ThemeData = SuperMaterialThemeData;
Future<T?> showDialog<T>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
}) =>
    showSuperMaterialDialog(
      context: context,
      builder: builder,
    );
void runApp(
  SuperApp Function() appProvider,
  SuperControllerBase superController,
) =>
    runSuperMaterialApp(
      appProvider,
      superController,
    );
