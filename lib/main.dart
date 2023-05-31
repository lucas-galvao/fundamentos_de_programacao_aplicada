import 'package:flutter/material.dart';
import 'package:fundamentos_de_programacao_aplicada/pages/home.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    routes: {'/home': (context) => Home()}));
