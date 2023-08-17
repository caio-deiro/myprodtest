import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myprodtest/src/home/controller/home_controller.dart';

import '../constants/app_colors.dart';

class UserInfoComponent extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final HomeController controller;
  const UserInfoComponent(
      {super.key,
      required this.image,
      required this.name,
      required this.description,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
        child: controller.loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      image,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: 230,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.apply(fontSizeFactor: 1.4),
                            ),
                            Text(
                              description,
                              style:
                                  Theme.of(context).textTheme.bodyMedium?.apply(
                                        fontSizeFactor: .9,
                                        color: AppColors.brownishGrey,
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
