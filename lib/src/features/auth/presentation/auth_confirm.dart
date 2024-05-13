import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labari/src/features/auth/data/auth_repository.dart';

import 'package:labari/src/features/auth/presentation/screens/log_in_screen.dart';

import 'package:labari/src/features/news/presentation/screens/home_screen.dart';

/// This class checks for the user authentication status (signed-in or !signed-in)
/// It goes ahead to return different screens based on user auth status

class AuthConfirm extends ConsumerWidget {
  const AuthConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      body: authState.when(
        data: (user) {
          if (user != null) return const HomePage();
          return const LogInScreen();
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (e, trace) => const LogInScreen(),
      ),
    );
  }
}
