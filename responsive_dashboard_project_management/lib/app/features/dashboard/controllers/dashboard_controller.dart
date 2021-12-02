part of dashboard;

class DashboardController extends GetxController {
  _Profile getProfile() => const _Profile(
        photo: AssetImage(ImageRasterPath.avatar1),
        name: 'Zafarjon Olimov',
        email: 'zafarjon.olimov@mail.net',
      );

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

  List<ProjectCardData> getActiveProjectData() {
    return [
      ProjectCardData(
        percent: .3,
        projectImage: const AssetImage(ImageRasterPath.logo2),
        projectName: 'Taxi Online',
        releaseTime: DateTime.now().add(const Duration(days: 90)),
      ),
      ProjectCardData(
        percent: .5,
        projectImage: const AssetImage(ImageRasterPath.logo1),
        projectName: 'E-Movies Mobile',
        releaseTime: DateTime.now().add(const Duration(days: 60)),
      ),
      ProjectCardData(
        percent: .8,
        projectImage: const AssetImage(ImageRasterPath.logo2),
        projectName: 'Video Converter App',
        releaseTime: DateTime.now().add(const Duration(days: 150)),
      ),
    ];
  }

  List<ImageProvider> getMembers() => [
        const AssetImage(ImageRasterPath.avatar1),
        const AssetImage(ImageRasterPath.avatar2),
        const AssetImage(ImageRasterPath.avatar3),
        const AssetImage(ImageRasterPath.avatar4),
        const AssetImage(ImageRasterPath.avatar5),
        const AssetImage(ImageRasterPath.avatar6),
      ];

  List<ChattingCardData> getChatting() => [
        ChattingCardData(
          image: const AssetImage(ImageRasterPath.avatar5),
          isOnline: false,
          name: 'Ali Ganiev',
          lastMessage: 'i added my new task',
          isRead: false,
          totalUnread: 80,
        ),
        ChattingCardData(
          image: const AssetImage(ImageRasterPath.avatar2),
          isOnline: true,
          name: 'Gani Valies',
          lastMessage: 'i am working on new task',
          isRead: false,
          totalUnread: 100,
        ),
        ChattingCardData(
          image: const AssetImage(ImageRasterPath.avatar4),
          isOnline: false,
          name: 'Ali Ganiev',
          lastMessage: 'yorvordim...',
          isRead: false,
          totalUnread: 50,
        ),
        ChattingCardData(
          image: const AssetImage(ImageRasterPath.avatar3),
          isOnline: false,
          name: 'Vali Aliev',
          lastMessage: 'gap yoq Alijon',
          isRead: true,
          totalUnread: 10,
        ),
        ChattingCardData(
          image: const AssetImage(ImageRasterPath.avatar1),
          isOnline: true,
          name: 'Karim Vallomat',
          lastMessage: 'we`ll have meeting 9:00PM',
          isRead: true,
          totalUnread: 10,
        ),
      ];
}
