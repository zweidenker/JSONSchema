Class {
	#name : 'JSONSchemaMultipleSimultaneousPatternPropertiesAreValidatedTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-PatternProperties',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'PatternProperties'
}

{ #category : 'testing' }
JSONSchemaMultipleSimultaneousPatternPropertiesAreValidatedTests >> expectedFailures [
	^ #(#testAnInvalidDueToBothIsInvalid #testAnInvalidDueToTheOtherIsInvalid #testAnInvalidDueToOneIsInvalid)
]

{ #category : 'accessing' }
JSONSchemaMultipleSimultaneousPatternPropertiesAreValidatedTests >> schemaString [
	^ '{"patternProperties":{"a*":{"type":"integer"},"aaa*":{"maximum":20}}}'
]

{ #category : 'tests' }
JSONSchemaMultipleSimultaneousPatternPropertiesAreValidatedTests >> testASimultaneousMatchIsValid [
	self
		assertValid: '{"aaaa":18}'
		description: 'a simultaneous match is valid'
]

{ #category : 'tests' }
JSONSchemaMultipleSimultaneousPatternPropertiesAreValidatedTests >> testASingleValidMatchIsValid [
	self
		assertValid: '{"a":21}'
		description: 'a single valid match is valid'
]

{ #category : 'tests' }
JSONSchemaMultipleSimultaneousPatternPropertiesAreValidatedTests >> testAnInvalidDueToBothIsInvalid [
	self
		assertInvalid: '{"aaa":"foo","aaaa":31}'
		description: 'an invalid due to both is invalid'
]

{ #category : 'tests' }
JSONSchemaMultipleSimultaneousPatternPropertiesAreValidatedTests >> testAnInvalidDueToOneIsInvalid [
	self
		assertInvalid: '{"a":"bar"}'
		description: 'an invalid due to one is invalid'
]

{ #category : 'tests' }
JSONSchemaMultipleSimultaneousPatternPropertiesAreValidatedTests >> testAnInvalidDueToTheOtherIsInvalid [
	self
		assertInvalid: '{"aaaa":31}'
		description: 'an invalid due to the other is invalid'
]

{ #category : 'tests' }
JSONSchemaMultipleSimultaneousPatternPropertiesAreValidatedTests >> testMultipleMatchesIsValid [
	self
		assertValid: '{"a":21,"aaaa":18}'
		description: 'multiple matches is valid'
]
