import 'package:flutter/material.dart';
import 'package:news_app/common/helper/date_formate.dart';
import 'package:news_app/common/helper/is_dark_mode.dart';
import 'package:news_app/core/theme/app_color.dart';
import 'package:news_app/domin/entities/article_entity.dart';
import 'package:news_app/domin/usecases/addnews_sqflite.dart';
import 'package:news_app/service_locator.dart';

class ReadingPage extends StatelessWidget {
  const ReadingPage(
      {super.key,
      required this.image,
      required this.author,
      required this.dateTime,
      required this.title,
      required this.content,
      required this.desc,
      required this.newsUrl});
  final String image;
  final String author;
  final DateTime dateTime;
  final String title;
  final String content;
  final String desc;
  final String newsUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.isDarkMode
            ? AppColors.darkBackgroundColor
            : Colors.transparent,
        actions: [
          IconButton(
              onPressed: () async {
                await s1<AddnewsSqfliteUsecase>().call(
                  parms: ArticleEntity(
                    author: author,
                    content: content,
                    description: desc,
                    publishedAt: dateTime,
                    title: title,
                    url: newsUrl,
                    urlToImage: image,
                  ),
                );
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Bookmark Added')));
              },
              icon: const Icon(
                Icons.bookmark_add_outlined,
                size: 35,
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    fit: BoxFit.cover,
                    image,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _authorNameFollowBtn(context),
              const SizedBox(
                height: 15,
              ),
              Text(
                title,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: context.isDarkMode
                      ? AppColors.textColorWhite
                      : AppColors.textColorDarkSlateGray,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                desc,
                style: TextStyle(
                  color: context.isDarkMode
                      ? AppColors.textColorWhite
                      : AppColors.textColorDarkSlateGray,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Read more 👇',
                style: TextStyle(
                  color: context.isDarkMode
                      ? AppColors.textColorWhite
                      : AppColors.textColorDarkSlateGray,
                  fontSize: 16,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                newsUrl,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: context.isDarkMode
                        ? AppColors.textColorWhite
                        : AppColors.textColorDarkSlateGray,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              Text(
                content,
                style: TextStyle(
                  color: context.isDarkMode
                      ? AppColors.textColorWhite
                      : AppColors.textColorDarkSlateGray,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _authorNameFollowBtn(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              child: Text(
                author,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: context.isDarkMode
                      ? AppColors.textColorWhite
                      : AppColors.textColorDarkSlateGray,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              formatDate(dateTime),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: context.isDarkMode
                    ? AppColors.textColorWhite
                    : AppColors.textColorDarkSlateGray,
                fontSize: 16,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.primaryColor,
          ),
          child: const Center(
            child: Text(
              'Follow',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
        )
      ],
    );
  }
}
