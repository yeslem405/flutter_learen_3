import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:learen_3/homescreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learen_3/core/database/cache/cache_helper.dart';
import 'package:learen_3/core/localization/app_localizations.dart';
import 'package:learen_3/features/auth/presentation/views/LoginScreen.dart';
import 'package:learen_3/features/auth/presentation/views/RegisterScreen.dart';
import 'package:learen_3/features/more/bloc_theme/bloc/theme_bloc.dart';
import 'package:learen_3/features/more/bloc_theme/bloc/theme_state.dart';
import 'package:learen_3/features/more/bloc_theme/bloc/theme_event.dart';
import 'package:learen_3/features/more/bloc_locale/bloc/locale_bloc.dart';
import 'package:learen_3/features/more/bloc_locale/bloc/locale_event.dart';
import 'package:learen_3/features/more/bloc_locale/bloc/locale_state.dart';
import 'package:learen_3/features/more/bloc_connec/bloc/connectivity_bloc.dart';
import 'package:learen_3/features/more/bloc_connec/bloc/connectivity_state.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:learen_3/features/home/view/homescreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeBloc(),
          ),
          BlocProvider(
            create: (context) => LocaleBloc(),
          ),
          BlocProvider(
            create: (context) => ConnectivityBloc(),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return BlocBuilder<LocaleBloc, LocaleState>(
              builder: (context, localeState) {
                return MaterialApp(
                  routes: {
                    '/login': (context) => const LoginScreen(),
                    '/register': (context) => const RegisterScreen(),
                    '/home': (context) =>
                        HomeScreen(), // وجهة المستخدم بعد تسجيل الدخول
                  },
                  debugShowCheckedModeBanner: false,
                  theme: themeState.themeData,
                  locale: localeState
                      .locale, // لا خطأ هنا إذا كان LocaleState مضبوط
                  supportedLocales: [Locale('en'), Locale('ar')],
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate
                  ],
                  title: 'Flutter Demo',
                  home: HomeScreen(),
                );
              },
            );
          },
        ));
  }
}



// on(Icons.home)
//   ];
//   @overrideclass MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _currentIndex = 0;
//   List<Widget> body = [
//     Icon(Icons.home),
//     Icon(Icons.home),
//     Icon(Icons.home),
//     Ic
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       floatingActionButton: FloatingActionButton(onPressed: (){},child: Text("إضافة ختمتي"),
      
//       ),
//       bottomNavigationBar: BottomAppBar(
      //   currentIndex: _currentIndex,
      //   onTap: (int newIndex){
      //     setState(() {
      //        _currentIndex = newIndex;
      //     });
      //   }, items: [
      //     BottomNavigationBarItem(
      //       label: "ختماتي",
      //       icon: Icon(Icons.amp_stories_rounded)),
      //     BottomNavigationBarItem(
      //       label: "قراني",
      //       icon: Icon(Icons.menu_book_rounded)),
      //     BottomNavigationBarItem(
      //       label: "اشعاراتي",
      //       icon: Icon(Icons.notification_important_rounded)),
      //     BottomNavigationBarItem(
      //       label: "المزيد",
      //       icon: Icon(Icons.grid_view_rounded)),      
      //   ],
      //   shape: CircularNotchedRectangle(),
      //   notchMargin: 10,
      //     child: 
      //   Row(
      //   children: [
      //     Row(
      //       children: [
      //         GestureDetector(
      //           onTap: () {},
      //           child: Column(mainAxisSize: MainAxisSize.min,children: [
      //             Icon(Icons.amp_stories_rounded),Text("ختماتي")
      //           ],),
      //         ),
      //         GestureDetector(
      //           onTap: () {},
      //           child: Column(mainAxisSize: MainAxisSize.min,children: [
      //             Icon(Icons.menu_book_rounded),Text("قراني")
      //           ],),
      //         )
      //       ],
      //     ),
      //     Spacer(),
      //     Row(
      //       children: [
      //         GestureDetector(
      //            onTap: () {},
      //           child: Column(mainAxisSize: MainAxisSize.min,children: [
      //             Icon(Icons.notification_important_rounded),Text("اشعاراتي")
      //           ],),
      //         ),
      //         GestureDetector(
      //           onTap: () {},
      //           child: Column(mainAxisSize: MainAxisSize.min,children: [
      //             Icon(Icons.grid_view_rounded),Text("المزيد")
      //           ],),
      //         )
      //       ],
      //     ),
      //   ],
      // )
//       ),
     
//     );
//   }
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
