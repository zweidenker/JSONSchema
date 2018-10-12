as yet unclassified
neoJsonOn: jsonWriter
	jsonWriter writeMapStreamingDo: [ :jsonMapWriter |
		self writePropertiesOn: jsonMapWriter ]
