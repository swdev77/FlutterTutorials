library dashboard;

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_dashboard_project_management/app/constants/app_constants.dart';
import 'package:responsive_dashboard_project_management/app/shared_components/progress_card.dart';
import 'package:responsive_dashboard_project_management/app/shared_components/progress_report_card.dart';
import 'package:responsive_dashboard_project_management/app/shared_components/project_card.dart';
import 'package:responsive_dashboard_project_management/app/shared_components/search_field.dart';
import 'package:responsive_dashboard_project_management/app/shared_components/selection_button.dart';
import 'package:responsive_dashboard_project_management/app/shared_components/today_text.dart';
import 'package:responsive_dashboard_project_management/app/shared_components/upgrade_premium_card.dart';
import '../../../../shared_components/header_text.dart';

part '../../bindings/dashboard_binding.dart';

part '../../controllers/dashboard_controller.dart';

part '../components/header.dart';
part '../components/sidebar.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
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
              ],
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              color: Colors.green,
            ),
          )
        ],
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
}
