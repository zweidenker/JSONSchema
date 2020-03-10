tests
testReadDateAndTimeTypeString
	| value |
	self 
		shouldnt: [ value := JSONSchemaString readString: '2018-10-09T13:15:08+01:00' format: #'date-time' ]
		raise: JSONTypeError.
		self assert: value equals: (DateAndTime fromString: '2018-10-09T13:15:08+01:00') 
