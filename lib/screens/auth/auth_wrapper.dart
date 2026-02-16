// lib/screens/auth/auth_wrapper.dart

import 'package:blogapi_flutter/providers/auth_provider.dart';
import 'package:blogapi_flutter/screens/auth/login_screen.dart';
import 'package:blogapi_flutter/screens/home/home_screen.dart';
import 'package:blogapi_flutter/screens/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return authState.when(
      data: (user) {
        if (user != null) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      },

      loading: () {
        return const Scaffold(
          body: LoadingWidget(message: 'Checking authentication...'),
        );
      },
      error: (err, stack) {
        return const Scaffold(
          body: Center(
            child: Text('Something went wrong! Please login again.'),

          ),
        );
      },
    );
  }
}