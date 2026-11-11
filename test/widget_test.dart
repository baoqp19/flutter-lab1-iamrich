import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iamrich/main.dart';

void main() {
  testWidgets('Shows the title, bundled diamond and both icon sets', (
    tester,
  ) async {
    await tester.pumpWidget(const IAmRichApp());
    // Wait for the actual asset decode, which runs outside the test clock.
    await tester.runAsync(() async {
      await precacheImage(
        const AssetImage('images/diamond.png'),
        tester.element(find.byType(Image)),
      );
    });
    await tester.pumpAndSettle();

    expect(find.text('I Am Rich'), findsOneWidget);
    expect(find.byIcon(Icons.diamond_outlined), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.sparkles), findsOneWidget);
    expect(find.bySemanticsLabel('A sparkling blue diamond'), findsOneWidget);
    final image = tester.widget<Image>(find.byType(Image));
    expect((image.image as AssetImage).assetName, 'images/diamond.png');
    expect(tester.takeException(), isNull);
  });

  for (final size in [
    const Size(320, 568),
    const Size(568, 320),
    const Size(1440, 900),
  ]) {
    testWidgets('Layout fits $size with enlarged text', (tester) async {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: MediaQuery(
            data: MediaQueryData(size: size, textScaler: TextScaler.linear(2)),
            child: const RichScreen(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Shine in your own way.'));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      expect(find.text('I Am Rich'), findsOneWidget);
    });
  }
}
