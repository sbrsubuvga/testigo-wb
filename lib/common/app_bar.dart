import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'content_padding.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.title,
  }) ;

  final String title;

  @override
  Widget build(BuildContext context) {
    final breakpoints = ShadTheme.of(context).breakpoints;
    final width = MediaQuery.sizeOf(context).width;
    final breakpoint = breakpoints.fromWidth(width);


    return ContentPadding(
      child: AppBar(
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(title,style: ShadTheme.of(context).textTheme.h4,),
               if (breakpoint >= breakpoints.md) NavBar(),
             ],
        ),
        actions: [
            ShadButton.ghost(
            onPressed: () {

            },
            leading: Icon(LucideIcons.github),
          ),
        ],
      ),
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
            child: const Text('Explore'),
          ),
        ),
        SizedBox(width: 10,),
        ShadMenubarItem(
          items: [],
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: const Text('Inspiration'),
          ),
        ),
        SizedBox(width: 10),
        ShadMenubarItem(
          items: [],
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: const Text('About'),
          ),
        ),
        SizedBox(width: 10,),
      ],
    );
  }
}