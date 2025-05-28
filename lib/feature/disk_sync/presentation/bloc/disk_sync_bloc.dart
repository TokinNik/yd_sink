import 'dart:io';

import 'package:YDsync/core/models/data_state.dart';
import 'package:YDsync/feature/disk_sync/data/repository/disk_sync_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../domain/models/folder.dart';

part 'disk_sync_state.dart';

class DiskSyncBloc extends Cubit<DiskSyncState> {
  DiskSyncBloc(this._repository) : super(DiskSyncState());

  final DiskSyncRepository _repository;

  static const platform = MethodChannel('com.tokin.ydsynk/android_folder_permissins');

  Future<void> getDiskFiles() async {
    try {
      emit(state.copyWith(diskItems: state.diskItems.loading()));
      final result = await _repository.getFiles("/Ьгышс/Epic/Acryl Madness");
      emit(state.copyWith(diskItems: state.diskItems.success(result)));
    } on Exception catch (e, tr) {
      emit(state.copyWith(diskItems: state.diskItems.error(e, trace: tr)));
    }
  }

  Future<void> getLocalFiles() async {
    try {
      emit(state.copyWith(localItems: state.localItems.loading()));

      final String localStorePath = '/storage/emulated/0/Music/Ьгышс/Epic/Acryl Madness';

      final Directory? saveDir;

      // Для Android 13+
      if (Platform.isAndroid) {
        print('!!!DEBUG: DiskSyncBloc:getLocalFiles: ${await Permission.manageExternalStorage.request()}');
        print('!!!DEBUG: DiskSyncBloc:getLocalFiles: ${await Permission.storage.request()}');
      }

      // print('!!!DEBUG: DiskSyncBloc:getLocalFiles: status = $status');

      // if (!status.isGranted) {
      //   await Permission.storage.request();
      //
      //   final rr = await platform.invokeListMethod<String>('requestFolderPermission');
      //   print('!!!DEBUG: DiskSyncBloc:getLocalFiles: rr = $rr');
      // }

      if (Platform.isAndroid) {
        saveDir = await getExternalStorageDirectory();
      } else {
        saveDir = await getApplicationDocumentsDirectory();
      }
      print('!!!DEBUG: DiskSyncBloc:getLocalFiles: Start  ($saveDir)/($localStorePath)');

      final result = await Directory(localStorePath).list();
      final items = [];
      await for (final entity in result) {
        try {
          // Проверяем тип элемента
          if (entity is File || entity is Directory) {
            items.add(entity);
            print('Элемент: $entity');
          }
        } catch (e) {
          print('Ошибка доступа к элементу: $e');
        }
      }

      // final result = await saveDir?.list().toList() ?? [];

      print('!!!DEBUG: DiskSyncBloc:getLocalFiles: result----');
      items.forEach(print);
      print('!!!DEBUG: DiskSyncBloc:getLocalFiles: ----');

      final mapped = items.map((e) => FolderItem(name: e.path.split('/').last, path: e.path, id: e.path)).toList();

      print('!!!DEBUG: DiskSyncBloc:getLocalFiles: mapped----');
      mapped.forEach(print);
      print('!!!DEBUG: DiskSyncBloc:getLocalFiles: ----');

      emit(state.copyWith(localItems: state.localItems.success(mapped)));
    } on Exception catch (e, tr) {
      print('!!!DEBUG: DiskSyncBloc:getLocalFiles: Error $e');
      emit(state.copyWith(localItems: state.localItems.error(e, trace: tr)));
    }
  }

  void downloadFile(FolderItem e) async {
    // try {
      emit(state.copyWith(downloadFile: state.downloadFile.copyWith(isLoading: true, data: e)));
      final result = await _repository.downloadFile(e);
      emit(state.copyWith(downloadFile: DataState()));
    // } on Exception catch (e, tr) {
    //   emit(state.copyWith(downloadFile: DataState()));
    //   emit(state.copyWith(downloadFile: state.downloadFile.error(e, trace: tr)));
    // }
  }
}
