import 'package:flutter/material.dart';

typedef SuperMaterialIconButton = IconButton;
typedef SuperMaterialListTile = ListTile;
typedef SuperMaterialCheckboxListTile = CheckboxListTile;
typedef SuperMaterialTextField = TextField;
typedef SuperMaterialElevatedButton = ElevatedButton;
typedef SuperMaterialAlertDialog = AlertDialog;
typedef SuperMaterialCircularProgressIndicator = CircularProgressIndicator;
typedef SuperMaterialCard = Card;
typedef SuperMaterialIcon = Icon;
typedef SuperMaterialAppBar = AppBar;
typedef SuperMaterialApp = MaterialApp;
typedef SuperMaterialScaffold = Scaffold;
typedef SuperMaterialThemeData = ThemeData;
Future<T?> showSuperMaterialDialog<T>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
}) =>
    showDialog(
      context: context,
      builder: builder,
    );
