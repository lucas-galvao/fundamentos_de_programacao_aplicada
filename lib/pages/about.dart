import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:fundamentos_de_programacao_aplicada/pages/home.dart';
import 'package:fundamentos_de_programacao_aplicada/classes/logo.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class About extends StatelessWidget {
  About({super.key});

  @override
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
        body: Center(
            child: Container(
          height: 700,
          width: 600,
          color: Colors.black,
          child: FutureBuilder(
              future: rootBundle.loadString("README.md"),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Markdown(
                    data: snapshot.data as String,
                    styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
                        .copyWith(
                            h1: TextStyle(color: Colors.white),
                            p: TextStyle(color: Colors.white),
                            a: TextStyle(color: Colors.teal),
                            textScaleFactor: 1.2,
                            pPadding: EdgeInsets.all(8.0)),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),

/*aboutText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30)),*/
        )));
  }
}
