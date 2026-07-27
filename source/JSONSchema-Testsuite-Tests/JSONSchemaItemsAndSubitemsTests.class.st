Class {
	#name : 'JSONSchemaItemsAndSubitemsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Items',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Items'
}

{ #category : 'accessing' }
JSONSchemaItemsAndSubitemsTests >> schemaString [
	^ '{"definitions":{"item":{"additionalItems":false,"items":[{"$ref":"#/definitions/sub-item"},{"$ref":"#/definitions/sub-item"}],"type":"array"},"sub-item":{"required":["foo"],"type":"object"}},"additionalItems":false,"items":[{"$ref":"#/definitions/item"},{"$ref":"#/definitions/item"},{"$ref":"#/definitions/item"}],"type":"array"}'
]

{ #category : 'tests' }
JSONSchemaItemsAndSubitemsTests >> testFewerItemsIsValid [
	self
		assertValid: '[[{"foo":null}],[{"foo":null}]]'
		description: 'fewer items is valid'
]

{ #category : 'tests' }
JSONSchemaItemsAndSubitemsTests >> testTooManyItems [
	self
		assertInvalid:
			'[[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}]]'
		description: 'too many items'
]

{ #category : 'tests' }
JSONSchemaItemsAndSubitemsTests >> testTooManySubItems [
	self
		assertInvalid:
			'[[{"foo":null},{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}]]'
		description: 'too many sub-items'
]

{ #category : 'tests' }
JSONSchemaItemsAndSubitemsTests >> testValidItems [
	self
		assertValid:
			'[[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}]]'
		description: 'valid items'
]

{ #category : 'tests' }
JSONSchemaItemsAndSubitemsTests >> testWrongItem [
	self
		assertInvalid:
			'[{"foo":null},[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}]]'
		description: 'wrong item'
]

{ #category : 'tests' }
JSONSchemaItemsAndSubitemsTests >> testWrongSubItem [
	self
		assertInvalid:
			'[[{},{"foo":null}],[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}]]'
		description: 'wrong sub-item'
]
