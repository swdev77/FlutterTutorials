import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_recommendation/core/widgets/primary_button.dart';

void main() {
  testWidgets(
      'Given primary button When loading is true Then find progress indicator',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: PrimaryButton(
          onPressed: () {},
          text: '',
          isLoading: true,
        ),
      ),
    );

    final loadingIndicationFinder = find.byType(CircularProgressIndicator);
    expect(loadingIndicationFinder, findsOneWidget);
  });

  testWidgets(
      'Given primary button When loading is false Then finds no progress indicator',
      (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: PrimaryButton(
          onPressed: () {},
          text: 'test',
          isLoading: false,
        ),
      ),
    );
    final loadingIndicationFinder = find.byType(CircularProgressIndicator);
    expect(loadingIndicationFinder, findsNothing);
    expect(find.text('test'), findsOneWidget);
  });
}
