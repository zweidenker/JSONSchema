tests
testReadIntegerTypeString
	self 
		shouldnt: [ JSONSchemaInteger readString: '123' ]
		raise: JSONTypeError  
