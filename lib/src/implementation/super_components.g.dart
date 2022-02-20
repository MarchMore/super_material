import 'package:flutter/material.dart';
import 'package:super_material/src/implementation/cupertino_components.dart'
    as cupertino_components;
import 'package:super_material/src/general/common.dart';
import 'package:super_material/src/implementation/material_components.g.dart'
    as material_components;
import 'package:super_material/src/export_helper/material_interface.g.dart'
    as material_components;

class ModifiableList<T> {
  List<T> _values = <T>[];
  ModifiableList(List<T> values) {
    _values = values.toList();
  }
  List<T> get() => _values;
}

class SuperMaterialIconButton extends StatelessWidget {
  final Widget icon;
  final void Function()? onPressed;
  final String? tooltip;
  const SuperMaterialIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.tooltip,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (SuperControllerBase.modeGetter == SuperMaterialMode.material) {
      return material_components.SuperMaterialIconButton(
        key: key,
        icon: icon,
        onPressed: onPressed,
        tooltip: tooltip,
      );
    } else if (SuperControllerBase.modeGetter == SuperMaterialMode.cupertino) {
      return cupertino_components.SuperMaterialIconButton(
        key: key,
        icon: icon,
        onPressed: onPressed,
        tooltip: tooltip,
      );
    } else {
      throw UnimplementedError();
    }
  }
}

class SuperMaterialListTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Text? subtitle;
  final void Function()? onTap;
  final Widget? trailing;
  const SuperMaterialListTile({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.onTap,
    this.trailing,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (SuperControllerBase.modeGetter == SuperMaterialMode.material) {
      return material_components.SuperMaterialListTile(
        key: key,
        leading: leading,
        title: title,
        subtitle: subtitle,
        onTap: onTap,
        trailing: trailing,
      );
    } else if (SuperControllerBase.modeGetter == SuperMaterialMode.cupertino) {
      return cupertino_components.SuperMaterialListTile(
        key: key,
        leading: leading,
        title: title,
        subtitle: subtitle,
        onTap: onTap,
        trailing: trailing,
      );
    } else {
      throw UnimplementedError();
    }
  }
}

