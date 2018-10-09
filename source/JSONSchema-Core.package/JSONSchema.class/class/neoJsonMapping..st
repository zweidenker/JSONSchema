accessing
neoJsonMapping: mapper
	mapper for: self do: [ :mapping |
		mapping mapAccessor: #reference to: '$ref'.
		mapping mapInstVars: #( title description).
		mapping mapAccessor: #typeString mutator: #typeString: to: #type  ].
