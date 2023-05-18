import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_recommendation/core/constants.dart';
import 'package:movie_recommendation/features/movie_flow/result/result_screen.dart';

import '../../../core/widgets/primary_button.dart';

class YearsBackScreen extends StatefulWidget {
  const YearsBackScreen({
    super.key,
    required this.nextPage,
    required this.previousPage,
  });

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<YearsBackScreen> createState() => _YearsBackScreenState();
}

class _YearsBackScreenState extends State<YearsBackScreen> {
  double yearsBack = 10;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.previousPage,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'How many years back should we check for?',
              style: theme.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  '${yearsBack.ceil()}',
                  style: theme.textTheme.headlineMedium,
                ),
                Text(
                  'Years back',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color:
                        theme.textTheme.headlineMedium?.color!.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Slider(
              value: yearsBack,
              onChanged: (value) => setState(() => yearsBack = value),
              min: 0,
              max: 70,
              divisions: 70,
              label: '${yearsBack.ceil()}',
            ),
            const Spacer(),
            PrimaryButton(
              onPress: () => Navigator.of(context).push(ResultScreen.route()),
              text: 'Amazing',
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
