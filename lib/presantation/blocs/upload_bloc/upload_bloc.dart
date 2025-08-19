import 'package:autolife/presantation/blocs/upload_bloc/upload_event.dart';
import 'package:autolife/presantation/blocs/upload_bloc/upload_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class UploadBloc extends Bloc<UploadPostsEvent, UploadState> {
  bool isLoading = false;
  var captionController = TextEditingController();


  UploadBloc() : super(UploadInitialState()) {
    on<UploadPostsEvent>(_onUploadPostsEvent);
  }

  Future<void> _onUploadPostsEvent(UploadPostsEvent event,
      Emitter<UploadState> emit) async {}
}