import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/navigation/app_router.gr.dart';
import '../bloc/banner_bloc/banner_cubit.dart';
import '../bloc/banner_bloc/banner_state.dart';
import 'custom_indicator.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  int _currentIndex = 0;
  late PageController _pageController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.93);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        _currentIndex++;
        if (_currentIndex >= 1000) {
          _currentIndex = 0;
          _pageController.jumpToPage(_currentIndex);
        } else {
          _pageController.animateToPage(
            _currentIndex,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocProvider(
        create: (_) => BannerCubit()..getBanners(),
        child: BlocBuilder<BannerCubit, BannerState>(
          builder: (context, state) {
            if (state is BannerLoading) {
            } else if (state is BannerLoaded) {
              final banners = state.banners;
              return Column(
                children: [
                  SizedBox(
                    height: 173,
                    child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          _currentIndex = value % banners.count;
                        });
                      },
                      controller: _pageController,
                      itemCount: banners.count * 1000,
                      itemBuilder: (context, index) {
                        final bannerIndex = index % banners.count;
                        return GestureDetector(
                          onTap: () {
                            context.router.push(
                              DetailRoute(
                                serviceModels:
                                    banners.banners[bannerIndex].service!,
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: CachedNetworkImage(
                                imageUrl: banners.banners[bannerIndex].url,
                                placeholder: (context, url) => Padding(
                                  padding: const EdgeInsets.all(.5),
                                  child: Shimmer(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.grey[300]!,
                                        Colors.grey[100]!,
                                      ],
                                    ),
                                    child: const SizedBox.expand(
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.error_rounded,
                                  color: Colors.red,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomIndicator(
                    currentIndex: _currentIndex % banners.count,
                    itemCount: banners.count,
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
