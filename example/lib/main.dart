import 'package:equality_defined_collections/equality_defined_collections.dart';

void main(List<String> args) {
  final eqOddNumbers = EqualityDefinedSet({1, 5, 3});
  eqOddNumbers.addAll([7, 9]);
  print(eqOddNumbers == {1, 9, 5, 7, 3}); // true
  final numbers = [
    {1, 2},
    {1, 2, 3},
    {3, 4},
    {3, 4, 5},
    {5, 6}
  ];
  final sumMap = <EqualityDefinedSet<int>, int>{};
  for (var number in numbers) 
    sumMap[number.toEqualityDefinedSet()] = number.reduce((value, element) => value + element);
  print(sumMap[EqualityDefinedSet({0, 3})]); // null
  print(sumMap[EqualityDefinedSet({6, 5})]); // 11
}