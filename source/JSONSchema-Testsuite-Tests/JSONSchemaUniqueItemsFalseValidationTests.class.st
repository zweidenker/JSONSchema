Class {
	#name : 'JSONSchemaUniqueItemsFalseValidationTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-UniqueItems',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'UniqueItems'
}

{ #category : 'testing' }
JSONSchemaUniqueItemsFalseValidationTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaUniqueItemsFalseValidationTests >> schemaString [
	^ '{"uniqueItems":false}'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseValidationTests >> test0AndFalseAreUnique [
	self assertValid: '[0,false]' description: '0 and false are unique'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseValidationTests >> test1AndTrueAreUnique [
	self assertValid: '[1,true]' description: '1 and true are unique'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseValidationTests >> testFalseIsNotEqualToZero [
	self
		assertValid: '[0,false]'
		description: 'false is not equal to zero'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseValidationTests >> testNonUniqueArrayOfArraysIsValid [
	self
		assertValid: '[["foo"],["foo"]]'
		description: 'non-unique array of arrays is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseValidationTests >> testNonUniqueArrayOfIntegersIsValid [
	self
		assertValid: '[1,1]'
		description: 'non-unique array of integers is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseValidationTests >> testNonUniqueArrayOfNestedObjectsIsValid [
	self
		assertValid: '[{"foo":{"bar":{"baz":true}}},{"foo":{"bar":{"baz":true}}}]'
		description: 'non-unique array of nested objects is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseValidationTests >> testNonUniqueArrayOfObjectsIsValid [
	self
		assertValid: '[{"foo":"bar"},{"foo":"bar"}]'
		description: 'non-unique array of objects is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseValidationTests >> testNonUniqueHeterogeneousTypesAreValid [
	self
		assertValid: '[{},[1],true,null,{},1]'
		description: 'non-unique heterogeneous types are valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseValidationTests >> testNumbersAreUniqueIfMathematicallyUnequal [
	self
		assertValid: '[1.0,1.0,1]'
		description: 'numbers are unique if mathematically unequal'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseValidationTests >> testTrueIsNotEqualToOne [
	self assertValid: '[1,true]' description: 'true is not equal to one'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseValidationTests >> testUniqueArrayOfArraysIsValid [
	self
		assertValid: '[["foo"],["bar"]]'
		description: 'unique array of arrays is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseValidationTests >> testUniqueArrayOfIntegersIsValid [
	self
		assertValid: '[1,2]'
		description: 'unique array of integers is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseValidationTests >> testUniqueArrayOfNestedObjectsIsValid [
	self
		assertValid: '[{"foo":{"bar":{"baz":true}}},{"foo":{"bar":{"baz":false}}}]'
		description: 'unique array of nested objects is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseValidationTests >> testUniqueArrayOfObjectsIsValid [
	self
		assertValid: '[{"foo":"bar"},{"foo":"baz"}]'
		description: 'unique array of objects is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseValidationTests >> testUniqueHeterogeneousTypesAreValid [
	self
		assertValid: '[{},[1],true,null,1]'
		description: 'unique heterogeneous types are valid'
]
