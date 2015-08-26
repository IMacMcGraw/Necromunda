
library geo;

import 'dart:math';
import '../../events/events.dart';


part 'vector.dart';
part 'line.dart';
part 'rect.dart';
part 'polyline.dart';
part 'circle.dart';


/// A common superclass for geometric figures.
abstract class Geo{

	/// Returns the bounding box of this geometric figure.
	Rect get boundingBox;

}