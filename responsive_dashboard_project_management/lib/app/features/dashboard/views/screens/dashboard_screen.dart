library dashboard;

import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 4,
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
                ],
              ),
            )
          ],
        ),
      ),
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

  Widget _buildTaskOverview({required List<TaskCardData> data}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
        children: [
          _OverviewHeader(
            onSelected: (task) {},
          ),
          const SizedBox(height: kSpacing),
          Row(
            children: data
                .map((e) => Expanded(
                      child: TaskCard(
                        data: e,
                        onPressedComments: () {},
                        onPressedContirbutors: () {},
                        onPressedMore: () {},
                        onPressedTask: () {},
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget _buildActiveProject({required List<ProjectCardData> data}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: _ActiveProjectCard(data: data, onPressedAll: () {}),
    );
  }

  Widget _buildProfile({required _Profile data}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacing),
        child: _ProfileTile(data: data, onPressedNotification: () {}),
      );
}
