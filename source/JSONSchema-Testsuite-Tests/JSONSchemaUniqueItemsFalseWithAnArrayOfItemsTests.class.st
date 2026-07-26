Class {
	#name : 'JSONSchemaUniqueItemsFalseWithAnArrayOfItemsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-UniqueItems',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'UniqueItems'
}

{ #category : 'testing' }
JSONSchemaUniqueItemsFalseWithAnArrayOfItemsTests >> expectedFailures [
	^ #(#testNonUniqueArrayExtendedFromTrueFalseIsValid #testUniqueArrayExtendedFromFalseTrueIsValid #testFalseFalseFromItemsArrayIsValid #testFalseTrueFromItemsArrayIsValid #testUniqueArrayExtendedFromTrueFalseIsValid #testTrueTrueFromItemsArrayIsValid #testTrueFalseFromItemsArrayIsValid #testNonUniqueArrayExtendedFromFalseTrueIsValid)
]

{ #category : 'accessing' }
JSONSchemaUniqueItemsFalseWithAnArrayOfItemsTests >> schemaString [
	^ '{"items":[{"type":"boolean"},{"type":"boolean"}],"uniqueItems":false}'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseWithAnArrayOfItemsTests >> testFalseFalseFromItemsArrayIsValid [
	self
		assertValid: '[false,false]'
		description: '[false, false] from items array is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseWithAnArrayOfItemsTests >> testFalseTrueFromItemsArrayIsValid [
	self
		assertValid: '[false,true]'
		description: '[false, true] from items array is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseWithAnArrayOfItemsTests >> testNonUniqueArrayExtendedFromFalseTrueIsValid [
	self
		assertValid: '[false,true,"foo","foo"]'
		description: 'non-unique array extended from [false, true] is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseWithAnArrayOfItemsTests >> testNonUniqueArrayExtendedFromTrueFalseIsValid [
	self
		assertValid: '[true,false,"foo","foo"]'
		description: 'non-unique array extended from [true, false] is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseWithAnArrayOfItemsTests >> testTrueFalseFromItemsArrayIsValid [
	self
		assertValid: '[true,false]'
		description: '[true, false] from items array is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseWithAnArrayOfItemsTests >> testTrueTrueFromItemsArrayIsValid [
	self
		assertValid: '[true,true]'
		description: '[true, true] from items array is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseWithAnArrayOfItemsTests >> testUniqueArrayExtendedFromFalseTrueIsValid [
	self
		assertValid: '[false,true,"foo","bar"]'
		description: 'unique array extended from [false, true] is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseWithAnArrayOfItemsTests >> testUniqueArrayExtendedFromTrueFalseIsValid [
	self
		assertValid: '[true,false,"foo","bar"]'
		description: 'unique array extended from [true, false] is valid'
]
