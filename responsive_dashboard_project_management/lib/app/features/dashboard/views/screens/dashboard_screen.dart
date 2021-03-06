library dashboard;

import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:responsive_dashboard_project_management/app/features/dashboard/views/components/get_premium_card.dart';
import 'package:responsive_dashboard_project_management/app/shared_components/chatting_card.dart';
import 'package:responsive_dashboard_project_management/app/shared_components/list_profil_image.dart';
import 'package:responsive_dashboard_project_management/app/shared_components/responsive_builder.dart';
import 'package:responsive_dashboard_project_management/app/shared_components/task_card.dart';
import '../../../../constants/app_constants.dart';
import '../../../../shared_components/progress_card.dart';
import '../../../../shared_components/progress_report_card.dart';
import '../../../../shared_components/project_card.dart';
import '../../../../shared_components/search_field.dart';
import '../../../../shared_components/selection_button.dart';
import '../../../../shared_components/today_text.dart';
import '../../../../shared_components/upgrade_premium_card.dart';
import '../../../../utils/helpers/app_helpers.dart';
import '../../../../shared_components/header_text.dart';

part '../../models/profile.dart';

part '../../bindings/dashboard_binding.dart';

part '../../controllers/dashboard_controller.dart';

part '../components/active_project_card.dart';
part '../components/header.dart';
part '../components/overview_header.dart';
part '../components/sidebar.dart';
part '../components/profile_tile.dart';
part '../components/team_member.dart';
part '../components/recent_messages.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: desktopView(),
    );
  }

  Widget desktopView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 3,
          child: _Sidebar(data: controller.getSelectedProject()),
        ),
        Flexible(
          flex: 9,
          child: Column(
            children: [
              const SizedBox(height: kSpacing),
              _buildHeader(),
              const SizedBox(height: kSpacing),
              _buildProgress(),
              const SizedBox(height: kSpacing),
              _buildTaskOverview(data: controller.getAllTask()),
              const SizedBox(height: kSpacing),
              _buildActiveProject(data: controller.getActiveProjectData()),
            ],
          ),
        ),
        Flexible(
          flex: 4,
          child: Column(
            children: [
              const SizedBox(height: kSpacing),
              _buildProfile(data: controller.getProfile()),
              const Divider(thickness: 1),
              const SizedBox(height: kSpacing),
              _buildTeamMember(data: controller.getMembers()),
              const SizedBox(height: kSpacing),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kSpacing),
                child: GetPremiumCard(onPressed: () {}),
              ),
              const SizedBox(height: kSpacing),
              const Divider(thickness: 1),
              _buildRecentMessages(data: controller.getChatting()),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kSpacing),
      child: _Header(),
    );
  }

  Widget _buildProgress() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Row(
        children: [
          Flexible(
            flex: 5,
            child: ProgressCard(
              data: const ProgressCardData(
                totalUndone: 10,
                totalTaskInProgress: 2,
              ),
              onPressedCheck: () => {},
            ),
          ),
          const SizedBox(width: kSpacing / 2),
          Flexible(
            flex: 4,
            child: ProgressReportCard(
              data: ProgressReportCardData(
                percent: .3,
                title: '1st Sprint',
                task: 3,
                doneTask: 5,
                undoneTask: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskOverview({
    required List<TaskCardData> data,
    int crossAxisCount = 6,
    int crossAxisCellCount = 2,
  }) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: crossAxisCount,
      itemCount: data.length + 1,
      itemBuilder: (context, index) {
        return (index == 0)
            ? _OverviewHeader(
                onSelected: (task) {},
              )
            : TaskCard(
                data: data[index - 1],
                onPressedMore: () {},
                onPressedTask: () {},
                onPressedContirbutors: () {},
                onPressedComments: () {},
              );
      },
      staggeredTileBuilder: (index) => StaggeredTile.fit(
        (index == 0) ? crossAxisCount : crossAxisCellCount,
      ),
    );
  }

  Widget _buildActiveProject({required List<ProjectCardData> data}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacing),
        child: _ActiveProjectCard(data: data, onPressedAll: () {}),
      );

  Widget _buildProfile({required _Profile data}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacing),
        child: _ProfileTile(data: data, onPressedNotification: () {}),
      );

  Widget _buildTeamMember({required List<ImageProvider> data}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TeamMember(
              onPressedAdd: () {},
              totalMember: data.length,
            ),
            const SizedBox(height: kSpacing),
            ListProfilImage(
              maxImages: 6,
              images: data,
            ),
          ],
        ),
      );

  Widget _buildRecentMessages({required List<ChattingCardData> data}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSpacing),
          child: _RecentMessages(onPressedMore: () {}),
        ),
        const SizedBox(height: kSpacing),
        ...data.map((e) => ChattingCard(data: e, onPressed: () {})),
      ],
    );
  }
}
