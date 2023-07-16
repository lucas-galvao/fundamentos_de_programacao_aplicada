import 'package:flutter/material.dart';
import 'package:fundamentos_de_programacao_aplicada/classes/conv_pool_layer.dart';
import 'package:fundamentos_de_programacao_aplicada/classes/fc_layer.dart';

class Model extends ChangeNotifier {
  String dataset = '';
  String grammar = '';
  ConvPoolLayer convPool = ConvPoolLayer();
  String flatten = '';
  FcLayer fc = FcLayer();
  String dropout = '';
  String lr = '';
  double floor = 0.0;
  double ceil = 0.0;
  double accuracy = 0.0;
  double f1 = 0.0;

  Model();

  getGrammar() {
    return (('${convPool.getString()}.$flatten.${fc.getString()}.$dropout.fc ($lr)')
        .replaceAll('..', '.'));
  }

  writeFlattenDropout(String grammarAdd) {
    grammar = grammarAdd;
    if (grammarAdd.contains('<FLATTEN>')) {
      flatten = 'flatten';
    } else {
      flatten = '';
    }
    if (grammarAdd.contains('<DROPOUT>')) {
      dropout = 'dropout';
    } else {
      dropout = '';
    }
  }

  Map<String, dynamic> toJson() => {
        'dataset': dataset,
        'grammar': grammar,
        'convPool': convPool.getString(),
        'flatten': flatten,
        'fc': fc.getString(),
        'dropout': dropout,
        'lr': lr,
        'floor': floor,
        'ceil': ceil,
        'accuracy': accuracy,
        'f1': f1,
      };

  clearGrammar() {
    grammar = '';
    convPool = ConvPoolLayer();
    flatten = '';
    fc = FcLayer();
    dropout = '';
    lr = '';
  }

  clearModel() {
    dataset = '';
    floor = 0.0;
    ceil = 0.0;
    accuracy = 0.0;
    f1 = 0.0;
    clearGrammar();
  }
}
