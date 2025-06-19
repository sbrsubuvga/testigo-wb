
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'home.dart';

void main() {
  runApp(const App());
}

// Maps the routes to the specific widget page.
final routes = <String, WidgetBuilder>{
  '': (_) => Home(),
  '/alert': (_) => const ShadCard(),

};
final routeToNameRegex = RegExp('(?:^/|-)([a-zA-Z])');

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      routes: routes,
      initialRoute: '',
      themeCurve: Curves.fastLinearToSlowEaseIn,
      theme: ShadThemeData(
        brightness: Brightness.light,

        colorScheme: const ShadZincColorScheme.light(),
        // Example with google fonts
        // textTheme: ShadTextTheme.fromGoogleFont(GoogleFonts.poppins),

        // Example of custom font family
        // textTheme: ShadTextTheme(family: 'UbuntuMono'),

        // Example to disable the secondary border
        // disableSecondaryBorder: true,
      ),
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadZincColorScheme.dark(),
        // Example of custom font family
        // textTheme: ShadTextTheme(family: 'UbuntuMono'),
      ),
      home:  Home(),
    );
  }
}
