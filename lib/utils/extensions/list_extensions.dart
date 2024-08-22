extension ListExt<T> on List<T> {
  List<T>? get nullIfEmpty {
    return isEmpty ? null : this;
  }

  T firstOrDefault(T defaultValue) {
    return isNotEmpty ? first : defaultValue;
  }

  T? get firstOrNull => isNotEmpty ? first : null;

  List<T> plus(T value) {
    return [...this, value];
  }

  List<T> minus(T value) {
    var newList = [...this];
    newList.remove(value);
    return newList;
  }

  List<T> plusAll(List<T> value) {
    addAll(value);
    return this;
  }

  List<T> exclude(List<T> exclude) {
    List<T> list = [];
    forEach((element) {
      if (!exclude.contains(element)) {
        list.add(element);
      }
    });
    return list;
  }
}

extension ListNullableExt<T> on List<T>? {
  List<T> plus(T value) {
    if (this == null) {
      return [value];
    } else {
      return [...this!, value];
    }
  }
}

extension ListStringExt on List<String> {
  String get firstOrEmpty => length > 0 ? first : '';
}
