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
