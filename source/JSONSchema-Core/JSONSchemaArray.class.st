Class {
	#name : 'JSONSchemaArray',
	#superclass : 'JSONSchema',
	#instVars : [
		'items'
	],
	#category : 'JSONSchema-Core-Model',
	#package : 'JSONSchema-Core',
	#tag : 'Model'
}

{ #category : 'accessing' }
JSONSchemaArray class >> neoJsonMapping: mapper [
	super neoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		mapping mapInstVar: #items ] 
]

{ #category : 'instance creation' }
JSONSchemaArray class >> typeName [
	^ 'array'
]

{ #category : 'visiting' }
JSONSchemaArray >> acceptJSONSchema: aVisitor [ 
	^ aVisitor visitTypeArray: self 
]

{ #category : 'accessing' }
JSONSchemaArray >> items [
	^ items
]

{ #category : 'accessing' }
JSONSchemaArray >> items: aSchema [ 
	items := aSchema notNil
	ifTrue: [ aSchema ]
	ifFalse: [ JSONSchemaAnyObject new ]
	
]

{ #category : 'meta-object-protocol' }
JSONSchemaArray >> read: aCollection [
	^ items isCollection 
		ifTrue: [ 
			"tuple validation: items is an array of per-position schemas"
			aCollection withIndexCollect: [ :item :idx |
				(items at: idx) read: item ] ]
		ifFalse: [ 
			"homogeneous array: items is a single schema applied to every element"
			aCollection collect: [ :item | 
				items read: item ] ]
]

{ #category : 'as yet unclassified' }
JSONSchemaArray >> read: aString object: object [ 
	| reader |
	reader := NeoJSONReader on: aString readStream.
	object addAll: (self readUsing: reader).
]

{ #category : 'private' }
JSONSchemaArray >> readUsing: aReader [
	^ self peekNullThenReadUsing: aReader ifNotNull: [
		| index |
		index := 0.
		Array streamContents: [:stream |
			aReader parseListDo: [ 
				stream nextPut: (items isCollection 
					ifTrue: [ 
						index := index + 1.
						(items at: index) readUsing: aReader ]
					ifFalse: [ items readUsing: aReader ])]] ]
]

{ #category : 'accessing' }
JSONSchemaArray >> schemaProperties [
	^ {  
		#type -> nil.
		#title -> nil.
		#description -> nil.
		#items -> nil }
]

{ #category : 'validating' }
JSONSchemaArray >> validateType: aCollection [
	"Array type check plus positional element type-checking for the DSL path
	(JSONSchemaArray built directly, without constraints). Spec-compliant tuples:
	a single-schema items applies to every element; an array (tuple) applies
	positionally, and a shorter or longer instance is allowed here (additionalItems
	is enforced by JSONSchemaSingleItemSchemaConstraint on parsed schemas)."
	aCollection isArray ifFalse: [
		JSONTypeError signal: aCollection printString, ' is not an array' ].
	items ifNil: [ ^ self ].
	items isCollection
		ifTrue: [
			aCollection withIndexDo: [ :item :idx |
				idx <= items size ifTrue: [ (items at: idx) validateType: item ] ] ]
		ifFalse: [
			aCollection do: [ :each |
				items validateType: each ] ]
]

{ #category : 'as yet unclassified' }
JSONSchemaArray >> write: aCollection [
	| writer |
	^ String
		streamContents: [ :stream | 
			writer := JSONSchemaWriter on: stream.
			self write: aCollection on: writer ]
]

{ #category : 'as yet unclassified' }
JSONSchemaArray >> write: aCollection on: writer [
	| index |
	index := 0.
	^ writer
		writeList: aCollection with: [ :eachObject | 
			items isCollection 
				ifTrue: [ 
					index := index + 1.
					(items at: index) write: eachObject on: writer ]
				ifFalse: [ items write: eachObject on: writer ] ] 
]
