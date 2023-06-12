import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:racketscore/view/admin_pages/events_list_page.dart';
import 'package:provider/provider.dart';
import 'package:racketscore/view/guest_pages/result_page.dart';
import 'package:racketscore/view/guest_pages/welcome_page.dart';
import 'data/appwrite_service.dart';

String? eventParameter;


void main() async {
  eventParameter = Uri.base.queryParameters["event"];
  /*if (!kReleaseMode) {
    eventParameter = "23623erherherh";
  }*/
  runApp(ChangeNotifierProvider(
      create: ((context) => AppwriteService()), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RacketScore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        secondaryHeaderColor: Colors.blue,
      ),
      //home: AuthenticationWrapper(),
      initialRoute: eventParameter != null ? '/?event=$eventParameter' : "/",
      onGenerateRoute: (settings) {
        if (eventParameter != null) return MaterialPageRoute(builder: (_) => ResultPage(matchId: eventParameter!), settings: settings);
        return MaterialPageRoute(builder: (_) => AuthenticationWrapper(), settings: settings); // you can do this in `onUnknownRoute` too
      },
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  Widget build(BuildContext context) {

    final value = context.watch<AppwriteService>().status;

   /* if(eventParameter != null){
      return ResultPage(matchId: eventParameter!);
    }*/

    Widget widget = value == AuthStatus.uninitialized
        ?  Center(child: CircularProgressIndicator())
        : (value == AuthStatus.authenticated
        ? EventsListPage()
        : WelcomePage());
    return widget;

  }
}


