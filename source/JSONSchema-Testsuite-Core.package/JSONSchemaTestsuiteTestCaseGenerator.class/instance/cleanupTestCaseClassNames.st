private
cleanupTestCaseClassNames
	"As test case class names are automaticall generated from descriptions we might encounter a situation where doubletes are being created. Especially on case-insensitive filesystems. We're checking all class names here and adding a numeric suffix in case similar classnames are being found"

	"| caseInsensitiveGroups duplicateGroups duplicateGroupByFile duplicateGroupsWithDisjointFile |
	caseInsensitiveGroups := Dictionary new.
	self allGroups
		do: [ :group | 
			(caseInsensitiveGroups
				at: group caseInsensitiveKey
				ifAbsentPut: OrderedCollection new) add: group ].
	duplicateGroups := caseInsensitiveGroups values
		select: [ :classes | classes size > 1 ].
	duplicateGroupByFile := duplicateGroups
		collect: [ :groups | 
			| dic |
			dic := Dictionary new.
			groups
				do: [ :group | 
					(dic at: group file cleanedName ifAbsentPut: OrderedCollection new)
						add: group ].
			dic ].
	duplicateGroupsWithDisjointFile := duplicateGroupByFile
		select: [ :collection | collection size > 1 ].
	duplicateGroupsWithDisjointFile
		do: [ :formatGroups | 
			| index |
			index := 1.
			formatGroups
				do: [ :groups | 
					groups
						do: [ :group | 
							group testCaseClassName: group testCaseClassName , index printString.
							index := index + 1 ] ] ]"