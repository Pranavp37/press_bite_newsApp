import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/widgets/news_card.dart';
import 'package:news_app/core/constant/Images/app_images.dart';
import 'package:news_app/persentation/readingpage/page/reading_page.dart';
import 'package:news_app/persentation/search/bloc/bloc/getsearchnews_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchController searchController = SearchController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: Column(
          children: [
            SearchBar(
              controller: searchController,
              onChanged: (value) {
                BlocProvider.of<GetsearchnewsBloc>(context).add(
                  Getsearchnews(
                    inputText: searchController.text.toLowerCase(),
                  ),
                );
              },
              // onTap: () {

              // },
              elevation: const WidgetStatePropertyAll(3),
              autoFocus: false,
              hintText: 'Search',
              leading: const Icon(Icons.search),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(),
            BlocBuilder<GetsearchnewsBloc, GetsearchnewsState>(
              builder: (context, state) {
                if (state is GetsearchnewsInitial) {
                  return const Center(child: Text('Search News Your Topic'));
                }
                if (state is GetsearchnewsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is GetsearchnewsSucces) {
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReadingPage(
                                        newsUrl: state.newsData[index].url
                                            .toString(),
                                        desc: state.newsData[index].description
                                            .toString(),
                                        content: state.newsData[index].content
                                            .toString(),
                                        title: state.newsData[index].title
                                            .toString(),
                                        dateTime:
                                            state.newsData[index].publishedAt!,
                                        author: state.newsData[index].author
                                            .toString(),
                                        image: state.newsData[index]
                                                    .urlToImage !=
                                                null
                                            ? state.newsData[index].urlToImage
                                                .toString()
                                            : AppImages.newsdefultImg
                                                .toString(),
                                      ),
                                    ));
                              },
                              child: NewsCard(
                                image: state.newsData[index].urlToImage != null
                                    ? state.newsData[index].urlToImage
                                        .toString()
                                    : AppImages.newsdefultImg.toString(),
                                title: state.newsData[index].title.toString(),
                                desc: state.newsData[index].description
                                    .toString(),
                              ),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemCount: state.newsData.length),
                  );
                }
                if (state is GetsearchnewsFailed) {
                  return Center(child: Text(state.error));
                }
                return const Text('Some error occued');
              },
            ),
          ],
        ),
      ),
    );
  }
}
