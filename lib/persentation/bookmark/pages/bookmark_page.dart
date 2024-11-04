import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:news_app/common/widgets/news_card.dart';
import 'package:news_app/core/constant/Images/app_images.dart';
import 'package:news_app/domin/usecases/delectnews_sqflite.dart';
import 'package:news_app/persentation/bookmark/bloc/bloc/bookmark_bloc.dart';
import 'package:news_app/persentation/readingpage/page/reading_page.dart';
import 'package:news_app/service_locator.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        BlocProvider.of<BookmarkBloc>(context).add(GetnewsDataEvent());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('bookmark'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          BlocConsumer<BookmarkBloc, BookmarkState>(
            listener: (context, state) {
              if (state is DelectdataSucces) {
                return BlocProvider.of<BookmarkBloc>(context)
                    .add(GetnewsDataEvent());
              } else if (state is BookmarkFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: ${state.error}')),
                );
              }
            },
            builder: (context, state) {
              if (state is BookmarkSuccess) {
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReadingPage(
                                newsUrl: state.newsData[index].url.toString(),
                                desc: state.newsData[index].description
                                    .toString(),
                                content:
                                    state.newsData[index].content.toString(),
                                title: state.newsData[index].title.toString(),
                                dateTime: state.newsData[index].publishedAt!,
                                author: state.newsData[index].author.toString(),
                                image: state.newsData[index].urlToImage != null
                                    ? state.newsData[index].urlToImage
                                        .toString()
                                    : AppImages.newsdefultImg.toString(),
                              ),
                            ));
                      },
                      child: Slidable(
                        endActionPane:
                            ActionPane(motion: const ScrollMotion(), children: [
                          SlidableAction(
                            onPressed: (context) async {
                              s1<DelectnewsSqfliteUsecase>()
                                  .call(parms: state.newsData[index].id);
                              //
                              BlocProvider.of<BookmarkBloc>(context).add(
                                  DelectdataFrommSqfliteEvent(
                                      id: state.newsData[index].id!));
                            },
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ]),
                        child: NewsCard(
                          image: state.newsData[index].urlToImage.toString(),
                          title: state.newsData[index].title.toString(),
                          desc: state.newsData[index].description.toString(),
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: state.newsData.length,
                  ),
                );
              }
              if (state is BookmarkFailed) {
                return Center(
                  child: Text(state.error),
                );
              }
              return const Text('some error occued');
            },
          ),
        ],
      ),
    );
  }
}
