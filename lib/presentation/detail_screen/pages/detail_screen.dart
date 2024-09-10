import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_joy/data/service_data/models/service_models.dart';
import 'package:top_joy/presentation/detail_screen/widgets/detail_app_bar.dart';
import 'package:top_joy/presentation/detail_screen/widgets/detail_bottom_bar.dart';
import 'package:top_joy/presentation/detail_screen/widgets/detail_body.dart';

@RoutePage()
class DetailScreen extends StatefulWidget {
  final ServiceModels serviceModels;
  const DetailScreen({super.key, required this.serviceModels});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DetailBottomBar(serviceModels: widget.serviceModels),
      body: CustomScrollView(
        slivers: [
          DetailAppBar(serviceModels: widget.serviceModels),
          SliverToBoxAdapter(
            child: DetailBody(serviceModels: widget.serviceModels),
          ),
        ],
      ),
    );
  }
}
