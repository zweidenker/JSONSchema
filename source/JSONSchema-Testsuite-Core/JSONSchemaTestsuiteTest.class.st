Class {
	#name : 'JSONSchemaTestsuiteTest',
	#superclass : 'Object',
	#instVars : [
		'description',
		'comment',
		'data',
		'valid',
		'testMethodName'
	],
	#category : 'JSONSchema-Testsuite-Core-Model',
	#package : 'JSONSchema-Testsuite-Core',
	#tag : 'Model'
}

{ #category : 'accessing' }
JSONSchemaTestsuiteTest class >> neoJsonMapping: mapper [
	mapper for: self do: [ :mapping | mapping mapInstVars ]
]

{ #category : 'visiting' }
JSONSchemaTestsuiteTest >> acceptVisitor: aVisitor [
	^ aVisitor visitTest: self
]

{ #category : 'accessing' }
JSONSchemaTestsuiteTest >> comment [
	^ comment
]

{ #category : 'accessing' }
JSONSchemaTestsuiteTest >> data [
	^ data
]

{ #category : 'accessing' }
JSONSchemaTestsuiteTest >> description [
	^ description
]

{ #category : 'private' }
JSONSchemaTestsuiteTest >> emitAssertion: aStream [
	aStream
		nextPutAll:
			(valid
				ifTrue: [ 'self assertValid:' ]
				ifFalse: [ 'self assertInvalid:' ]);
		print: (NeoJSONWriter toString: data);
		nextPutAll: ' description: ';
		print: description;
		cr
]

{ #category : 'private' }
JSONSchemaTestsuiteTest >> emitMethodHeader: aStream [
	aStream
		nextPutAll: self testMethodName;
		cr
]

{ #category : 'private' }
JSONSchemaTestsuiteTest >> emitTestComment: aStream [
	comment isNil ifTrue: [ ^ self ].
	comment printCleanedCommentTo: aStream.
	aStream cr
]

{ #category : 'code generation' }
JSONSchemaTestsuiteTest >> generateCode: aClass [
	| methodName methodContent |
	methodContent := String
		streamContents: [ :stream | 
			self
				emitMethodHeader: stream;
				emitTestComment: stream;
				emitAssertion: stream ].
	methodName := aClass compile: methodContent.
	(aClass >> methodName)
		reformat;
		protocol: 'tests'
]

{ #category : 'printing' }
JSONSchemaTestsuiteTest >> printOn: aStream [
	super printOn: aStream.
	description notNil
		ifTrue: [ aStream
				space;
				nextPut: $(;
				print: description;
				nextPut: $) ]
]

{ #category : 'accessing' }
JSONSchemaTestsuiteTest >> testMethodName [
	^ testMethodName
		ifNil: [ | cleanedDescription |
			cleanedDescription := ''
				join:
					(([ :character | character isAlphaNumeric not ] split: description)
						collect: [ :each | each capitalized ]).
			testMethodName := 'test' , cleanedDescription ]
]

{ #category : 'accessing' }
JSONSchemaTestsuiteTest >> valid [
	^ valid
]
