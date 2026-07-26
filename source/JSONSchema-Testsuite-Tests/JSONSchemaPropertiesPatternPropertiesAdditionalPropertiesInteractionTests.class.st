Class {
	#name : 'JSONSchemaPropertiesPatternPropertiesAdditionalPropertiesInteractionTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Properties',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Properties'
}

{ #category : 'testing' }
JSONSchemaPropertiesPatternPropertiesAdditionalPropertiesInteractionTests >> expectedFailures [
	^ #(#testPatternPropertyInvalidatesProperty #testAdditionalPropertyInvalidatesOthers #testPatternPropertyInvalidatesNonproperty)
]

{ #category : 'accessing' }
JSONSchemaPropertiesPatternPropertiesAdditionalPropertiesInteractionTests >> schemaString [
	^ '{"properties":{"foo":{"maxItems":3,"type":"array"},"bar":{"type":"array"}},"patternProperties":{"f.o":{"minItems":2}},"additionalProperties":{"type":"integer"}}'
]

{ #category : 'tests' }
JSONSchemaPropertiesPatternPropertiesAdditionalPropertiesInteractionTests >> testAdditionalPropertyIgnoresProperty [
	self
		assertValid: '{"bar":[]}'
		description: 'additionalProperty ignores property'
]

{ #category : 'tests' }
JSONSchemaPropertiesPatternPropertiesAdditionalPropertiesInteractionTests >> testAdditionalPropertyInvalidatesOthers [
	self
		assertInvalid: '{"quux":"foo"}'
		description: 'additionalProperty invalidates others'
]

{ #category : 'tests' }
JSONSchemaPropertiesPatternPropertiesAdditionalPropertiesInteractionTests >> testAdditionalPropertyValidatesOthers [
	self
		assertValid: '{"quux":3}'
		description: 'additionalProperty validates others'
]

{ #category : 'tests' }
JSONSchemaPropertiesPatternPropertiesAdditionalPropertiesInteractionTests >> testPatternPropertyInvalidatesNonproperty [
	self
		assertInvalid: '{"fxo":[]}'
		description: 'patternProperty invalidates nonproperty'
]

{ #category : 'tests' }
JSONSchemaPropertiesPatternPropertiesAdditionalPropertiesInteractionTests >> testPatternPropertyInvalidatesProperty [
	self
		assertInvalid: '{"foo":[]}'
		description: 'patternProperty invalidates property'
]

{ #category : 'tests' }
JSONSchemaPropertiesPatternPropertiesAdditionalPropertiesInteractionTests >> testPatternPropertyValidatesNonproperty [
	self
		assertValid: '{"fxo":[1,2]}'
		description: 'patternProperty validates nonproperty'
]

{ #category : 'tests' }
JSONSchemaPropertiesPatternPropertiesAdditionalPropertiesInteractionTests >> testPropertyInvalidatesProperty [
	self
		assertInvalid: '{"foo":[1,2,3,4]}'
		description: 'property invalidates property'
]

{ #category : 'tests' }
JSONSchemaPropertiesPatternPropertiesAdditionalPropertiesInteractionTests >> testPropertyValidatesProperty [
	self
		assertValid: '{"foo":[1,2]}'
		description: 'property validates property'
]
