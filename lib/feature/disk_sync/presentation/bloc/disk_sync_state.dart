part of 'disk_sync_bloc.dart';

class DiskSyncState extends Equatable {
  final DataState<List<FolderItem>> items;

  DiskSyncState({this.items = const DataState()});

  DiskSyncState copyWith({DataState<List<FolderItem>>? items}) {
    return DiskSyncState(items: items ?? this.items);
  }

  @override
  List<Object?> get props => [items];
}
