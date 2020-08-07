private
createGroupClassNameMapping: aJSONSchemaTestsuite
	| groups groupsByCaseInsensitiveName |
	groups := (JSONSchemaTestsuiteGroupsCollector
		visit: aJSONSchemaTestsuite) groups.
	groupClassMapping := (groups
		collect: [ :group | group -> (self classNameFromGroup: group) ])
		asDictionary.
	groupsByCaseInsensitiveName := groups
		groupedBy: [ :group | (groupClassMapping at: group) asLowercase ].
	groupsByCaseInsensitiveName
		select: [ :each | each size > 1 ]
		thenDo: [ :clash | 
			clash
				withIndexDo: [ :group :index | 
					groupClassMapping
						at: group
						put: (groupClassMapping at: group) , index printString ] ]