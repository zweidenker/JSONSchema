validation
validateType: aDictionary 
	required ifNotNil: [
		self required do: [ :requiredProperty |
			(aDictionary includesKey: requiredProperty) ifFalse: [ 
				JSONSchemaMissingRequiredProperty new
					property: requiredProperty;
					signal ] ] ].
	properties associationsDo: [ :property | 
		aDictionary 
			at: property key 
			ifPresent: [ :elementValue  | property value validate: elementValue ] ]