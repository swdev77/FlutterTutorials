import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_dashboard_project_management/app/constants/app_constants.dart';

class ProgressCardData {
  final int totalUndone;
  final int totalTaskInProgress;

  const ProgressCardData({
    required this.totalUndone,
    required this.totalTaskInProgress,
  });
}

class ProgressCard extends StatelessWidget {
  const ProgressCard(
      {required this.data, 
      required this.onPressedCheck, 
      Key? key})
      : super(key: key);

  final ProgressCardData data;
  final Function() onPressedCheck;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(kBorderRadius),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Transform.translate(
                offset: const Offset(10, 30),
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: SvgPicture.asset(
                    ImageVectorPath.happy2,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kSpacing, left: kSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You have ${data.totalUndone} Undone tasks',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  '${data.totalTaskInProgress} tasks are in progress',
                  style: TextStyle(color: kFontColorPallets[1]),
                ),
                const SizedBox(height: kSpacing),
                ElevatedButton(
                  onPressed: onPressedCheck,
                  child: const Text('Check'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
