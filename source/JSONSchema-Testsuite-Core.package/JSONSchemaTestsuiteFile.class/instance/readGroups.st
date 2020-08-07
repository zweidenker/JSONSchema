private
readGroups
	^ fileReference
		readStreamDo: [ :stream | (NeoJSONReader on: stream) nextAs: self class ]