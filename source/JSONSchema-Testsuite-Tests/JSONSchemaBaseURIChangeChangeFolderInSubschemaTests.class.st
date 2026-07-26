Class {
	#name : 'JSONSchemaBaseURIChangeChangeFolderInSubschemaTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-RefRemote',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'RefRemote'
}

{ #category : 'testing' }
JSONSchemaBaseURIChangeChangeFolderInSubschemaTests >> expectedFailures [
	^ #(#testStringIsInvalid)
]

{ #category : 'accessing' }
JSONSchemaBaseURIChangeChangeFolderInSubschemaTests >> schemaString [
	^ '{"definitions":{"baz":{"definitions":{"bar":{"items":{"$ref":"folderInteger.json"},"type":"array"}},"$id":"folder/"}},"properties":{"list":{"$ref":"#/definitions/baz/definitions/bar"}},"$id":"http://localhost:1234/scope_change_defs2.json","type":"object"}'
]

{ #category : 'tests' }
JSONSchemaBaseURIChangeChangeFolderInSubschemaTests >> testNumberIsValid [
	self assertValid: '{"list":[1]}' description: 'number is valid'
]

{ #category : 'tests' }
JSONSchemaBaseURIChangeChangeFolderInSubschemaTests >> testStringIsInvalid [
	self assertInvalid: '{"list":["a"]}' description: 'string is invalid'
]
