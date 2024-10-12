import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/helper/date_formate.dart';
import 'package:news_app/common/helper/is_dark_mode.dart';
import 'package:news_app/core/constant/Images/app_images.dart';
import 'package:news_app/core/theme/app_color.dart';
import 'package:news_app/data/sources/news_api_provider.dart';
import 'package:news_app/persentation/home/bloc/bloc/getnews_bloc.dart';
import 'package:news_app/persentation/home/widgets/home_drawer.dart';
import 'package:news_app/common/widgets/news_card.dart';
import 'package:news_app/persentation/readingpage/page/reading_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // ignore: unused_field
  late final TabController _tabcontroller;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        BlocProvider.of<GetnewsBloc>(context).add(GetnewsfechedEvent());
      },
    );
    super.initState();

    _tabcontroller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: HomeScreenDrawer(),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(size: 40),
        title: Image.asset(
          AppImages.appLogo,
          height: 130,
        ),
        centerTitle: true,
        backgroundColor: context.isDarkMode
            ? AppColors.darkBackgroundColor
            : Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                NewsApiProviderImp().searchNewsDAta('sports');
              },
              icon: const Icon(
                Icons.notifications_outlined,
                size: 34,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'Hot News',
              style: TextStyle(
                color: context.isDarkMode
                    ? AppColors.textColorWhite
                    : AppColors.textColorDarkSlateGray,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<GetnewsBloc, GetnewsState>(
              builder: (context, state) {
                if (state is GetnewsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is GetnewsSuccess) {
                  return CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 200,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                      ),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        return _hotNewsCarousel(state, itemIndex);
                      });
                }
                if (state is GetnewsFailed) {
                  return Text(state.error.toString());
                }
                return const Text('error occured');
              },
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<GetnewsBloc, GetnewsState>(
              builder: (context, state) {
                if (state is GetnewsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is GetnewsSuccess) {
                  return Expanded(
                    child: ListView.separated(
                      itemCount: state.newsData.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReadingPage(
                                    newsUrl:
                                        state.newsData[index].url.toString(),
                                    desc: state.newsData[index].description
                                        .toString(),
                                    content: state.newsData[index].content
                                        .toString(),
                                    title:
                                        state.newsData[index].title.toString(),
                                    dateTime: formatDate(state
                                        .newsData[index].publishedAt
                                        .toString()),
                                    author:
                                        state.newsData[index].author.toString(),
                                    image: state.newsData[index].urlToImage !=
                                            null
                                        ? state.newsData[index].urlToImage
                                            .toString()
                                        : AppImages.newsdefultImg.toString(),
                                  ),
                                ));
                          },
                          child: NewsCard(
                            desc: state.newsData[index].description.toString(),
                            title: state.newsData[index].title.toString(),
                            image: state.newsData[index].urlToImage != null
                                ? state.newsData[index].urlToImage.toString()
                                : AppImages.newsdefultImg.toString(),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                    ),
                  );
                }
                if (state is GetnewsFailed) {
                  return Text(state.error);
                }
                return const Text('somthind wrong');
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _hotNewsCarousel(GetnewsSuccess state, int itemIndex) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      state.newsData[itemIndex].urlToImage != null
                          ? state.newsData[itemIndex].urlToImage.toString()
                          : AppImages.newsdefultImg.toString()),
                )),
          ),
        ),
        Positioned(
          bottom: 18,
          left: 8,
          child: Container(
            padding: const EdgeInsets.only(top: 10, left: 5),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.black.withOpacity(.500)),
            height: 100,
            width: 280,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.newsData[itemIndex].title.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  formatDate(state.newsData[itemIndex].publishedAt.toString()),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white60,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }


}
