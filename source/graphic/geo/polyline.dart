
part of geo;

class Polyline extends Geo{

	final List<Line> _lines = new List<Line>();
	final List<Vector> _points;

	Rect get boundingBox{
		var bounds = new Rect.zero();
		for(var point in _points){
			if(point.x > bounds.xMax) bounds.xMax = point.x;
			else if(point.x < bounds.xMin) bounds.xMin = point.x;
			if(point.y > bounds.yMax) bounds.yMax = point.y;
			else if(point.y < bounds.yMin) bounds.yMin = point.y;
		}
		return bounds;
	}

	Polyline(this._points){
		_createLines();
	}

	void _createLines(){
		for(var i = 0; i < _points.length - 1; i++){
			_lines.add(new Line.fromAtoB(_points[i], _points[i + 1]));
		}
	}

	void remove({Vector point}){
		var index = _points.indexOf(point);
		if(index < 0 || index >= _points.length) return;
		if(index == 0){
			_lines.removeAt(0);
		}
		else if(index == _points.length - 1){
			_lines.removeAt(index - 1);
		}
		else{
			_lines[index - 1].p2 = _points[index + 1];
			_lines.removeAt(index);
		}
		this._points.remove(point);
	}

	void insert({Vector oldPoint, Vector newPoint}){

	}



}