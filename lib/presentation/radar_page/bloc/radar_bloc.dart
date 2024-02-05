import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:weather_app/presentation/radar_page/models/radar_model.dart';
part 'radar_event.dart';
part 'radar_state.dart';

/// A bloc that manages the state of a Radar according to the event that is dispatched to it.
class RadarBloc extends Bloc<RadarEvent, RadarState> {
  RadarBloc(RadarState initialState) : super(initialState) {
    on<RadarInitialEvent>(_onInitialize);
  }

  _onInitialize(
    RadarInitialEvent event,
    Emitter<RadarState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
    ));
  }
}
