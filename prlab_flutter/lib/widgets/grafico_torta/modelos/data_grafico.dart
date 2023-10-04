class DataGrafico<T> {
  DataGrafico({
    required this.valor,
    required this.cantidad,
  });

  /// Es el tipo de dato que se va a mostrar dentro del grafico
  ///
  /// Ej: si fuese un gráfico de redes sociales, aca vendría el
  /// modelo de red social que se este manejando, esto sirve para
  /// luego poder hacer callbacks al tapear ciertas partes del gráfico.
  final T valor;

  /// Representación numérica de cuanto valor tiene este dato
  ///
  /// Ej: si fuese un gráfico de cantidad de visitas que recibe una red
  /// social y se le pasara en el componente `GraficoTorta` una lista de
  /// [DataGrafico] [(Facebook, 10 visitas), (Instragram, 10 visitas) ]
  /// cada uno representaria un 50 % del gráfico.
  final double cantidad;
}
