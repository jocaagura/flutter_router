import 'package:flutter/material.dart';

class SegmentsPage extends StatelessWidget {
  const SegmentsPage({Key? key, required this.segment, required this.value})
      : super(key: key);

  final String segment, value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Segments:\n$segment : $value')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
