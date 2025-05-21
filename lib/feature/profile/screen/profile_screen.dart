import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:YDsync/core/models/error_handler.dart';
import 'package:YDsync/core/ui/generated/assets.gen.dart';
import 'package:YDsync/core/utils/extensions/context_extensions.dart';
import 'package:YDsync/feature/app/app_router.dart';
import 'package:YDsync/feature/profile/bloc/profile_bloc.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget implements AutoRouteWrapper {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ProfileScreenCubit>(
      create: (c) => ProfileScreenCubit(GetIt.instance.get(), GetIt.instance.get()),
      child: const ProfileScreen(),
    );
  }
}

class _ProfileScreenState extends State<ProfileScreen> with ErrorHandlerMixin {
  @override
  void initState() {
    super.initState();
    context.bloc<ProfileScreenCubit>().loadData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileScreenCubit, ProfileScreenState>(
      builder: (BuildContext context, ProfileScreenState state) {
        return Scaffold(
          backgroundColor: context.colors.contentPrimary,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: <Widget>[
                        FilledButton(
                          onPressed: () {
                            context.bloc<ProfileScreenCubit>().logout();
                          },
                          child: const Text("Logout"),
                        ),
                        FilledButton(
                          onPressed: () {
                            context.bloc<ProfileScreenCubit>().refreshToken();
                          },
                          child: const Text("Refresh Token"),
                        ),
                        FilledButton(
                          onPressed: () {
                            context.router.push(const NasaMediaRoute());
                          },
                          child: const Text("To List"),
                        ),
                        FilledButton(
                          onPressed: () {
                            context.router.push(const TempTabsRoute());
                          },
                          child: const Text("To Tabs"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Assets.gifs.snoopDogg.image(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
