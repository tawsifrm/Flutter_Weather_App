// ignore_for_file: must_be_immutable

part of 'news_bloc.dart';

/// Represents the state of News in the application.
class NewsState extends Equatable {
  NewsState({
    this.searchController,
    this.newsModelObj,
  });

  TextEditingController? searchController;

  NewsModel? newsModelObj;

  @override
  List<Object?> get props => [
        searchController,
        newsModelObj,
      ];
  NewsState copyWith({
    TextEditingController? searchController,
    NewsModel? newsModelObj,
  }) {
    return NewsState(
      searchController: searchController ?? this.searchController,
      newsModelObj: newsModelObj ?? this.newsModelObj,
    );
  }
}
