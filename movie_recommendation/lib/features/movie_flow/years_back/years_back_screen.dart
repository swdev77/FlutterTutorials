import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommendation/core/constants.dart';
import 'package:movie_recommendation/features/movie_flow/movie_flow_controller.dart';
import 'package:movie_recommendation/features/movie_flow/result/result_screen.dart';

import '../../../core/widgets/primary_button.dart';

class YearsBackScreen extends ConsumerWidget {
  const YearsBackScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed:
              ref.read(movieFlowControllerProvider.notifier).previousPage,
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
                  '${ref.watch(movieFlowControllerProvider).yearsBack}',
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
              value:
                  ref.watch(movieFlowControllerProvider).yearsBack.toDouble(),
              onChanged: (value) => ref
                  .watch(movieFlowControllerProvider.notifier)
                  .updateYearsBack(value.toInt()),
              min: 0,
              max: 70,
              divisions: 70,
              label: '${ref.watch(movieFlowControllerProvider).yearsBack}',
            ),
            const Spacer(),
            PrimaryButton(
              onPressed: () async {
                await ref
                    .watch(movieFlowControllerProvider.notifier)
                    .getRecommendedMovie();
                Navigator.of(context).push(ResultScreen.route());
              },
              isLoading: ref.watch(movieFlowControllerProvider).movie is AsyncLoading,
              text: 'Amazing',
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
