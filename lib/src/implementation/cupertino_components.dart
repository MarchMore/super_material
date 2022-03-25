import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:super_material/src/implementation/super_components.g.dart'
    as super_components;

class Constants {
  static const Color borderGrey = Color.fromRGBO(127, 127, 127, 0.5);
}

class SuperMaterialApp extends CupertinoApp {
  const SuperMaterialApp({
    Key? key,
    ThemeMode? themeMode,
    Diagnosticable? theme,
    Diagnosticable? darkTheme,
    required Widget home,
    String title = '',
    bool debugShowCheckedModeBanner = true,
  }) : super(
          title: title,
          key: key,
          home: home,
          theme: (themeMode == ThemeMode.light && theme != null) ||
                  (darkTheme == null)
              ? theme as CupertinoThemeData
              : darkTheme as CupertinoThemeData,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        );
}

class SuperMaterialAppBar extends CupertinoNavigationBar {
  final List<Widget>? actions;
  final Widget? title;
  final List<Widget> emptyAction;

  SuperMaterialAppBar(
      {Key? key,
      this.title,
      this.actions,
      Widget? leading,
      required this.emptyAction})
      : super(
            key: key,
            middle: title,
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: emptyAction,
              mainAxisSize: MainAxisSize.min,
            ),
            leading: leading);
}

class SuperMaterialTextField extends CupertinoTextField {
  SuperMaterialTextField({
    Key? key,
    InputDecoration? decoration,
    TextEditingController? controller,
    int? maxLines = 1,
    bool obscureText = false,
    void Function(String)? onChanged,
    TextInputType? keyboardType,
    bool? enabled,
  }) : super(
          key: key,
          controller: controller,
          maxLines: maxLines,
          obscureText: obscureText,
          placeholder: decoration!.hintText ?? (decoration.labelText),
          onChanged: onChanged,
          enabled: enabled,
          keyboardType: keyboardType,
        );
}

class SuperMaterialAlertDialog extends CupertinoAlertDialog {
  SuperMaterialAlertDialog(
      {Key? key, Widget? content, Widget? title, List<Widget>? actions})
      : super(key: key, content: content!, title: title, actions: actions!);
}

class SuperMaterialDialogAction extends CupertinoDialogAction {
  SuperMaterialDialogAction(
      {Key? key,
      Widget? child,
      void Function()? onPressed,
      bool? isDestructiveAction = false})
      : super(
          child: child!,
          onPressed: onPressed,
          key: key,
          isDestructiveAction: isDestructiveAction!,
        );
}

class SuperMaterialListTile extends Container {
  SuperMaterialListTile({
    Key? key,
    Widget? leading,
    Widget? title,
    Text? subtitle,
    void Function()? onTap,
    Widget? trailing,
  }) : super(
          key: key,
          decoration: BoxDecoration(
            border: Border.all(color: Constants.borderGrey),
            borderRadius: BorderRadius.circular(7),
          ),
          child: SuperMaterialElevatedButton(
            onPressed: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Visibility(
                  visible: leading != null,
                  child: leading ?? Container(),
                ),
                Container(
                  width: 15,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    title!,
                    Visibility(
                      visible: subtitle != null,
                      child: Text(
                        subtitle != null ? subtitle.data! : '',
                        style: const TextStyle(
                            color: Colors.grey, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: trailing != null,
                  child: trailing ?? Container(),
                ),
              ],
            ),
          ),
        );
}

class SuperMaterialCheckboxListTile extends Container {
  final Widget? title;
  final Text? subtitle;
  final void Function(bool?)? onChanged;
  final bool? value;

  SuperMaterialCheckboxListTile(
      {Key? key, this.title, this.subtitle, this.onChanged, this.value})
      : super(
          key: key,
          decoration: BoxDecoration(
            border: Border.all(color: Constants.borderGrey),
            borderRadius: BorderRadius.circular(7),
          ),
          child: SuperMaterialElevatedButton(
            onPressed: null,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  width: 15,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    title!,
                    Visibility(
                      visible: subtitle != null,
                      child: Text(
                        subtitle != null ? subtitle.data! : '',
                        style: const TextStyle(
                            color: Colors.grey, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
                CupertinoSwitch(value: value ?? false, onChanged: onChanged),
              ],
            ),
          ),
        );
}

class SuperMaterialIconButton extends SuperMaterialElevatedButton {
  SuperMaterialIconButton(
      {Key? key,
      required Widget icon,
      void Function()? onPressed,
      String? tooltip})
      : super(
            key: key,
            child: tooltip == null
                ? icon
                : Tooltip(
                    message: tooltip,
                    child: icon,
                  ),
            onPressed: onPressed);
}

class SuperMaterialScaffold extends StatefulWidget {
  final ObstructingPreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final BottomNavigationBar? bottomNavigationBar;

