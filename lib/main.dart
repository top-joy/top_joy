import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:top_joy/data/favorite/source/favorite_source.dart';
import 'package:top_joy/domain/auth/usecsae/verify_code_usecase.dart';
import 'package:top_joy/domain/recomendation/usecase/get_recomendation_usecase.dart';
import 'package:top_joy/domain/service_data/usecase/get_service_data.dart';
import 'package:top_joy/domain/user/usecase/post_user_usecase.dart';
import 'package:top_joy/injection.dart';
import 'package:top_joy/core/navigation/app_router.dart';
import 'package:top_joy/presentation/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:top_joy/presentation/auth/bloc/user_info_input/user_input_bloc.dart';
import 'package:top_joy/presentation/auth/bloc/verify_code_bloc/verify_bloc.dart';
import 'package:top_joy/presentation/favorite/bloc/favorite_bloc.dart';
import 'package:top_joy/presentation/home/bloc/banner_bloc/banner_cubit.dart';
import 'package:top_joy/presentation/home/bloc/service_data_bloc/service_data_bloc.dart';
import 'package:top_joy/presentation/main/bloc/navigation_cubit.dart';
import 'package:top_joy/presentation/network/bloc/network_state.dart';
import 'package:top_joy/presentation/profile/bloc/user_profile_bloc.dart';
import 'package:top_joy/presentation/recomendation/bloc/recomendation_bloc.dart';
import 'package:top_joy/presentation/network/bloc/network_bloc.dart';
import 'package:top_joy/presentation/widgets/no_internet_screen.dart';

import 'data/user/models/user_model.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserModelAdapter());
  await setUp();
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
        BlocProvider(create: (context) => BannerCubit()),
        BlocProvider(
          create: (context) => ServiceBloc(
            getServiceDataUseCase: getIt<GetServiceDataUsercase>(),
          ),
        ),
        BlocProvider(
          create: (context) => RecomendationBloc(
            getRecomendationUsecase: getIt<GetRecomendationUsecase>(),
          ),
        ),
        BlocProvider(create: (context) => getIt<AuthBloc>()),
        BlocProvider(create: (context) => getIt<VerifyBloc>()),
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(create: (context) => InternetBloc()),
        BlocProvider(
          create: (context) => UserProfileBloc(getIt<VerifyCodeUsecase>()),
        ),
        BlocProvider(
          create: (context) => UserInputBloc(getIt<PostUserUsecase>()),
        ),
        BlocProvider(
          create: (context) => FavoriteBloc(getIt<FavoriteSource>()),
        )
      ],
      child: BlocBuilder<InternetBloc, InternetState>(
        builder: (context, internetState) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter.config(),
            builder: (context, child) {
              if (internetState is InternetDisconnectedState) {
                return const NoInternetScreen();
              }
              return child!;
            },
          );
        },
      ),
    );
  }
}
