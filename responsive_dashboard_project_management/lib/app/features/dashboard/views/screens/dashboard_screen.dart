library dashboard;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared_components/header_text.dart';

part '../../bindings/dashboard_binding.dart';

part '../../controllers/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: HeaderText('Dashboard'),
      ),
    );
  }
}
