import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'common/app_bar.dart';
import 'common/content_padding.dart';
import 'common/my_footer.dart';

class HowItWorks extends StatefulWidget {
  const HowItWorks({super.key});

  @override
  State<HowItWorks> createState() => _HowItWorksState();
}

class _HowItWorksState extends State<HowItWorks> {
  final ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    scrollController.dispose(); // Dispose the scroll controller
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> section1 = [_mainCol(context),_step1(context),_step2(context),_step3(context),_otherInfo(context)];
    return Scaffold(
      // appBar: MyAppBar(title: 'TestiGO'),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          MyAppBar(
              title: 'TestiGO'
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return section1[index];
              },
              childCount: section1.length, // Example item count
            ),
          ),
          SliverToBoxAdapter(
            child: MyFooterBar(),
          ),
        ],
      ),
    );
  }



  Container _mainCol(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey.withOpacity(0.1),
            Colors.grey.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ContentPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'How TestiGo Works',
              style: ShadTheme.of(context).textTheme.h4.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.2),
            const SizedBox(height: 16),
            Text(
              'TestiGo simplifies UI test automation into a three-step process: Record, Send, and Run.',
              style: ShadTheme.of(
                context,
              ).textTheme.large.copyWith(color: Colors.white70),
              textAlign: TextAlign.center,
            ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.3),
            Text(
              'This section walks you through the complete testing flow — from setting up to executing your tests.',
              style: ShadTheme.of(
                context,
              ).textTheme.large.copyWith(color: Colors.white70),
              textAlign: TextAlign.center,
            ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.3),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Add navigation or action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: const Text('Get Started'),
            ).animate().fadeIn(duration: 800.ms, curve: Curves.easeIn).slideY(begin: 0.4),
          ],
        ),
      ),
    );
  }

  Widget _step1(BuildContext context) {
    return ContentPadding(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Step 1: Record Test Steps (No Coding Needed)',
              style: ShadTheme.of(context).textTheme.h2,
              textAlign: TextAlign.center,
            ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.4),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Use the Chrome Extension',
              style: ShadTheme.of(context).textTheme.small.copyWith(
                height: 1.7,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.4),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Non-technical users or QA engineers can easily record test actions using the official LTestigo Chrome Extension.',
              style: ShadTheme.of(context).textTheme.small.copyWith(
                height: 1.7,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.4),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🖱 Actions you can record:',
                  style: ShadTheme.of(context).textTheme.h4.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ).animate().fadeIn(duration: 800.ms),
                const SizedBox(height: 8),
                Text(
                  '• Typing into fields\n'
                      '• Clicking buttons or links\n'
                      '• Hovering over elements\n'
                      '• Waiting for page loads',
                  style: ShadTheme.of(context).textTheme.small.copyWith(
                    height: 1.5,
                  ),
                ).animate().fadeIn(duration: 800.ms),
                const SizedBox(height: 16),
                Text(
                  '📦 Output:',
                  style: ShadTheme.of(context).textTheme.h4.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ).animate().fadeIn(duration: 800.ms),
                const SizedBox(height: 8),
                Text(
                  'A clean, structured JSON file that contains all your actions and target selectors.',
                  style: ShadTheme.of(context).textTheme.small.copyWith(
                    height: 1.5,
                  ),
                ).animate().fadeIn(duration: 800.ms),
                const SizedBox(height: 16),
                Text(
                  '✅ Example action:',
                  style: ShadTheme.of(context).textTheme.h4.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ).animate().fadeIn(duration: 800.ms),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '{ "action": "click", "selector": "button.btn.btn-primary" }',
                    style: ShadTheme.of(context).textTheme.small.copyWith(
                      fontFamily: 'monospace',
                    ),
                  ),
                ).animate().fadeIn(duration: 800.ms),
              ],
            ),
          )

        ],
      ),
    );
  }

  Widget _step2(BuildContext context) {
    return ContentPadding(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Once your test steps are recorded, send the entire JSON object to the API endpoint:',
          style: ShadTheme.of(context).textTheme.h4.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ).animate().fadeIn(duration: 800.ms),
        const SizedBox(height: 16),
        Text(
          'Endpoint:',
          style: ShadTheme.of(context).textTheme.h4.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ).animate().fadeIn(duration: 800.ms),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'POST http://ltestigo/testing/start',
            style: ShadTheme.of(context).textTheme.small.copyWith(
              fontFamily: 'monospace',
            ),
          ),
        ).animate().fadeIn(duration: 800.ms),
        const SizedBox(height: 16),
        Text(
          'Required fields in body:',
          style: ShadTheme.of(context).textTheme.h4.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ).animate().fadeIn(duration: 800.ms),
        const SizedBox(height: 8),
        Text(
          '• url: The URL of the page you want to test.\n'
              '• timeout: Global timeout for the test in milliseconds.\n'
              '• actions: An array of steps the browser will execute.',
          style: ShadTheme.of(context).textTheme.small.copyWith(
            height: 1.5,
          ),
        ).animate().fadeIn(duration: 800.ms),
        const SizedBox(height: 16),
        Text(
          '🛠 Example Request Body:',
          style: ShadTheme.of(context).textTheme.h4.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ).animate().fadeIn(duration: 800.ms),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '{\n'
                '  "url": "http://localhost:4200",\n'
                '  "timeout": 60000,\n'
                '  "actions": [\n'
                '    { "action": "type", "selector": "#username", "value": "sb@lithos.in" },\n'
                '    { "action": "click", "selector": "button.btn.btn-primary" }\n'
                '  ]\n'
                '}',
            style: ShadTheme.of(context).textTheme.small.copyWith(
              fontFamily: 'monospace',
            ),
          ),
        ).animate().fadeIn(duration: 800.ms),
        const SizedBox(height: 16),
        Text(
          'You can send this via:',
          style: ShadTheme.of(context).textTheme.h4.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ).animate().fadeIn(duration: 800.ms),
        const SizedBox(height: 8),
        Text(
          '• Postman\n'
              '• cURL\n'
              '• Any HTTP client\n'
              '• Your own custom dashboard',
          style: ShadTheme.of(context).textTheme.small.copyWith(
            height: 1.5,
          ),
        ).animate().fadeIn(duration: 800.ms),
      ],
    ),
    );
  }

