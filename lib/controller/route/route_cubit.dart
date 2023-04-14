import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'route_state.dart';

class RouteCubit extends Cubit<RouteState> {
  final BuildContext context;
  RouteCubit(this.context) : super(RouteState(context));
}
