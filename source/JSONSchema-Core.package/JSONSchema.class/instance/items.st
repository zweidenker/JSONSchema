accessing
items
	self flag: #todo.
	"items should not be accessed from the schema"
	^ type items