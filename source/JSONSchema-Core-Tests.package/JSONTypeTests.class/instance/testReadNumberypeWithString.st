tests
testReadNumberypeWithString
	self 
		should: [ JSONSchemaNumber read: '123' ]
		raise: JSONTypeErrror  
