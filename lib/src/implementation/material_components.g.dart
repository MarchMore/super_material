import 'package:flutter/material.dart';
import 'package:super_material/src/implementation/super_components.g.dart'
    as super_components;

class SuperMaterialDialogAction extends ElevatedButton {
  const SuperMaterialDialogAction({
    Key? key,
    required Widget child,
    void Function()? onPressed,
    bool? isDestructiveAction = false,
  }) : super(
          key: key,
          child: child,
          onPressed: onPressed,
        );
}

class SuperMaterialThemeData extends super_components.SuperMaterialThemeData {
  late final Brightness? brightness;
  late final MaterialColor? primarySwatch;
  late final VisualDensity? visualDensity;
  SuperMaterialThemeData({
    this.brightness,
    this.primarySwatch,
    this.visualDensity,
  }) : super.standard();
  @override
  get() => ThemeData(
        brightness: brightness,
        primarySwatch: primarySwatch,
        visualDensity: visualDensity,
      );
}
