Class {
	#name : 'JSONSchemaFloatAndIntegersAreEqualUpTo64BitRepresentationLimitsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Const',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Const'
}

{ #category : 'testing' }
JSONSchemaFloatAndIntegersAreEqualUpTo64BitRepresentationLimitsTests >> expectedFailures [
	^ #(#testFloatMinusOneIsInvalid #testIntegerMinusOneIsInvalid)
]

{ #category : 'accessing' }
JSONSchemaFloatAndIntegersAreEqualUpTo64BitRepresentationLimitsTests >> schemaString [
	^ '{"const":9007199254740992}'
]

{ #category : 'tests' }
JSONSchemaFloatAndIntegersAreEqualUpTo64BitRepresentationLimitsTests >> testFloatIsValid [
	self
		assertValid: '9.007199254740992e15'
		description: 'float is valid'
]

{ #category : 'tests' }
JSONSchemaFloatAndIntegersAreEqualUpTo64BitRepresentationLimitsTests >> testFloatMinusOneIsInvalid [
	self
		assertInvalid: '9.007199254740991e15'
		description: 'float minus one is invalid'
]

{ #category : 'tests' }
JSONSchemaFloatAndIntegersAreEqualUpTo64BitRepresentationLimitsTests >> testIntegerIsValid [
	self assertValid: '9007199254740992' description: 'integer is valid'
]

{ #category : 'tests' }
JSONSchemaFloatAndIntegersAreEqualUpTo64BitRepresentationLimitsTests >> testIntegerMinusOneIsInvalid [
	self
		assertInvalid: '9007199254740991'
		description: 'integer minus one is invalid'
]
