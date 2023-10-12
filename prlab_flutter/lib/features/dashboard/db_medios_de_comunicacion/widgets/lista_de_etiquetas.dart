import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/features/dashboard/db_medios_de_comunicacion/widgets/card_periodista/topic_pr_card_periodista.dart';

/// {@template ListaEtiquetas}
/// Lista de etiquetas a mostrar al crear un periodista.
/// {@endtemplate}
class ListaEtiquetas extends StatelessWidget {
  /// {@macro ListaEtiquetas}
  const ListaEtiquetas({
    required this.lista,
    super.key,
  });

  final List<Map<String, dynamic>> lista;

  @override
  Widget build(BuildContext context) {
    if (lista.isNotEmpty) {
      return Container(
        margin: EdgeInsets.only(top: 10.ph),
        height: 20.ph,
        child: ListView.builder(
          itemCount: lista.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => TopicPRCardPeriodista(
            topic: lista[index]['label'].toString(),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
