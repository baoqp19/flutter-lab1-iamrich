import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const IAmRichApp());
}

class IAmRichApp extends StatelessWidget {
  const IAmRichApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I Am Rich',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB9EAF1),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF0B1423),
      ),
      home: const RichScreen(),
    );
  }
}

class RichScreen extends StatelessWidget {
  const RichScreen({super.key});

  static const _gold = Color(0xFFD9BF8A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1423),
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.diamond_outlined, color: _gold, size: 20),
            SizedBox(width: 10),
            Text(
              'I AM RICH',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 4,
                color: _gold,
              ),
            ),
          ],
        ),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.3),
            radius: 0.9,
            colors: [Color(0xFF1A3045), Color(0xFF0B1423)],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Allow scrolling on short screens and at larger text sizes.
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: (constraints.maxHeight - 64).clamp(
                      0,
                      double.infinity,
                    ),
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 420),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'A LITTLE BRILLIANCE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _gold,
                              fontSize: 11,
                              letterSpacing: 3,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 32),
                          const _DiamondArtwork(),
                          const SizedBox(height: 36),
                          Semantics(
                            header: true,
                            child: const Text(
                              'I Am Rich',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1,
                                height: 1.2,
                                color: Color(0xFFF6F0E6),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          const Text(
                            'Shine in your own way.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFB0BECC),
                              fontSize: 16,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 32),
                          const ExcludeSemantics(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 36,
                                  child: Divider(color: Color(0xFF645D50)),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Icon(
                                    CupertinoIcons.sparkles,
                                    color: _gold,
                                    size: 18,
                                  ),
                                ),
                                SizedBox(
                                  width: 36,
                                  child: Divider(color: Color(0xFF645D50)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _DiamondArtwork extends StatelessWidget {
  const _DiamondArtwork();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 280,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF3D4B55)),
        gradient: const RadialGradient(
          colors: [Color(0xFF315468), Color(0x001A3045)],
        ),
      ),
      child: Image.asset(
        'images/diamond.png',
        fit: BoxFit.contain,
        semanticLabel: 'A sparkling blue diamond',
      ),
    );
  }
}
