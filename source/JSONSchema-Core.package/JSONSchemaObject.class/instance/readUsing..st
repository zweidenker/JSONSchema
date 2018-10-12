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
				(additionalProperties isNil | (additionalProperties = true)) 
					ifTrue: [ 
						"if additionProperties is absent or true any additional property
						is allowed"
						object at: key put: reader parseValue ]
					ifFalse: [  
						(additionalProperties = false) 
							ifTrue: [
								"addtional properties are disallowed" 
								JSONTypeErrror signal: 'additional properties are not allowed' ]
							ifFalse: [ 
								"if additionalProperty is present and not a boolean it is a
								schema defining the type of the addtional properties"
								object at: key put: (additionalProperties readUsing: reader) ] ] ] ].
	required ifNotNil: [ 
		containedKeys := object keys intersection: properties keys.
		(containedKeys = required) ifFalse: [ 
		 	JSONTypeErrror signal: 'object is missing required properties ', ($, join: (required difference: containedKeys)) ] ].
	^ object