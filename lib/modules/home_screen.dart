import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Reorderable List',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ReorderableListView(
              physics: const BouncingScrollPhysics(),
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  updateMyIndex(oldIndex, newIndex);
                });
              },
              children: [
                for (var item in items)
                  Card(
                    key: ValueKey(item),
                    elevation: 7,
                    child: ListTile(
                      title: Text(item),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void updateMyIndex(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex--;
    }
    final String item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
  }
}
