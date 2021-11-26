part of dashboard;

class DashboardController extends GetxController {
  ProjectCardData getSelectedProject() {
    return ProjectCardData(
      percent: .3,
      projectImage: const AssetImage(ImageRasterPath.logo1),
      projectName: 'Marketplace Mobile',
      releaseTime: DateTime.now(),
    );
  }
}
