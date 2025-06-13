import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'common/app_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'TestiGO'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
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
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'The ultimate web testing solution for your needs.',
                    style: ShadTheme.of(
                      context,
                    ).textTheme.large.copyWith(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
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
                  ),
                ],
              ),
            ),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 200),
                          height: 300,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                child: Text(
                                  'What is?.',
                                  style: ShadTheme.of(context).textTheme.h2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                child: Text(
                                  'This tool lets you describe what you want to do on a website—like filling out forms or clicking buttons—and then automatically does those steps for you. It helps you check if your website works the way you expect, without having to do everything by hand..',
                                  style: ShadTheme.of(context).textTheme.small.copyWith(
                                   height: 1.7
                                  ),
                                  textAlign: TextAlign.center,

                                ),
                              ),

                            ],
                          ),
                        ),


            ShadResponsiveBuilder(
              builder: (context, breakpoint) {
                return switch (breakpoint) {
                  ShadBreakpointTN() => const Text('Tiny'),
                  ShadBreakpointSM() => const Text('Small'),
                  ShadBreakpointMD() => const Text('Medium'),
                  ShadBreakpointLG() => const Text('Large'),
                  ShadBreakpointXL() => const Text('Extra Large'),
                  ShadBreakpointXXL() => const Text('Extra Extra Large'),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
