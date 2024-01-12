import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  static const name = 'home-screen';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Home Screen'),
            FilledButton(
              onPressed: () {},
              child: const Text('Presione aquí'),
            ),
          ],
        ),
      ),
    );
  }
}
