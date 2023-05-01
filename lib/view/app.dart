import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_app/controller/authentication/authentication_cubit.dart';
import 'package:rent_app/controller/route/route_cubit.dart';
import 'package:rent_app/helper/color_package.dart';
import 'package:rent_app/model/models/authentication_client.dart';
import 'package:rent_app/view/announcement/announcements_screen.dart';
import 'package:rent_app/view/authentication/login_screen.dart';
import 'package:rent_app/view/chat/chats.dart';
import 'package:rent_app/view/home/home_screen.dart';
import 'package:rent_app/view/profile/profile_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => AuthenticationCubit(
          AuthenticationClient(),
        )..verifyToken(),
        child: const Authentication(),
      ),
    );
  }
}

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    final AuthenticationState state =
        context.watch<AuthenticationCubit>().state;
    switch (state.status) {
      case AuthenticationStatus.authenticated:
        return const Content();
      case AuthenticationStatus.unauthenticated:
        return const LoginScreen();
      default:
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
    }
  }
}

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int currentIndex = 0;

  void _onTap(int index) {
    if (index != currentIndex) {
      setState(() => currentIndex = index);
      switch (index) {
        case 0:
          _navigatorKey.currentState!.pushReplacementNamed('Home');
          break;
        case 1:
          _navigatorKey.currentState!.pushReplacementNamed('Chats');
          break;
        case 2:
          _navigatorKey.currentState!.pushReplacementNamed('Announcements');
          break;
        case 3:
          _navigatorKey.currentState!.pushReplacementNamed('Profile');
          break;
      }
    }
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'Chats':
        return MaterialPageRoute(builder: (context) => const Chats());
      case 'Announcements':
        return MaterialPageRoute(
            builder: (context) => const AnnouncementsScreen());
      case 'Profile':
        return MaterialPageRoute(builder: (context) => ProfileScreen());
      default:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RouteCubit(context),
      child: Scaffold(
        backgroundColor: ColorPackage.primaryColor,
        body: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorPackage.primaryTextColor,
                width: .2,
              ),
            ),
          ),
          child: Navigator(
            key: _navigatorKey,
            onGenerateRoute: _onGenerateRoute,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorPackage.primaryColor,
          currentIndex: currentIndex,
          onTap: _onTap,
          selectedItemColor: ColorPackage.secondaryColor,
          unselectedItemColor: ColorPackage.primaryTextColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Chats",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.feed),
              label: "Announcements",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
