Class {
	#name : 'JSONSchemaMissingRequiredProperty',
	#superclass : 'JSONSchemaError',
	#instVars : [
		'property'
	],
	#category : 'JSONSchema-Core-Errors',
	#package : 'JSONSchema-Core',
	#tag : 'Errors'
}

{ #category : 'accessing' }
JSONSchemaMissingRequiredProperty >> messageText [ 

	^ 'Property required but not found: ', self property printString
]

{ #category : 'accessing' }
JSONSchemaMissingRequiredProperty >> property [ 

	^ property
]

{ #category : 'accessing' }
JSONSchemaMissingRequiredProperty >> property: aSymbol [

	property := aSymbol
]
