tests
testReadObjectRequiredPropertiesMet
	| schema value |
	schema := { 
		#foo -> #string.
		#bar -> #string } asJSONSchema.
	schema required: #(foo bar).
	self 
		shouldnt: [ value := schema readString: '{ "foo" : "one", "bar" : "two" }' ]
		raise: JSONTypeErrror.
		
	self assert: (value includesKey: #foo).
	self assert: (value includesKey: #bar) 
