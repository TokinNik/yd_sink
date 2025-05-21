import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:YDsync/core/ui/themes/theme.dart';
import 'package:YDsync/feature/nasa_media/model/nasa_media_search_model.dart';

@RoutePage()
class NasaMediaDetailsScreen extends StatelessWidget {
  static String modelArgumentKey = "modelArgumentKey";

  const NasaMediaDetailsScreen({super.key, required this.model});

  final NasaMediaSearchModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            context.maybePop();
          },
          child: Icon(Icons.chevron_left, color: Theme.of(context).extension<CustomTheme>()!.contentPrimary),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(model.type.mapName),
                Text(model.title),
                Text(model.subTitle),
                Text(model.image),
                Text(model.date),
                Text(model.id),
                Text(model.center),
                Text(model.mediaLink),
                Text(model.keyWord.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
