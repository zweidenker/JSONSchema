Class {
	#name : 'JSONSchemaEnumsInPropertiesTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Enum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Enum'
}

{ #category : 'testing' }
JSONSchemaEnumsInPropertiesTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaEnumsInPropertiesTests >> schemaString [
	^ '{"properties":{"foo":{"enum":["foo"]},"bar":{"enum":["bar"]}},"required":["bar"],"type":"object"}'
]

{ #category : 'tests' }
JSONSchemaEnumsInPropertiesTests >> testBothPropertiesAreValid [
	self
		assertValid: '{"foo":"foo","bar":"bar"}'
		description: 'both properties are valid'
]

{ #category : 'tests' }
JSONSchemaEnumsInPropertiesTests >> testMissingAllPropertiesIsInvalid [
	self
		assertInvalid: '{}'
		description: 'missing all properties is invalid'
]

{ #category : 'tests' }
JSONSchemaEnumsInPropertiesTests >> testMissingOptionalPropertyIsValid [
	self
		assertValid: '{"bar":"bar"}'
		description: 'missing optional property is valid'
]

{ #category : 'tests' }
JSONSchemaEnumsInPropertiesTests >> testMissingRequiredPropertyIsInvalid [
	self
		assertInvalid: '{"foo":"foo"}'
		description: 'missing required property is invalid'
]

{ #category : 'tests' }
JSONSchemaEnumsInPropertiesTests >> testWrongBarValue [
	self
		assertInvalid: '{"foo":"foo","bar":"bart"}'
		description: 'wrong bar value'
]

{ #category : 'tests' }
JSONSchemaEnumsInPropertiesTests >> testWrongFooValue [
	self
		assertInvalid: '{"foo":"foot","bar":"bar"}'
		description: 'wrong foo value'
]