  const SuperMaterialScaffold(
      {Key? key,
      this.appBar,
      required this.body,
      this.floatingActionButton,
      this.bottomNavigationBar})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SuperMaterialScaffoldState();
}

class _SuperMaterialScaffoldState extends State<SuperMaterialScaffold> {
  @override
  Widget build(BuildContext context) {
    if (widget.bottomNavigationBar == null) {
      return _SuperMaterialPageScaffold(
        appBar: widget.appBar,
        body: widget.body,
        floatingActionButton: widget.floatingActionButton,
      );
    } else {
      return _SuperMaterialTabScaffold(
        appBar: widget.appBar,
        body: widget.body,
        floatingActionButton: widget.floatingActionButton,
        bottomNavigationBar: widget.bottomNavigationBar,
      );
    }
  }
}

class _SuperMaterialPageScaffold extends CupertinoPageScaffold {
  _SuperMaterialPageScaffold({
    ObstructingPreferredSizeWidget? appBar,
    required Widget body,
    Widget? floatingActionButton,
  }) : super(navigationBar: appBar, child: body) {
    if (appBar is SuperMaterialAppBar) {
      if (appBar.actions != null) {
        appBar.emptyAction.clear();
        appBar.emptyAction.addAll(appBar.actions!);
      }
    }

    if (floatingActionButton is FloatingActionButton &&
        appBar is SuperMaterialAppBar) {
      appBar.emptyAction.add(SuperMaterialIconButton(
        icon: floatingActionButton.child!,
        onPressed: floatingActionButton.onPressed,
        tooltip: floatingActionButton.tooltip,
      ));
    }
  }
}

class _SuperMaterialTabScaffold extends StatefulWidget {
  final ObstructingPreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final BottomNavigationBar? bottomNavigationBar;

  const _SuperMaterialTabScaffold(
      {this.appBar,
      required this.body,
      this.floatingActionButton,
      this.bottomNavigationBar});

  @override
  State<StatefulWidget> createState() => _SuperMaterialTabScaffoldState();
}

class _SuperMaterialTabScaffoldState extends State<_SuperMaterialTabScaffold> {
  @override
  Widget build(BuildContext context) => CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          currentIndex: widget.bottomNavigationBar!.currentIndex,
          items: widget.bottomNavigationBar!.items,
          onTap: (int index) {
            widget.bottomNavigationBar!.onTap!(index);
          },
        ),
        tabBuilder: (BuildContext buildContext, int index) =>
            _SuperMaterialPageScaffold(
          body: widget.body,
          floatingActionButton: widget.floatingActionButton,
          appBar: widget.appBar,
        ),
      );
}

Future<T?> showSuperMaterialDialog<T>(
        {Widget Function(BuildContext)? builder,
        required BuildContext context}) async =>
    showCupertinoDialog<T>(builder: builder!, context: context);

void runSuperMaterialApp(Widget app) => runApp(app);

class SuperMaterialCircularProgressIndicator
    extends CupertinoActivityIndicator {
  const SuperMaterialCircularProgressIndicator({Key? key}) : super(key: key);
}

class SuperMaterialElevatedButton extends CupertinoButton {
  const SuperMaterialElevatedButton(
      {Key? key, required Widget child, required void Function()? onPressed})
      : super(key: key, child: child, onPressed: onPressed);
}

class SuperMaterialThemeData extends super_components.SuperMaterialThemeData {
  late final Brightness? brightness;
  late final MaterialColor? primarySwatch;
  late final VisualDensity? visualDensity;

  SuperMaterialThemeData(
      {this.brightness, this.primarySwatch, this.visualDensity})
      : super.standard();

  @override
  CupertinoThemeData get() => CupertinoThemeData(
        brightness: brightness,
        primaryColor: primarySwatch,
        primaryContrastingColor: primarySwatch,
      );
}

class SuperMaterialCard extends Container {
  SuperMaterialCard({Key? key, Widget? child, Color? color})
      : super(
          key: key,
          child: child,
          decoration: BoxDecoration(
              color: color,
              border: Border.all(color: Constants.borderGrey),
              borderRadius: const BorderRadius.all(Radius.circular(7))),
          margin: const EdgeInsets.all(3),
          padding: const EdgeInsets.all(3),
        );
}

class SuperMaterialIcon extends Icon {
  static IconData? _getIconFromMap(IconData? icon) {
    if (icon == null) {
      return icon;
    }

    Map<IconData, IconData> _iconMap = <IconData, IconData>{
      Icons.arrow_back: CupertinoIcons.back,
      Icons.refresh: CupertinoIcons.refresh,
      Icons.send: CupertinoIcons.add_circled,
      Icons.settings: CupertinoIcons.settings,
      Icons.delete: CupertinoIcons.delete,
      Icons.delete_forever: CupertinoIcons.delete_solid,
      Icons.message: CupertinoIcons.conversation_bubble,
      Icons.person_add: CupertinoIcons.person_add,
      Icons.person: CupertinoIcons.person,
      Icons.done: CupertinoIcons.check_mark,
    };

    if (_iconMap.containsKey(icon)) {
      return _iconMap[icon];
    }

    return icon;
  }

  SuperMaterialIcon(IconData? icon, {Key? key, double? size})
      : super(
          _getIconFromMap(icon),
          key: key,
          size: size,
        );
}
