
library necromunda;
//import 'dart:html' as html;
//import 'dart:math' as math;
//import 'dart:async' as async;

import './events/events.dart';
import './view/view.dart';


main(){

	//var surface = new Surface(7);

	var viewport = new Viewport();

	viewport.onMouseDown.addListener( (MouseData e) => print(e.coordinates) );

}
