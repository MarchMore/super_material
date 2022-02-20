import 'package:super_material/src/general/common.dart';

class SuperController extends SuperControllerBase {
  const SuperController([SuperMaterialMode? initialMode]) : super(initialMode);
  @override
  SuperMaterialMode getStandardMode() => SuperMaterialMode.material;
}
