import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:weather_app/presentation/news_page/models/news_model.dart';
part 'news_event.dart';
part 'news_state.dart';

/// A bloc that manages the state of a News according to the event that is dispatched to it.
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(NewsState initialState) : super(initialState) {
    on<NewsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    NewsInitialEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
    ));
  }
}
