
part of dartTest;

class Framework extends _Aggregate<Module>{
	void set backgroundColour(value)=> html.document.body.style.backgroundColor = value;
	Framework(String name, List<Module> entries) : super(name, entries){
		html.document.body.append(_node);
	}
}

class Module extends _Aggregate<Group>{
	Module(String name, List<Group> entries) : super(name, entries);
}

class Group extends _Aggregate<Test>{
	Group(String name, List<Test> entries) : super(name, entries);
}


