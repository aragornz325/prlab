import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/assets.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';

class ComponenteVerticalArticulos extends StatelessWidget {
  ComponenteVerticalArticulos({super.key});

  final List<Article> articles = [
    Article('Home page', 'Flutter article1'),
    Article('Home page', 'Flutter article2'),
    Article('Home page', 'Flutter article3'),
  ];

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: 151.pw,
            height: 508.ph,
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: 20.ph,
                    left: 10.pw,
                    right: 10.pw,
                  ),
                  child: Container(
                    width: 132.pw,
                    height: 55.ph,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: colores.primary,
                      ),
                      color: colores.primary.withOpacity(.2),
                    ),
                    child: Row(
                      children: [
                        Center(
                          child: SizedBox(
                            height: 30.ph,
                            width: 30.pw,
                            child: Image.asset(Assets.assets_icons_casa_png),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              articles[index].title,
                              style: TextStyle(
                                fontSize: 10.pf,
                                color: colores.secondary,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              articles[index].content,
                              style: TextStyle(
                                color: colores.tertiary,
                                fontSize: 12.pf,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Article {
  Article(this.title, this.content);
  final String title;
  final String content;
}
