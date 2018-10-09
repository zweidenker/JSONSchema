as yet unclassified
readUsing: reader
	| object |
	object := NeoJSONObject new.
	reader parseMapKeysDo: [ :k |
		object at: k put: ((properties at: k) readUsing: reader) ].
	^ object