import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_joy/core/utils/app_text_style.dart';
import 'package:top_joy/presentation/home/widgets/service_data_card.dart';
import 'package:top_joy/presentation/recomendation/bloc/recomendation_bloc.dart';
import 'package:top_joy/src/gen/assets.gen.dart';

@RoutePage()
class RecomendatioScreen extends StatelessWidget {
  const RecomendatioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: const Text(
          "Tavsiya",
          style: AppTextStyle.montserratBold,
        ),
      ),
      body: BlocBuilder<RecomendationBloc, RecomendationState>(
        bloc: context.read<RecomendationBloc>()..add(FetchRecomendationData()),
        builder: (context, state) {
          if (state is LoadingRecomendation) {
            return Center(
              child: Assets.lottie.loading.lottie(width: 100, height: 100),
            );
          } else if (state is ErrorRecomendation) {
            return Center(
              child: Text(
                state.error,
                textAlign: TextAlign.center,
                style: AppTextStyle.montserratMedium,
              ),
            );
          } else if (state is LoadedRecomendation) {
            return ListView.builder(
              itemCount: state.recomendationData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ServiceCard(service: state.recomendationData[index]),
                );
              },
            );
          } else {
            return const Center(
              child: Text("Ma'lumotlar yo'q"),
            );
          }
        },
      ),
    );
  }
}
