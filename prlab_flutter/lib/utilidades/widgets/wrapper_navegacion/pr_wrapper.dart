import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/utilidades/widgets/appbar/appbar.dart';
import 'package:prlab_flutter/utilidades/widgets/drawer/drawer.dart';

class PRWrapperNavegacion extends StatelessWidget {
  const PRWrapperNavegacion({
    required this.body,
    super.key,
  });

  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const PrDrawer(),
        SizedBox(width: 30.pw),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PRAppBar(onTap: (menuDeOpciones) {}),
              SizedBox(height: 30.ph),
              Expanded(child: body),
            ],
          ),
        ),
      ],
    );
  }
}
