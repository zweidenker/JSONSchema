tests
testReadEnum
	| schema value |

	schema := { #foo -> (JSONSchema enum: { 'one' . 'two' . 'three' }) } asJSONSchema.
	self 
		shouldnt: [ value := schema readString: '{ "foo" : "two" }' ]
		raise: JSONTypeErrror.
		
	self assert: (value includesKey: #foo) 
