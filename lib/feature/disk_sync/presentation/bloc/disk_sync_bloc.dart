import 'package:YDsync/core/models/data_state.dart';
import 'package:YDsync/feature/disk_sync/data/repository/disk_sync_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/folder.dart';

part 'disk_sync_state.dart';

class DiskSyncBloc extends Cubit<DiskSyncState> {
  DiskSyncBloc(this._repository) : super(DiskSyncState());

  final DiskSyncRepository _repository;

  getFiles() async {
    try {
      emit(state.copyWith(items: state.items.loading()));
      final result = await _repository.getFiles("/Buf");
      emit(state.copyWith(items: state.items.success(result)));
    } on Exception catch (e, tr) {
      emit(state.copyWith(items: state.items.error(e, trace: tr)));
    }
  }
}
