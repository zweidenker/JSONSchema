as yet unclassified
checkRequiredKeys: keys 
	| containedKeys |
	required ifNotNil: [  
		containedKeys := keys intersection: properties keys.
		(containedKeys includesAll: required) ifFalse: [ 
			 JSONTypeErrror signal: 'object is missing required properties ', ($, join: (required difference: containedKeys)) ] ]