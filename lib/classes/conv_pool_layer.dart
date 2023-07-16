class ConvPoolLayer {
  Map conv = {'bnorm': '', 'n': ''};
  String pool = '';
  String m = '';

  ConvPoolLayer();

  String getString() {
    return ('${'${'(<conv' + conv['bnorm']} * (' + conv['n']})>$pool) * ($m)');
  }
}
