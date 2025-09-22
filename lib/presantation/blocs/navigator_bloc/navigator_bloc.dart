import 'package:autolife/presantation/blocs/navigator_bloc/navigator_event.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorSearchEvent, NavigatorSearchState> {
  bool isLoading = false;
  late YandexMapController ycontroller;

  NavigatorBloc() : super(NavigatorInitialState()) {
    on<NavigatorSearchEvent>(_onNavigatorSearchEvent);
  }

  Future<void> _onNavigatorSearchEvent(
      NavigatorSearchEvent event, Emitter<NavigatorSearchState> emit) async {}

  void NavigatorToggleUserLocation(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      Geolocator.requestPermission();
    } else if (permission == LocationPermission.deniedForever) {
      Geolocator.openAppSettings();
    }
    CameraPosition? userPosition = await ycontroller.getUserCameraPosition();
    if (userPosition != null) {
      ycontroller.moveCamera(CameraUpdate.newCameraPosition(userPosition!));
    }
    await ycontroller.toggleUserLayer(visible: true, autoZoomEnabled: true);
    await ycontroller.moveCamera(CameraUpdate.zoomTo(14));
  }
}
