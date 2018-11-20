as yet unclassified
neoJsonOn: jsonWriter

	jsonWriter writeMapStreamingDo: [ :jsonMapWriter |
		self schemaKeys do: [ :key |
			jsonMapWriter writeKey: key value: (self perform: key) ].
		self writePropertiesOn: jsonMapWriter ]
