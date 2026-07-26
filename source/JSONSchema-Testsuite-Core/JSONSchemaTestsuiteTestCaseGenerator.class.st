Class {
	#name : 'JSONSchemaTestsuiteTestCaseGenerator',
	#superclass : 'JSONSchemaTestsuiteVisitor',
	#instVars : [
		'groupClassMapping',
		'taggedPackageName',
		'testCaseClass',
		'testSelectorMapping'
	],
	#category : 'JSONSchema-Testsuite-Core-Builder',
	#package : 'JSONSchema-Testsuite-Core',
	#tag : 'Builder'
}

{ #category : 'constants' }
JSONSchemaTestsuiteTestCaseGenerator class >> testsPackageName [
	^ 'JSONSchema-Testsuite-Tests'
]

{ #category : 'private' }
JSONSchemaTestsuiteTestCaseGenerator >> classNameFromGroup: aJSONSchemaTestsuiteGroup [
	^ #JSONSchema
		, (self identifierFromString: aJSONSchemaTestsuiteGroup description)
		, #Tests
]

{ #category : 'private' }
JSONSchemaTestsuiteTestCaseGenerator >> cleanupTestCaseClassNames [
	"As test case class names are automaticall generated from descriptions we might encounter a situation where doubletes are being created. Especially on case-insensitive filesystems. We're checking all class names here and adding a numeric suffix in case similar classnames are being found"

	"| caseInsensitiveGroups duplicateGroups duplicateGroupByFile duplicateGroupsWithDisjointFile |
	caseInsensitiveGroups := Dictionary new.
	self allGroups
		do: [ :group | 
			(caseInsensitiveGroups
				at: group caseInsensitiveKey
				ifAbsentPut: OrderedCollection new) add: group ].
	duplicateGroups := caseInsensitiveGroups values
		select: [ :classes | classes size > 1 ].
	duplicateGroupByFile := duplicateGroups
		collect: [ :groups | 
			| dic |
			dic := Dictionary new.
			groups
				do: [ :group | 
					(dic at: group file cleanedName ifAbsentPut: OrderedCollection new)
						add: group ].
			dic ].
	duplicateGroupsWithDisjointFile := duplicateGroupByFile
		select: [ :collection | collection size > 1 ].
	duplicateGroupsWithDisjointFile
		do: [ :formatGroups | 
			| index |
			index := 1.
			formatGroups
				do: [ :groups | 
					groups
						do: [ :group | 
							group testCaseClassName: group testCaseClassName , index printString.
							index := index + 1 ] ] ]"
]

{ #category : 'code generation' }
JSONSchemaTestsuiteTestCaseGenerator >> createClassForGroup: aJSONSchemaTestsuiteGroup [
	^ JSONSchemaTestsuiteTestCase
		subclass: (groupClassMapping at: aJSONSchemaTestsuiteGroup)
		instanceVariableNames: ''
		classVariableNames: ''
		package: taggedPackageName
]

{ #category : 'private' }
JSONSchemaTestsuiteTestCaseGenerator >> createGroupClassNameMapping: aJSONSchemaTestsuite [
	| groups groupsByCaseInsensitiveName |
	groups := (JSONSchemaTestsuiteGroupsCollector
		visit: aJSONSchemaTestsuite) groups.
	groupClassMapping := (groups
		collect: [ :group | group -> (self classNameFromGroup: group) ])
		asDictionary.
	groupsByCaseInsensitiveName := groups
		groupedBy: [ :group | (groupClassMapping at: group) asLowercase ].
	groupsByCaseInsensitiveName
		select: [ :each | each size > 1 ]
		thenDo: [ :clash | 
			clash
				withIndexDo: [ :group :index | 
					groupClassMapping
						at: group
						put: (groupClassMapping at: group) , index printString ] ]
]

{ #category : 'private' }
JSONSchemaTestsuiteTestCaseGenerator >> createTestSelectorMapping: aJSONSchemaTestsuiteGroup [
	| tests testsBySelector |
	tests := aJSONSchemaTestsuiteGroup tests.
	testSelectorMapping := (tests
		collect: [ :each | each -> (self testMethodSelectorFromTest: each) ])
		asDictionary.
	testsBySelector := tests
		groupedBy: [ :each | (testSelectorMapping at: each) asLowercase ].
	testsBySelector
		select: [ :each | each size > 1 ]
		thenDo: [ :clash | 
			clash
				withIndexDo: [ :test :index | 
					testSelectorMapping
						at: test
						put: (testSelectorMapping at: test) , index printString ] ]
]

{ #category : 'code generation' }
JSONSchemaTestsuiteTestCaseGenerator >> createTestsPackage [
	(RPackageOrganizer default
		includesPackageNamed: self class testsPackageName)
		ifFalse: [ RPackageOrganizer default
				createPackageNamed: self class testsPackageName ]
]

{ #category : 'code generation' }
JSONSchemaTestsuiteTestCaseGenerator >> generateSchemaMethod: aJSONSchemaTestsuiteGroup [
	| methodSource methodName |
	methodSource := 'schemaString
	^ <1p>'
		expandMacrosWith: (NeoJSONWriter toString: aJSONSchemaTestsuiteGroup schema).
	methodName := testCaseClass compile: methodSource.
	(testCaseClass >> methodName)
		protocol: 'accessing';
		reformat
]

{ #category : 'code generation' }
JSONSchemaTestsuiteTestCaseGenerator >> generateTestMethod: aJSONSchemaTestsuiteTest [
	| methodSource methodName |
	methodSource := String
		streamContents: [ :stream | 
			stream
				nextPutAll: (testSelectorMapping at: aJSONSchemaTestsuiteTest);
				cr.
			aJSONSchemaTestsuiteTest comment isNil
				ifFalse: [ stream nextPutAll: aJSONSchemaTestsuiteTest comment asComment ].
			stream
				nextPutAll:
					(aJSONSchemaTestsuiteTest valid
						ifTrue: [ 'self assertValid:' ]
						ifFalse: [ 'self assertInvalid:' ]);
				print: (NeoJSONWriter toString: aJSONSchemaTestsuiteTest data);
				nextPutAll: ' description: ';
				print: aJSONSchemaTestsuiteTest description;
				cr ].
	methodName := testCaseClass compile: methodSource.
	(testCaseClass >> methodName)
		protocol: 'tests';
		reformat
]

{ #category : 'private' }
JSONSchemaTestsuiteTestCaseGenerator >> identifierFromString: aString [
	^ ''
		join:
			(([ :character | character isAlphaNumeric not ] split: aString)
				collect: [ :each | each capitalized ])
]

{ #category : 'private' }
JSONSchemaTestsuiteTestCaseGenerator >> packageNameFromFile: aJSONSchemaTestsuiteFile [
	| cleanedName |
	cleanedName := self
		identifierFromString: aJSONSchemaTestsuiteFile fileReference basenameWithoutExtension.
	^ self class testsPackageName , '-' , cleanedName
]

{ #category : 'private' }
JSONSchemaTestsuiteTestCaseGenerator >> testMethodSelectorFromTest: aJSONSchemaTestsuiteTest [
	| cleanedName |
	cleanedName := self
		identifierFromString: aJSONSchemaTestsuiteTest description.
	^ 'test' , cleanedName
]

{ #category : 'visiting' }
JSONSchemaTestsuiteTestCaseGenerator >> visitFile: aJSONSchemaTestsuiteFile [
	| groups |
	groups := aJSONSchemaTestsuiteFile groups.
	taggedPackageName := self
		packageNameFromFile: aJSONSchemaTestsuiteFile.
	groups do: [ :group | group acceptVisitor: self ].
	taggedPackageName := nil
]

{ #category : 'visiting' }
JSONSchemaTestsuiteTestCaseGenerator >> visitGroup: aJSONSchemaTestsuiteGroup [
	| tests |
	tests := aJSONSchemaTestsuiteGroup tests.
	testCaseClass := self createClassForGroup: aJSONSchemaTestsuiteGroup.
	self createTestSelectorMapping: aJSONSchemaTestsuiteGroup.
	self generateSchemaMethod: aJSONSchemaTestsuiteGroup.
	tests do: [ :test | test acceptVisitor: self ].
	testCaseClass := nil
]

{ #category : 'visiting' }
JSONSchemaTestsuiteTestCaseGenerator >> visitSuite: aJSONSchemaTestsuite [
	[ :job | 
	| files |
	files := aJSONSchemaTestsuite files.
	job max: files size.
	self
		createTestsPackage;
		createGroupClassNameMapping: aJSONSchemaTestsuite.
	files
		do: [ :file | 
			job
				increment;
				title: 'Processing file ' , file fileName.
			file acceptVisitor: self ] ] asJob run
]

{ #category : 'visiting' }
JSONSchemaTestsuiteTestCaseGenerator >> visitTest: aJSONSchemaTestsuiteTest [
	self generateTestMethod: aJSONSchemaTestsuiteTest
]
