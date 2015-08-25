
library events;

import 'dart:html' as html;

import '../graphic/geo/geo.dart';

part 'coreClasses.dart';



class DeltaT{
	final double ms;
	const DeltaT(double milliseconds) : ms = milliseconds;
	const DeltaT.micro(int microseconds) : ms = microseconds/1000;
}

class MouseData extends Vector{

	MouseData(x, y) : super(x, y);

	MouseData.fromMouseEvent(html.MouseEvent e)
	: this(e.client.x, e.client.y);
}
