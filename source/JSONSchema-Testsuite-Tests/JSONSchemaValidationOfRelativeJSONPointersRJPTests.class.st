Class {
	#name : 'JSONSchemaValidationOfRelativeJSONPointersRJPTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-RelativeJsonPointer',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'RelativeJsonPointer'
}

{ #category : 'testing' }
JSONSchemaValidationOfRelativeJSONPointersRJPTests >> expectedFailures [
	^ #(#testAnInvalidRJPThatIsAValidJSONPointer #testNegativePrefix)
]

{ #category : 'accessing' }
JSONSchemaValidationOfRelativeJSONPointersRJPTests >> schemaString [
	^ '{"format":"relative-json-pointer"}'
]

{ #category : 'tests' }
JSONSchemaValidationOfRelativeJSONPointersRJPTests >> testAValidDownwardsRJP [
	self assertValid: '"0/foo/bar"' description: 'a valid downwards RJP'
]

{ #category : 'tests' }
JSONSchemaValidationOfRelativeJSONPointersRJPTests >> testAValidRJPTakingTheMemberOrIndexName [
	self
		assertValid: '"0#"'
		description: 'a valid RJP taking the member or index name'
]

{ #category : 'tests' }
JSONSchemaValidationOfRelativeJSONPointersRJPTests >> testAValidUpAndThenDownRJPWithArrayIndex [
	self
		assertValid: '"2/0/baz/1/zip"'
		description: 'a valid up and then down RJP, with array index'
]

{ #category : 'tests' }
JSONSchemaValidationOfRelativeJSONPointersRJPTests >> testAValidUpwardsRJP [
	self assertValid: '"1"' description: 'a valid upwards RJP'
]

{ #category : 'tests' }
JSONSchemaValidationOfRelativeJSONPointersRJPTests >> testAnInvalidRJPThatIsAValidJSONPointer [
	self
		assertInvalid: '"/foo/bar"'
		description: 'an invalid RJP that is a valid JSON Pointer'
]

{ #category : 'tests' }
JSONSchemaValidationOfRelativeJSONPointersRJPTests >> testNegativePrefix [
	self assertInvalid: '"-1/foo/bar"' description: 'negative prefix'
]
