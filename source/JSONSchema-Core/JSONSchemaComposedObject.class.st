Class {
	#name : 'JSONSchemaComposedObject',
	#superclass : 'JSONSchemaBasicObject',
	#instVars : [
		'schemas'
	],
	#category : 'JSONSchema-Core-Model',
	#package : 'JSONSchema-Core',
	#tag : 'Model'
}

{ #category : 'accessing' }
JSONSchemaComposedObject >> schemas [
	^ schemas
]

{ #category : 'accessing' }
JSONSchemaComposedObject >> schemas: aCollection [ 
	schemas := aCollection
]
