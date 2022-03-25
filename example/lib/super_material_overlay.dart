import 'package:super_material/super_material_overlay.dart';

class SuperMaterialOverlayExample extends StatefulWidget {
  const SuperMaterialOverlayExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SuperMaterialOverlayExampleState();
}

class _SuperMaterialOverlayExampleState
    extends State<SuperMaterialOverlayExample> {
  int _currentIndex = 0;
  bool _testValue1 = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Example'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            const Text('Button:'),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.message),
                      Container(width: 20),
                      const Text('Dialog'),
                    ],
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Title'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Icon(Icons.clear),
                            Text('Example content ...'),
                          ],
                        ),
                        actions: <Widget>[
                          SuperMaterialDialogAction(
                            child: const Text('Action 1'),
                            isDestructiveAction: false,
                            onPressed: () => Navigator.pop(context),
                          ),
                          SuperMaterialDialogAction(
                            child: const Text('Action 2'),
                            isDestructiveAction: true,
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            const Text('Icon button:'),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.sort),
                  onPressed: () {},
                ),
              ],
            ),
            const Text('Icons:'),
            Row(
              children: const <Icon>[
                Icon(Icons.settings),
                Icon(Icons.delete),
                Icon(Icons.person_add),
                Icon(Icons.done),
                Icon(Icons.send),
                Icon(Icons.arrow_back),
              ],
            ),
            const Text('ListTiles:'),
            ListTile(
              title: const Text('Title'),
              subtitle: const Text('Sub'),
              trailing: const Icon(Icons.person),
              onTap: () {},
            ),
            CheckboxListTile(
              title: const Text('Title'),
              subtitle: const Text('Sub'),
              onChanged: (bool? value) {
                if (value == null) {
                  return;
                }

                setState(() {
                  _testValue1 = value;
                });
              },
              value: _testValue1,
            ),
            const Text('Card:'),
            const Card(
              child: Text('Card content ...'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.person),
          onPressed: () {},
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Item 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.clear),
              label: 'Item 2',
            ),
          ],
        ),
      );
}
