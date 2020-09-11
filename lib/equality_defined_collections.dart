import 'package:collection/collection.dart';

/// An [Iterable] that has equality defined on it by its elements.
///
/// An instance of an equality-defined iterable inherits all the methods and properties of an [Iterable], but overrides the property [hashCode] and the operator
/// [operator ==].
///
/// By default, two equality-defined iterables are considered equal if they have the same length, and if every element in the two iterables are equal, in order, when comparing by
/// the equality operator [operator ==]. This is [DefaultEquality].
///
/// It is also possible to provide a different type of [Equality] for the elements. A pre-defined alternate is the [IdentityEquality], which defines two objects as
/// equal if they are the same instance of an object.
///
/// See also:
///
/// * the class [Iterable] for its purpose and usage.
///
/// * the equalities [DefaultEquality] and [IdentityEquality], which both implement [Equality].
class EqualityDefinedIterable<E> extends DelegatingIterable<E> {
  /// Creates an equality-defined iterable.
  ///
  /// It takes an [Iterable] on which the equality is to be defined.
  ///
  /// It is also possible to provide an instance of [Equality] class, which will be used to compare the elements within the iterable.
  /// By default, this is the [DefaultEquality], which uses [operator ==] on the elements to determine equality.
  ///
  /// Another type of [Equality] is the [IdenticalEquality], which checks whether two elements are instances of the same object when determining equality.
  const EqualityDefinedIterable(Iterable<E> iterable,
      [this._elementEquality = const DefaultEquality()])
      : super(iterable);

  final Equality _elementEquality;

  IterableEquality get _equality => IterableEquality(_elementEquality);

  @override
  int get hashCode => _equality.hash(this);

  @override
  bool operator ==(Object other) =>
      _equality.isValidKey(other) && _equality.equals(this, other);
}

/// A [List] that has equality defined on it by its elements.
///
/// An instance of an equality-defined list inherits all the methods and properties of an [List], but overrides the property [hashCode] and the operator
/// [operator ==].
///
/// By default, two equality-defined lists are considered equal if they have the same length, and if every element in the two lists are equal, in order, when comparing by
/// the equality operator [operator ==]. This is [DefaultEquality].
///
/// It is also possible to provide a different type of [Equality] for the elements. A pre-defined alternate is the [IdentityEquality], which defines two objects as
/// equal if they are the same instance of an object.
///
/// See also:
///
/// * the class [List] for its purpose and usage.
///
/// * the equalities [DefaultEquality] and [IdentityEquality], which both implement [Equality].
class EqualityDefinedList<E> extends DelegatingList<E> {
  /// Creates an equality-defined list.
  ///
  /// It takes a [List] on which the equality is to be defined.
  ///
  /// It is also possible to provide an instance of [Equality] class, which will be used to compare the elements within the list.
  /// By default, this is the [DefaultEquality], which uses [operator ==] on the elements to determine equality.
  ///
  /// Another type of [Equality] is the [IdenticalEquality], which checks whether two elements are instances of the same object when determining equality.
  const EqualityDefinedList(List<E> list,
      [this._elementEquality = const DefaultEquality()])
      : super(list);

  final Equality _elementEquality;

  ListEquality get _equality => ListEquality(_elementEquality);

  @override
  int get hashCode => _equality.hash(this);

  @override
  bool operator ==(Object other) =>
      _equality.isValidKey(other) && _equality.equals(this, other);
}

