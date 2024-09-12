import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:top_joy/core/utils/app_text_style.dart';
import 'package:top_joy/data/user/models/user_model.dart';
import 'package:top_joy/injection.dart';
import 'package:top_joy/presentation/favorite/bloc/favorite_bloc.dart';
import 'package:top_joy/presentation/favorite/widget/favorite_card.dart';
import 'package:top_joy/src/gen/assets.gen.dart';

import '../../../core/navigation/app_router.gr.dart';

@RoutePage()
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  UserModel? userModel;

  @override
  void initState() {
    var userBox = getIt<Box<UserModel>>();
    userModel = userBox.get('user');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sevimlilar',
          style: AppTextStyle.montserratBold,
        ),
        elevation: 0,
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        bloc: context.read<FavoriteBloc>()
          ..add(GetFavoritesEvent(userModel?.id ?? '')),
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return Center(
              child: Assets.lottie.loading
                  .lottie(width: 100, height: 100, fit: BoxFit.cover),
            );
          }
          if (state is FavoriteLoaded) {
            if (state.favorites.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 80,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Hozircha sevimlilar yo\'q',
                      style: AppTextStyle.montserratBold.copyWith(fontSize: 18),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: state.favorites.length,
              itemBuilder: (context, index) {
                final favorite = state.favorites[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: FavoriteCard(
                    service: favorite,
                    onTap: () {
                      context.router.push(
                        DetailRoute(serviceModels: favorite),
                      );
                    },
                  ),
                );
              },
            );
          } else if (state is FavoriteError) {
            return Center(
              child: Assets.images.favoriteEmpty.svg(),
            );
          }
          context
              .read<FavoriteBloc>()
              .add(GetFavoritesEvent(userModel?.id ?? ''));
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.images.favoriteEmpty.svg(),
              ],
            ),
          );
        },
      ),
    );
  }
}
