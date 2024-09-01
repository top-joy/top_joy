import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_joy/domain/service_data/usecase/get_service_data.dart';
import 'package:top_joy/injection.dart';
import 'package:top_joy/core/navigation/app_router.dart';
import 'package:top_joy/presentation/home/bloc/banner_bloc/banner_cubit.dart';
import 'package:top_joy/presentation/home/bloc/service_data_bloc/service_data_bloc.dart';

void main(List<String> args) {
  setUp();
  final appRouter = AppRouter();
  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BannerCubit(),
        ),
        BlocProvider(
          create: (context) => ServiceBloc(
            getServiceDataUseCase: getIt<GetServiceDataUsercase>(),
          ),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
