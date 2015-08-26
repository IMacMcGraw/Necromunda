
library events;

import 'dart:html' as html;
import 'dart:mirrors';

import '../graphic/geo/geo.dart';

part 'coreClasses.dart';
part 'eventMixins.dart';
part 'mutableMixin.dart';


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

// TODO: Fix this documentation.
/// Mixins in the event library rely on the base method,
/// in order to generate events.
/// And so any override must make a call to super.
const String mustInvokeSuper = 'Must invoke super';