as yet unclassified
neoJsonOn: jsonWriter

	jsonWriter writeMapStreamingDo: [ :jsonMapWriter |
		self schemaProperties do: [ :assoc | | value |
			value := self perform: assoc key.
			(value = assoc value) ifFalse: [  
				jsonMapWriter writeKey: assoc key value: value] ].
		self writePropertiesOn: jsonMapWriter ]
