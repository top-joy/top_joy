import 'package:flutter/material.dart';
import 'package:top_joy/data/service_data/models/service_models.dart';
import 'package:top_joy/presentation/home/widgets/service_data_card.dart';

class ServiceDetailsBottomSheet extends StatelessWidget {
  final List<ServiceModels> services;

  const ServiceDetailsBottomSheet({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.2,
      maxChildSize: 0.9,
      expand: false,
      builder: (_, controller) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: controller,
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    final service = services[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 8.0),
                      child: ServiceCard(service: service),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
