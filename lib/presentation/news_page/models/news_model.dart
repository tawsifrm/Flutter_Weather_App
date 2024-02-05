// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [news_page],
/// and is typically used to hold data that is passed between different parts of the application.
class NewsModel extends Equatable {
  NewsModel() {}

  NewsModel copyWith() {
    return NewsModel();
  }

  @override
  List<Object?> get props => [];
}
