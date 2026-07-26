Class {
	#name : 'JSONSchemaTestsuiteGroupsCollector',
	#superclass : 'JSONSchemaTestsuiteVisitor',
	#instVars : [
		'groups'
	],
	#category : 'JSONSchema-Testsuite-Core-Builder',
	#package : 'JSONSchema-Testsuite-Core',
	#tag : 'Builder'
}

{ #category : 'accessing' }
JSONSchemaTestsuiteGroupsCollector >> groups [
	^ groups contents
]

{ #category : 'visiting' }
JSONSchemaTestsuiteGroupsCollector >> visit: aNode [
	groups := ReadWriteStream on: OrderedCollection new.
	^ super visit: aNode
]

{ #category : 'visiting' }
JSONSchemaTestsuiteGroupsCollector >> visitGroup: aJSONSchemaTestsuiteGroup [
	^ groups nextPut: aJSONSchemaTestsuiteGroup
]
