
part of view;

class WorldView extends Surface{

	Transform _transform;


	@mustInvokeSuper
	viewChanged(Rect e){

		super(this._transform.viewRect);
	}

	@mustInvokeSuper
	render(){

	}


}