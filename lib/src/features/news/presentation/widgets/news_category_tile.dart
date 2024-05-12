import 'package:flutter/material.dart';
import 'package:labari/src/features/news/presentation/screens/news_category.dart';

class NewsCategoryTile extends StatelessWidget {
  final String imagePath;
  final String categoryTitle;
  const NewsCategoryTile({
    super.key,
    required this.imagePath,
    required this.categoryTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsCategoryPage(
                      newsCategory: categoryTitle,
                    )));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                height: 230,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(imagePath), fit: BoxFit.cover)),
                width: 270,

                // child: Image.network(imagePath, fit: BoxFit.fill,),
              ),
            ),
          ),
          Expanded(
              child: Text(
            categoryTitle,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ))
        ],
      ),
    );
  }
}
