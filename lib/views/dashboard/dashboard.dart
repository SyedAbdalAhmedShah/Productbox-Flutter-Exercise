import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productbox_flutter_exercise/bloc/cubits/dashboar_cubit/dashboard_cubit.dart';
import 'package:productbox_flutter_exercise/core/components/custom_gap.dart';
import 'package:productbox_flutter_exercise/core/constants/app_colors.dart';
import 'package:productbox_flutter_exercise/core/constants/app_strings.dart';
import 'package:productbox_flutter_exercise/views/dashboard/widgets/post_card.dart';
import 'package:productbox_flutter_exercise/views/dashboard/widgets/story_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late DashboardCubit _dashboardCubit;
  @override
  void initState() {
    _dashboardCubit = BlocProvider.of<DashboardCubit>(context);
    _dashboardCubit.getAllFeedData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 10.h,
                child: ListView.builder(
                    itemCount: _dashboardCubit.feeds.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => StoryCard(
                        storyImage:
                            _dashboardCubit.feeds[index].profileImage ?? "")),
              ),
              Expanded(
                child: ListView.separated(
                    itemCount: _dashboardCubit.feeds.length,
                    separatorBuilder: (ctx, index) => CustomGap(),
                    itemBuilder: (context, index) {
                      return PostCard(
                          postImage:
                              _dashboardCubit.feeds[index].postImage ?? "",
                          userName: _dashboardCubit.feeds[index].userName ??
                              AppStrings.noName,
                          profileImage:
                              _dashboardCubit.feeds[index].profileImage ?? "");
                    }),
              )
            ],
          );
        },
      ),
    );
  }
}
