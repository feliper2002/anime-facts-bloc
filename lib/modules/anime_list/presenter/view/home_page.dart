import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await Modular.to.pushNamed('/anime');
              },
              child: const Text('BLoC Page'),
            ),
            ElevatedButton(
              onPressed: () async {
                await Modular.to.pushNamed('/anime-cubit');
              },
              child: const Text('Cubit Page'),
            ),
          ],
        ),
      ),
    );
  }
}
