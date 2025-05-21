import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:YDsync/core/models/data_state.dart';
import 'package:YDsync/feature/nasa_media/data/repository/nasa_repository.dart';
import 'package:YDsync/feature/nasa_media/model/nasa_media_search_model.dart';

part 'nasa_media_state.dart';

class NasaMediaBloc extends Cubit<NasaMediaState> {
  final NasaRepository _nasaRepository;

  NasaMediaBloc(this._nasaRepository) : super(const NasaMediaState());

  Future refresh() async {
    emit(state.copyWith(data: state.data.more(isRefresh: true)));
    try {
      final result = await _nasaRepository.getImages(
        "mars",
        NasaFileType.image.mapName,
        forceRefresh: true,
        pageSize: 16,
        page: state.data.page + 1,
      );

      emit(state.copyWith(data: state.data.success(result)));
    } on Exception catch (e, trace) {
      emit(state.copyWith(data: state.data.error(e, trace: trace)));
    }
  }

  Future next() async {
    emit(state.copyWith(data: state.data.more()));
    try {
      final result = await _nasaRepository.getImages(
        "mars",
        NasaFileType.image.mapName,
        forceRefresh: true,
        pageSize: 16,
        page: state.data.page + 1,
      );

      emit(state.copyWith(data: state.data.success(result)));
    } on Exception catch (e, trace) {
      emit(state.copyWith(data: state.data.error(e, trace: trace)));
    }
  }
}
