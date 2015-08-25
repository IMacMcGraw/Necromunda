
library necromunda;
//import 'dart:html' as html;
//import 'dart:math' as math;
//import 'dart:async' as async;

import './events/events.dart';
import './view/view.dart';


main(){

	var viewport = new Viewport();

	viewport.onMouseDown.addListener( (e) => print(e) );

	var surface = new Surface(viewport);

}
