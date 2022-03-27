import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../navigator/my_navigator.dart';

class QueriesPage extends StatelessWidget {
  const QueriesPage({Key? key, this.queries, this.value}) : super(key: key);

  final String? queries, value;

  @override
  Widget build(BuildContext context) {
    final myNavigator = Provider.of<MyNavigator>(context);
    return Scaffold(
      body: Center(child: Text('Queries segments:\n$queries : $value')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myNavigator.pop();
        },
        child: const Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
