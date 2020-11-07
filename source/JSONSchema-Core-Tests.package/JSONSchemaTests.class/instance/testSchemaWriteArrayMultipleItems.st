tests
testSchemaWriteArrayMultipleItems

	| schema object value date |
	schema := {
	#foo -> (JSONSchemaArray new items: {
		JSONSchema integer.
		JSONSchema string.
		JSONSchema string formatString: 'date-time' }).
	} asJSONSchema.
	
	date := DateAndTime year: 2019 month: 10 day: 9 hour: 13 minute: 15 second: 8 offset: 1 hour.
	
	object := { 
		#foo -> { 3 . #foobar.  date}
		} as: NeoJSONObject.

	value := schema write: object.
	
	self assert: value equals: '{"foo":[3,"foobar","2019-10-09T13:15:08+01:00"]}'