import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myprodtest/src/home/controller/home_controller.dart';
import 'package:myprodtest/src/home/pages/tabs/repos_tab.dart';
import 'package:myprodtest/src/home/pages/tabs/starred_tab.dart';
import 'package:myprodtest/src/shared/components/user_info_component.dart';
import 'package:myprodtest/src/shared/constants/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController tabController;
  final HomeController controller = Get.find<HomeController>();

  var screens = <Widget>[
    const ReposTab(),
    const StarredTab(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      controller.getUserFromGitHub();
      controller.getStarredUserRepoFromGitHub();
      controller.getUserInfo();
    });
    tabController = TabController(
      length: screens.length,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/icons/github-logo.png',
                fit: BoxFit.cover,
                color: AppColors.white,
              ),
            ),
            backgroundColor: Colors.black,
            title: Row(
              children: [
                Text(
                  'Github ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.apply(color: AppColors.white),
                ),
                Text(
                  ' Profiles',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.apply(color: AppColors.white),
                ),
              ],
            )),
        body: GetX<HomeController>(
            builder: (controller) => Column(
                  children: [
                    UserInfoComponent(
                      controller: controller,
                      image:
                          'https://avatars.githubusercontent.com/u/76565329?v=4',
                      name: controller.githubUser.value.login ?? '',
                      description: controller.githubUser.value.bio ?? '',
                    ),
                    TabBar(
                      onTap: (index) {
                        controller.currentIndex.value = index;
                      },
                      controller: tabController,
                      indicatorColor: AppColors.orange,
                      indicatorWeight: 4,
                      labelColor: controller.currentIndex.value == 0
                          ? Colors.black
                          : AppColors.slateGrey,
                      labelStyle:
                          Theme.of(context).textTheme.bodyLarge?.apply(),
                      unselectedLabelColor: controller.currentIndex.value == 0
                          ? AppColors.slateGrey
                          : AppColors.warmGrey,
                      tabs: [
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Repos'),
                              SizedBox(width: 5),
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.whiteTwo,
                                ),
                                child: Center(
                                    child: Text(
                                  '${controller.githubRepoList.length}',
                                  style: TextStyle(
                                      fontSize: 15, color: AppColors.slateGrey),
                                )),
                              ),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Starred'),
                              SizedBox(width: 5),
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.whiteTwo,
                                ),
                                child: Center(
                                    child: Text(
                                  '${controller.githubStarredList.length}',
                                  style: TextStyle(
                                      fontSize: 15, color: AppColors.slateGrey),
                                )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                        child: TabBarView(
                      controller: tabController,
                      children: screens,
                    ))
                  ],
                )));
  }
}
