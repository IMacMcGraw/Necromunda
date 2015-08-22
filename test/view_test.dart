
@TestOn('dartium')

library view_test;

import '../source/view/view.dart' as view;
//import 'dart:html';
//import 'dart:collection' as collection;
import 'package:test/test.dart';

main(){

	group('Viewport ', (){
		test('surface addition and removal testing', () {

			var layer0 = new view.Surface(0);
			var layer1 = new view.Surface(1);
			var layer2 = new view.Surface(2);
			var layer3 = new view.Surface(3);

			var viewport = new view.Viewport()
				..addLayer(layer2)
				..addLayer(layer3)
				..addLayer(layer0)
				..addLayer(layer1);

			viewport.removeLayer(layer3);

			var layers = viewport.layers;

			expect(layers.length, equals(3));
			expect(layers.contains(layer3), equals(false));
			expect(layers[0], equals(layer0));
			expect(layers[1], equals(layer1));
			expect(layers[2], equals(layer2));
		});
	});
}