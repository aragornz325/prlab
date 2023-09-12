import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/features/dashboard/inicio/escritorio/widgets/widgets.dart';

class EncabezadoInicio extends StatelessWidget {
  const EncabezadoInicio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Container(
      width: 1010.pw,
      height: 264.ph,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xffEC351D),
            Color(0xffA4213B),
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 20.ph),
          Text(
            'Welcome back, John!',
            style: TextStyle(
              fontSize: 30.pf,
              color: colores.background,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 15.ph),
          Container(
            width: 542.pw,
            height: 50.ph,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: colores.background,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                prefix: SizedBox(
                  width: 5.pw,
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 5.pw),
                  child: Icon(
                    Icons.manage_search_outlined,
                    size: 25.pf,
                  ),
                ),
                hintText: 'Search articles, projects, brands, and more...',
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 17.pf),
            ),
          ),
          SizedBox(height: 15.ph),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ItemEncabezado(
                texto: 'Media Database',
                icono: Icons.explore_outlined,
                estaCargando: true,
              ),
              ItemEncabezado(
                texto: 'Contacts',
                icono: Icons.ballot_outlined,
                estaCargando: true,
              ),
              ItemEncabezado(
                texto: 'Online Newsroom',
                icono: Icons.telegram,
                estaCargando: true,
              ),
              ItemEncabezado(
                texto: 'PR Reports',
                icono: Icons.donut_small,
              ),
              ItemEncabezado(
                texto: 'Analytic',
                icono: Icons.account_tree_outlined,
              ),
              ItemEncabezado(
                texto: 'Media Monitoring',
                icono: Icons.monitor_heart_outlined,
              ),
              ItemEncabezado(
                texto: 'Statistics',
                icono: Icons.monitor,
              ),
            ],
          ),
          SizedBox(height: 15.ph),
        ],
      ),
    );
  }
}
