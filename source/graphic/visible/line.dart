
part of visible;

class Line extends geo.Line implements Visible{

	final Surface surface;
	Colour colour;

	Circle(this.surface, num x, num y, num radius, this.colour){


	}
}