import 'package:super_material/src/general/super_app.dart';

enum SuperMaterialMode {
  unknown,
  material,
  cupertino,
}

abstract class SuperControllerBase {
  final SuperMaterialMode? initialMode;

  const SuperControllerBase(this.initialMode);

  static get modeGetter => SuperInstance.getDefault();

  SuperMaterialMode getStandardMode();
}
