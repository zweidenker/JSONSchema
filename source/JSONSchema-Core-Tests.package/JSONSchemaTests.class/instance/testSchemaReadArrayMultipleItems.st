tests
testSchemaReadArrayMultipleItems

	| schema object|
	schema := {
	#foo -> (JSONSchemaArray new items: {
		JSONSchema integer.
		JSONSchema string.
		JSONSchema string formatString: 'date-time' }).
	} asJSONSchema.
	
	object := schema readString: '{"foo":[3,"foobar","2019-10-09T13:15:08+01:00"]}'.
	
	self assert: object foo first equals: 3.
	self assert: object foo second equals: #foobar.
	self assert: object foo third equals: (DateAndTime year: 2019 month: 10 day: 9 hour: 13 minute: 15 second: 8 offset: 1 hour).	