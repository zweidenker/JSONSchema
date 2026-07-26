"
I generate json Schema TestCases based on files from https://github.com/json-schema-org/JSON-Schema-Test-Suite.

You can generate Test Cases using

JSONSchemaTestsuite new generateTestCases.

To remove the generated Test Cases use: 

JSONSchemaTestsuite removeTestCases.
"
Class {
	#name : 'JSONSchemaTestsuite',
	#superclass : 'Object',
	#instVars : [
		'archiveFile',
		'archive',
		'files',
		'version'
	],
	#category : 'JSONSchema-Testsuite-Core-Model',
	#package : 'JSONSchema-Testsuite-Core',
	#tag : 'Model'
}

{ #category : 'constants' }
JSONSchemaTestsuite class >> defaultVersion [
	^ 'draft7'
]

{ #category : 'actions' }
JSONSchemaTestsuite class >> generateTestCases [
	^ self new
		generateTestCases;
		generateExpectedFailures;
		validateGeneratedTestCases
]

{ #category : 'instance creation' }
JSONSchemaTestsuite class >> new [
	^ self version: self defaultVersion
]

{ #category : 'actions' }
JSONSchemaTestsuite class >> removeTestCases [
	[ :job | 
	| classes |
	classes := JSONSchemaTestsuiteTestCase allSubclasses.
	job
		title: 'Cleaning up...';
		max: classes size.
	classes
		do: [ :each | 
			each removeFromSystem.
			job increment ].
	self removeTestsPackage ] asJob run
]

{ #category : 'private' }
JSONSchemaTestsuite class >> removeTestsPackage [
	(RPackageOrganizer default
		includesPackageNamed: JSONSchemaTestsuiteTestCaseGenerator testsPackageName)
		ifTrue: [ RPackageOrganizer default
				unregisterPackageNamed: JSONSchemaTestsuiteTestCaseGenerator testsPackageName ]
]

{ #category : 'constants' }
JSONSchemaTestsuite class >> url [
	^ 'https://github.com/json-schema-org/JSON-Schema-Test-Suite/archive/master.zip'
]

{ #category : 'instance creation' }
JSONSchemaTestsuite class >> version: aString [
	^ super new
		setVersion: aString;
		yourself
]

{ #category : 'visiting' }
JSONSchemaTestsuite >> acceptVisitor: aVisitor [
	^ aVisitor visitSuite: self
]

{ #category : 'accessing' }
JSONSchemaTestsuite >> allGroups [
	^ (JSONSchemaTestsuiteGroupsCollector visit: self) groups
]

{ #category : 'accessing' }
JSONSchemaTestsuite >> allTests [
	^ (JSONSchemaTestsuiteTestCollector visit: self) tests
]

{ #category : 'accessing' }
JSONSchemaTestsuite >> archive [
	^ archive
		ifNil:
			[ archive := (FileSystem zip: self archiveFile) open workingDirectory ]
]

{ #category : 'accessing' }
JSONSchemaTestsuite >> archiveFile [
	^ archiveFile ifNil: [ archiveFile := self downloadArchiveFile ]
]

{ #category : 'private' }
JSONSchemaTestsuite >> createFiles [
	^ (self archive / 'JSON-Schema-Test-Suite-master' / 'tests'
		/ self version allChildrenMatching: '*.json')
		collect: [ :each | JSONSchemaTestsuiteFile fromFileReference: each ]
]

{ #category : 'private' }
JSONSchemaTestsuite >> downloadArchiveFile [
	^ [ :job | 
	job title: 'Downloading JSON Schema Test Suite ...'.
	(FileLocator temp
		/ ('JSON-Schema-Test-Suite-' , UUIDGenerator next asString) , 'zip')
		binaryWriteStreamDo: [ :stream | stream nextPutAll: (ZnEasy get: self class url) contents ];
		yourself ] asJob run
]

{ #category : 'accessing' }
JSONSchemaTestsuite >> files [
	^ files ifNil: [ files := self createFiles ]
]

{ #category : 'actions' }
JSONSchemaTestsuite >> generateExpectedFailures [
	JSONSchemaTestsuiteTestCase generateExpectedFailures
]

{ #category : 'actions' }
JSONSchemaTestsuite >> generateTestCases [
	JSONSchemaTestsuiteTestCaseGenerator visit: self
]

{ #category : 'private' }
JSONSchemaTestsuite >> setVersion: aString [
	version := aString
]

{ #category : 'actions' }
JSONSchemaTestsuite >> validateGeneratedTestCases [
	| classes selectors |
	classes := JSONSchemaTestsuiteTestCase allSubclasses.
	self assert: [ self allGroups size = classes size ].
	selectors := OrderedCollection
		streamContents:
			[ :stream | classes do: [ :class | stream nextPutAll: class testSelectors ] ].
	self assert: [ self allTests size = selectors size ]
]

{ #category : 'accessing' }
JSONSchemaTestsuite >> version [
	^ version
]
