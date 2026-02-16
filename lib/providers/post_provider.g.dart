// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchPostsHash() => r'6184e586c1e35081ea789098c2d71afa7090534e';

/// See also [fetchPosts].
@ProviderFor(fetchPosts)
final fetchPostsProvider = AutoDisposeFutureProvider<List<Post>>.internal(
  fetchPosts,
  name: r'fetchPostsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchPostsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchPostsRef = AutoDisposeFutureProviderRef<List<Post>>;
String _$fetchPostByIdHash() => r'9df774e910b4ae3f2dad6dbdbbda615e509e42bb';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchPostById].
@ProviderFor(fetchPostById)
const fetchPostByIdProvider = FetchPostByIdFamily();

/// See also [fetchPostById].
class FetchPostByIdFamily extends Family<AsyncValue<Post>> {
  /// See also [fetchPostById].
  const FetchPostByIdFamily();

  /// See also [fetchPostById].
  FetchPostByIdProvider call(
    int id,
  ) {
    return FetchPostByIdProvider(
      id,
    );
  }

  @override
  FetchPostByIdProvider getProviderOverride(
    covariant FetchPostByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchPostByIdProvider';
}

/// See also [fetchPostById].
class FetchPostByIdProvider extends AutoDisposeFutureProvider<Post> {
  /// See also [fetchPostById].
  FetchPostByIdProvider(
    int id,
  ) : this._internal(
          (ref) => fetchPostById(
            ref as FetchPostByIdRef,
            id,
          ),
          from: fetchPostByIdProvider,
          name: r'fetchPostByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPostByIdHash,
          dependencies: FetchPostByIdFamily._dependencies,
          allTransitiveDependencies:
              FetchPostByIdFamily._allTransitiveDependencies,
          id: id,
        );

  FetchPostByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Post> Function(FetchPostByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchPostByIdProvider._internal(
        (ref) => create(ref as FetchPostByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Post> createElement() {
    return _FetchPostByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPostByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchPostByIdRef on AutoDisposeFutureProviderRef<Post> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchPostByIdProviderElement
    extends AutoDisposeFutureProviderElement<Post> with FetchPostByIdRef {
  _FetchPostByIdProviderElement(super.provider);

  @override
  int get id => (origin as FetchPostByIdProvider).id;
}

String _$postActionsHash() => r'afc9897ea36506323f83de08268cd3b64324a213';

/// See also [PostActions].
@ProviderFor(PostActions)
final postActionsProvider =
    AutoDisposeNotifierProvider<PostActions, void>.internal(
  PostActions.new,
  name: r'postActionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$postActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PostActions = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
