import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fundamentos_de_programacao_aplicada/pages/home.dart';
import 'package:fundamentos_de_programacao_aplicada/classes/logo.dart';
import 'package:fundamentos_de_programacao_aplicada/classes/model.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.modelInfo}) : super(key: key);

  final Model modelInfo;

  @override
  Widget build(BuildContext context) {
    final _random = new Random();
    modelInfo.accuracy =
        _random.nextDouble() * (modelInfo.ceil - modelInfo.floor) +
            modelInfo.floor;
    modelInfo.f1 = _random.nextDouble() * (modelInfo.ceil - modelInfo.floor) +
        modelInfo.floor;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [logo]
            //child: logo,
            //const Text('Neural Network Designer'),
            ),
        backgroundColor: Colors.black,
        toolbarHeight: 60,
      ),
      body: Column(
        children: [
          _titleSection('Accuracy', modelInfo.accuracy.toStringAsFixed(2)),
          _titleSection('F1 Score', modelInfo.f1.toStringAsFixed(2)),
          const SizedBox(height: 20),
          ElevatedButton(
            style: raisedButtonStyle(Colors.white, Colors.teal),
            child: const Text('Save Model', style: TextStyle(fontSize: 25)),
            onPressed: () {
              updateHistory(modelInfo);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Home()),
                  (Route<dynamic> route) => false);
            },
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: raisedButtonStyle(Colors.white, Colors.teal),
            child: const Text('Return to Home Screen',
                style: TextStyle(fontSize: 25)),
            onPressed: () {
              modelInfo.clearModel();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Home()),
                  (Route<dynamic> route) => false);
            },
          )
        ],
      ),
    );
  }
}

Future<String> getFilePath() async {
  Directory appDocumentsDirectory =
      await getApplicationDocumentsDirectory(); // 1
  String appDocumentsPath = appDocumentsDirectory.path;
  String filePath = '$appDocumentsPath/history.json';

  return filePath;
}

void updateHistory(Model modelInfo) async {
  File file = File(await getFilePath());
  List decoded;
  try {
    decoded = jsonDecode(await file.readAsString()) as List;
  } catch (e) {
    decoded = [];
  }
  decoded.add(modelInfo.toJson());
  final jsonString = jsonEncode(decoded);
  file.writeAsString(jsonString);
  modelInfo.clearModel();
}

ButtonStyle raisedButtonStyle(Color foreground, Color background) {
  return (ElevatedButton.styleFrom(
    foregroundColor: foreground,
    backgroundColor: background,
    minimumSize: const Size(200, 70),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
  ));
}

Container _titleSection(String title, String expression) {
  return Container(
    padding: const EdgeInsets.all(20),
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
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25),
                ),
              ),
              Container(
                //color: Colors.black,
                //padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  expression,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                      fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
