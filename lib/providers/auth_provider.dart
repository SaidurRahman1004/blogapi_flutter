import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:blogapi_flutter/models/user.dart';
import 'package:blogapi_flutter/providers/service_providers.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  //run provider in 1st time
  @override
  Future<User?> build() async {
    //cheak user login or not
    final isLoggedIn =await ref.read(authServiceProvider).isLoggedIn();
    if (isLoggedIn) {
      //if login return user
      return await ref.read(authServiceProvider).currentUser();
    }
    return null;
  }

  //login
  Future<void> login({
    required String username,
    required String password,
  }) async {
    //loading
    state = const AsyncLoading();
    //autu try catch using AsyncValue Gaurd
    state = await AsyncValue.guard(() async {
      await ref
          .read(authServiceProvider)
          .login(username: username, password: password);
      //loading success return user
      return await ref.read(authServiceProvider).currentUser();
    });
  }

  //rigester
  Future<void> register({
    required String username,
    required String email,
    required String password,
    required String password2,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(authServiceProvider)
          .register(
            username: username,
            email: email,
            password: password,
            password2: password2,
          );
      return ref.read(authServiceProvider).currentUser();
    });
  }
  //logout
  Future<void> logout() async {
    await ref.read(authServiceProvider).logout();
    state = const AsyncData(null);
  }
}
