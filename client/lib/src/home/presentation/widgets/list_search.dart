import 'package:client/src/home/domain/entities/google_entity.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListSearch extends StatelessWidget {
  final List<GoogleEntity> entity;
  const ListSearch({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: entity.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                entity[i].title ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () async {
                  if (await canLaunchUrl(
                      Uri.parse(entity[i].link ?? ''))) {
                    await launchUrl(Uri.parse(entity[i].link ?? ''));
                  }
                },
                child: Text(
                  entity[i].link ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
