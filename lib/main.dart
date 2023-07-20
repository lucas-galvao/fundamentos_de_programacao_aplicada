//import 'dart:js';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fundamentos_de_programacao_aplicada/pages/home.dart';
import 'package:fundamentos_de_programacao_aplicada/classes/model.dart';

void main() => runApp(
      ChangeNotifierProvider(
          create: (context) => Model(),
          child: MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.teal,
              unselectedWidgetColor: Colors.white,
            ),
            debugShowCheckedModeBanner: false,
            home: const Home(),
          )),
    );
