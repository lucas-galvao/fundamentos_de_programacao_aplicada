class FcLayer {
  String units = '';
  String k = '';

  FcLayer();

  String getString() {
    return ('<(fc($units)) * ($k)>');
  }
}
