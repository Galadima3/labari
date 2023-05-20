import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:labari/src/features/auth/presentation/screens/log_in_screen.dart';

import 'package:labari/src/features/news/presentation/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCheckerX extends ConsumerStatefulWidget {
  const AuthCheckerX({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthCheckerXState();
}

class _AuthCheckerXState extends ConsumerState<AuthCheckerX> {
  late Future rex;
  Future<bool> verifyAuthStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loginCheck = prefs.getBool('loggedIn') ?? false;
    return loginCheck;
  }

  @override
  void initState() {
    rex = verifyAuthStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final isUserLoggedIn = ref.watch(testProvider);
    //return SafeArea(child: isUserLoggedIn ? const HomePage() : const LogInScreen());
    return FutureBuilder(
      future: rex,
      builder: (context, snapshot) {
        if (snapshot.data == false) {
          return const LogInScreen();
        } else {
          return const HomePage();
        }
      },
    );
  }
}


// class AuthChecker extends ConsumerWidget {
//   const AuthChecker({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final authState = ref.watch(authStateProvider);

//     return authState.when(
//       data: (user) {
//         if (user != null) return const HomePage();
//         return const LogInScreen();
//       },
//       loading: () => const Center(
//         child: CircularProgressIndicator(),
//       ),
//       error: (e, trace) => const LogInScreen(),
//     );
//   }
// }