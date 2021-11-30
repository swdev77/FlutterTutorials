part of dashboard;

class _ActiveProjectCard extends StatelessWidget {
  const _ActiveProjectCard({
    required this.data,
    required this.onPressedAll,
    Key? key,
  }) : super(key: key);

  final List<ProjectCardData> data;
  final Function() onPressedAll;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kSpacing),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _title('My Active Project'),
                _seeAllButtion(onPressed: onPressedAll),
              ],
            ),
            const Divider(thickness: 1, height: kSpacing),
            const SizedBox(height: kSpacing),
            Row(
              children: data
                  .map((e) => Expanded(child: ProjectCard(data: e)))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget _title(String data) => Text(
        data,
        style: const TextStyle(fontWeight: FontWeight.bold),
      );

  Widget _seeAllButtion({required Function() onPressed}) => TextButton(
        onPressed: onPressed,
        child: const Text('See All'),
        style: TextButton.styleFrom(primary: kFontColorPallets[1]),
      );
}
