Class {
	#name : 'JSONSchemaTestsuiteGroup',
	#superclass : 'Object',
	#instVars : [
		'description',
		'schema',
		'tests',
		'testCaseClassName',
		'file'
	],
	#category : 'JSONSchema-Testsuite-Core-Model',
	#package : 'JSONSchema-Testsuite-Core',
	#tag : 'Model'
}

{ #category : 'accessing' }
JSONSchemaTestsuiteGroup class >> neoJsonMapping: mapper [
	mapper
		for: self
		do: [ :mapping | 
			mapping mapInstVars: #(description schema tests).
			(mapping mapInstVar: #tests) valueSchema: #ArrayOfTests ].
	mapper
		for: #ArrayOfTests
		customDo: [ :mapping | mapping listOfElementSchema: JSONSchemaTestsuiteTest ]
]

{ #category : 'visiting' }
JSONSchemaTestsuiteGroup >> acceptVisitor: aVisitor [
	^ aVisitor visitGroup: self
]

{ #category : 'private' }
JSONSchemaTestsuiteGroup >> caseInsensitiveKey [
	^ self cleanedDescription asLowercase
]

{ #category : 'private' }
JSONSchemaTestsuiteGroup >> cleanedDescription [
	^ ''
		join:
			(([ :character | character isAlphaNumeric not ] split: description)
				collect: [ :each | each capitalized ])
]

{ #category : 'accessing' }
JSONSchemaTestsuiteGroup >> description [
	^ description
]

{ #category : 'accessing' }
JSONSchemaTestsuiteGroup >> file [
	^ file
]

{ #category : 'accessing' }
JSONSchemaTestsuiteGroup >> file: aJSONSchemaTestsuiteFile [
	file := aJSONSchemaTestsuiteFile
]

{ #category : 'code generation' }
JSONSchemaTestsuiteGroup >> generateCode: packageName [
	| class |
	[ :job | 
	job max: self tests size + 1.
	class := self createClass: packageName.
	job
		increment;
		title: 'Generating #schemaString'.
	self compileSchemaMethod: class.
	self tests
		do: [ :test | 
			job
				increment;
				title: 'Generating #' , test testMethodName.
			test generateCode: class ] ] asJob run
]

{ #category : 'printing' }
JSONSchemaTestsuiteGroup >> printOn: aStream [
	super printOn: aStream.
	description notNil
		ifTrue: [ aStream
				space;
				nextPut: $(;
				print: description;
				nextPut: $) ]
]

{ #category : 'accessing' }
JSONSchemaTestsuiteGroup >> schema [
	^ schema
]

{ #category : 'accessing' }
JSONSchemaTestsuiteGroup >> testCaseClassName [
	^ testCaseClassName
		ifNil:
			[ testCaseClassName := #JSONSchema , self cleanedDescription , #Tests ]
]

{ #category : 'accessing' }
JSONSchemaTestsuiteGroup >> testCaseClassName: aString [ 
	testCaseClassName := aString
]

{ #category : 'accessing' }
JSONSchemaTestsuiteGroup >> tests [
	^ tests
]
