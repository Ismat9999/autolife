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
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (scrollController.hasClients) {
        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.offset;
        final itemWidth = MediaQuery.of(context).size.width;

        if (currentScroll >= maxScroll) {
          // reset
          scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          add(AutoScrollReset());
        } else {
          // next
          scrollController.animateTo(
            currentScroll + itemWidth,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          add(AutoScrollNext());
        }
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
