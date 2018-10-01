tests
testReadObject
	| schema value |
	schema := JSONSchemaObject new 
		properties: { 
			#foo -> JSONSchema string } asDictionary.
	self 
		shouldnt: [ value := schema readString: '{ "foo" : "bar" }' ]
		raise: JSONTypeErrror.
		
	self assert: (value includesKey: #foo) 
