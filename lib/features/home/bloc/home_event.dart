part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

List<Map<String, dynamic>>? loadedData;

FutureOr<void> homeInitialEvent(
    HomeInitialEvent event, Emitter<HomeState> emit) async {
  emit(HomeLoadingState());
  await getNews();
  loadedData!=null?
  emit(HomeLoadedSuccessState(news: [
    for (var itm in loadedData!)
      NewsItem(
        title: itm['title'],
        videoUrl: itm['url'],
      )
  ])):emit(HomeErrorState());
}

Future<void> getNews() async {
  try {
    var docRef = await FirebaseFirestore.instance.collection('videos').get();
    loadedData = docRef.docs.map((e) => e.data()).toList();
  } catch (e) {
    
  }
}
