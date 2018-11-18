*jsonschema-core
jsonSchemaAt: property put: value 
	| selector |
	selector := property asSymbol asMutator.
	(self respondsTo: selector) ifTrue: [   
		self perform: selector asSymbol with: value ]