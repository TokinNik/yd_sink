import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:YDsync/core/di/register_module.dart';
import 'package:YDsync/core/ui/themes/text_styles.dart';
import 'package:YDsync/core/ui/themes/theme.dart';
import 'package:YDsync/core/ui/uikit/g_inf_list.dart';
import 'package:YDsync/core/ui/uikit/g_network_image.dart';
import 'package:YDsync/core/utils/extensions/context_extensions.dart';
import 'package:YDsync/feature/app/app_router.dart';
import 'package:YDsync/feature/nasa_media/bloc/nasa_media_bloc.dart';

@RoutePage()
class NasaMediaScreen extends StatelessWidget implements AutoRouteWrapper {
  const NasaMediaScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<NasaMediaBloc>(
      create: (c) => NasaMediaBloc(getIt.get())..refresh(),
      child: const NasaMediaScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NasaMediaBloc, NasaMediaState>(builder: _buildScreen);
  }

  Widget _buildScreen(BuildContext context, NasaMediaState state) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.chevron_left, color: Theme.of(context).extension<CustomTheme>()!.contentPrimary),
          onTap: () {
            context.maybePop();
          },
        ),
      ),
      body: SafeArea(
        child: GInfList(
          items: state.data.data ?? [],
          isLoading: state.data.isLoading || state.data.isRefresh,
          onRefresh: context.bloc<NasaMediaBloc>().refresh,
          onLoadMore: context.bloc<NasaMediaBloc>().next,
          onRender: (item, index) {
            return ListTile(
              dense: true,
              onTap: () => context.router.push(NasaMediaDetailsRoute(model: item)),
              title: GNetworkImage(url: item?.image, width: double.infinity, height: 300, fit: BoxFit.cover),
              subtitle: Text(item?.title, style: AppTextStyles.s20semibold),
            );
          },
        ),
      ),
    );
  }
}
