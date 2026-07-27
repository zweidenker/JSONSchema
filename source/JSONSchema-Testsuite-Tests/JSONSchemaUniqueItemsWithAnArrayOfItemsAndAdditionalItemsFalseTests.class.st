Class {
	#name : 'JSONSchemaUniqueItemsWithAnArrayOfItemsAndAdditionalItemsFalseTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-UniqueItems',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'UniqueItems'
}

{ #category : 'accessing' }
JSONSchemaUniqueItemsWithAnArrayOfItemsAndAdditionalItemsFalseTests >> schemaString [
	^ '{"items":[{"type":"boolean"},{"type":"boolean"}],"uniqueItems":true,"additionalItems":false}'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsWithAnArrayOfItemsAndAdditionalItemsFalseTests >> testExtraItemsAreInvalidEvenIfUnique [
	self
		assertInvalid: '[false,true,null]'
		description: 'extra items are invalid even if unique'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsWithAnArrayOfItemsAndAdditionalItemsFalseTests >> testFalseFalseFromItemsArrayIsNotValid [
	self
		assertInvalid: '[false,false]'
		description: '[false, false] from items array is not valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsWithAnArrayOfItemsAndAdditionalItemsFalseTests >> testFalseTrueFromItemsArrayIsValid [
	self
		assertValid: '[false,true]'
		description: '[false, true] from items array is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsWithAnArrayOfItemsAndAdditionalItemsFalseTests >> testTrueFalseFromItemsArrayIsValid [
	self
		assertValid: '[true,false]'
		description: '[true, false] from items array is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsWithAnArrayOfItemsAndAdditionalItemsFalseTests >> testTrueTrueFromItemsArrayIsNotValid [
	self
		assertInvalid: '[true,true]'
		description: '[true, true] from items array is not valid'
]
