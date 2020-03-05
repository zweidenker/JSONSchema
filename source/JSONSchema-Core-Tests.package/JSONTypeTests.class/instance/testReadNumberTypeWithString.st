tests
testReadNumberTypeWithString
	self 
		should: [ JSONSchemaNumber read: '123' ]
		raise: JSONTypeError  
