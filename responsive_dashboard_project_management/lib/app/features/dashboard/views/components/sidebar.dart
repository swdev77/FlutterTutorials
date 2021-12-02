part of dashboard;

class _Sidebar extends StatelessWidget {
  const _Sidebar({required this.data, Key? key}) : super(key: key);

  final ProjectCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(kSpacing),
              child: ProjectCard(data: data),
            ),
            const Divider(thickness: 1),
            SelectionButton(
              initialSelected: 0,
              data: [
                SelectionButtonData(
                  activeIcon: EvaIcons.grid,
                  icon: EvaIcons.gridOutline,
                  label: 'Dashboard',
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.archive,
                  icon: EvaIcons.archiveOutline,
                  label: 'Reports',
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.calendar,
                  icon: EvaIcons.calendarOutline,
                  label: 'Calendar',
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.email,
                  icon: EvaIcons.emailOutline,
                  label: 'Email',
                  totalNotif: 100,
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.person,
                  icon: EvaIcons.personOutline,
                  label: 'Profile',
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.settings,
                  icon: EvaIcons.settings2,
                  label: 'Setting',
                ),
              ],
              onSelected: (index, value) {},
            ),
            const Divider(thickness: 1),
            const SizedBox(height: kSpacing * 2),
            UpgradePremiumCard(
              onPressed: () {},
            ),
            const SizedBox(height: kSpacing),
          ],
        ),
      ),
    );
  }
}
