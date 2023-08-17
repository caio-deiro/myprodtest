import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myprodtest/src/home/controller/home_controller.dart';
import 'package:myprodtest/src/shared/components/text_form_field_component.dart';

import '../../../shared/constants/app_colors.dart';

class ReposTab extends StatelessWidget {
  const ReposTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      return SingleChildScrollView(
        child: controller.loading.value
            ? Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 35.0),
                    child: TextFormFieldComponent(
                      onChanged: (value) => controller.filterRepoList(value),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.githubRepoList.length,
                      itemBuilder: (context, index) {
                        var repo = controller.githubRepoList[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(repo.name ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.apply(color: Colors.blue)),
                              SizedBox(height: 10),
                              Text(repo.description ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.apply(color: AppColors.warmGrey)),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: AppColors.brownishGrey,
                                  ),
                                  SizedBox(width: 2),
                                  Text(repo.stargazers_count.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.apply(color: AppColors.warmGrey)),
                                  SizedBox(width: 15),
                                  Icon(
                                    Icons.fork_right,
                                    color: AppColors.brownishGrey,
                                  ),
                                  SizedBox(width: 2),
                                  Text(repo.forks.toString()),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: Divider(
                                  thickness: 2,
                                  color: AppColors.paleGrey,
                                ),
                              )
                            ],
                          ),
                        );
                      })
                ],
              ),
      );
    });
  }
}
