part of 'ships_bloc.dart';

@immutable
abstract class ShipsState extends Equatable {}

class ShipsInitial extends ShipsState {
  @override
  List<Object?> get props => [];
}

class ShipsLoading extends ShipsState {
  @override
  List<Object?> get props => [];
}

class ShipsLoaded extends ShipsState {
  final List<Ship> ships;
  ShipsLoaded({required this.ships});

  @override
  List<Object?> get props => [ships];
}

class ShipsLoadedById extends ShipsState {
  final Ship ship;
  ShipsLoadedById({required this.ship});

  @override
  List<Object?> get props => [ship];
}
class ShipsError extends ShipsState {
  @override
  List<Object?> get props => [];
}

