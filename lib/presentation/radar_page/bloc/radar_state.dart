// ignore_for_file: must_be_immutable

part of 'radar_bloc.dart';

/// Represents the state of Radar in the application.
class RadarState extends Equatable {
  RadarState({
    this.searchController,
    this.radarModelObj,
  });

  TextEditingController? searchController;

  RadarModel? radarModelObj;

  @override
  List<Object?> get props => [
        searchController,
        radarModelObj,
      ];
  RadarState copyWith({
    TextEditingController? searchController,
    RadarModel? radarModelObj,
  }) {
    return RadarState(
      searchController: searchController ?? this.searchController,
      radarModelObj: radarModelObj ?? this.radarModelObj,
    );
  }
}
