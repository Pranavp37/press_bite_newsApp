import 'package:flutter/material.dart';
import 'package:news_app/common/helper/is_dark_mode.dart';
import 'package:news_app/core/theme/app_color.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
  });
  final String image;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: context.isDarkMode
                  ? AppColors.lightBackgroundColor
                  : AppColors.darkBackgroundColor)),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          children: [
            SizedBox(
                height: 110,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    fit: BoxFit.cover,
                    image,
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 240,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: context.isDarkMode
                          ? AppColors.textColorWhite
                          : AppColors.textColorBlack,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    desc,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: context.isDarkMode
                          ? AppColors.grey
                          : AppColors.darkGrey,
                      // color: Colors.amber,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
