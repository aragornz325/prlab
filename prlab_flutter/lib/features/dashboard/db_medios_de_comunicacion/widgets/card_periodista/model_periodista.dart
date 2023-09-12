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
    required this.urlDeImage,
    required this.idioma,
    required this.telefono,
    required this.facebook,
    required this.instagram,
    required this.twitter,
    required this.youtube,
    required this.descripcion,
    required this.id,
  });
  String name;
  int id;
  String urlDeImage;
  String telefono;
  String instagram;
  String descripcion;
  String facebook;
  String youtube;
  String twitter;
  String idioma;
  String anchor;
  String location;
  List<String> topicCovered;
  String email;
  String avatar;
  int valoracion;
  bool estaSeleccionado;
}
