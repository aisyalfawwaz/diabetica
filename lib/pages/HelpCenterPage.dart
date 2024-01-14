import 'package:flutter/material.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Frequently Asked Questions',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              FAQItem(
                question: 'What is Diabetica?',
                answer:
                    'Diabetica is a health management app designed for individuals with diabetes to monitor and manage their health condition.',
                icon: Icons.info,
              ),
              FAQItem(
                question: 'How to track blood sugar levels?',
                answer:
                    'You can track your blood sugar levels by entering the readings in the Diabetica app. Go to the "Trackers" section and select "Blood Sugar" to add your readings.',
                icon: Icons.favorite,
              ),
              FAQItem(
                question: 'Can I set medication reminders?',
                answer:
                    'Yes, Diabetica allows you to set custom medication reminders. Go to the "Reminders" section to add and manage your medication reminders.',
                icon: Icons.alarm,
              ),
              FAQItem(
                question: 'Is my data secure?',
                answer:
                    'Diabetica takes user privacy seriously. All your health data is securely stored and only accessible by you. We use encryption to protect your sensitive information.',
                icon: Icons.security,
              ),
              SizedBox(height: 32),
              Text(
                'Contact Support',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'If you have any further questions or need assistance, please contact our support team at:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'support@diabetica.com',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;
  final IconData icon;

  const FAQItem({super.key, 
    required this.question,
    required this.answer,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: ListTile(
        title: Text(
          question,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: Icon(icon),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(answer, style: const TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}
