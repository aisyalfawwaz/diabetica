import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_onboarding/cupertino_onboarding.dart';

class DiabeticaOnboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoOnboarding(
      onPressedOnLastPage: () => Navigator.pop(context),
      pages: [
        WhatsNewPage(
          title: const Text("What's New in Diabetica"),
          features: [
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.heart_fill,
                color: CupertinoColors.systemRed.resolveFrom(context),
              ),
              title: const Text('Health Monitoring'),
              description: const Text(
                'Monitor your health and keep track of important metrics.',
              ),
            ),
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.doc_append,
                color: CupertinoColors.systemRed.resolveFrom(context),
              ),
              title: const Text('Personalized Recommendations'),
              description: const Text(
                'Receive personalized recommendations for better health.',
              ),
            ),
          ],
        ),
        const CupertinoOnboardingPage(
          title: Text('Simple and Intuitive'),
          body: Icon(
            CupertinoIcons.bolt_fill,
            size: 200,
          ),
        ),
        const CupertinoOnboardingPage(
          title: Text('Easy to Use'),
          body: Icon(
            CupertinoIcons.gauge,
            size: 200,
          ),
        ),
      ],
    );
  }
}
