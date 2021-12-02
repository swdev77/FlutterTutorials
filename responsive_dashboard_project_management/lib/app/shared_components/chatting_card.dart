import 'package:flutter/material.dart';
import 'package:responsive_dashboard_project_management/app/constants/app_constants.dart';

class ChattingCardData {
  final ImageProvider image;
  final bool isOnline;
  final String name;
  final String lastMessage;
  final bool isRead;
  final int totalUnread;

  ChattingCardData({
    required this.image,
    required this.isOnline,
    required this.name,
    required this.lastMessage,
    required this.isRead,
    required this.totalUnread,
  });
}

class ChattingCard extends StatelessWidget {
  const ChattingCard({
    required this.data,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final ChattingCardData data;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: kSpacing),
          leading: Stack(
            children: [
              CircleAvatar(backgroundImage: data.image),
              CircleAvatar(
                backgroundColor: data.isOnline ? Colors.green : Colors.grey,
                radius: 5,
              )
            ],
          ),
          title: Text(data.name,
              style: TextStyle(
                fontSize: 14,
                color: kFontColorPallets[0],
              )),
          subtitle: Text(
            data.lastMessage,
            style: TextStyle(
              fontSize: 12,
              color: kFontColorPallets[2],
            ),
          ),
          trailing: (!data.isRead && data.totalUnread > 1)
              ? _notif(data.totalUnread)
              : Icon(
                  Icons.check,
                  color: data.isOnline ? Colors.green : Colors.grey,
                ),
          onTap: onPressed,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        const Divider(),
      ],
    );
  }

  Widget _notif(int total) {
    return (total <= 0)
        ? Container()
        : Container(
            height: 30,
            width: 30,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: kNotifColor,
            ),
            alignment: Alignment.center,
            child: Text(
              (total > 99) ? '99+' : '$total',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          );
  }
}
