Class {
	#name : 'JSONSchemaBoolean',
	#superclass : 'JSONPrimitiveSchema',
	#category : 'JSONSchema-Core-Model',
	#package : 'JSONSchema-Core',
	#tag : 'Model'
}

{ #category : 'instance creation' }
JSONSchemaBoolean class >> typeName [
	^ 'boolean'
]

{ #category : 'as yet unclassified' }
JSONSchemaBoolean >> defaultFormat [
	^ JSONFormatBoolean 
]

{ #category : 'reading-primitive data' }
JSONSchemaBoolean >> read: aBoolean [
	(aBoolean isKindOf: Boolean) ifFalse: [  
		^ JSONTypeError signal: 'not a boolean' ].
	^ aBoolean
	
]

{ #category : 'reading-primitive data' }
JSONSchemaBoolean >> readString: aString [
	(aString = 'true') ifTrue: [ 
		^ true ].
	(aString = 'false') ifTrue: [ 
		^ false ].
	^ JSONTypeError signal: 'not a boolean'
	
]

{ #category : 'validation' }
JSONSchemaBoolean >> validateType: anObject [
	(anObject isKindOf: Boolean) ifFalse: [ 
		JSONTypeError signal: anObject asString, ' is not a boolean ' ]
]
