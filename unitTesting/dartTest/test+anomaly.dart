
part of dartTest;

class Test extends _Aggregate<_anomaly>{

	static Test _currentTest;

	static void _addEntry(_anomaly result){
		_currentTest._entries.add(result);
	}

	Test(name, testBody) : super.deferred(name){
		this._entries = new List<_anomaly>();
		_currentTest = this;
		testBody();
	}

	@override
	UListElement get _node{
		var node = new UListElement()
			..style.marginLeft = '1em'
			..style.paddingLeft = '0em'
			..style.color = _passed? 'LimeGreen' : 'Red';
		var bullet = new SpanElement()
			..style.fontFamily = 'Webdings'
			..text = _passed? 'a' : 'r';
		node.append(bullet);
		node.appendText(' '+_name);
		for(var result in _entries){
			node.append(result._node);
		}
		return node;
	}
}

class _anomaly implements _Transcript{
	bool get _passed => false;
	String _message = '';
	_anomaly(this._message);
	LIElement get _node{
		if(_message.isEmpty) return null;
		var node = new LIElement()
			..style.textIndent = '0em'
			..style.marginLeft = '0em'
			..style.color = 'red'
			..text = this._message;
		return node;
	}
}