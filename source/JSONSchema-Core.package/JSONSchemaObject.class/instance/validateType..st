validation
validateType: aDictionary
	aDictionary isDictionary ifFalse: [
		JSONTypeError signal: aDictionary printString, ' is not an object' ].
	required ifNotNil: [
		self required do: [ :requiredProperty |
			(aDictionary includesKey: requiredProperty) ifFalse: [
				JSONSchemaMissingRequiredProperty new
					property: requiredProperty;
					signal ] ] ].
	properties ifNotNil: [
		properties associationsDo: [ :property |
			aDictionary
				at: property key
				ifPresent: [ :elementValue | property value validate: elementValue ] ] ]