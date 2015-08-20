
library geo_test;

import '../geo/geo.dart' as geo;
import 'package:test/test.dart';

main(){

	group('Point: ', (){
		test('constructor test.', () {
			var v = new geo.Vector(3, 7.0);
			assert(v.x == 3);
			assert(v.y == 7.0);
		});
		test('addition test.', () {
			var a = new geo.Vector(2, 5);
			var b = new geo.Vector(3.0, 4.0);
			var c = a + b;
			assert(c.x == 5.0);
			assert(c.y == 9.0);
		});
		test('subtraction test.', () {
			var a = new geo.Vector(3, 7);
			var b = new geo.Vector(5.0, 4.1);
			var c = a - b;
			expect(c.x, greaterThan(-2.0001));
			expect(c.x, lessThan(-1.9999));
			expect(c.y, greaterThan(2.8999));
			expect(c.y, lessThan(2.9001));
		});
		test('equality test.', () {
			var a = new geo.Vector(1.0, 2.0);
			var b = new geo.Vector(1, 2);
			var c = new geo.Vector(0.7, 3.2);
			assert(a == b);
			assert(a != c);
		});
		test('scaling test.', () {
			var a = new geo.Vector(24, -2)..scale(2);
			var b = new geo.Vector(48, -4);
			assert(a == b);
		});
		test('magnitude test.', () {
			var v = new geo.Vector(3, 4);
			assert(v.length == 5);
		});
		test('unitVector test.', () {
			var v = new geo.Vector(3, 4);
			var u = new geo.Vector(0.6, 0.8);
			assert(v.unitVector == u);
		});
		test('orthogonal test.', () {
			var u = new geo.Vector(3, 4);
			var v = new geo.Vector(-0.8, 0.6);
			assert(u.orthogonal == v);
		});

	});
}