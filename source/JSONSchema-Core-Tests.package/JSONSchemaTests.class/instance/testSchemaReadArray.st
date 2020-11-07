tests
testSchemaReadArray

	| schema object|
	schema := {
	#foo -> (JSONSchemaArray new items: (JSONSchema string formatString: 'date-time')).
	} asJSONSchema.
	
	object := schema readString: '{"foo":["2018-10-09T13:15:08+01:00","2019-10-09T13:15:08+01:00"]}'.
	
	self assert: object foo first equals: (DateAndTime year: 2018 month: 10 day: 9 hour: 13 minute: 15 second: 8 offset: 1 hour).
	self assert: object foo second equals: (DateAndTime year: 2019 month: 10 day: 9 hour: 13 minute: 15 second: 8 offset: 1 hour).	