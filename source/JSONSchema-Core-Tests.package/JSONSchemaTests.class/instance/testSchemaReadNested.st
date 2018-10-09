tests
testSchemaReadNested

	| schema object |
	schema := {
	#foo -> (JSONSchema string formatString: 'date-time').
	#bar -> { 
		#one -> JSONSchema string }  
	} asJSONSchema.
	
	object := schema read: '{"foo":"2018-10-09T13:15:08+01:00","bar":{"one":"two"}}'.
	self assert: object foo equals: (DateAndTime year: 2018 month: 10 day: 9 hour: 13 minute: 15 second: 8 offset: 1 hour).
	self assert: object bar equals: ({ #one -> #two } as: NeoJSONObject)

	
