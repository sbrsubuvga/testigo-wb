import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ContentPadding extends StatelessWidget {
  final Widget child;
  const ContentPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return   ShadResponsiveBuilder(
      builder: (context, breakpoint) {
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: switch(breakpoint){
          ShadBreakpointXXL() => 300,
        ShadBreakpointXL() => 300,
        ShadBreakpointLG() => 200,
        ShadBreakpointMD() => 100,
        _ => 50, // Default case for other breakpoints
          }),
          child: child,
        );
      }

    );
  }
}

class SliverContentPadding extends StatelessWidget {
  final Widget child;
  const SliverContentPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return   ShadResponsiveBuilder(
        builder: (context, breakpoint) {
          return SliverPadding(
            padding: EdgeInsets.symmetric(
                horizontal: switch(breakpoint){
              ShadBreakpointXXL() => 300,
              ShadBreakpointXL() => 300,
              ShadBreakpointLG() => 200,
              ShadBreakpointMD() => 100,
              _ => 50, // Default case for other breakpoints
            },
            vertical: switch(breakpoint){
              ShadBreakpointXXL() => 20,
              ShadBreakpointXL() => 20,
              ShadBreakpointLG() => 10,
              ShadBreakpointMD() => 5,
              _ => 5, // Default case for other breakpoints
            },),

            sliver: child,
          );
        }

    );
  }
}