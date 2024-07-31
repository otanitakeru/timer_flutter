// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_down_timer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$countDownTimerNotifierHash() =>
    r'3f4f234d7a5c804d876c3a7070d40c834215eb23';

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

abstract class _$CountDownTimerNotifier
    extends BuildlessAutoDisposeNotifier<Time> {
  late final void Function() onTimerEnd;

  Time build({
    required void Function() onTimerEnd,
  });
}

/// See also [CountDownTimerNotifier].
@ProviderFor(CountDownTimerNotifier)
const countDownTimerNotifierProvider = CountDownTimerNotifierFamily();

/// See also [CountDownTimerNotifier].
class CountDownTimerNotifierFamily extends Family<Time> {
  /// See also [CountDownTimerNotifier].
  const CountDownTimerNotifierFamily();

  /// See also [CountDownTimerNotifier].
  CountDownTimerNotifierProvider call({
    required void Function() onTimerEnd,
  }) {
    return CountDownTimerNotifierProvider(
      onTimerEnd: onTimerEnd,
    );
  }

  @override
  CountDownTimerNotifierProvider getProviderOverride(
    covariant CountDownTimerNotifierProvider provider,
  ) {
    return call(
      onTimerEnd: provider.onTimerEnd,
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
  String? get name => r'countDownTimerNotifierProvider';
}

/// See also [CountDownTimerNotifier].
class CountDownTimerNotifierProvider
    extends AutoDisposeNotifierProviderImpl<CountDownTimerNotifier, Time> {
  /// See also [CountDownTimerNotifier].
  CountDownTimerNotifierProvider({
    required void Function() onTimerEnd,
  }) : this._internal(
          () => CountDownTimerNotifier()..onTimerEnd = onTimerEnd,
          from: countDownTimerNotifierProvider,
          name: r'countDownTimerNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$countDownTimerNotifierHash,
          dependencies: CountDownTimerNotifierFamily._dependencies,
          allTransitiveDependencies:
              CountDownTimerNotifierFamily._allTransitiveDependencies,
          onTimerEnd: onTimerEnd,
        );

  CountDownTimerNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.onTimerEnd,
  }) : super.internal();

  final void Function() onTimerEnd;

  @override
  Time runNotifierBuild(
    covariant CountDownTimerNotifier notifier,
  ) {
    return notifier.build(
      onTimerEnd: onTimerEnd,
    );
  }

  @override
  Override overrideWith(CountDownTimerNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CountDownTimerNotifierProvider._internal(
        () => create()..onTimerEnd = onTimerEnd,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        onTimerEnd: onTimerEnd,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CountDownTimerNotifier, Time>
      createElement() {
    return _CountDownTimerNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CountDownTimerNotifierProvider &&
        other.onTimerEnd == onTimerEnd;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, onTimerEnd.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CountDownTimerNotifierRef on AutoDisposeNotifierProviderRef<Time> {
  /// The parameter `onTimerEnd` of this provider.
  void Function() get onTimerEnd;
}

class _CountDownTimerNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<CountDownTimerNotifier, Time>
    with CountDownTimerNotifierRef {
  _CountDownTimerNotifierProviderElement(super.provider);

  @override
  void Function() get onTimerEnd =>
      (origin as CountDownTimerNotifierProvider).onTimerEnd;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
