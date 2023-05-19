import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_recommendation/core/widgets/primary_button.dart';
import 'package:movie_recommendation/features/movie_flow/genre/list_card.dart';
import 'package:movie_recommendation/features/movie_flow/movie_flow_controller.dart';

import '../../../core/constants.dart';

class GenreScreen extends ConsumerWidget {
  const GenreScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              'Let\'s start with a genre',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(vertical: kListItemsSpacing),
                itemBuilder: (context, index) {
                  final genre =
                      ref.watch(movieFlowControllerProvider).genres[index];
                  return ListCard(
                    genre: genre,
                    onTap: () => ref
                        .watch(movieFlowControllerProvider.notifier)
                        .toggleSelected(genre),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: kMediumSpacing);
                },
                itemCount: ref.read(movieFlowControllerProvider).genres.length,
              ),
            ),
            PrimaryButton(
              onPress: ref.read(movieFlowControllerProvider.notifier).nextPage,
              text: 'Continue',
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
