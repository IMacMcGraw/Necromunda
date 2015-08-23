
part of dartTest;

class Module extends _Aggregate<Group>{
	Module(String name, List<Group> entries) : super(name, entries){
		document.body.append(_node);
	}
}

class Group extends _Aggregate<Test>{
	Group(String name, List<Test> entries) : super(name, entries);
}


