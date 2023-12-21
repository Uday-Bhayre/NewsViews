import 'package:flutter/material.dart';
import 'package:uday/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uday/features/home/model/newsModel.dart';
import 'package:uday/features/home/ui/widget/newsCard.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({
    super.key,
  });
  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
   
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('NewsViews'),
              ),
              backgroundColor: Colors.black,
              body: PageView.builder(
                controller: _pageController,
                itemCount: successState.news.length,
                itemBuilder: (context, index) {
                  return NewsCard(
                    newsItem: NewsItem(
                      title: successState.news[index].title,
                      videoUrl: successState.news[index].videoUrl,
                    ),
                  );
                },
              ),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Some Error Occurred...',style: TextStyle(fontSize: 16,),),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}


