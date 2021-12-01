part of dashboard;

class _ProfileTile extends StatelessWidget {
  const _ProfileTile(
      {required this.data, required this.onPressedNotification, Key? key})
      : super(key: key);

  final _Profile data;
  final Function() onPressedNotification;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: CircleAvatar(backgroundImage: data.photo),
      title: Text(data.name,
          style: TextStyle(
            fontSize: 14,
            color: kFontColorPallets[0],
          )),
      subtitle: Text(
        data.email,
        style: TextStyle(
          fontSize: 12,
          color: kFontColorPallets[2],
        ),
      ),
      trailing: IconButton(
        icon: const Icon(EvaIcons.bellOutline),
        tooltip: 'notification',
        onPressed: onPressedNotification,
      ),
    );
  }
}
