**super_material** provides component wrappers and useful interfaces to convert existing flutter
applications into applications that can switch the design at runtime.

That means your app can be represented in different designs, but just one codebase.

## Supported components

### Widgets
The package supports basic widgets like **MaterialApp**, **Scaffold**, **AppBar**, **ElevatedButton**, **TextField**, **ListTile**.

### Functions
Also functions are supported: e.g. **showDialog**

## Provided interfaces:
### Standard
* **super_material:** Provides the super material component wrappers. Able to change design at runtime.
* **material_only:** Same as super_material, but enforces material design. (Unofficial)
* **cupertino_only:** Same as super_material, but enforces cupertino design. (Unofficial)

### Overlay
* **super_material_overlay:** Provides the super material components, but with same name as the real material components. Able to change design at runtime.
* **material_only_overlay:** Same as super_material_overlay, but enforces material design. (Unofficial)
* **cupertino_only_overlay:** Same as super_material_overlay, but enforces cupertino design. (Unofficial)

**Unofficial**: Not provided as official interface. Located at *'package:super_material/src/api/'*

## Getting started

* Add package to your application
* Modify **runApp** and your main app class, to enable the (runtime) design switch feature.
* Replace **material** imports with **super_material** imports
* Replace components/functions (Non-overlay only)

## Usage

### Standard interface

```dart
import 'package:super_material/super_material.dart';

void main() {
  runSuperMaterialApp(ExampleApp.getApp, const SuperController());
}

class ExampleApp extends SuperApp {
  ExampleApp({Key? key}) : super(key: key);

  static ExampleApp getApp() => ExampleApp();

  @override
  Widget build(BuildContext context) => SuperMaterialApp(
    theme: SuperMaterialThemeData(),
    home: const MainPage(),
  );
}
```

### Overlay interface

```dart
import 'package:super_material/super_material_overlay.dart';

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
  );
}
```

### !!! Important note !!!

Use **devMode** during app development. This ensures that the **hot reload** feature works. Otherwise **hot reload** will restart your app all the time.

```dart
class ExampleApp extends SuperApp {
  ExampleApp({Key? key}) : super(key: key, devMode: true);

  ...
```

### Design

With **SuperInstance.restartApp**, the design get switched. This leads to a complete new build trigger of the whole app widget.

#### Switch action
```dart
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
```

#### Default design

The **SuperController** can take a parameter to specify the default design.

```dart
void main() {
  runApp(ExampleApp.getApp, const SuperController(SuperMaterialMode.cupertino));
}
```

## Additional information

Currently just a few widgets and functions are implemented. Please request needed widgets/parameters/function by creating an issue on GitHub.

Or feel free to extend the components by yourself and create a pull request.

## Extending the package

* Adjust the **code_generation/configuration.dart** file
* Run **code_generation/main.dart** script
* Implement component at **implementation/...** folder

Detailed information on how to extending the package coming soon ...

## Tasks and future goals

* Add more widgets, functions and their parameters
* Add more designs (Including a desktop like design)
* More focus on usability
* More focus on performance