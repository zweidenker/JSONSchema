instance creation
readFrom: stream
	^ self new
		methods: ((NeoJSONReader on: stream) nextAs: self);
		yourself