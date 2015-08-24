
part of events;

class Signal{
	const Signal();
}

class DeltaT extends Signal{
	final double ms;
	const DeltaT(double milliseconds) : ms = milliseconds;
	const DeltaT.micro(int microseconds) : ms = microseconds/1000;
}

class ViewData extends Signal{
	final Rect rect;
	const ViewData(this.rect);
}

class MouseData extends Signal{
	final Vector coordinates;

	const MouseData(this.coordinates);

	MouseData.fromMouseEvent(MouseEvent e)
		: coordinates = new Vector(e.clientX, e.clientY);


}
