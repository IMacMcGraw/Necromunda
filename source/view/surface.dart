
part of view;


/// A drawing surface.
class Surface{
	int zIndex;



	Surface(this.zIndex);

	bool mouseMoveHandler(MouseEvent){
		print(zIndex);
	}
	bool _mouseDownHandler(MouseEvent){}
	bool _mouseUpHandler(MouseEvent){}

	_resizeHandler(){}


}