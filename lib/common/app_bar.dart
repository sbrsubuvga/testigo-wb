import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final breakpoints = ShadTheme.of(context).breakpoints;
    final width = MediaQuery.sizeOf(context).width;
    final breakpoint = breakpoints.fromWidth(width);

    return SliverAppBar(
      automaticallyImplyLeading: false, // Disable back button
      floating: true,
      elevation: 0,
      pinned: true,
      actionsPadding: EdgeInsets.only(
        right: switch (breakpoint) {
          ShadBreakpointXXL() => 300,
          ShadBreakpointXL() => 200,
          ShadBreakpointLG() => 100,
          ShadBreakpointMD() => 50,
          _ => 20, // Default case for other breakpoints
        },
      ),
      titleSpacing: switch (breakpoint) {
        ShadBreakpointXXL() => 300,
        ShadBreakpointXL() => 200,
        ShadBreakpointLG() => 100,
        ShadBreakpointMD() => 50,
        _ => 20, // Default case for other breakpoints
      },
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: ShadTheme.of(context).textTheme.h4,
          ),
          if (breakpoint >= breakpoints.md) NavBar(),
        ],
      ),
      actions: [
        ShadButton.ghost(
          onPressed: () {},
          leading: Icon(LucideIcons.download100),
          child: Text('Download Chrome Extension'),
        ),
        ShadButton.ghost(
          onPressed: () {},
          leading: Icon(LucideIcons.github),
          child: Text('View on GitHub'),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadMenubar(
      border: ShadBorder.none,
      items: [
        SizedBox(width: 10,),
        ShadMenubarItem(
          items: [],
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: const Text('Home'),
          ),
          onTapUp: (tap) {
            Navigator.of(context).pushNamed('/');
          },
        ),
        SizedBox(width: 10,),
        ShadMenubarItem(
          items: [],
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: const Text('How it works'),
          ),
          onTapUp: (tap) {
            Navigator.of(context).pushNamed('/how-it-works');
          },
        ),
        SizedBox(width: 10),
        ShadMenubarItem(
          items: [],
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
          child: const Text('About'),
          ),
          onTapUp: (tap) {
            Navigator.of(context).pushNamed('/');
          },
        ),
        SizedBox(width: 10,),
      ],
    );
  }




}
