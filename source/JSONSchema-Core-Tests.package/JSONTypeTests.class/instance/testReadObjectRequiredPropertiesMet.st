tests
testReadObjectRequiredPropertiesMet
	| schema value string |
	schema := { 
		#foo -> #string.
		#bar -> #string } asJSONSchema.
	schema required: #(foo bar).
	self 
		shouldnt: [ value := schema readString: '{ "foo" : "one", "bar" : "two" }' ]
		raise: JSONTypeErrror.
		
	self assert: (value includesKey: #foo).
	self assert: (value includesKey: #bar).
	
	self 
		shouldnt: [ string := schema write: value ]
	 	raise: JSONTypeErrror.
		
	self assert: (string includesSubstring: 'one').
	self assert: (string includesSubstring: 'two')
