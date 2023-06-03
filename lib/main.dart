//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:fundamentos_de_programacao_aplicada/pages/home.dart';
import 'package:fundamentos_de_programacao_aplicada/pages/n.dart';
import 'package:fundamentos_de_programacao_aplicada/pages/conv_pool.dart';

void main() => runApp(MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.teal,
          unselectedWidgetColor: Colors.white, // <-- your color
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (context) => Home(),
          '/n': (context) => N(),
          '/conv_pool': (context) => ConvPool()
        }));
