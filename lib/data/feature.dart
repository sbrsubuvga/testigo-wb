import 'package:flutter/cupertino.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Feature {
  final String title;
  final String description;
  final IconData icon; // Optional icon representation (e.g., emoji or asset path)

  Feature({
    required this.title,
    required this.description,
    required this.icon,
  });
}

// Example usage
final List<Feature> features = [
  Feature(
    icon: LucideIcons.testTube,
    title: '🧪 API-Driven Testing',
    description: 'Post a test payload to /testing/start and TestiGO runs it automatically using Puppeteer behind the scenes.',
  ),
  Feature(
    icon: LucideIcons.chrome,
    title: '🧩 Chrome Extension for Test Generation',
    description: 'Non-technical users can record their browser actions via the Chrome extension. No manual JSON editing required.',
  ),
  Feature(
    icon: LucideIcons.building,
    title: '🏗️ Self-Hostable',
    description: 'Deploy on your own infrastructure. No external dependencies. Full control over your data, tests, and test environment.',
  ),
  Feature(
    icon: LucideIcons.clock,
    title: '🕒 Timeout and Wait Support',
    description: 'Supports wait strategies like networkidle2 to ensure elements and actions are fully loaded before moving on.',
  ),
  Feature(
    icon: LucideIcons.fileJson,
    title: '📋 Simple JSON Structure',
    description: 'All test steps are sent in a clean, declarative format. Easy to version, reuse, and debug.',
  ),
  Feature(
    icon: LucideIcons.doorOpen,
    title: '🔓 Open Source',
    description: 'MIT Licensed. Contribute or customize it freely for your needs.',
  ),
];

class Working {
  final String title;
  final String description;

  Working({
    required this.title,
    required this.description,
  });
}

// Example usage
final List<Working> works = [
  Working(
    title: '🛠️ Install the Chrome Extension',
    description: 'Use the extension to record clicks, inputs, hovers, and form submissions.',
  ),
  Working(
    title: '📤 Export the JSON',
    description: 'The extension generates a JSON body that describes your recorded actions.',
  ),
  Working(
    title: '📡 Send to API Endpoint',
    description: 'POST the JSON to /testing/start with the desired url, timeout, and actions.',
  ),
  Working(
    title: '🤖 Testigo Executes via Puppeteer',
    description: 'The server headlessly launches Chrome, executes actions, and waits as instructed.',
  ),
];