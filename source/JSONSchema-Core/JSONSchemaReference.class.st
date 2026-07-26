Class {
	#name : 'JSONSchemaReference',
	#superclass : 'Object',
	#instVars : [
		'path'
	],
	#category : 'JSONSchema-Core-Model',
	#package : 'JSONSchema-Core',
	#tag : 'Model'
}

{ #category : 'instance creation' }
JSONSchemaReference class >> neoJsonMapping: mapper [
	mapper for: self do: [ :mapping |
		mapping mapInstVar: #path to: '$ref' ]
]

{ #category : 'instance creation' }
JSONSchemaReference class >> path: aString [
	^ self new
		path: aString
]

{ #category : 'visiting' }
JSONSchemaReference >> acceptJSONSchema: aVisitor [ 
	^ aVisitor visitReference: self
]

{ #category : 'testing' }
JSONSchemaReference >> isLocalPath [
	^ path beginsWith: '#'
]

{ #category : 'accessing' }
JSONSchemaReference >> path [
	^ path
]

{ #category : 'accessing' }
JSONSchemaReference >> path: anObject [
	path := anObject
]

{ #category : 'printing' }
JSONSchemaReference >> printOn: aStream [ 
	aStream << 'Reference: '<< path asString
]
