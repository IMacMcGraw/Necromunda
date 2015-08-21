
library geo_test;

import '../geo/geo.dart';
import 'package:test/test.dart';

main(){

	group('Vector:', (){
		test('constructor test.', () {
			var v = new Vector(3, 7.0);
			assert(v.x == 3);
			assert(v.y == 7.0);
		});
		test('addition test.', () {
			var a = new Vector(2, 5);
			var b = new Vector(3.0, 4.0);
			var c = a + b;
			assert(c.x == 5.0);
			assert(c.y == 9.0);
		});
		test('subtraction test.', () {
			var a = new Vector(3, 7);
			var b = new Vector(5.0, 4.1);
			var c = a - b;
			expect(c.x, greaterThan(-2.0001));
			expect(c.x, lessThan(-1.9999));
			expect(c.y, greaterThan(2.8999));
			expect(c.y, lessThan(2.9001));
		});
		test('equality test.', () {
			var a = new Vector(1.0, 2.0);
			var b = new Vector(1, 2);
			var c = new Vector(0.7, 3.2);
			assert(a == b);
			assert(a != c);
		});
		test('scaling test.', () {
			var a = new Vector(24, -2)..scale(2);
			var b = new Vector(48, -4);
			assert(a == b);
		});
		test('length test.', () {
			var v = new Vector(3, 4);
			assert(v.length == 5);
		});
		test('unitVector test.', () {
			var u = new Vector(3, 4);
			var v = new Vector(0.6, 0.8);
			assert(u.unitVector == v);
		});
		test('orthogonal test.', () {
			var u = new Vector(3, 4);
			var v = new Vector(-0.8, 0.6);
			assert(u.orthogonal == v);
		});
	});

	group('Rect:', (){
		test('equality and constructor test.', () {
			var rectA = new Rect(2, 7, 4, 3);
			var rectB = new Rect(4, 3, 2, 7);
			assert(rectA == rectB);

			var pointA = new Vector(0, 1);
			var pointB = new Vector(2, 4);
			var rectP = new Rect.byCorners(pointA, pointB);
			var rectQ = new Rect(2, 1, 0, 4);
			assert(rectP == rectQ);
		});
		test('xMin, xMax, yMin, yMax getters and setters.', () {
			var rect = new Rect(-3, 4, 2,  1);
			assert(rect.yMin == 1);
			rect.xMin = 7;
			assert(rect.xMin == 2);
			assert(rect.xMax == 7);
		});
		test('width and height getter test.', () {
			var rect = new Rect(7, 12, 4, 16);
			assert(rect.width == 3);
			assert(rect.height == 4);
		});
		test('Contains test.', () {
			var rect = new Rect(-3, -2, 4, 11);
			var pointA = new Vector(1, 4);
			var pointB = new Vector(-2, 1);
			var pointC = new Vector(4, 11);
			var pointD = new Vector(-2, 6);
			assert(rect.contains(pointA));
			assert(rect.contains(pointB));
			assert(rect.contains(pointC));
			assert(rect.contains(pointD));
			var pointW = new Vector(-4, 2);
			var pointX = new Vector(-6, 12);
			var pointY = new Vector(2, 13);
			var pointZ = new Vector(5, 6);
			assert(!rect.contains(pointW));
			assert(!rect.contains(pointX));
			assert(!rect.contains(pointY));
			assert(!rect.contains(pointZ));
		});
		test('Overlap test.', () {
			var rectA = new Rect(1, 2, 4, 8);
			var rectB = new Rect(2, 4, 8, 16);
			var rectC = new Rect(6, 12, 12, 24);
			assert(rectA.overlaps(rectB));
			assert(rectB.overlaps(rectA));
			assert(rectB.overlaps(rectC));
			assert(rectC.overlaps(rectB));
			assert(!rectA.overlaps(rectC));
			assert(!rectC.overlaps(rectA));
		});
		test('Union test.', () {
			var rectA = new Rect(-1, -2, 4, 8);
			var rectB = new Rect(-4, 1, 8, 6);
			var rectC = new Rect(-4, -2, 8, 8);
			assert(rectA.union(rectB) == rectC);
		});
	});
	group('Line:', (){
		test('equality and constructor test.', (){
			var A = new Vector(-1, -2);
			var B = new Vector(4, 8);
			var lineP = new Line(A, B);
			var lineQ = new Line.byValue(-1, -2, 4, 8);
			assert(lineP == lineQ);
		});
		test('Length test.', (){
			var line = new Line.byValue(1, 2, 4, 6);
			assert(line.length == 5);
		});
		test('unitVector test.', (){
			var line = new Line.byValue(1, 2, 4, 6);
			assert(line.unitVector== new Vector(0.6,0.8));
		});
		test('boundingBox test.', (){
			var lineP = new Line.byValue(3,7, 6, 2);
			var lineQ = new Line.byValue(6, 7, 3, 2);
			assert(lineP.boundingBox == lineQ.boundingBox);
		});
		test('intersection test', (){
			Line p, q;
			Vector intersect;
			p = new Line.byValue(0, 2, 2, 0);
			q = new Line.byValue(0, 0, 2, 2);
			intersect = new Vector(1, 1);
			expect(p.intersection(q), equals(intersect));
			expect(q.intersection(p), equals(intersect));

			p = new Line.byValue(-2, -2, 1, 1);
			q = new Line.byValue(1, 1, 4, 0);
			intersect = new Vector(1, 1);
			expect(p.intersection(q), equals(intersect));
			expect(q.intersection(p), equals(intersect));

			p = new Line.byValue(0, 0, 4, 4);
			q = new Line.byValue(3, 2, 1, 0);
			intersect = null;
			expect(p.intersection(q), equals(intersect));
			expect(q.intersection(p), equals(intersect));

			p = new Line.byValue(0, 0, 0, 4);
			q = new Line.byValue(-2, 2, 2, 2);
			intersect = new Vector(0, 2);
			expect(p.intersection(q), equals(intersect));
			expect(q.intersection(p), equals(intersect));

			p = new Line.byValue(2, -8, 2, 8);
			q = new Line.byValue(0, 0, 4, 4);
			intersect = new Vector(2, 2);
			expect(p.intersection(q), equals(intersect));
			expect(q.intersection(p), equals(intersect));

			p = new Line.byValue(0, 4, 8, 4);
			q = new Line.byValue(2, 0, 4, 8);
			intersect = new Vector(3, 4);
			expect(p.intersection(q), equals(intersect));
			expect(q.intersection(p), equals(intersect));

			p = new Line.byValue(1, 2, 2, 3);
			q = new Line.byValue(0, 0, 4, 4);
			intersect = null;
			expect(p.intersection(q), equals(intersect));
			expect(q.intersection(p), equals(intersect));
		});
	});
}