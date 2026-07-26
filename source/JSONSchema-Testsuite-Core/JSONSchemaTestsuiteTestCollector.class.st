Class {
	#name : 'JSONSchemaTestsuiteTestCollector',
	#superclass : 'JSONSchemaTestsuiteVisitor',
	#instVars : [
		'tests'
	],
	#category : 'JSONSchema-Testsuite-Core-Builder',
	#package : 'JSONSchema-Testsuite-Core',
	#tag : 'Builder'
}

{ #category : 'accessing' }
JSONSchemaTestsuiteTestCollector >> tests [
	^ tests contents
]

{ #category : 'visiting' }
JSONSchemaTestsuiteTestCollector >> visit: aNode [
	tests := ReadWriteStream on: OrderedCollection new.
	^ super visit: aNode
]

{ #category : 'visiting' }
JSONSchemaTestsuiteTestCollector >> visitTest: aJSONSchemaTestsuiteTest [
	tests nextPut: aJSONSchemaTestsuiteTest
]
