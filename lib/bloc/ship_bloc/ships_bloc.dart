import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graph_ql/data/models/ships.dart';
import 'package:flutter/material.dart';
import 'package:graph_ql/data/network/api.dart';

part 'ships_event.dart';
part 'ships_state.dart';

class ShipsBloc extends Bloc<ShipsEvent, ShipsState> {
  ShipsBloc({required this.shipsApiClient}) : super(ShipsInitial()) {
    on<GetShips>(_getShips);
    on<GetShipsById>(_getShipById);
  }
  final ShipsApiClient shipsApiClient;

  Future<void> _getShips(
    GetShips event,
    Emitter<ShipsState> emit,
  ) async {
    emit(ShipsError());
    try {
      final ships = await shipsApiClient.getShips();
      // final singleCountry = await _jobsApiClient.getCountryById("UZ");
      emit(ShipsLoaded(ships: ships));
    } catch (error) {
      print("ERRROR:$error");
      emit(ShipsError());
    }
  }

  Future<void> _getShipById(
    GetShipsById event,
    Emitter<ShipsState> emit,
  ) async {
    emit(ShipsError());
    try {
      final ship = await shipsApiClient.getShipById(event.id);
      // final singleCountry = await _jobsApiClient.getCountryById("UZ");
      emit(ShipsLoadedById(ship: ship));
    } catch (error) {
      print("ERRROR:$error");
      emit(ShipsError());
    }
  }
}
