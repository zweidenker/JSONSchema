Class {
	#name : 'JSONSchemaValidationOfDateStringsTests2',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Date',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Date'
}

{ #category : 'accessing' }
JSONSchemaValidationOfDateStringsTests2 >> schemaString [
	^ '{"format":"date"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfDateStringsTests2 >> testAValidDateString [
	self assertValid: '"1963-06-19"' description: 'a valid date string'
]

{ #category : 'tests' }
JSONSchemaValidationOfDateStringsTests2 >> testAnInvalidDateTimeString [
	self
		assertInvalid: '"06/19/1963"'
		description: 'an invalid date-time string'
]

{ #category : 'tests' }
JSONSchemaValidationOfDateStringsTests2 >> testOnlyRFC3339NotAllOfISO8601AreValid [
	self
		assertInvalid: '"2013-350"'
		description: 'only RFC3339 not all of ISO 8601 are valid'
]
