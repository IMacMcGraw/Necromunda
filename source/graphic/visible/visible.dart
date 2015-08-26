
library visible;

import 'dart:html' as html;

import '../../events/events.dart';
import '../colour/colour.dart';
import '../geo/geo.dart' as geo;
import '../view/view.dart';

part 'circle.dart';
part 'line.dart';
part 'polyline.dart';
part 'rect.dart';


abstract class Visible{

	Colour get colour;

	html.Path2D get path;

}