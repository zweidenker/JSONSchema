Class {
	#name : 'JSONSchemaTestsuiteFile',
	#superclass : 'Object',
	#instVars : [
		'fileReference',
		'groups'
	],
	#category : 'JSONSchema-Testsuite-Builder',
	#package : 'JSONSchema-Testsuite',
	#tag : 'Builder'
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

{ #category : 'accessing' }
JSONSchemaTestsuiteFile >> cleanedName [
	^ ''
		join:
			(([ :character | character isAlphaNumeric not ]
				split: self fileReference basenameWithoutExtension)
				collect: [ :each | each capitalized ])
]

{ #category : 'accessing' }
JSONSchemaTestsuiteFile >> fileName [
	^ self fileReference basename
]

{ #category : 'accessing' }
JSONSchemaTestsuiteFile >> fileReference [
	^ fileReference
]

{ #category : 'code generation' }
JSONSchemaTestsuiteFile >> generateCode [
	[ :job | 
	job max: self groups size.
	self groups
		do: [ :group | 
			job
				increment;
				title: 'Generating ' , group testCaseClassName.
			group generateCode: self packageName ] ] asJob run
]

{ #category : 'accessing' }
JSONSchemaTestsuiteFile >> groups [
	^ groups
		ifNil: [ groups := fileReference
				readStreamDo: [ :stream | (NeoJSONReader on: stream) nextAs: self class ] ]
]

{ #category : 'accessing' }
JSONSchemaTestsuiteFile >> packageName [
	^ 'JSONSchema-Testsuite-Tests'	" , self cleanedName"
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

{ #category : 'initialization' }
JSONSchemaTestsuiteFile >> setFileReference: anObject [
	fileReference := anObject
]
