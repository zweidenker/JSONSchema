Class {
	#name : 'JSONSchemaValidationOfDateTimeStringsTests2',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-DateTime',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'DateTime'
}

{ #category : 'testing' }
JSONSchemaValidationOfDateTimeStringsTests2 >> expectedFailures [
	^ #(#testAInvalidDayInDateTimeString #testAnInvalidDateTimeString #testAnInvalidOffsetInDateTimeString #testOnlyRFC3339NotAllOfISO8601AreValid)
]

{ #category : 'accessing' }
JSONSchemaValidationOfDateTimeStringsTests2 >> schemaString [
	^ '{"format":"date-time"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfDateTimeStringsTests2 >> testAInvalidDayInDateTimeString [
	self
		assertInvalid: '"1990-02-31T15:59:60.123-08:00"'
		description: 'a invalid day in date-time string'
]

{ #category : 'tests' }
JSONSchemaValidationOfDateTimeStringsTests2 >> testAValidDateTimeString [
	self
		assertValid: '"1963-06-19T08:30:06.283185Z"'
		description: 'a valid date-time string'
]

{ #category : 'tests' }
JSONSchemaValidationOfDateTimeStringsTests2 >> testAValidDateTimeStringWithMinusOffset [
	self
		assertValid: '"1990-12-31T15:59:50.123-08:00"'
		description: 'a valid date-time string with minus offset'
]

{ #category : 'tests' }
JSONSchemaValidationOfDateTimeStringsTests2 >> testAValidDateTimeStringWithPlusOffset [
	self
		assertValid: '"1937-01-01T12:00:27.87+00:20"'
		description: 'a valid date-time string with plus offset'
]

{ #category : 'tests' }
JSONSchemaValidationOfDateTimeStringsTests2 >> testAValidDateTimeStringWithoutSecondFraction [
	self
		assertValid: '"1963-06-19T08:30:06Z"'
		description: 'a valid date-time string without second fraction'
]

{ #category : 'tests' }
JSONSchemaValidationOfDateTimeStringsTests2 >> testAnInvalidDateTimeString [
	self
		assertInvalid: '"06/19/1963 08:30:06 PST"'
		description: 'an invalid date-time string'
]

{ #category : 'tests' }
JSONSchemaValidationOfDateTimeStringsTests2 >> testAnInvalidOffsetInDateTimeString [
	self
		assertInvalid: '"1990-12-31T15:59:60-24:00"'
		description: 'an invalid offset in date-time string'
]

{ #category : 'tests' }
JSONSchemaValidationOfDateTimeStringsTests2 >> testCaseInsensitiveTAndZ [
	self
		assertValid: '"1963-06-19t08:30:06.283185z"'
		description: 'case-insensitive T and Z'
]

{ #category : 'tests' }
JSONSchemaValidationOfDateTimeStringsTests2 >> testOnlyRFC3339NotAllOfISO8601AreValid [
	self
		assertInvalid: '"2013-350T01:01:01"'
		description: 'only RFC3339 not all of ISO 8601 are valid'
]
