import 'package:get/get.dart';
import '../../features/dashboard/views/screens/dashboard_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.dashboard;

  static final routes = [
    GetPage(
      name: _Paths.dashboard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
  ];
}
