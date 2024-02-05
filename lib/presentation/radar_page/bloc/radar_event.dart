// ignore_for_file: must_be_immutable

part of 'radar_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Radar widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class RadarEvent extends Equatable {}

/// Event that is dispatched when the Radar widget is first created.
class RadarInitialEvent extends RadarEvent {
  @override
  List<Object?> get props => [];
}
