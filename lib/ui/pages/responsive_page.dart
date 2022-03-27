import 'package:flutter/material.dart';

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('Responsive')),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: null,
              onPressed: () {},
              child: const Icon(Icons.arrow_back_ios),
            ),
            const SizedBox(
              height: 10.0,
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {},
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ));
  }
}
