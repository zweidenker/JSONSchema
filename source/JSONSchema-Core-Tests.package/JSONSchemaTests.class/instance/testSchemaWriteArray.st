tests
testSchemaWriteArray

	| schema object value |
	schema := {
	#foo -> (JSONSchemaArray new items: (JSONSchema string formatString: 'date-time')).
	} asJSONSchema.
	
	
	object := { 
		#foo -> {(DateAndTime year: 2018 month: 10 day: 9 hour: 13 minute: 15 second: 8 offset: 1 hour).}
		} as: NeoJSONObject.

	value := schema write: object.
	
	self assert: value equals: '{"foo":["2018-10-09T13:15:08+01:00"]}'