class Get {
  Get._();
  static Get instance = Get._();

  Map<String, dynamic> _data = Map();

  String _getKey(Type t, String tag) {
    if (tag != null) {
      return '${t.toString()}$tag';
    }
    return t.toString();
  }

  void put<T>(dynamic dependency, {String tag}) {
    final key = _getKey(T, tag);
    _data[key] = dependency;
  }

  T find<T>({String tag}) {
    final String key = _getKey(T, tag);
    return _data[key];
  }
}
