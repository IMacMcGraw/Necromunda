
part of visible;

class Circle extends geo.Circle implements Visible{

	geo.Vector _origin;
	geo.Vector get origin => _origin;


	final Surface surface;
	Colour colour;

	Circle(this.surface, num x, num y, num radius, this.colour){

		
	}
}