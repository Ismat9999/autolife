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

  Future<void> _onNavigatorSearchEvent(NavigatorSearchEvent event,
      Emitter<NavigatorSearchState> emit) async {}

  void UserLocation(BuildContext context) async {
    CameraPosition? userPosition = await ycontroller.getUserCameraPosition();
    if (userPosition != null) {
      ycontroller.moveCamera(CameraUpdate.newCameraPosition(userPosition));
    }
    await ycontroller.toggleUserLayer(visible: true, autoZoomEnabled: true);
    await ycontroller.moveCamera(CameraUpdate.zoomTo(14));
  }

  void cameraPosition(BuildContext context) async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    final Point userPoint = Point(
      latitude: position.latitude,
      longitude: position.longitude,
    );
      await ycontroller.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: userPoint, zoom: 14),
        ),
      );
      await ycontroller.toggleUserLayer(
      visible: true,
      autoZoomEnabled: true,
        anchor: UserLocationAnchor(normal: Offset(0.5, 0.5), course:Offset(0.5, 0.5)),
    );
  }

}
