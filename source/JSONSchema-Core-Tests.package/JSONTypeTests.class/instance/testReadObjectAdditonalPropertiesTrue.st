tests
testReadObjectAdditonalPropertiesTrue
	| schema value |
	schema := { 
		#foo -> #string  } asJSONSchema.
	schema additionalProperties: true.
	self 
		shouldnt: [ value := schema readString: '{ "foo" : "one", "bar" : "two" }' ]
		raise: JSONTypeErrror.
		
	self assert: (value includesKey: #bar)