extension MapExt on Map {
  void removeNullValues() {
    removeWhere((_, value) => value == null);
  }

  elementAt(int index) => values.elementAt(index);

  keyAt(int index) => keys.elementAt(index);
}
