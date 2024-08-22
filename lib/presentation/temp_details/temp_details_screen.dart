import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:template_app/domain/models/nivl_data_model.dart';

@RoutePage()
class TempDetailsScreen extends StatelessWidget {
  static String modelArgumentKey = "modelArgumentKey";

  const TempDetailsScreen({super.key, required this.model});

  final NIVLDataModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
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
    );
  }
}
