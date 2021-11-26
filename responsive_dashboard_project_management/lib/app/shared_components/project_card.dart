import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:responsive_dashboard_project_management/app/constants/app_constants.dart';

class ProjectCardData {
  final double percent;
  final String projectName;
  final ImageProvider projectImage;
  final DateTime releaseTime;

  const ProjectCardData({
    required this.percent,
    required this.projectImage,
    required this.projectName,
    required this.releaseTime,
  });
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({required this.data, Key? key}) : super(key: key);
  final ProjectCardData data;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _PercentIndicator(
          percent: data.percent,
          center: _ProfilImge(image: data.projectImage),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TitleText(data.projectName),
              const SizedBox(height: 5),
              Row(
                children: [
                  const _SubtitleText('Release time: '),
                  _ReleaseTimeText(data.releaseTime),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class _PercentIndicator extends StatelessWidget {
  const _PercentIndicator(
      {required this.percent, required this.center, Key? key})
      : super(key: key);

  final double percent;
  final Widget center;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 55,
      lineWidth: 2.0,
      percent: percent,
      center: center,
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Colors.blueGrey,
      progressColor: Theme.of(context).primaryColor,
    );
  }
}

class _ProfilImge extends StatelessWidget {
  const _ProfilImge({required this.image, Key? key}) : super(key: key);
  final ImageProvider image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: image,
      radius: 20,
      backgroundColor: Colors.white,
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText(this.data, {Key? key}) : super(key: key);
  final String data;
  @override
  Widget build(BuildContext context) {
    return Text(
      data.capitalize!,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: kFontColorPallets[0],
        letterSpacing: .8,
      ),
    );
  }
}

class _SubtitleText extends StatelessWidget {
  const _SubtitleText(this.data, {Key? key}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data.capitalize!,
      style: TextStyle(
        fontSize: 11,
        color: kFontColorPallets[2],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _ReleaseTimeText extends StatelessWidget {
  const _ReleaseTimeText(this.date, {Key? key}) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kNotifColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
      child: Text(
        DateFormat.yMMMd().format(date),
        style: const TextStyle(
          fontSize: 9,
          color: Colors.white,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
