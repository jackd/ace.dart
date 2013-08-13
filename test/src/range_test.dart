@Group('Range')
library ace.test.range;

import 'package:ace/ace.dart';
import 'package:bench/meta.dart';
import 'package:unittest/unittest.dart';

@Test()
void testRangeCtor() {
  final range = new Range(1, 1, 2, 2);
  expect(range.start.row, equals(1));
  expect(range.start.column, equals(1));
  expect(range.end.row, equals(2));
  expect(range.end.column, equals(2));
}

@Test()
void testRangeFromPointsCtor() {
  final range = new Range.fromPoints(new Point(1, 1), new Point(2, 2));
  expect(range.start.row, equals(1));
  expect(range.start.column, equals(1));
  expect(range.end.row, equals(2));
  expect(range.end.column, equals(2));
}

@Test('Test the `==` operator.')
void testRangeEquals() {
  var x = new Range(1, 1, 2, 2);
  var y = new Range(1, 1, 2, 2);
  var z = new Range(1, 1, 2, 2);
  expect(x, isNot(equals(null)));
  expect(x, equals(x));
  expect(x, equals(y));
  expect(y, equals(x));
  expect(y, equals(z));
  expect(x, equals(z));
  expect(x.hashCode, equals(y.hashCode));
  expect(y.hashCode, equals(z.hashCode));
  expect(x.hashCode, equals(z.hashCode));
  var w = new Range(-1, 1, 2, 2);
  expect(x, isNot(equals(w)));
  expect(w, isNot(equals(x)));
  expect(w.hashCode, isNot(equals(x.hashCode)));
  w = new Range(1, 1, 2, -2);
  expect(w, isNot(equals(x)));
  expect(w.hashCode, isNot(equals(x.hashCode)));
}

@Test('Test the `toString` method.')
void testRangeToString() {
  var p = new Range(1, 1, 2, 2);
  expect(p.toString(), equals("Range: [1/1] -> [2/2]"));
}

@Test()
void testRangeIsEmpty() {
  final notEmpty = new Range(1, 1, 2, 2);
  final empty = new Range(1, 2, 1, 2);
  expect(notEmpty.isEmpty, isFalse);
  expect(empty.isEmpty, isTrue);
}

@Test()
void testRangeIsMultiLine() {
  final notMultiLine = new Range(1, 1, 1, 2);
  final multiLine = new Range(1, 2, 2, 3);
  expect(notMultiLine.isMultiLine, isFalse);
  expect(multiLine.isMultiLine, isTrue);
}