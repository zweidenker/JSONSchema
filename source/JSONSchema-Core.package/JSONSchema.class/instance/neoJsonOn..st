as yet unclassified
neoJsonOn: jsonWriter
	| m |
	jsonWriter writeMapStreamingDo: [ :jsonMapWriter |
		self flag: #todo.
		"this is a hacky version of reusing the existing neojson mapping"
		m := jsonWriter mappingFor: self class.
		(m instVarNamed: #properties) do: [ :each |
			each writeObject: self on: jsonMapWriter ].
		self writePropertiesOn: jsonMapWriter ]
