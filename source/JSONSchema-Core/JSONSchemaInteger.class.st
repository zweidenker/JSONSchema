Class {
	#name : 'JSONSchemaInteger',
	#superclass : 'JSONSchemaNumber',
	#category : 'JSONSchema-Core-Model',
	#package : 'JSONSchema-Core',
	#tag : 'Model'
}

{ #category : 'instance creation' }
JSONSchemaInteger class >> typeName [
	^ 'integer'
]

{ #category : 'instance creation' }
JSONSchemaInteger >> basicConvertString: aString [
	^ aString asInteger 
]

{ #category : 'accessing' }
JSONSchemaInteger >> defaultFormat [
	^ JSONIntegerFormat
]

{ #category : 'instance creation' }
JSONSchemaInteger >> validateType: anObject [
	(anObject isKindOf: Integer) ifFalse: [ 
		JSONTypeError signal: anObject asString, ' is not an integer ' ].

"	(anObject between: (2 raisedTo: 31) negated and: (2 raisedTo: 31) - 1) ifFalse: [ 
		JSONTypeErrror signal: anObject asString, ' is not a 32 bits integer ' ]
	"
	
]
