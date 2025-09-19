import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'auto_scrool_event.dart';
import 'auto_scrool_state.dart';

class AutoScrollBloc extends Bloc<AutoScrollEvent, AutoScrollState> {
  final ScrollController scrollController = ScrollController();
  Timer? timer;

  AutoScrollBloc() : super(const AutoScrollInitial()) {
    on<AutoScrollNext>(_onNext);
    on<AutoScrollReset>(_onReset);
  }

  void startAutoScroll(BuildContext context) {
    final itemWidth = MediaQuery.of(context).size.width;

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!scrollController.hasClients) return;

      final maxScroll = scrollController.position.maxScrollExtent;
      final currentScroll = scrollController.offset;

      if (currentScroll >= maxScroll) {
        scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        // emit(const AutoScrollState(0));
      } else {
        final nextScroll = currentScroll + itemWidth;
        scrollController.animateTo(
          nextScroll,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        // emit(AutoScrollState(state.currentIndex + 1));
      }
    });
  }

  void _onNext(AutoScrollNext event, Emitter<AutoScrollState> emit) {
    emit(AutoScrollChanged(state.currentIndex + 1));
  }

  void _onReset(AutoScrollReset event, Emitter<AutoScrollState> emit) {
    emit(const AutoScrollChanged(0));
  }

  @override
  Future<void> close() {
    timer?.cancel();
    scrollController.dispose();
    return super.close();
  }
}