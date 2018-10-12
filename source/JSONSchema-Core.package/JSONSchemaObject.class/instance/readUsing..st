as yet unclassified
readUsing: reader
	| object containedKeys |
	object := NeoJSONObject new.
	reader parseMapKeysDo: [ :key | 
		properties 
			at: key
			ifPresent: [ :value |
				object 
					at: key 
					put: (value readUsing: reader)  ]
			ifAbsent: [ 
				(additionalProperties isKindOf: Boolean)
					ifTrue: [  
						additionalProperties 
							ifTrue: [ object at: key put: reader parseValue ]
							ifFalse: [ JSONTypeErrror signal: 'additional properties are not allowed' ]]
					ifFalse: [
						object at: key put: (additionalProperties readUsing: reader) ] ] ].
	required ifNotNil: [ 
		containedKeys := object keys intersection: properties keys.
		(containedKeys = required) ifFalse: [ 
		 	JSONTypeErrror signal: 'object is missing required properties ', ($, join: (required difference: containedKeys)) ] ].
	^ object