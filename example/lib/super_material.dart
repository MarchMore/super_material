import 'package:super_material/super_material.dart';

class SuperMaterialExample extends StatefulWidget {
  const SuperMaterialExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SuperMaterialExampleState();
}

class _SuperMaterialExampleState extends State<SuperMaterialExample> {
  int _currentIndex = 0;
  bool _testValue1 = false;

  @override
  Widget build(BuildContext context) => SuperMaterialScaffold(
        appBar: SuperMaterialAppBar(
          title: const Text('Example'),
          actions: <Widget>[
            SuperMaterialIconButton(
              icon: const SuperMaterialIcon(Icons.refresh),
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
                SuperMaterialElevatedButton(
                  child: Row(
                    children: <Widget>[
                      const SuperMaterialIcon(Icons.message),
                      Container(width: 20),
                      const Text('Dialog'),
                    ],
                  ),
                  onPressed: () {
                    showSuperMaterialDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          SuperMaterialAlertDialog(
                        title: const Text('Title'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            SuperMaterialIcon(Icons.clear),
                            Text('Example content ...'),
                          ],
                        ),
                        actions: <Widget>[
                          SuperMaterialDialogAction(
                            child: const Text('Action 1'),
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
                SuperMaterialIconButton(
                  icon: const SuperMaterialIcon(Icons.sort),
                  onPressed: () {},
                ),
              ],
            ),
            const Text('Icons:'),
            Row(
              children: const <SuperMaterialIcon>[
                SuperMaterialIcon(Icons.settings),
                SuperMaterialIcon(Icons.delete),
                SuperMaterialIcon(Icons.person_add),
                SuperMaterialIcon(Icons.done),
                SuperMaterialIcon(Icons.send),
                SuperMaterialIcon(Icons.arrow_back),
              ],
            ),
            const Text('ListTiles:'),
            SuperMaterialListTile(
              title: const Text('Title'),
              subtitle: const Text('Sub'),
              trailing: const SuperMaterialIcon(Icons.person),
              onTap: () {},
            ),
            SuperMaterialCheckboxListTile(
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
            const SuperMaterialCard(
              child: Text('Card content ...'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const SuperMaterialIcon(Icons.person),
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
              icon: SuperMaterialIcon(Icons.person),
              label: 'Item 1',
            ),
            BottomNavigationBarItem(
              icon: SuperMaterialIcon(Icons.clear),
              label: 'Item 2',
            ),
          ],
        ),
      );
}
