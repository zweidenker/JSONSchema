Class {
	#name : 'JSONSchemaAnyObject',
	#superclass : 'JSONSchemaBasicObject',
	#category : 'JSONSchema-Core-Model',
	#package : 'JSONSchema-Core',
	#tag : 'Model'
}

{ #category : 'instance creation' }
JSONSchemaAnyObject class >> typeName [ 
	^ #any
]

{ #category : 'visiting' }
JSONSchemaAnyObject >> acceptJSONSchema: aVisitor [ 
	^ aVisitor visitAnyObject: self 
]

{ #category : 'reading' }
JSONSchemaAnyObject >> read: string object: object [
	| json |
	json := (NeoJSONReader on: string readStream) next .
	json isDictionary ifFalse: [ 
		JSONTypeError signal: 'json type is not object' ].
	json keysAndValuesDo: [ :key :value | 
		object 
			jsonSchemaAt: key asSymbol 
			put: value ].
	^ object
]

{ #category : 'reading' }
JSONSchemaAnyObject >> readUsing: aReader [ 
	^ aReader next
]

{ #category : 'writing' }
JSONSchemaAnyObject >> write: anObject [
	^ String streamContents: [ :stream |
		self write: anObject on: (JSONSchemaWriter on: stream)  ]
]

{ #category : 'writing' }
JSONSchemaAnyObject >> write: anObject on: aWriter [ 
	aWriter nextPut: anObject
]
