as yet unclassified
readKey: key reader: reader
	properties ifNotNil: [  
		properties 
			at: key
			ifPresent: [ :propertySchema |
				"schema for property is existing using it to read the value"
				^ propertySchema readUsing: reader ] ].
		
	(additionalProperties isNil | (additionalProperties = true)) 
		ifTrue: [ 
			"if additionProperties is absent or true any additional property
			is allowed"
			^ reader parseValue ].
	
	(additionalProperties = false) 
		ifTrue: [
			"addtional properties are disallowed" 											
			JSONTypeErrror signal: 'additional properties are not allowed' ].
				
	"if additionalProperty is present and not a boolean it is a
	schema defining the type of the addtional properties"
	^ additionalProperties readUsing: reader