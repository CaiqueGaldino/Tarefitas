import 'package:flutter/material.dart';
import 'constants.dart';

class TodoCategories extends StatelessWidget {

  final int bgcolor;
  final String title;
  final icone;
  const TodoCategories({Key? key, required this.bgcolor,required this.title, required this.icone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
      child: Container(
        child:
        Container(
          decoration: BoxDecoration(
          color: ColorsList[bgcolor],
          borderRadius: BorderRadius.circular(10)
        ),
        height: 130,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(title, style: TextStyle(
              fontSize: 20
            ),),
            Icon(IconsList[icone], size: 36,)
          ],
        ),
        )
      ),
    );
  }
}

class Category {
  final String name;
  final int category;
  final int total;

  Category({required this.name, required this.category, required this.total});
}
