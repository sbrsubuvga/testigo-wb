import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'common/app_bar.dart';
import 'common/content_padding.dart';
import 'common/my_footer.dart';
import 'data/feature.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    scrollController.dispose(); // Dispose the scroll controller
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> section1 = [_mainCol(context),_whatIsTestigo(context)];
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
          _featuresBuilder(),
          _howItWorks(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return section1[index].animate().fadeIn(duration: 800.ms).slideY(begin: 0.2);
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
              'Welcome to TestiGO',
              style: ShadTheme.of(context).textTheme.h4.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.2),
            const SizedBox(height: 16),
            Text(
              'The ultimate web testing solution for your needs.',
              style: ShadTheme.of(
                context,
              ).textTheme.large.copyWith(color: Colors.white70),
              textAlign: TextAlign.center,
            ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.3),
            Text(
              'Automate Your Web UI Testing – Without Writing Code.',
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

  Widget _whatIsTestigo(BuildContext context) {
    return ContentPadding(
      child: SizedBox(
        height: 300,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'What is TestiGo?.',
                style: ShadTheme.of(context).textTheme.h2,
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.4),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Testigo is an open-source, self-hostable testing automation system built on Puppeteer. It allows QA teams, developers, and product owners to create end-to-end UI tests through a simple JSON format, without writing a single line of test code.',
                style: ShadTheme.of(context).textTheme.small.copyWith(
                  height: 1.7,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.4),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Instead of traditional test scripts, users can record interactions using a Chrome Extension and run those as test cases via a single HTTP API endpoint.',
                style: ShadTheme.of(context).textTheme.small.copyWith(
                  height: 1.7,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _featuresBuilder() {

    return SliverContentPadding(
      child: ShadResponsiveBuilder(
        builder: (context, breakpoint) {
          int crossAxisCount = switch (breakpoint) {
            ShadBreakpointXXL() => 3,
            ShadBreakpointXL() => 3,
            ShadBreakpointLG() => 3,
            ShadBreakpointMD() => 2,
            _ => 1, // Default case for other breakpoints
          };
          return SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 1.0,
                mainAxisExtent: 300,
              ),

              delegate:SliverChildBuilderDelegate((context, index) {
                final feature = features[index]; // Assuming you have a list of features
                return Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          feature.icon,
                          size: 48.0,
                          color: Colors.blueAccent,
                        ).animate().fadeIn(duration: 800.ms),
                        const SizedBox(height: 16.0),
                        Text(feature.title,
                          style: ShadTheme.of(context).textTheme.h4.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.2),
                        const SizedBox(height: 8.0),
                        Text(feature.description,
                          style: ShadTheme.of(context).textTheme.small.copyWith(
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2),
                      ],
                    ),
                  ),
                ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.1);
              },
                childCount: features.length, // Example item count


              )
          );
        },
      ),
    );
  }


  Widget _howItWorks() {
    return SliverContentPadding(
      child: ShadResponsiveBuilder(
        builder: (context, breakpoint) {
          int crossAxisCount = switch (breakpoint) {
            ShadBreakpointXXL() => 2,
            ShadBreakpointXL() => 2,
            ShadBreakpointLG() => 1,
            ShadBreakpointMD() => 1,
            _ => 1, // Default case for other breakpoints
          };
          return SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 1.0,
                mainAxisExtent: 150,
              ),

              delegate:SliverChildBuilderDelegate((context, index) {
                final feature = works[index]; // Assuming you have a list of features
                return Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16.0),
                        Text(feature.title,
                          style: ShadTheme.of(context).textTheme.h4.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.2),
                        const SizedBox(height: 8.0),
                        Text(feature.description,
                          style: ShadTheme.of(context).textTheme.small.copyWith(
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2),
                      ],
                    ),
                  ),
                ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.1);
              },
                childCount: works.length, // Example item count


              )
          );
        },
      ),
    );
  }

}

