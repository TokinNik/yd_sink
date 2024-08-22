import 'package:template_app/core/singletons/loggers/log.dart';

extension IterableExt<E> on Iterable<E> {
  printAll() {
    forEach((element) {
      logD('$element');
    });
  }

  void forEachIndexed(void Function(E e, int i) f) {
    var i = 0;
    forEach((e) => f(e, i++));
  }

  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }

  Iterable<T> mapNotNull<T>(T Function(E e) toElement) {
    final resultList = List.of(map(toElement))..whereType<T>();
    return resultList.map((e) => e);
  }

  E? get tryFirst => ((length) > 0 ? first : null);

  E? tryReduce(E Function(E value, E element) f) {
    if (isNotEmpty) {
      return reduce(f);
    }

    return null;
  }
}
