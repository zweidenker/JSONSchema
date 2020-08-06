accessing
groups
	^ groups
		ifNil: [ groups := self readGroups
				do: [ :each | each file: self ];
				yourself ]