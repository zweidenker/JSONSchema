Class {
	#name : 'JSONSchemaTestsuiteGroup',
	#superclass : 'Object',
	#instVars : [
		'description',
		'schema',
		'tests',
		'testCaseClassName'
	],
	#category : 'JSONSchema-Testsuite-Builder',
	#package : 'JSONSchema-Testsuite',
	#tag : 'Builder'
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

{ #category : 'private' }
JSONSchemaTestsuiteGroup >> compileSchemaMethod: class [
	| methodName methodContent |
	methodContent := String
		streamContents: [ :stream | self emitSchemaStringMethod: stream ].
	methodName := class compile: methodContent.
	(class >> methodName)
		reformat;
		protocol: 'accessing'
]

{ #category : 'private' }
JSONSchemaTestsuiteGroup >> createClass: packageName [
	^ JSONSchemaTestsuiteTestCase
		subclass: self testCaseClassName
		instanceVariableNames: ''
		classVariableNames: ''
		package: packageName
]

{ #category : 'accessing' }
JSONSchemaTestsuiteGroup >> description [
	^ description
]

{ #category : 'private' }
JSONSchemaTestsuiteGroup >> emitSchemaStringMethod: aStream [
	aStream
		nextPutAll: 'schemaString';
		cr;
		nextPutAll: '^ ';
		print: (NeoJSONWriter toString: schema);
		nextPut: $.;
		cr
]

{ #category : 'private' }
JSONSchemaTestsuiteGroup >> emitSetUpMethod: aStream [
	aStream
		nextPutAll: 'setUp';
		cr;
		nextPutAll: 'schema := self schema';
		cr
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
JSONSchemaTestsuiteGroup >> testCaseClassName [
	^ testCaseClassName
		ifNil: [ | cleanedDescription |
			cleanedDescription := ''
				join:
					(([ :character | character isAlphaNumeric not ] split: description)
						collect: [ :each | each capitalized ]).
			testCaseClassName := #JSONSchema , cleanedDescription , #Tests ]
]

{ #category : 'accessing' }
JSONSchemaTestsuiteGroup >> tests [
	^ tests
]
