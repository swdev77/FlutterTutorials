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

  List<TaskCardData> getAllTask() {
    return [
      TaskCardData(
        title: 'Landing page UI Design',
        dueDay: 2,
        profilContributors: [
          AssetImage(ImageRasterPath.avatar1),
          AssetImage(ImageRasterPath.avatar2),
          AssetImage(ImageRasterPath.avatar3),
          AssetImage(ImageRasterPath.avatar4),
        ],
        type: TaskType.todo,
        totalComments: 50,
        totalContributors: 30,
      ),
      TaskCardData(
        title: 'Landing page UI Design',
        dueDay: -1,
        profilContributors: [
          AssetImage(ImageRasterPath.avatar5),
          AssetImage(ImageRasterPath.avatar6),
          AssetImage(ImageRasterPath.avatar7),
          AssetImage(ImageRasterPath.avatar8),
        ],
        type: TaskType.inProgress,
        totalComments: 40,
        totalContributors: 20,
      ),
      TaskCardData(
        title: 'Landing page UI Design',
        dueDay: 1,
        profilContributors: [
          AssetImage(ImageRasterPath.avatar6),
          AssetImage(ImageRasterPath.avatar7),
          AssetImage(ImageRasterPath.avatar5),
          AssetImage(ImageRasterPath.avatar4),
        ],
        type: TaskType.done,
        totalComments: 55,
        totalContributors: 34,
      ),
    ];
  }
}
