class Periodista {
  Periodista({
    required this.name,
    required this.anchor,
    required this.location,
    required this.topicCovered,
    required this.email,
    required this.avatar,
    required this.valoracion,
    required this.estaSeleccionado,
  });
  String name;
  String anchor;
  String location;
  List<String> topicCovered;
  String email;
  String avatar;
  int valoracion;
  bool estaSeleccionado;
}
