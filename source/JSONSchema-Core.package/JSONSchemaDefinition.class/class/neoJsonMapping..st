accessing
neoJsonMapping: mapper
	mapper for: self do: [ :mapping |
		mapping mapAccessor: #reference to: '$ref'.
		mapping mapInstVars: #( title ).
		mapping mapAccessors: #( required description enum ).
		mapping mapAccessor: #formatString mutator: #formatString: to: #format.
		(mapping mapAccessor: #properties) valueSchema: #PropertiesDictionary.
		(mapping mapAccessor: #items) valueSchema: #SingleSchema.
		mapping mapAccessors: #( oneOf anyOf not additionalProperties multipleOf maximum exclusiveMaximum minimum exclusiveMinimum maxLength minLength pattern maxItems minItems uniqueItems maxProperties minProperties  ).
		(mapping mapAccessor: #allOf) valueSchema: #SchemaList.
		mapping mapAccessor: #typeString mutator: #typeString: to: #type.
		 ].
	mapper for: #PropertiesDictionary customDo: [ :mapping |
		"Same boolean-tolerant reading as #SchemaList/#SingleSchema below - a property's
		schema can be a bare true/false, not just an object (e.g. properties:{foo:false})."
		mapping mapWithValueSchema: JSONSchemaDefinition.
		mapping reader: [ :jsonReader | | map |
			map := jsonReader mapClass new.
			jsonReader parseMapKeysDo: [ :key | | matched value entry |
				matched := false.
				value := nil.
				jsonReader parseConstantDo: [ :v | matched := true. value := v ].
				entry := (matched and: [ value isKindOf: Boolean ])
					ifTrue: [ JSONSchemaDefinition new booleanValue: value; yourself ]
					ifFalse: [ jsonReader nextAs: JSONSchemaDefinition ].
				map at: key put: entry ].
			map ] ].
	mapper for: #SchemaList customDo: [ :mapping |
		"allOf/anyOf/oneOf elements can each be a bare true/false, not just an object
		(e.g. allOf:[false]) - #listOfElementSchema: keeps the writer, we only replace
		the reader with a boolean-tolerant version."
		mapping listOfElementSchema: JSONSchemaDefinition.
		mapping reader: [ :jsonReader |
			jsonReader listClass streamContents: [ :stream |
				jsonReader parseListDo: [ | matched value element |
					matched := false.
					value := nil.
					jsonReader parseConstantDo: [ :v | matched := true. value := v ].
					element := (matched and: [ value isKindOf: Boolean ])
						ifTrue: [ JSONSchemaDefinition new booleanValue: value; yourself ]
						ifFalse: [ jsonReader nextAs: JSONSchemaDefinition ].
					stream nextPut: element ] ] ] ].
	mapper for: #SingleSchema customDo: [ :mapping |
		"A single nested schema slot (currently only #items) that can be a bare
		true/false, not just an object (e.g. items:false)."
		mapping reader: [ :jsonReader | | matched value |
			matched := false.
			value := nil.
			jsonReader parseConstantDo: [ :v | matched := true. value := v ].
			(matched and: [ value isKindOf: Boolean ])
				ifTrue: [ JSONSchemaDefinition new booleanValue: value; yourself ]
				ifFalse: [ jsonReader nextAs: JSONSchemaDefinition ] ] ]