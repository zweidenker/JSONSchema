Class {
	#name : 'JSONSchemaWriter',
	#superclass : 'NeoJSONWriter',
	#category : 'JSONSchema-Core',
	#package : 'JSONSchema-Core'
}

{ #category : 'private' }
JSONSchemaWriter >> encodeKey: key value: value as: schema [
	self nextPut: key.
	self prettyPrintSpace.
	writeStream nextPut: $:.
	self prettyPrintSpace.
	value 
		ifNotNil: [ schema write: value on: self ]
		ifNil: [ self writeNull ]
]

{ #category : 'private' }
JSONSchemaWriter >> writeList: aCollection with: block [
	writeStream nextPut: $[.
	aCollection
		do:
			[ :eachObject | block valueWithArguments: (Array with: eachObject) ]
		separatedBy: [ self listElementSeparator ].
	writeStream nextPut: $]
]
