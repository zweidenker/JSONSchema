tests
testReadIntegerTypeWithString
	self 
		should: [ JSONSchemaInteger read: '123' ]
		raise: JSONTypeError  
