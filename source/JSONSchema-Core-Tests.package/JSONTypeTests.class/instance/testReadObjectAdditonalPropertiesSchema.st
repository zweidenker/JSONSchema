tests
testReadObjectAdditonalPropertiesSchema
	| schema value |
	schema := { 
		#foo -> #string  } asJSONSchema.
	schema additionalProperties: JSONSchema number.
	self 
		shouldnt: [ value := schema readString: '{ "foo" : "one", "bar" : 3 }' ]
		raise: JSONTypeError.
		
	self assert: (value includesKey: #bar)