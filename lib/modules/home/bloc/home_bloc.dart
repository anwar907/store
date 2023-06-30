import 'package:bloc/bloc.dart';
import 'package:client/client.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:home_repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required HomeRepository homeRepository})
      : _homeRepository = homeRepository,
        super(const HomeState()) {
    on<HomeEventStarted>(listProduct);
    on<HomeEventSubmit>(submitProduct);
  }

  final HomeRepository _homeRepository;

  Future<void> listProduct(
    HomeEventStarted event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final result = await _homeRepository.fetchListProduct();

      emit(HomeState(productModels: result, status: GlobalStatusState.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: GlobalStatusState.failed,
          message: 'Something Wrong',
        ),
      );
    }
  }

  Future<void> submitProduct(
    HomeEventSubmit event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final result = await _homeRepository.submitDataProduct(
        description: event.description,
        imagePath: event.imageUrl,
        name: event.name,
      );

      emit(HomeState(product: result, status: GlobalStatusState.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: GlobalStatusState.failed,
          message: 'Something wrong',
        ),
      );
    }
  }
}
