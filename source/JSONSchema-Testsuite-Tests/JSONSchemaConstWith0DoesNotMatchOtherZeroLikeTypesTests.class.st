Class {
	#name : 'JSONSchemaConstWith0DoesNotMatchOtherZeroLikeTypesTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Const',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Const'
}

{ #category : 'accessing' }
JSONSchemaConstWith0DoesNotMatchOtherZeroLikeTypesTests >> schemaString [
	^ '{"const":0}'
]

{ #category : 'tests' }
JSONSchemaConstWith0DoesNotMatchOtherZeroLikeTypesTests >> testEmptyArrayIsInvalid [
	self assertInvalid: '[]' description: 'empty array is invalid'
]

{ #category : 'tests' }
JSONSchemaConstWith0DoesNotMatchOtherZeroLikeTypesTests >> testEmptyObjectIsInvalid [
	self assertInvalid: '{}' description: 'empty object is invalid'
]

{ #category : 'tests' }
JSONSchemaConstWith0DoesNotMatchOtherZeroLikeTypesTests >> testEmptyStringIsInvalid [
	self assertInvalid: '""' description: 'empty string is invalid'
]

{ #category : 'tests' }
JSONSchemaConstWith0DoesNotMatchOtherZeroLikeTypesTests >> testFalseIsInvalid [
	self assertInvalid: 'false' description: 'false is invalid'
]

{ #category : 'tests' }
JSONSchemaConstWith0DoesNotMatchOtherZeroLikeTypesTests >> testFloatZeroIsValid [
	self assertValid: '0.0' description: 'float zero is valid'
]

{ #category : 'tests' }
JSONSchemaConstWith0DoesNotMatchOtherZeroLikeTypesTests >> testIntegerZeroIsValid [
	self assertValid: '0' description: 'integer zero is valid'
]
