Class {
	#name : 'JSONSchemaUniqueItemsWithAnArrayOfItemsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-UniqueItems',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'UniqueItems'
}

{ #category : 'accessing' }
JSONSchemaUniqueItemsWithAnArrayOfItemsTests >> schemaString [
	^ '{"items":[{"type":"boolean"},{"type":"boolean"}],"uniqueItems":true}'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsWithAnArrayOfItemsTests >> testFalseFalseFromItemsArrayIsNotValid [
	self
		assertInvalid: '[false,false]'
		description: '[false, false] from items array is not valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsWithAnArrayOfItemsTests >> testFalseTrueFromItemsArrayIsValid [
	self
		assertValid: '[false,true]'
		description: '[false, true] from items array is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsWithAnArrayOfItemsTests >> testNonUniqueArrayExtendedFromFalseTrueIsNotValid [
	self
		assertInvalid: '[false,true,"foo","foo"]'
		description: 'non-unique array extended from [false, true] is not valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsWithAnArrayOfItemsTests >> testNonUniqueArrayExtendedFromTrueFalseIsNotValid [
	self
		assertInvalid: '[true,false,"foo","foo"]'
		description: 'non-unique array extended from [true, false] is not valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsWithAnArrayOfItemsTests >> testTrueFalseFromItemsArrayIsValid [
	self
		assertValid: '[true,false]'
		description: '[true, false] from items array is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsWithAnArrayOfItemsTests >> testTrueTrueFromItemsArrayIsNotValid [
	self
		assertInvalid: '[true,true]'
		description: '[true, true] from items array is not valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsWithAnArrayOfItemsTests >> testUniqueArrayExtendedFromFalseTrueIsValid [
	self
		assertValid: '[false,true,"foo","bar"]'
		description: 'unique array extended from [false, true] is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsWithAnArrayOfItemsTests >> testUniqueArrayExtendedFromTrueFalseIsValid [
	self
		assertValid: '[true,false,"foo","bar"]'
		description: 'unique array extended from [true, false] is valid'
]
