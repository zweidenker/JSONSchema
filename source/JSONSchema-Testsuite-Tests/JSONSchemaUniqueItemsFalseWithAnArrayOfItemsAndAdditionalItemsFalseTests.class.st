Class {
	#name : 'JSONSchemaUniqueItemsFalseWithAnArrayOfItemsAndAdditionalItemsFalseTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-UniqueItems',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'UniqueItems'
}

{ #category : 'testing' }
JSONSchemaUniqueItemsFalseWithAnArrayOfItemsAndAdditionalItemsFalseTests >> expectedFailures [
	^ #(#testTrueFalseFromItemsArrayIsValid #testTrueTrueFromItemsArrayIsValid #testFalseTrueFromItemsArrayIsValid #testFalseFalseFromItemsArrayIsValid #testExtraItemsAreInvalidEvenIfUnique)
]

{ #category : 'accessing' }
JSONSchemaUniqueItemsFalseWithAnArrayOfItemsAndAdditionalItemsFalseTests >> schemaString [
	^ '{"items":[{"type":"boolean"},{"type":"boolean"}],"uniqueItems":false,"additionalItems":false}'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseWithAnArrayOfItemsAndAdditionalItemsFalseTests >> testExtraItemsAreInvalidEvenIfUnique [
	self
		assertInvalid: '[false,true,null]'
		description: 'extra items are invalid even if unique'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseWithAnArrayOfItemsAndAdditionalItemsFalseTests >> testFalseFalseFromItemsArrayIsValid [
	self
		assertValid: '[false,false]'
		description: '[false, false] from items array is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseWithAnArrayOfItemsAndAdditionalItemsFalseTests >> testFalseTrueFromItemsArrayIsValid [
	self
		assertValid: '[false,true]'
		description: '[false, true] from items array is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseWithAnArrayOfItemsAndAdditionalItemsFalseTests >> testTrueFalseFromItemsArrayIsValid [
	self
		assertValid: '[true,false]'
		description: '[true, false] from items array is valid'
]

{ #category : 'tests' }
JSONSchemaUniqueItemsFalseWithAnArrayOfItemsAndAdditionalItemsFalseTests >> testTrueTrueFromItemsArrayIsValid [
	self
		assertValid: '[true,true]'
		description: '[true, true] from items array is valid'
]
