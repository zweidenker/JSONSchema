Class {
	#name : 'JSONSchemaAllOfCombinedWithAnyOfOneOfTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AllOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AllOf'
}

{ #category : 'testing' }
JSONSchemaAllOfCombinedWithAnyOfOneOfTests >> expectedFailures [
	^ #(#testAllOfTrueAnyOfFalseOneOfFalse #testAllOfFalseAnyOfTrueOneOfTrue #testAllOfTrueAnyOfFalseOneOfTrue #testAllOfTrueAnyOfTrueOneOfTrue #testAllOfFalseAnyOfTrueOneOfFalse #testAllOfTrueAnyOfTrueOneOfFalse #testAllOfFalseAnyOfFalseOneOfTrue #testAllOfFalseAnyOfFalseOneOfFalse)
]

{ #category : 'accessing' }
JSONSchemaAllOfCombinedWithAnyOfOneOfTests >> schemaString [
	^ '{"allOf":[{"multipleOf":2}],"oneOf":[{"multipleOf":5}],"anyOf":[{"multipleOf":3}]}'
]

{ #category : 'tests' }
JSONSchemaAllOfCombinedWithAnyOfOneOfTests >> testAllOfFalseAnyOfFalseOneOfFalse [
	self
		assertInvalid: '1'
		description: 'allOf: false, anyOf: false, oneOf: false'
]

{ #category : 'tests' }
JSONSchemaAllOfCombinedWithAnyOfOneOfTests >> testAllOfFalseAnyOfFalseOneOfTrue [
	self
		assertInvalid: '5'
		description: 'allOf: false, anyOf: false, oneOf: true'
]

{ #category : 'tests' }
JSONSchemaAllOfCombinedWithAnyOfOneOfTests >> testAllOfFalseAnyOfTrueOneOfFalse [
	self
		assertInvalid: '3'
		description: 'allOf: false, anyOf: true, oneOf: false'
]

{ #category : 'tests' }
JSONSchemaAllOfCombinedWithAnyOfOneOfTests >> testAllOfFalseAnyOfTrueOneOfTrue [
	self
		assertInvalid: '15'
		description: 'allOf: false, anyOf: true, oneOf: true'
]

{ #category : 'tests' }
JSONSchemaAllOfCombinedWithAnyOfOneOfTests >> testAllOfTrueAnyOfFalseOneOfFalse [
	self
		assertInvalid: '2'
		description: 'allOf: true, anyOf: false, oneOf: false'
]

{ #category : 'tests' }
JSONSchemaAllOfCombinedWithAnyOfOneOfTests >> testAllOfTrueAnyOfFalseOneOfTrue [
	self
		assertInvalid: '10'
		description: 'allOf: true, anyOf: false, oneOf: true'
]

{ #category : 'tests' }
JSONSchemaAllOfCombinedWithAnyOfOneOfTests >> testAllOfTrueAnyOfTrueOneOfFalse [
	self
		assertInvalid: '6'
		description: 'allOf: true, anyOf: true, oneOf: false'
]

{ #category : 'tests' }
JSONSchemaAllOfCombinedWithAnyOfOneOfTests >> testAllOfTrueAnyOfTrueOneOfTrue [
	self
		assertValid: '30'
		description: 'allOf: true, anyOf: true, oneOf: true'
]
