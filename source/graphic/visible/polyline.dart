
part of visible;

class Polyline extends geo.Polyline implements Visible{

	final Surface surface;
	Colour colour;

	Circle(this.surface, num x, num y, num radius, this.colour){


	}
}