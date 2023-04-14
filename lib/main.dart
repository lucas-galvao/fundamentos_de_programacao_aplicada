import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neural Network Designer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        /*
        appBar: AppBar(
          title: Center(
            child: const Text('Neural Network Designer'),
          ),
        ),
      */
        body: Column(
          children: [
            Image.asset(
              'images/Cover.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
          ],
        ),
      ),
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.white,
  backgroundColor: Colors.blueGrey,
  minimumSize: Size(135, 43),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

Column _buildButtonColumn(String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        style: raisedButtonStyle,
        child: Text(label, style: TextStyle(fontSize: 20)),
        onPressed: () {},
      )
    ],
  );
}

Color color = Colors.blueGrey;

Widget buttonSection = Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    _buildButtonColumn('Cifar'),
    const SizedBox(height: 10),
    _buildButtonColumn('Mnist'),
    const SizedBox(height: 10),
    _buildButtonColumn('Kmnist'),
    const SizedBox(height: 10),
    _buildButtonColumn('Eurosat'),
  ],
);

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                'Select the Dataset',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);
