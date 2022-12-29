enum TaskTypes {
  completed,
  notCompleted,
}

extension ParseToString on TaskTypes {
  String convertToText() {
    final strings = toString().replaceAll('.', '_').split('_').last;
    final exp = RegExp(r"(?=[A-Z])");
    final parts = strings.split(exp);
    String name = '';
    for (String p in parts) {
      name += '${p[0].toUpperCase() + p.substring(1)} ';
    }
    return name;
  }
}
