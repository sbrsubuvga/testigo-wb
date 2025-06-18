import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/widgets/lazy_load_builder.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'common/app_bar.dart';
import 'common/content_padding.dart';
import 'common/my_footer.dart';

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
    List<Widget> section2 = [_mainCol(context),_whatIsTestigo(context)];
    return Scaffold(
      // appBar: MyAppBar(title: 'TestiGO'),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          MyAppBar(title: 'TestiGO'),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return section1[index];
              },
              childCount: section1.length, // Example item count
            ),
          ),
          _featuresBuilder(),

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
                'What is?.',
                style: ShadTheme.of(context).textTheme.h2,
                textAlign: TextAlign.center,
              ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.4),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'This tool lets you describe what you want to do on a website—like filling out forms or clicking buttons—and then automatically does those steps for you. It helps you check if your website works the way you expect, without having to do everything by hand..',
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
            ShadBreakpointXXL() => 4,
            ShadBreakpointXL() => 4,
            ShadBreakpointLG() => 4,
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
                          Icons.featured_play_list,
                          size: 48.0,
                          color: Colors.blueAccent,
                        ).animate().fadeIn(duration: 800.ms),
                        const SizedBox(height: 16.0),
                        Text(
                          'Feature ${index + 1}',
                          style: ShadTheme.of(context).textTheme.h4.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ).animate().fadeIn(duration: 800.ms).slideY(begin: -0.2),
                        const SizedBox(height: 8.0),
                        Text(
                          'Description of feature ${index + 1}.',
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
                childCount: 8,


              )
          );
        },
      ),
    );
  }
}