Widget _step3(BuildContext context) {
    return ContentPadding(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Step 3: LTestigo Executes the Test with Puppeteer',
              style: ShadTheme.of(context).textTheme.h2,
              textAlign: TextAlign.center,
            ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.4),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Behind the scenes, LTestigo launches a headless Chrome browser using Puppeteer.',
              style: ShadTheme.of(context).textTheme.small.copyWith(
                height: 1.7,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.4),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🔧 What happens:',
                  style: ShadTheme.of(context).textTheme.h4.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ).animate().fadeIn(duration: 800.ms),
                const SizedBox(height: 8),
                Text(
                  '• Navigates to the specified URL\n'
                  '• Performs actions in the given order\n'
                  '• Waits for defined events like networkidle2 to avoid premature steps\n'
                  '• Captures logs, errors, and screenshots (if configured)',
                  style: ShadTheme.of(context).textTheme.small.copyWith(
                    height: 1.5,
                  ),
                ).animate().fadeIn(duration: 800.ms),
                const SizedBox(height: 16),
                Text(
                  '⚡ Speed:',
                  style: ShadTheme.of(context).textTheme.h4.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ).animate().fadeIn(duration: 800.ms),
                const SizedBox(height: 8),
                Text(
                  'Tests are run quickly and consistently in a headless environment.',
                  style: ShadTheme.of(context).textTheme.small.copyWith(
                    height: 1.5,
                  ),
                ).animate().fadeIn(duration: 800.ms),
                const SizedBox(height: 16),
                Text(
                  '📊 Output:',
                  style: ShadTheme.of(context).textTheme.h4.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ).animate().fadeIn(duration: 800.ms),
                const SizedBox(height: 8),
                Text(
                  'The system returns an execution report or status via API response.',
                  style: ShadTheme.of(context).textTheme.small.copyWith(
                    height: 1.5,
                  ),
                ).animate().fadeIn(duration: 800.ms),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _otherInfo(BuildContext context) {
    return ContentPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '💬 Wait Strategies & Timing Control',
            style: ShadTheme.of(context).textTheme.h4.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(duration: 800.ms),
          const SizedBox(height: 8),
          Text(
            'You can fine-tune when actions execute using the `waiting_after` key. This ensures your test does not move forward until the page or element is ready.',
            style: ShadTheme.of(context).textTheme.small.copyWith(
              height: 1.5,
            ),
          ).animate().fadeIn(duration: 800.ms),
          const SizedBox(height: 16),
          Text(
            '🧭 Example:',
            style: ShadTheme.of(context).textTheme.h4.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(duration: 800.ms),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '{\n'
              '  "action": "click",\n'
              '  "selector": "#submit",\n'
              '  "waiting_after": { "for": "networkidle2", "timeout": 10000 }\n'
              '}',
              style: ShadTheme.of(context).textTheme.small.copyWith(
                fontFamily: 'monospace',
              ),
            ),
          ).animate().fadeIn(duration: 800.ms),
          const SizedBox(height: 16),
          Text(
            '🛠 Custom Actions (Advanced)',
            style: ShadTheme.of(context).textTheme.h4.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(duration: 800.ms),
          const SizedBox(height: 8),
          Text(
            'You can extend LTestigo to:\n'
            '• Add screenshot steps\n'
            '• Inject custom JavaScript\n'
            '• Integrate with CI/CD tools (e.g., GitHub Actions)',
            style: ShadTheme.of(context).textTheme.small.copyWith(
              height: 1.5,
            ),
          ).animate().fadeIn(duration: 800.ms),
          const SizedBox(height: 16),
          Text(
            '🧪 What Happens on the Server',
            style: ShadTheme.of(context).textTheme.h4.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(duration: 800.ms),
          const SizedBox(height: 8),
          Text(
            '• JSON request is received by your self-hosted LTestigo server.\n'
            '• Puppeteer runs your test in a sandboxed browser.\n'
            '• The system follows your actions one by one.\n'
            '• Response is returned with success/failure and optional logs.',
            style: ShadTheme.of(context).textTheme.small.copyWith(
              height: 1.5,
            ),
          ).animate().fadeIn(duration: 800.ms),
        ],
      ),
    );
  }
}

