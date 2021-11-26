library dashboard;

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_dashboard_project_management/app/constants/app_constants.dart';
import 'package:responsive_dashboard_project_management/app/shared_components/project_card.dart';
import 'package:responsive_dashboard_project_management/app/shared_components/selection_button.dart';
import 'package:responsive_dashboard_project_management/app/shared_components/upgrade_premium_card.dart';
import '../../../../shared_components/header_text.dart';

part '../../bindings/dashboard_binding.dart';

part '../../controllers/dashboard_controller.dart';

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
            child: Container(
              color: Colors.blue,
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
}
