Class {
	#name : 'JSONSchemaValidationOfTimeStringsTests2',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Time',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Time'
}

{ #category : 'testing' }
JSONSchemaValidationOfTimeStringsTests2 >> expectedFailures [
	^ #(#testAnInvalidTimeString #testOnlyRFC3339NotAllOfISO8601AreValid)
]

{ #category : 'accessing' }
JSONSchemaValidationOfTimeStringsTests2 >> schemaString [
	^ '{"format":"time"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfTimeStringsTests2 >> testAValidTimeString [
	self
		assertValid: '"08:30:06.283185Z"'
		description: 'a valid time string'
]

{ #category : 'tests' }
JSONSchemaValidationOfTimeStringsTests2 >> testAnInvalidTimeString [
	self
		assertInvalid: '"08:30:06 PST"'
		description: 'an invalid time string'
]

{ #category : 'tests' }
JSONSchemaValidationOfTimeStringsTests2 >> testOnlyRFC3339NotAllOfISO8601AreValid [
	self
		assertInvalid: '"01:01:01,1111"'
		description: 'only RFC3339 not all of ISO 8601 are valid'
]
