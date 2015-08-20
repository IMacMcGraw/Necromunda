
library view_test;

import '../view/view.dart' as dwg;
import 'dart:collection' as collection;
import 'package:test/test.dart';

main(){

	group('Viewport ', (){
		test('surface addition and removal testing', () {

			var layer0 = new dwg.Surface(0);
			var layer1 = new dwg.Surface(1);
			var layer2 = new dwg.Surface(2);
			var layer3 = new dwg.Surface(3);

			var viewport = new dwg.Viewport()
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