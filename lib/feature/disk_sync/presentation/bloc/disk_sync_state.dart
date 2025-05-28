part of 'disk_sync_bloc.dart';

class DiskSyncState extends Equatable {
  final DataState<List<FolderItem>> diskItems;
  final DataState<List<FolderItem>> localItems;
  final DataState<FolderItem> downloadFile;

  DiskSyncState({
    this.diskItems = const DataState(),
    this.localItems = const DataState(),
    this.downloadFile = const DataState(),
  });

  DiskSyncState copyWith({
    DataState<List<FolderItem>>? diskItems,
    DataState<List<FolderItem>>? localItems,
    DataState<FolderItem>? downloadFile,
  }) {
    return DiskSyncState(
      diskItems: diskItems ?? this.diskItems,
      localItems: localItems ?? this.localItems,
      downloadFile: downloadFile ?? this.downloadFile,
    );
  }

  @override
  List<Object?> get props => [diskItems, localItems, downloadFile];
}
