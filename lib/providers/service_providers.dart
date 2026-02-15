import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/api_service.dart';
import '../services/auth_service.dart';

part 'service_providers.g.dart';

@Riverpod(keepAlive: true)
ApiService apiService(ApiServiceRef ref) => ApiService();

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) {
  final apiService = ref.watch(apiServiceProvider);
  return AuthService(apiService);
}
