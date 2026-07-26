Extension { #name : 'Symbol' }

{ #category : '*JSONSchema-Core' }
Symbol >> asJSONSchema [
	^ JSONSchema perform: self
]
