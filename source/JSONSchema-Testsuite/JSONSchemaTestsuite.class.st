Class {
	#name : 'JSONSchemaTestsuite',
	#superclass : 'Object',
	#instVars : [
		'archiveFile',
		'archive',
		'files',
		'version'
	],
	#category : 'JSONSchema-Testsuite-Builder',
	#package : 'JSONSchema-Testsuite',
	#tag : 'Builder'
}

{ #category : 'as yet unclassified' }
JSONSchemaTestsuite class >> draft7 [
	^ self new
		version: 'draft7';
		yourself
]

{ #category : 'actions' }
JSONSchemaTestsuite class >> removeTestCases [
	JSONSchemaTestsuiteTestCase
		allSubclassesDo: [ :each | each removeFromSystem ]
]

{ #category : 'private' }
JSONSchemaTestsuite >> archive [
	^ archive
		ifNil:
			[ archive := (FileSystem zip: self archiveFile) open workingDirectory ]
]

{ #category : 'private' }
JSONSchemaTestsuite >> archiveFile [
	^ archiveFile ifNil:
		[ self download ]
]

{ #category : 'constants' }
JSONSchemaTestsuite >> defaultVersion [
	^ 'draft7'
]

{ #category : 'private' }
JSONSchemaTestsuite >> download [
	^ [ archiveFile := (FileLocator temp
		/ ('JSON-Schema-Test-Suite-' , UUIDGenerator next asString) , 'zip')
		binaryWriteStreamDo: [ :stream | stream nextPutAll: (ZnEasy get: self url) contents ];
		yourself ] asJob
		title: 'Downloading JSON Schema Test Suite ...';
		run
]

{ #category : 'private' }
JSONSchemaTestsuite >> files [
	^ files
		ifNil: [ files := (self archive / 'JSON-Schema-Test-Suite-master' / 'tests'
				/ 'draft7' allChildrenMatching: '*.json')
				collect: [ :each | JSONSchemaTestsuiteFile fromFileReference: each ] ]
]

{ #category : 'actions' }
JSONSchemaTestsuite >> generateTestCases [
	[ :job | 
	job max: self files size.
	self files
		do: [ :file | 
			job
				increment;
				title: 'Processing file ' , file fileName.
			file generateCode ] ] asJob run
]

{ #category : 'constants' }
JSONSchemaTestsuite >> url [
	^ 'https://github.com/json-schema-org/JSON-Schema-Test-Suite/archive/master.zip'
]

{ #category : 'accessing' }
JSONSchemaTestsuite >> version [
	^ version ifNil: [ version := self defaultVersion ]
]

{ #category : 'accessing' }
JSONSchemaTestsuite >> version: aString [
	version := aString
]
