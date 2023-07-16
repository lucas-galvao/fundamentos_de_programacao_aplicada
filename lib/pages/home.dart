import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fundamentos_de_programacao_aplicada/pages/dataset.dart';
import 'package:fundamentos_de_programacao_aplicada/pages/history.dart';
import 'package:fundamentos_de_programacao_aplicada/pages/about.dart';
import 'package:fundamentos_de_programacao_aplicada/classes/model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Center(
          child: logo,
          //const Text('Neural Network Designer'),
        ),
        backgroundColor: Colors.black,
        toolbarHeight: 60,
      ),
      body: Column(
        children: [
          titleSection,
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: raisedButtonStyle,
                  child: const Text('Start', style: TextStyle(fontSize: 30)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dataset()));
                  },
                )
              ],
            ),
            const SizedBox(height: 50),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: raisedButtonStyle,
                  child: const Text('Model History',
                      style: TextStyle(fontSize: 30)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => History()));
                  },
                )
              ],
            ),
            const SizedBox(height: 50),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: raisedButtonStyle,
                  child: const Text('About', style: TextStyle(fontSize: 30)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => About()));
                  },
                )
              ],
            ),
            const SizedBox(height: 50),
          ])
        ],
      ),
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.white,
  backgroundColor: Colors.teal,
  minimumSize: const Size(250, 80),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(50)),
  ),
);

Widget titleSection = Container(
  padding: const EdgeInsets.symmetric(vertical: 50.0),
  child: Row(
    children: [
      Expanded(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Center(
                child: const Text(
                  'Neural Network Designer',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);
