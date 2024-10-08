import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_joy/core/utils/app_color.dart';
import 'package:top_joy/core/utils/app_text_style.dart';
import 'package:top_joy/presentation/home/bloc/banner_bloc/banner_cubit.dart';
import 'package:top_joy/presentation/home/bloc/service_data_bloc/service_data_bloc.dart';
import 'package:top_joy/presentation/home/widgets/banner_carousel.dart';
import 'package:top_joy/src/gen/assets.gen.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_category.dart';
import '../widgets/service_data_card.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: RefreshIndicator(
        color: AppColor.buttonColor,
        onRefresh: () async {
          context.read<ServiceBloc>().add(FetchServiceDataEvent());
        },
        child: CustomScrollView(
          slivers: [
            const HomeCategoryRow(),
            const BannerCarousel(),
            BlocBuilder<ServiceBloc, ServiceState>(
              bloc: context.read<ServiceBloc>()..add(FetchServiceDataEvent()),
              builder: (context, state) {
                if (state is ServiceLoading) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Assets.lottie.loading
                          .lottie(width: 100, height: 100, fit: BoxFit.cover),
                    ),
                  );
                } else if (state is ServiceLoaded) {
                  if (state.serviceData.isEmpty) {
                    return SliverFillRemaining(
                      child: Center(child: Assets.lottie.not.lottie()),
                    );
                  }
                  return SliverList.builder(
                    itemCount: state.serviceData.length,
                    itemBuilder: (BuildContext context, int index) {
                      final service = state.serviceData[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: ServiceCard(service: service),
                      );
                    },
                  );
                } else if (state is ServiceError) {
                  return SliverFillRemaining(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.message,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.montserratMedium,
                        ),
                        const SizedBox(height: 15),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: AppColor.buttonColor,
                          ),
                          onPressed: () {
                            context.read<BannerCubit>().getBanners();
                            context.read<ServiceBloc>().add(
                                  FetchServiceDataEvent(),
                                );
                          },
                          child: Center(
                            child: Text(
                              "Qayta urinish",
                              style: AppTextStyle.montserratMedium.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return const SliverFillRemaining(
                    child: Center(child: Text('No data available')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCardShimmer extends StatelessWidget {
  const ServiceCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 10.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 180.0,
                color: Colors.grey[300],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 16.0,
                      width: double.infinity * 0.7,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      height: 14.0,
                      width: double.infinity * 0.5,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(height: 4.0),
                    Container(
                      height: 14.0,
                      width: double.infinity * 0.3,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
