Class {
	#name : 'JSONSchemaBasicObject',
	#superclass : 'JSONSchema',
	#category : 'JSONSchema-Core-Model',
	#package : 'JSONSchema-Core',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
JSONSchemaBasicObject >> readProperties: aDictionary from: jsonObject writeTo: object [
	 aDictionary ifNil: [ ^ self ].
	 aDictionary keysAndValuesDo: [ :key :schema |
		self readProperty: key schema: schema from: jsonObject writeTo: object ]
]

{ #category : 'as yet unclassified' }
JSONSchemaBasicObject >> readProperty: key schema:schema from: jsonObject writeTo: object [
	jsonObject 
		at: key
		ifPresent: [ :val |
			self flag: #todo.
			"disabling nil values here. Needs to be checked what needs to be done
			with existing key but nil value" 
			val ifNotNil: [ 
				object 
					at: key 
					put: (schema read: val) ] ]
]
