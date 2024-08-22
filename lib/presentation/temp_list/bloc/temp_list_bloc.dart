import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:template_app/core/core.dart';
import 'package:template_app/data/nivl_template_api/repository/nivl_repository.dart';
import 'package:template_app/domain/models/nivl_data_model.dart';

part 'temp_list_event.dart';
part 'temp_list_state.dart';

class TempListScreenBloc
    extends Bloc<TempListScreenEvent, TempListScreenState> {
  final NIVLRepository _nivlRepository;

  TempListScreenBloc(
    this._nivlRepository,
  ) : super(const TempListScreenState()) {
    on<TempListScreenInitEvent>(init);
  }

  void init(
    TempListScreenEvent? value,
    Emitter<TempListScreenState> emit,
  ) async {
    var result = await _nivlRepository.getNIVLData(
      "mars",
      NIVLType.image.mapName,
    );

    logD("TempListScreenBloc:init:result = $result");

    emit(state.copyWith(
      listOfElements: result,
    ));
  }
}
