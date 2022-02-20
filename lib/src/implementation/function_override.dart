import 'package:flutter/material.dart';
import 'package:super_material/src/general/common.dart';
import 'package:super_material/src/general/super_app.dart';

void runSuperMaterialApp(
        SuperApp Function() appProvider, SuperControllerBase superController) =>
    runApp(
      SuperInstance(
        appProvider,
        superController,
      ),
    );
