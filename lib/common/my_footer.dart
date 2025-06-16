import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MyFooterBar extends StatelessWidget {
  const MyFooterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      color: Colors.grey[900]?.withOpacity(0.8),
      child: Column(
        children: [
          ShadResponsiveBuilder(
            builder: (context, breakpoint) {
              int columnCount = switch (breakpoint) {
                ShadBreakpointXXL() => 3,
                ShadBreakpointXL() => 3,
                ShadBreakpointLG() => 2,
                ShadBreakpointMD() => 1,
                _ => 1, // Default case for other breakpoints
              };

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columnCount,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 2.0,
                  mainAxisExtent: 180
                ),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Quick Links',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          // Add navigation or action for "Home"
                        },
                        child: Text(
                          'Home',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Add navigation or action for "About Us"
                        },
                        child: Text(
                          'About Us',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Add navigation or action for "Contact"
                        },
                        child: Text(
                          'Contact',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Follow us on:',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(width: 10),
              IconButton(
                icon: Icon(LucideIcons.facebook, color: Colors.blue),
                onPressed: () {
                  // Add navigation or action for Facebook
                },
              ),
              IconButton(
                icon: Icon(LucideIcons.twitter, color: Colors.blue),
                onPressed: () {
                  // Add navigation or action for Twitter
                },
              ),
              IconButton(
                icon: Icon(LucideIcons.instagram, color: Colors.pink),
                onPressed: () {
                  // Add navigation or action for Instagram
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '© 2023 Your Company Name',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              TextButton(
                onPressed: () {
                  // Add navigation or action for "Privacy Policy"
                },
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  // Add navigation or action for "Terms of Service"
                },
                child: Text(
                  'Terms of Service',
                  style: TextStyle(color: Colors.blue),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