class SuperMaterialCheckboxListTile extends StatelessWidget {
  final Widget? title;
  final Text? subtitle;
  final void Function(bool?)? onChanged;
  final bool? value;
  const SuperMaterialCheckboxListTile({
    Key? key,
    this.title,
    this.subtitle,
    this.onChanged,
    this.value,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (SuperControllerBase.modeGetter == SuperMaterialMode.material) {
      return material_components.SuperMaterialCheckboxListTile(
        key: key,
        title: title,
        subtitle: subtitle,
        onChanged: onChanged,
        value: value,
      );
    } else if (SuperControllerBase.modeGetter == SuperMaterialMode.cupertino) {
      return cupertino_components.SuperMaterialCheckboxListTile(
        key: key,
        title: title,
        subtitle: subtitle,
        onChanged: onChanged,
        value: value,
      );
    } else {
      throw UnimplementedError();
    }
  }
}

class SuperMaterialTextField extends StatelessWidget {
  final TextEditingController? controller;
  final InputDecoration? decoration;
  final int? maxLines;
  final bool obscureText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final bool? enabled;
  const SuperMaterialTextField({
    Key? key,
    this.controller,
    this.decoration,
    this.maxLines = 1,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
    this.enabled,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (SuperControllerBase.modeGetter == SuperMaterialMode.material) {
      return material_components.SuperMaterialTextField(
        key: key,
        controller: controller,
        decoration: decoration,
        maxLines: maxLines,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        enabled: enabled,
      );
    } else if (SuperControllerBase.modeGetter == SuperMaterialMode.cupertino) {
      return cupertino_components.SuperMaterialTextField(
        key: key,
        controller: controller,
        decoration: decoration,
        maxLines: maxLines,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        enabled: enabled,
      );
    } else {
      throw UnimplementedError();
    }
  }
}

class SuperMaterialElevatedButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  const SuperMaterialElevatedButton({
    Key? key,
    required this.child,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (SuperControllerBase.modeGetter == SuperMaterialMode.material) {
      return material_components.SuperMaterialElevatedButton(
        key: key,
        child: child,
        onPressed: onPressed,
      );
    } else if (SuperControllerBase.modeGetter == SuperMaterialMode.cupertino) {
      return cupertino_components.SuperMaterialElevatedButton(
        key: key,
        child: child,
        onPressed: onPressed,
      );
    } else {
      throw UnimplementedError();
    }
  }
}

class SuperMaterialAlertDialog extends StatelessWidget {
  final Widget? content;
  final Widget? title;
  final List<Widget>? actions;
  const SuperMaterialAlertDialog({
    Key? key,
    this.content,
    this.title,
    this.actions,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (SuperControllerBase.modeGetter == SuperMaterialMode.material) {
      return material_components.SuperMaterialAlertDialog(
        key: key,
        content: content,
        title: title,
        actions: actions,
      );
    } else if (SuperControllerBase.modeGetter == SuperMaterialMode.cupertino) {
      return cupertino_components.SuperMaterialAlertDialog(
        key: key,
        content: content,
        title: title,
        actions: actions,
      );
    } else {
      throw UnimplementedError();
    }
  }
}

class SuperMaterialDialogAction extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final bool? isDestructiveAction;
  const SuperMaterialDialogAction({
    Key? key,
    required this.child,
    this.onPressed,
    this.isDestructiveAction = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (SuperControllerBase.modeGetter == SuperMaterialMode.material) {
      return material_components.SuperMaterialDialogAction(
        key: key,
        child: child,
        onPressed: onPressed,
        isDestructiveAction: isDestructiveAction,
      );
    } else if (SuperControllerBase.modeGetter == SuperMaterialMode.cupertino) {
      return cupertino_components.SuperMaterialDialogAction(
        key: key,
        child: child,
        onPressed: onPressed,
        isDestructiveAction: isDestructiveAction,
      );
    } else {
      throw UnimplementedError();
    }
  }
}

class SuperMaterialCircularProgressIndicator extends StatelessWidget {
  const SuperMaterialCircularProgressIndicator({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (SuperControllerBase.modeGetter == SuperMaterialMode.material) {
      return material_components.SuperMaterialCircularProgressIndicator(
        key: key,
      );
    } else if (SuperControllerBase.modeGetter == SuperMaterialMode.cupertino) {
      return cupertino_components.SuperMaterialCircularProgressIndicator(
        key: key,
      );
    } else {
      throw UnimplementedError();
    }
  }
}

class SuperMaterialCard extends StatelessWidget {
  final Widget? child;
  final Color? color;
  const SuperMaterialCard({
    Key? key,
    this.child,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (SuperControllerBase.modeGetter == SuperMaterialMode.material) {
      return material_components.SuperMaterialCard(
        key: key,
        child: child,
        color: color,
      );
    } else if (SuperControllerBase.modeGetter == SuperMaterialMode.cupertino) {
      return cupertino_components.SuperMaterialCard(
        key: key,
        child: child,
        color: color,
      );
    } else {
      throw UnimplementedError();
    }
  }
}

class SuperMaterialIcon extends StatelessWidget {
  final IconData? icon;
  final double? size;
  const SuperMaterialIcon(
    this.icon, {
    Key? key,
    this.size,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (SuperControllerBase.modeGetter == SuperMaterialMode.material) {
      return material_components.SuperMaterialIcon(
        icon,
        key: key,
        size: size,
      );
    } else if (SuperControllerBase.modeGetter == SuperMaterialMode.cupertino) {
      return cupertino_components.SuperMaterialIcon(
        icon,
        key: key,
        size: size,
      );
    } else {
      throw UnimplementedError();
    }
  }
}

class SuperMaterialAppBar extends StatelessWidget {
  final List<Widget>? actions;
  final Widget? title;
  final Widget? leading;
  SuperMaterialAppBar({
    Key? key,
    this.actions,
    this.title,
    this.leading,
  }) : super(key: key ?? UniqueKey());
  dynamic get() {
    if (SuperControllerBase.modeGetter == SuperMaterialMode.material) {
      return material_components.SuperMaterialAppBar(
        key: key,
        actions: ModifiableList<Widget>(actions ?? <Widget>[]).get(),
        title: title,
        leading: leading,
      );
    } else if (SuperControllerBase.modeGetter == SuperMaterialMode.cupertino) {
      return cupertino_components.SuperMaterialAppBar(
        key: key,
        actions: ModifiableList<Widget>(actions ?? <Widget>[]).get(),
        title: title,
        leading: leading,
        emptyAction: ModifiableList<Widget>(<Widget>[]).get(),
      );
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (SuperControllerBase.modeGetter == SuperMaterialMode.material) {
      return material_components.SuperMaterialAppBar(
        key: key,
        actions: ModifiableList<Widget>(actions ?? <Widget>[]).get(),
        title: title,
        leading: leading,
      );
    } else if (SuperControllerBase.modeGetter == SuperMaterialMode.cupertino) {
      return cupertino_components.SuperMaterialAppBar(
        key: key,
        actions: ModifiableList<Widget>(actions ?? <Widget>[]).get(),
        title: title,
        leading: leading,
        emptyAction: ModifiableList<Widget>(<Widget>[]).get(),
      );
    } else {
      throw UnimplementedError();
    }
  }
}

class SuperMaterialApp extends StatelessWidget {
  final Widget home;
  final String title;
  final SuperMaterialThemeData? theme;
  final dynamic darkTheme;
  final ThemeMode? themeMode;
  final bool debugShowCheckedModeBanner;
  const SuperMaterialApp({
    Key? key,
    required this.home,
    this.title = '',
    this.theme,
    this.darkTheme,
    this.themeMode,
    this.debugShowCheckedModeBanner = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (SuperControllerBase.modeGetter == SuperMaterialMode.material) {
      return material_components.SuperMaterialApp(
        key: key,
        home: home,
        title: title,
        theme: theme == null ? null : theme!.get(),
        darkTheme: darkTheme == null ? null : darkTheme!.get(),
        themeMode: themeMode,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      );
    } else if (SuperControllerBase.modeGetter == SuperMaterialMode.cupertino) {
      return cupertino_components.SuperMaterialApp(
        key: key,
        home: home,
        title: title,
        theme: theme == null ? null : theme!.get(),
        darkTheme: darkTheme == null ? null : darkTheme!.get(),
        themeMode: themeMode,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      );
    } else {
      throw UnimplementedError();
    }
  }
}

class SuperMaterialScaffold extends StatelessWidget {
  final Widget body;
  final SuperMaterialAppBar? appBar;
  final Widget? floatingActionButton;
  final BottomNavigationBar? bottomNavigationBar;
  const SuperMaterialScaffold({
    Key? key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
  }) : super(key: key);
  dynamic get() {
    if (SuperControllerBase.modeGetter == SuperMaterialMode.material) {
      return material_components.SuperMaterialScaffold(
        key: key,
        body: body,
        appBar: appBar != null ? appBar!.get() : null,
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
      );
    } else if (SuperControllerBase.modeGetter == SuperMaterialMode.cupertino) {
      return cupertino_components.SuperMaterialScaffold(
        key: key,
        body: body,
        appBar: appBar != null ? appBar!.get() : null,
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
      );
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (SuperControllerBase.modeGetter == SuperMaterialMode.material) {
      return material_components.SuperMaterialScaffold(
        key: key,
        body: body,
        appBar: appBar != null ? appBar!.get() : null,
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
      );
    } else if (SuperControllerBase.modeGetter == SuperMaterialMode.cupertino) {
      return cupertino_components.SuperMaterialScaffold(
        key: key,
        body: body,
        appBar: appBar != null ? appBar!.get() : null,
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
      );
    } else {
      throw UnimplementedError();
    }
  }
}

abstract class SuperMaterialThemeData {
  dynamic get();
  SuperMaterialThemeData.standard();
  factory SuperMaterialThemeData({
    Brightness? brightness,
    MaterialColor? primarySwatch,
    VisualDensity? visualDensity,
  }) {
    if (SuperControllerBase.modeGetter == SuperMaterialMode.material) {
      return material_components.SuperMaterialThemeData(
        brightness: brightness,
        primarySwatch: primarySwatch,
        visualDensity: visualDensity,
      );
    } else if (SuperControllerBase.modeGetter == SuperMaterialMode.cupertino) {
      return cupertino_components.SuperMaterialThemeData(
        brightness: brightness,
        primarySwatch: primarySwatch,
        visualDensity: visualDensity,
      );
    } else {
      throw UnimplementedError();
    }
  }
}

Future<T?> showSuperMaterialDialog<T>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
}) {
  if (SuperControllerBase.modeGetter == SuperMaterialMode.material) {
    return material_components.showSuperMaterialDialog(
      context: context,
      builder: builder,
    );
  } else if (SuperControllerBase.modeGetter == SuperMaterialMode.cupertino) {
    return cupertino_components.showSuperMaterialDialog(
      context: context,
      builder: builder,
    );
  } else {
    throw UnimplementedError();
  }
}
