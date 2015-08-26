
library necromunda;
//import 'dart:html' as html;
//import 'dart:math' as math;
//import 'dart:async' as async;

import './events/events.dart';
import './graphic/view/view.dart';
import './graphic/visible/visible.dart';
import './graphic/colour/colour.dart';

main(){

	var viewport = new Viewport();

	viewport.onMouseDown.addListener( (e) => print(e) );

	var surface = new Surface();

	var line = new Line(surface, 0, 0, 1000, 1000, Colour.black);



}
