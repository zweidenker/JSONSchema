as yet unclassified
writePropertiesOn: mapWriter
	"mapWriter writeKey: 'type' value: self typeString."
	constraints ifNil: [ ^ self ].
	constraints do: [ :constraint |
			constraint definitionProperties do: [ :property | | value |
				value := constraint perform: property asSymbol.
				value ifNotNil: [  
					mapWriter writeKey: property value: value ]  ]  ]
		