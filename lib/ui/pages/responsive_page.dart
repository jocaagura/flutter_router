import 'package:flutter/material.dart';
import 'package:flutter_router/navigator/my_navigator.dart';
import 'package:flutter_router/ui/pages/queries_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Responsive');
    return Scaffold(
      appBar: AppBar(),
        body: const Center(child: Text('Responsive')),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                Provider.of<MyNavigator>(context, listen: false).goToRoute(context, '/');
              },
              child: const Icon(Icons.arrow_back_ios),
            ),
            const SizedBox(
              height: 10.0,
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {

                Provider.of<MyNavigator>(context, listen: false).goToRoute(context, '/queries');
              },
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ));
  }
}
