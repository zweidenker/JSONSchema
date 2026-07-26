Class {
	#name : 'JSONPrimitiveSchema',
	#superclass : 'JSONSchema',
	#instVars : [
		'format',
		'nullable'
	],
	#category : 'JSONSchema-Core-Model',
	#package : 'JSONSchema-Core',
	#tag : 'Model'
}

{ #category : 'meta-object-protocol' }
JSONPrimitiveSchema class >> read: anObject [
	^ self new
		read: anObject
]

{ #category : 'meta-object-protocol' }
JSONPrimitiveSchema class >> read: anObject format: formatString [
	^ self new
		formatString: formatString;
		read: anObject
]

{ #category : 'meta-object-protocol' }
JSONPrimitiveSchema class >> readString: aString [
	^ self new
		readString: aString
]

{ #category : 'meta-object-protocol' }
JSONPrimitiveSchema class >> readString: aString format: formatString [
	^ self new
		formatString: formatString;
		readString: aString
]

{ #category : 'visiting' }
JSONPrimitiveSchema >> acceptJSONSchema: aVisitor [
	"ignore for now as we are on the class side"
]

{ #category : 'as yet unclassified' }
JSONPrimitiveSchema >> encodeJSON: anObject [
	^ self format encodeJSON: anObject
]

{ #category : 'accessing' }
JSONPrimitiveSchema >> format [
	^ format ifNil: [ 
		format := self defaultFormat ]
]

{ #category : 'accessing' }
JSONPrimitiveSchema >> format: anObject [
	format := anObject
]

{ #category : 'accessing' }
JSONPrimitiveSchema >> formatString [
	^ format formatName
]

{ #category : 'formatting' }
JSONPrimitiveSchema >> formatString: aString [ 
	format := JSONFormat formatNamed: aString
]

{ #category : 'initializing' }
JSONPrimitiveSchema >> initialize [ 
	super initialize.
	nullable := false
]

{ #category : 'accessing' }
JSONPrimitiveSchema >> nullable: aBoolean [ 
	nullable := aBoolean
]

{ #category : 'reading' }
JSONPrimitiveSchema >> read: anObject [
	| value |
	value := self readFormatted: anObject.
	self constraints do: [ :each | each validate: value ].
	^ value
]

{ #category : 'formatting' }
JSONPrimitiveSchema >> readFormatted: anObject [

	^ self format read: anObject
]

{ #category : 'formatting' }
JSONPrimitiveSchema >> readFormattedString: aString [

	^ self format readString: aString 
]

{ #category : 'reading' }
JSONPrimitiveSchema >> readString: aString [

	^ self read: (self readFormattedString: aString).

]

{ #category : 'private' }
JSONPrimitiveSchema >> readUsing: aReader [ 
	| value |
	value := aReader parseValue.
	value ifNil: [ 
		nullable 
			ifTrue: [ ^ nil ]
			ifFalse: [ JSONTypeError signal: self class typeName, ' cannot be nil' ] ].
	^ self read: value
]

{ #category : 'accessing' }
JSONPrimitiveSchema >> schema: aSchema [ 
	"primitive types don't keep the schema as they are shared"
]

{ #category : 'validation' }
JSONPrimitiveSchema >> validate: anObject [
	super validate: anObject.
	format ifNotNil: [ 
		format validate: anObject ]
	
]

{ #category : 'writing' }
JSONPrimitiveSchema >> write: anObject [
	^ self format write: anObject
]

{ #category : 'writing' }
JSONPrimitiveSchema >> write: anObject on: aWriter [ 
	anObject ifNil: [ 
		nullable ifTrue: [ 
			^ aWriter writeNull ] ].
	self validate: anObject.
	aWriter nextPut: anObject
]

{ #category : 'writing' }
JSONPrimitiveSchema >> writePropertiesOn: mapWriter [
	super writePropertiesOn: mapWriter.
	format ifNotNil: [  
		mapWriter writeKey: 'format' value: self formatString ] 

]
