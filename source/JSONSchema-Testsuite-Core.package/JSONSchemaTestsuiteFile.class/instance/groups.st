accessing
groups
	^ groups
		ifNil: [ groups := fileReference
				readStreamDo: [ :stream | (NeoJSONReader on: stream) nextAs: self class ] ]