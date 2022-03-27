import 'package:flutter/material.dart';
import 'package:flutter_router/navigator/my_navigator.dart';
import 'package:provider/provider.dart';

class SegmentsPage extends StatelessWidget {
  const SegmentsPage({Key? key, required this.segment, required this.value})
      : super(key: key);

  final String segment, value;

  @override
  Widget build(BuildContext context) {
    final myNavigator = Provider.of<MyNavigator>(context);
    return Scaffold(
      body: Center(child: Text('Segments:\n$segment : $value')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myNavigator.pop();
        },
        child: const Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
