part of 'ships_bloc.dart';

@immutable
abstract class ShipsEvent {}

class GetShips extends ShipsEvent {}

class GetShipsById extends ShipsEvent {
  final String id;
  GetShipsById({required this.id});
}
