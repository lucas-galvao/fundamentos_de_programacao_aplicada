import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:fundamentos_de_programacao_aplicada/pages/home.dart';
import 'package:fundamentos_de_programacao_aplicada/classes/logo.dart';

class History extends StatelessWidget {
  History({super.key});

  @override
  Future<List> hist = getHistory();
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
            child: FutureBuilder<List>(
                future: hist,
                builder: (context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                        children:
                            createCardsList(snapshot.data as List, context));
                  } else if (snapshot.hasError) {
                    return Column(children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('Error: ${snapshot.error}'),
                      )
                    ]);
                  } else {
                    return Column(children: [
                      LoadingAnimationWidget.hexagonDots(
                          color: Colors.teal, size: 100)
                    ]);
                  }
                })));
  }
}

Future<List> getHistory() async {
  Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
  String appDocumentsPath = appDocumentsDirectory.path;
  String filePath = '$appDocumentsPath/history.json';
  File file = File(filePath);
  List decoded;
  try {
    decoded = jsonDecode(await file.readAsString()) as List;
  } catch (e) {
    decoded = [];
  }
  return decoded;
}

void deleteHistory() async {
  Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
  String appDocumentsPath = appDocumentsDirectory.path;
  String filePath = '$appDocumentsPath/history.json';
  File file = File(filePath);
  file.writeAsString('');
}

List<Widget> createCardsList(List hist, BuildContext context) {
  List<Widget> containers = [];
  for (Map stringModel in hist) {
    containers.add(const SizedBox(height: 20));
    containers.add(createCard(stringModel, context));
  }
  if (containers.length == 0) {
    containers.add(const SizedBox(height: 50));
    containers.add(const Center(
        child: Text(
      'History is empty',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
    )));
  } else {
    containers.add(const SizedBox(height: 50));
    containers.add(deleteButton(context));
  }
  return containers;
}

Center createCard(Map stringModel, BuildContext context) {
  String dataset = stringModel["dataset"];
  String accuracy = stringModel["accuracy"].toStringAsFixed(2);
  String f1 = stringModel["f1"].toStringAsFixed(2);
  return Center(
      child: Card(
          elevation: 10,
          color: Colors.black,
          child: SizedBox(
              width: 450,
              height: 120,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      'Dataset: $dataset',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          fontSize: 25),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Accuracy: $accuracy',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                            fontSize: 15),
                      ),
                      const SizedBox(width: 30),
                      Text(
                        'F1-Score: $f1',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                            fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    child: const Text('Details'),
                    onPressed: () {
                      detailsPopUp(stringModel, context);
                    },
                  ),
                ],
              ))));
}

void detailsPopUp(Map modelInfo, BuildContext context) {
  String dataset = modelInfo["dataset"];
  String grammar = modelInfo["grammar"];
  String accuracy = modelInfo["accuracy"].toStringAsFixed(2);
  String f1 = modelInfo["f1"].toStringAsFixed(2);
  showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
            child: Container(
                width: 1300.0,
                height: 300.0,
                child: AlertDialog(
                    content: Column(children: [
                      Text(
                        'Dataset: $dataset',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Grammar:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        grammar,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Accuracy: $accuracy',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            'F1-Score: $f1',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ],
                      )
                    ]),
                    backgroundColor: Colors.black,
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Back',
                            style: TextStyle(color: Colors.teal)),
                      ),
                    ])));
      });
}

ElevatedButton deleteButton(BuildContext context) {
  return ElevatedButton(
    style: raisedButtonStyle,
    child: const Text('Delete History', style: TextStyle(fontSize: 20)),
    onPressed: () {
      showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
                content: const Text(
                  'Are you sure you want to delete the history?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                backgroundColor: Colors.black,
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child:
                        const Text('No', style: TextStyle(color: Colors.teal)),
                  ),
                  TextButton(
                    onPressed: () {
                      deleteHistory();
                      Navigator.of(context).pop();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => Home()),
                          (Route<dynamic> route) => false);
                    },
                    child:
                        const Text('Yes', style: TextStyle(color: Colors.teal)),
                  ),
                ]);
          });
    },
  );
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.white,
  backgroundColor: Colors.red,
  minimumSize: const Size(250, 80),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(50)),
  ),
);
