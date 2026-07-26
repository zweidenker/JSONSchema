Class {
	#name : 'JSONSchemaTestsuiteVisitor',
	#superclass : 'Object',
	#category : 'JSONSchema-Testsuite-Core-Builder',
	#package : 'JSONSchema-Testsuite-Core',
	#tag : 'Builder'
}

{ #category : 'visiting' }
JSONSchemaTestsuiteVisitor class >> visit: aNode [
	^ self new
		visit: aNode;
		yourself
]

{ #category : 'visiting' }
JSONSchemaTestsuiteVisitor >> visit: aNode [
	^ aNode acceptVisitor: self
]

{ #category : 'visiting' }
JSONSchemaTestsuiteVisitor >> visitFile: aJSONSchemaTestsuiteFile [
	^ aJSONSchemaTestsuiteFile groups
		collect: [ :group | group acceptVisitor: self ]
]

{ #category : 'visiting' }
JSONSchemaTestsuiteVisitor >> visitGroup: aJSONSchemaTestsuiteGroup [
	^ aJSONSchemaTestsuiteGroup tests
		collect: [ :test | test acceptVisitor: self ]
]

{ #category : 'visiting' }
JSONSchemaTestsuiteVisitor >> visitSuite: aJSONSchemaTestsuite [
	^ aJSONSchemaTestsuite files
		collect: [ :file | file acceptVisitor: self ]
]

{ #category : 'visiting' }
JSONSchemaTestsuiteVisitor >> visitTest: aJSONSchemaTestsuiteTest [
	^ aJSONSchemaTestsuiteTest
]
