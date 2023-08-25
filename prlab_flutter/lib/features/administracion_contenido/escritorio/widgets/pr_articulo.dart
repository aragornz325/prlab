// TODO(anyone): sacar es un modelo de ejemplo
class PRArticulo {
  // TODO(anyone): sacar es un modelo de ejemplo
  const PRArticulo({
    required this.fecha,
    required this.nombre,
    required this.status,
    required this.tieneAutor,
    this.urlImageAutor,
  });
  final String nombre;
  final String status;
  final DateTime fecha;
  final bool tieneAutor;
  final String? urlImageAutor;
}
