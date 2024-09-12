import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_joy/data/service_data/models/service_models.dart';
import 'package:top_joy/data/user/models/user_model.dart';
import 'package:top_joy/presentation/detail_screen/widgets/detail_app_bar_button.dart';
import 'package:top_joy/presentation/detail_screen/widgets/registration_dialog.dart';
import 'package:top_joy/presentation/favorite/bloc/favorite_bloc.dart';

import '../../../data/favorite/model/favorite_request_model.dart';
import '../../../domain/favorite/entity/favorite_entity.dart';
import '../../../injection.dart';

class DetailAppBar extends StatefulWidget {
  final ServiceModels serviceModels;

  const DetailAppBar({super.key, required this.serviceModels});

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();
}

class _DetailAppBarState extends State<DetailAppBar> {
  UserModel? userModel;
  bool isFavorited = false;
  bool isRegistered = false;
  @override
  void initState() {
    super.initState();
    var userBox = getIt<Box<UserModel>>();
    userModel = userBox.get('user');
    _checkIfFavorited();
    _checkRegistrationStatus();
  }

  Future<void> _checkRegistrationStatus() async {
    final sharedPreferences = getIt<SharedPreferences>();
    setState(() {
      isRegistered = sharedPreferences.getBool('isRegistor') ?? false;
    });
  }

  void _checkIfFavorited() {
    final favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
    favoriteBloc.add(GetFavoritesEvent(userModel?.id ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceMaterialTransparency: true,
      pinned: false,
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: widget.serviceModels.url[0].url,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ],
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(7.0),
        child: DetailAppBarButton(
          icon: Icons.arrow_back_ios_rounded,
          onPressed: () => context.router.maybePop(),
        ),
      ),
      actions: [
        DetailAppBarButton(icon: Icons.share, onPressed: () {}),
        const SizedBox(width: 15),
        BlocConsumer<FavoriteBloc, FavoriteState>(
          listener: (context, state) {
            print(state);
            if (state is FavoriteLoaded) {
              setState(() {
                isFavorited = state.favorites
                    .any((fav) => fav.id == widget.serviceModels.id);
              });
            }
            if (state is FavoriteActionSuccess) {
              setState(() {
                isFavorited = !isFavorited;
              });
            }
          },
          builder: (context, state) {
            return DetailAppBarButton(
              icon: isFavorited
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
              color: isFavorited ? Colors.red : Colors.white,
              onPressed: () {
                if (!isRegistered) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        const RegistrationDialog(),
                  );
                } else if (userModel != null) {
                  if (isFavorited) {
                    context.read<FavoriteBloc>().add(DeleteFavoriteEvent(
                          FavoriteEntity(
                              userId: userModel!.id,
                              serviceId: widget.serviceModels.id),
                        ));
                  } else {
                    context.read<FavoriteBloc>().add(AddFavoriteEvent(
                          FavoriteRequestModel(
                              userId: userModel!.id,
                              serviceId: widget.serviceModels.id),
                        ));
                  }
                }
              },
            );
          },
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
