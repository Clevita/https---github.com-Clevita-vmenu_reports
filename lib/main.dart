
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:supabase_flutter/supabase_flutter.dart';


// import 'package:window_manager/window_manager.dart';

import 'Colours.dart';
import 'Constants.dart';
import 'app/routes/app_pages.dart';

bool Night_theme = false;
void main() async {
  _enablePlatformOverrideForDesktop();
  WidgetsFlutterBinding.ensureInitialized();
  if (GetPlatform.isMobile) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  // if (GetPlatform.isDesktop) {
  //   await windowManager.ensureInitialized();

  //   WindowOptions windowOptions = WindowOptions(
  //     // size: Size(Get.width, Get.height),
  //     center: true,
  //     //  backgroundColor: Colors.transparent,
  //     skipTaskbar: false,
  //     titleBarStyle: TitleBarStyle.hidden,
  //     fullScreen: true,
  //     // alwaysOnTop: true,
  //   );
  //   windowManager.waitUntilReadyToShow(windowOptions, () async {
  //     await windowManager.show();

  //     //await windowManager.focus();
  //   });
  // }
  // try {
  //   await Supabase.initialize(
  //     url: CloudStorageConfig.SUPABASE_URL,
  //     anonKey: CloudStorageConfig.SUPABASE_ANON_KEY,
  //   );
  // } catch (e) {
  //   print(e);
  // }

  await GetStorage.init(Constants.VMENU_REPORTS);
  // await GetStorage.init(Constants.STORAGE_VMENU_NETWORKIP);
  // await GetStorage.init(Constants.STORAGE_VMENU_ORDERDATA);
  // await GetStorage.init(Constants.STORAGE_VMENU_DATABASE_UPDATION);
  // await GetStorage.init(Constants.STORAGE_VMENU_APP_THEME);
  //await GetStorage.init(Constants.STORAGE_VMENU_REPORT_SETTINGS);

  // SetTheme(isnighttheme: false);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: Constants.APP_DEVLOPMENT_MODE,
      title: "Vmenu",

      // initialRoute: Routes.LOCAL_NOTIFICATION_CLIENT,
      // initialRoute: Routes.EMPLOYEELOGIN,
      // initialRoute: Routes.TSR,
      initialRoute: Routes. REPORTS,
      getPages: AppPages.routes,
      theme: _buildTheme(Brightness.light),
    ),
  );
}

void _enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.montserratTextTheme(baseTheme.textTheme),
  );
}

// void SetTheme({bool? isnighttheme}) {
//   try {
//     var storage = GetStorage(Constants.STORAGE_VMENU_APP_THEME);
//     if (isnighttheme != null) {
//       var data = storage.read("color_data") ?? '';
//       storage.write("night_mode", isnighttheme);
//       storage.write("color_data", data);
//     }
//     var night_mode = storage.read("night_mode") ?? false;
//     if (night_mode) {
//       Night_theme = true;
//       ColorsApp.COLOR_PRIMARY = ColorsApp.COLOR_NIGHT_PRIMARY;
//       ColorsApp.COLOR_PRIMARY_TEXT = ColorsApp.COLOR_NIGHT_PRIMARY_TEXT;

//       ColorsApp.COLOR_SECONDARY = ColorsApp.COLOR_NIGHT_SECONDARY;
//       ColorsApp.COLOR_SECONDARY_TEXT = ColorsApp.COLOR_NIGHT_SECONDARY_TEXT;

//       ColorsApp.COLOR_TERTIARY = ColorsApp.COLOR_NIGHT_TERTIARY;
//       ColorsApp.COLOR_TERTIARY_TEXT = ColorsApp.COLOR_NIGHT_TERTIARY_TEXT;
//     } else {
//       Night_theme = false;
//       var data = storage.read("color_data") ?? '';
//       if (data != null && data != "") {
//         ColorsApp.COLOR_PRIMARY = Color(data["COLOR_PRIMARY"]);
//         ColorsApp.COLOR_PRIMARY_TEXT = Color(data["COLOR_PRIMARY_TEXT"]);
//         ColorsApp.COLOR_SECONDARY = Color(data["COLOR_SECONDARY"]);
//         ColorsApp.COLOR_SECONDARY_TEXT = Color(data["COLOR_SECONDARY_TEXT"]);
//         ColorsApp.COLOR_TERTIARY = Color(data["COLOR_TERTIARY"]);
//         ColorsApp.COLOR_TERTIARY_TEXT = Color(data["COLOR_TERTIARY_TEXT"]);
//       }
//     }
//   } catch (e) {
//     print(e);
//   }
// }





// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a blue toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
