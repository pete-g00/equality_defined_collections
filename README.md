# Equality Defined Collections

This package contains the collection classes `Iterable`, `List`, `Set` and `Map` which have a redefined equality such that two collections are considered equal
based on their contents, and not whether they refer to the same instance of the collection.

Both the properties `operator ==` and `hashCode` have been overriden in these classes.

The classes present in the library are `EqualityDefinedIterable`, `EqualityDefinedList`, `EqualityDefinedSet` and `EqualityDefinedMap`. All these classes will take in a collection and give them the same properties. 

## Getting Started

To import this package, include the following code:

``` dart
import 'package:equality_defined_collections/equality_defined_collections.dart';
```

## Normal collections vs Equality Defined Collections

Let's say we have the following three lists

``` dart
final list1 = [1, 3, 5];
final list2 = [2, 0, 4];
final list3 = [1, 3, 5];
```

Even though the lists `list1` and `list3` have the same elements, `list1 == list3` will return `false` because the two list are different instances. Using equality defined collections, we have 

``` dart
final eqList1 = EqualityDefinedList([1, 3, 5]);
final eqList2 = EqualityDefinedList([2, 0, 4]);
final eqList3 = EqualityDefinedList([1, 3, 5]);
```

Then, `eqList1 == eqList3` will return `true`, while `eqList1 == eqList2` will return `false`.

Although it is not that difficult to create a function/method that checks whether two lists have the same elements, using an equality defined list has an advantage when used in collections that recognise uniqueness- a `Set`, or the keys of a `Map`.

For example, let's say we have 2 maps `map` and `eqMap`, as defined below:

``` dart
final map = {
    list1: 'odd',
    list2: 'even'
};

final eqMap = {
    eqList1: 'odd',
    eqList2: 'even'
};
```

Then, `map[list3]` will return `null`, but `eqMap[list3]` will return `odd`.

## Types of equality
By default, the equality used to compare the contents is [DefaultEquality](https://pub.dev/documentation/collection/latest/collection/DefaultEquality-class.html) from the `collection` package, which checks whether two elements within the collection are equal by equating them, using operator `==` and changing the `hashCode` alongside. 

Another possible equality is the [IdentityEquality](https://pub.dev/documentation/collection/latest/collection/IdentityEquality-class.html), which checks whether two elements are the same instance of an object, using the [identical](https://api.dart.dev/stable/2.9.3/dart-core/identical.html) function.