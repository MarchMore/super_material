import 'package:super_material/super_material_overlay.dart';
import 'package:example/super_material.dart';
import 'package:example/super_material_overlay.dart';

void main() {
  runApp(ExampleApp.getApp, const SuperController());
}

class ExampleApp extends SuperApp {
  ExampleApp({Key? key}) : super(key: key);

  static ExampleApp getApp() => ExampleApp();

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(),
        home: const MainPage(),
        debugShowCheckedModeBanner: false,
      );
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
          children: <ListTile>[
            ListTile(
              title: const Text('Switch to material'),
              subtitle: const Text('Tap to switch ...'),
              onTap: () => SuperInstance.restartApp(SuperMaterialMode.material),
            ),
            ListTile(
              title: const Text('Switch to cupertino'),
              subtitle: const Text('Tap to switch ...'),
              onTap: () =>
                  SuperInstance.restartApp(SuperMaterialMode.cupertino),
            ),
            ListTile(
              title: const Text('SuperMaterial components'),
              subtitle: const Text('Tap to see example ...'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<SuperMaterialExample>(
                  builder: (BuildContext context) =>
                      const SuperMaterialExample(),
                ),
              ),
            ),
            ListTile(
              title: const Text('SuperMaterial overlay components'),
              subtitle: const Text('Tap to see example ...'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<SuperMaterialOverlayExample>(
                  builder: (BuildContext context) =>
                      const SuperMaterialOverlayExample(),
                ),
              ),
            ),
          ],
        ),
      );
}
