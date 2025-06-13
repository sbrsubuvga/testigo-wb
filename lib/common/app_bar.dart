import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.title,
  }) ;

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Row(
               children: [
                 Text(title,style: ShadTheme.of(context).textTheme.h4,),
                 SizedBox(),
               ],
             ),

             Row(
               children: [
                 SizedBox(),
                 NavBar(),
                 SizedBox(),
               ],
             )
           ],
      ),
      actions: [
        SizedBox(width: 50),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ShadButton.ghost(
            onPressed: () {

            },
            leading: Builder(
              builder: (context) {
                return Icon(LucideIcons.github);
              },
            ),
          ),
        ),
        SizedBox(width: 20,)
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
    final theme = ShadTheme.of(context);
    // final square = SizedBox.square(
    //   dimension: 16,
    //   child: Center(
    //     child: SizedBox.square(
    //       dimension: 8,
    //       child: DecoratedBox(
    //         decoration: BoxDecoration(
    //           color: theme.colorScheme.foreground,
    //           shape: BoxShape.circle,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    // final divider = ShadSeparator.horizontal(
    //   margin: const EdgeInsets.symmetric(vertical: 4),
    //   color: theme.colorScheme.muted,
    // );
    return ShadMenubar(
      border: ShadBorder.none,
      items: [
        SizedBox(width: 30,),
         ShadMenubarItem(
          items: [],
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: const Text('Explore'),
          ),
        ),
        SizedBox(width: 30,),
        ShadMenubarItem(
          items: [],
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: const Text('Inspiration'),
          ),
        ),
        SizedBox(width: 30,),
        ShadMenubarItem(
          items: [],
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: const Text('About'),
          ),
        ),
        SizedBox(width: 200,)
      ],
    );
  }
}