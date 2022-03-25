import 'package:flutter/material.dart';
import 'package:super_material/src/general/common.dart';

class SuperApp extends StatelessWidget {
  SuperApp({
    Key? key,
    bool devMode = false,
  }) : super(
          key: key ?? (devMode ? null : UniqueKey()),
        );

  @override
  Widget build(BuildContext context) => throw UnimplementedError();
}

class SuperInstance extends StatefulWidget {
  static Function? _restartApp;
  final SuperApp Function() _appProvider;
  final SuperControllerBase _superController;

  SuperInstance(
    this._appProvider,
    this._superController, {
    Key? key,
  }) : super(key: key) {
    _SuperInstanceState._standardMode = _superController.getStandardMode();

    if (_SuperInstanceState._standardMode != SuperMaterialMode.unknown) {
      _SuperInstanceState._mode = _SuperInstanceState._standardMode;
    } else {
      _SuperInstanceState._mode =
          _superController.initialMode ?? SuperMaterialMode.material;
    }

    if (_SuperInstanceState._mode == SuperMaterialMode.unknown) {
      throw Exception('SuperMaterial mode is not set!');
    }
  }

  static void restartApp(SuperMaterialMode superMaterialMode) {
    if (_SuperInstanceState._standardMode == SuperMaterialMode.unknown) {
      _SuperInstanceState._mode = superMaterialMode;
    }

    if (_restartApp != null) {
      _restartApp!();
    }
  }

  static SuperMaterialMode getDefault() => _SuperInstanceState._mode;

  @override
  State<StatefulWidget> createState() => _SuperInstanceState();
}

class _SuperInstanceState extends State<SuperInstance> {
  static SuperMaterialMode _mode = SuperMaterialMode.unknown;
  static SuperMaterialMode _standardMode = SuperMaterialMode.unknown;

  void _restartApp() {
    setState(() {});
  }

  @override
  void initState() {
    SuperInstance._restartApp = _restartApp;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget._appProvider();
}
