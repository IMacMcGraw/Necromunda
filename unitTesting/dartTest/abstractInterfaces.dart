
part of dartTest;

abstract class _Transcript{
	bool get _passed;
	HtmlElement get _node;
}

abstract class _Aggregate<T extends _Transcript> implements _Transcript{
	String _name;
	List<T> _entries;

	_Aggregate(this._name, this._entries);

	_Aggregate.deferred(this._name);

	bool get _passed{
		for(T entry in _entries){
			if(!entry._passed){
				return false;
			}
		}
		return true;
	}
	UListElement get _node{
		var node = new UListElement()
			..style.marginLeft = '2em'
			..style.paddingLeft = '0em';
		var title = new SpanElement()
			..text = _name
			..style.color = _passed? 'LimeGreen' : 'red';
		node.append(title);
		for(T entry in _entries){
			node.append(entry._node);
		}
		return node;
	}
}