/// A [Set] that has equality defined on it by its elements.
///
/// An instance of an equality-defined set inherits all the methods and properties of an [Set], but overrides the property [hashCode] and the operator
/// [operator ==].
///
/// By default, two equality-defined sets are considered equal if they have the same length, and if every element in the two sets are equal, without any order, when comparing by
/// the equality operator [operator ==]. This is [DefaultEquality].
///
/// It is also possible to provide a different type of [Equality] for the elements. A pre-defined alternate is the [IdentityEquality], which defines two objects as
/// equal if they are the same instance of an object.
///
/// See also:
///
/// * the class [Set] for its purpose and usage.
///
/// * the equalities [DefaultEquality] and [IdentityEquality], which both implement [Equality].
class EqualityDefinedSet<E> extends DelegatingSet<E> {
  /// Creates an equality-defined list.
  ///
  /// It takes a [Set] on which the equality is to be defined.
  ///
  /// It is also possible to provide an instance of [Equality] class, which will be used to compare the elements within the set.
  /// By default, this is the [DefaultEquality], which uses [operator ==] on the elements to determine equality.
  ///
  /// Another type of [Equality] is the [IdenticalEquality], which checks whether two elements are instances of the same object when determining equality.
  const EqualityDefinedSet(Set<E> _set,
      [this._elementEquality = const DefaultEquality()])
      : super(_set);

  final Equality _elementEquality;

  SetEquality get _equality => SetEquality(_elementEquality);

  @override
  int get hashCode => _equality.hash(this);

  @override
  bool operator ==(Object other) =>
      _equality.isValidKey(other) && _equality.equals(this, other);
}

/// A [Map] that has equality defined on it by its entries.
///
/// An instance of an equality-defined map inherits all the methods and properties of an [Map], but overrides the property [hashCode] and the operator
/// [operator ==].
///
/// By default, two equality-defined map are considered equal if they have the same length, and if every entry in the map corresponds to another entry
/// in the other map, where both the key and value of the entry are considered equal by the equality operator [operator ==]. This is [DefaultEquality].
///
/// It is also possible to provide a different type of [Equality] when checking both the keys and the values.
/// A pre-defined alternate is the [IdentityEquality], which defines two objects as equal if they are the same instance of an object.
///
/// See also:
///
/// * the class [Map] for its purpose and usage.
///
/// * the equalities [DefaultEquality] and [IdentityEquality], which both implement [Equality].
class EqualityDefinedMap<K, V> extends DelegatingMap<K, V> {
  /// Creates an equality-defined map.
  ///
  /// It takes a [Map] on which the equality is to be defined.
  ///
  /// It is also possible to provide an instance of [Equality] class for both the keys and the values, which will be used to compare the entries with respect to the keys and values using the equality.
  /// By default, this is the [DefaultEquality], which uses [operator ==] on the elements to determine equality.
  ///
  /// Another type of [Equality] is the [IdenticalEquality], which checks whether two elements are instances of the same object when determining equality.
  const EqualityDefinedMap(Map<K, V> map,
      {this.keyEquality = const DefaultEquality(),
      this.valueEquality = const DefaultEquality()})
      : super(map);

  final Equality keyEquality;

  final Equality valueEquality;

  MapEquality get _equality =>
      MapEquality(keys: keyEquality, values: valueEquality);

  @override
  int get hashCode => _equality.hash(this);

  @override
  bool operator ==(Object other) =>
      _equality.isValidKey(other) && _equality.equals(this, other);
}

extension EqualityDefinedIterableExtension<E> on Iterable<E> {
  /// Returns an instance of equality-defined iterable version of `this`.
  EqualityDefinedIterable<E> toEqualityDefinedIterable() =>
      EqualityDefinedIterable<E>(this);
}

extension EqualityDefinedListExtension<E> on List<E> {
  /// Returns an instance of equality-defined list of `this`.
  EqualityDefinedList<E> toEqualityDefinedList() =>
      EqualityDefinedList<E>(this);
}

extension EqualityDefinedSetExtension<E> on Set<E> {
  /// Returns an instance of equality-defined set of `this`.
  EqualityDefinedSet<E> toEqualityDefinedSet() => EqualityDefinedSet<E>(this);
}

extension EqualityDefinedMapExtension<K, V> on Map<K, V> {
  /// Returns an instance of equality-defined map of `this`.
  EqualityDefinedMap<K, V> toEqualityDefinedMap() =>
      EqualityDefinedMap<K, V>(this);
}
