import 'package:YDsync/core/utils/extensions/context_extensions.dart';
import 'package:YDsync/core/utils/extensions/iterable_extension.dart';
import 'package:YDsync/feature/disk_sync/data/models/resource_list.dart';
import 'package:YDsync/feature/disk_sync/presentation/bloc/disk_sync_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class DiskSyncScreen extends StatelessWidget {
  const DiskSyncScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (c) => DiskSyncBloc(GetIt.instance.get()), child: _DiskSyncScreen());
  }
}

class _DiskSyncScreen extends StatefulWidget {
  const _DiskSyncScreen({super.key});

  @override
  State<_DiskSyncScreen> createState() => _DiskSyncScreenState();
}

class _DiskSyncScreenState extends State<_DiskSyncScreen> {
  @override
  void initState() {
    super.initState();
    context.bloc<DiskSyncBloc>().getFiles();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        backgroundColor: context.colors.backgroundNegativePrimary,
        body: BlocBuilder<DiskSyncBloc, DiskSyncState>(
          builder:
              (contrext, state) => Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FilledButton(
                        onPressed: () {
                          context.bloc<DiskSyncBloc>().getFiles();
                        },
                        child: const Text("GET FILES"),
                      ),
                      const SizedBox(height: 32),
                      Text(state.items.isLoading.toString()),
                      Text(state.items.isSuccess.toString()),
                      Text(state.items.isError.toString()),
                      Text(state.items.data?.length.toString() ?? '--'),
                      const SizedBox(height: 32),
                      if (state.items.isSuccess)
                        ...state.items.data!
                            .mapIndexed(
                              (e, i) => Container(
                                padding: EdgeInsets.all(4),
                                color: i % 2 == 0 ? Colors.white30 : Colors.white54,
                                child: Row(
                                  children: [
                                    Expanded(child: Text(e.name ?? '---')),
                                    const SizedBox(width: 8),
                                    switch (e.type) {
                                      null => const SizedBox.shrink(),
                                      FolderType.dir => Icon(Icons.folder),
                                      FolderType.file => Icon(Icons.file_copy),
                                    },
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      if (state.items.isLoading) CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
