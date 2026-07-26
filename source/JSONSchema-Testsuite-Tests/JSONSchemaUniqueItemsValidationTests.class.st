Class {
	#name : 'JSONSchemaUniqueItemsValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-UniqueItems',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'UniqueItems'
}

{ #category : 'testing' }
JSONSchemaUniqueItemsValidationTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaUniqueItemsValidationTests >> schemaString [
	^ '{"uniqueItems":true}'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> test0AndFalseAreUnique1 [
	self assertValid: '[0,false]' description: '0 and false are unique'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> test0AndFalseAreUnique2 [
	self
		assertValid: '[[0],[false]]'
		description: '[0] and [false] are unique'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> test1AndTrueAreUnique1 [
	self assertValid: '[1,true]' description: '1 and true are unique'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> test1AndTrueAreUnique2 [
	self
		assertValid: '[[1],[true]]'
		description: '[1] and [true] are unique'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> testDifferentObjectsAreUnique [
	self
		assertValid: '[{"a":1,"b":2},{"a":2,"b":1}]'
		description: 'different objects are unique'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> testFalseIsNotEqualToZero [
	self
		assertValid: '[0,false]'
		description: 'false is not equal to zero'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> testNested0AndFalseAreUnique [
	self
		assertValid: '[[[0],"foo"],[[false],"foo"]]'
		description: 'nested [0] and [false] are unique'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> testNested1AndTrueAreUnique [
	self
		assertValid: '[[[1],"foo"],[[true],"foo"]]'
		description: 'nested [1] and [true] are unique'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> testNonUniqueArrayOfArraysIsInvalid [
	self
		assertInvalid: '[["foo"],["foo"]]'
		description: 'non-unique array of arrays is invalid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> testNonUniqueArrayOfIntegersIsInvalid [
	self
		assertInvalid: '[1,1]'
		description: 'non-unique array of integers is invalid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> testNonUniqueArrayOfNestedObjectsIsInvalid [
	self
		assertInvalid: '[{"foo":{"bar":{"baz":true}}},{"foo":{"bar":{"baz":true}}}]'
		description: 'non-unique array of nested objects is invalid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> testNonUniqueArrayOfObjectsIsInvalid [
	self
		assertInvalid: '[{"foo":"bar"},{"foo":"bar"}]'
		description: 'non-unique array of objects is invalid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> testNonUniqueHeterogeneousTypesAreInvalid [
	self
		assertInvalid: '[{},[1],true,null,{},1]'
		description: 'non-unique heterogeneous types are invalid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> testNumbersAreUniqueIfMathematicallyUnequal [
	self
		assertInvalid: '[1.0,1.0,1]'
		description: 'numbers are unique if mathematically unequal'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> testObjectsAreNonUniqueDespiteKeyOrder [
	self
		assertInvalid: '[{"a":1,"b":2},{"b":2,"a":1}]'
		description: 'objects are non-unique despite key order'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> testTrueIsNotEqualToOne [
	self assertValid: '[1,true]' description: 'true is not equal to one'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> testUniqueArrayOfArraysIsValid [
	self
		assertValid: '[["foo"],["bar"]]'
		description: 'unique array of arrays is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> testUniqueArrayOfIntegersIsValid [
	self
		assertValid: '[1,2]'
		description: 'unique array of integers is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> testUniqueArrayOfNestedObjectsIsValid [
	self
		assertValid: '[{"foo":{"bar":{"baz":true}}},{"foo":{"bar":{"baz":false}}}]'
		description: 'unique array of nested objects is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> testUniqueArrayOfObjectsIsValid [
	self
		assertValid: '[{"foo":"bar"},{"foo":"baz"}]'
		description: 'unique array of objects is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsValidationTests >> testUniqueHeterogeneousTypesAreValid [
	self
		assertValid: '[{},[1],true,null,1,"{}"]'
		description: 'unique heterogeneous types are valid'
]
