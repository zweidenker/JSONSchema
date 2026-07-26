Class {
	#name : 'JSONSchemaNull',
	#superclass : 'JSONPrimitiveSchema',
	#category : 'JSONSchema-Core-Model',
	#package : 'JSONSchema-Core',
	#tag : 'Model'
}

{ #category : 'instance creation' }
JSONSchemaNull class >> typeName [
	^ 'null'
]

{ #category : 'initialization' }
JSONSchemaNull >> defaultFormat [
	^ JSONFormatNull
]

{ #category : 'validation' }
JSONSchemaNull >> validateType: anObject [ 
	anObject isNil ifFalse: [ 
		JSONTypeError signal: anObject printString, ' is not null ' ]
]
