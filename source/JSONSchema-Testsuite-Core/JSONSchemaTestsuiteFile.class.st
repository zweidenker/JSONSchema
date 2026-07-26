Class {
	#name : 'JSONSchemaTestsuiteFile',
	#superclass : 'Object',
	#instVars : [
		'fileReference',
		'groups'
	],
	#category : 'JSONSchema-Testsuite-Core-Model',
	#package : 'JSONSchema-Testsuite-Core',
	#tag : 'Model'
}

{ #category : 'instance creation' }
JSONSchemaTestsuiteFile class >> fromFileReference: aFileReference [
	^ self new
		setFileReference: aFileReference;
		yourself
]

{ #category : 'accessing' }
JSONSchemaTestsuiteFile class >> neoJsonMapping: mapper [
	mapper
		for: self
		customDo: [ :mapping | mapping listOfElementSchema: JSONSchemaTestsuiteGroup ]
]

{ #category : 'visiting' }
JSONSchemaTestsuiteFile >> acceptVisitor: aVisitor [
	^ aVisitor visitFile: self
]

{ #category : 'accessing' }
JSONSchemaTestsuiteFile >> fileName [
	^ self fileReference basename
]

{ #category : 'accessing' }
JSONSchemaTestsuiteFile >> fileReference [
	^ fileReference
]

{ #category : 'accessing' }
JSONSchemaTestsuiteFile >> groups [
	^ groups
		ifNil: [ groups := self readGroups
				do: [ :each | each file: self ];
				yourself ]
]

{ #category : 'printing' }
JSONSchemaTestsuiteFile >> printOn: aStream [
	super printOn: aStream.
	aStream
		space;
		nextPut: $(;
		print: self fileName;
		nextPut: $)
]

{ #category : 'private' }
JSONSchemaTestsuiteFile >> readGroups [
	^ fileReference
		readStreamDo: [ :stream | (NeoJSONReader on: stream) nextAs: self class ]
]

{ #category : 'initialization' }
JSONSchemaTestsuiteFile >> setFileReference: aFileReference [
	fileReference := aFileReference
]
