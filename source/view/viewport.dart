
part of view;


class Viewport{

	var _layers = new List<Surface>();

	Viewport();

	addLayer(Surface surface){
		_layers.add(surface);
		_sortLayersByZIndex();
	}
	removeLayer(Surface surface){
		_layers.remove(surface);
	}

	UnmodifiableListView<Surface> get layers => new UnmodifiableListView(this._layers);//new List.unmodifiable(this._layers);

	_sortLayersByZIndex(){
		this._layers.sort( (A, B) {
			if(A.zIndex == B.zIndex) return 0;
			return (A.zIndex > B.zIndex)? 1 : -1;
		});
	}

	get onMouseDown;

}