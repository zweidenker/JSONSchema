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
	items isCollection 
		ifTrue: [ 
			items withIndexCollect: [ :item :idx |
				(items at: idx) read: item ] ]
		ifFalse: [ 
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
	| index |
	index := 0.
	^ Array streamContents: [:stream |
			aReader parseListDo: [ 
				stream nextPut: (items isCollection 
					ifTrue: [ 
						index := index + 1.
						(items at: index) readUsing: aReader ]
					ifFalse: [ items readUsing: aReader ])]]
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
	aCollection isArray ifFalse: [
		JSONTypeError signal: aCollection printString, ' is not an array' ].
	items isCollection
		ifTrue: [
			(aCollection size = items size) ifFalse: [
				JSONTypeError signal: aCollection asString, ' has different size than schema' ].
			aCollection withIndexDo: [:item :idx |
				(items at: idx) validateType: item ] ]
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
