
part of dartTest;

class Test extends _Aggregate<_Result>{

	static Test _currentTest;

	static void _addResultToCurrentTest(_Result result){
		_currentTest._entries.add(result);
	}

	Test(name, testBody) : super.deferred(name){
		this._entries = new List<_Result>();
		_currentTest = this;
		testBody();
	}

	@override
	html.UListElement get _node{
		var node = new html.UListElement();

		node.style.listStyleType = 'none';
		//node.style.textIndent = '1em';

		var bullet = new html.SpanElement();
		bullet.style.fontFamily = 'Webdings';
		if(_passed){
			node.style.color = 'LimeGreen';
			bullet.text = 'a'; //A checkmark in Webdings.
		}
		else{
			node.style.color = 'red';
			bullet.text = 'r'; //An 'X' in Webdings.
		}
		node.append(bullet);
		node.appendText(' '+_name);

		for(var result in _entries){
			node.append(result._node);
		}
		return node;
	}
}

class _Result implements _Transcript{
	bool _passed = true;
	String _message = '';
	_Result(this._passed, this._message);
	html.LIElement get _node{
		if(_message.isEmpty) return null;
		var node = new html.LIElement()
			..style.textIndent = '0em'
			..style.marginLeft = '1em'
			..style.color = 'red'
			..text = this._message;
		return node;
	}
}