!classDefinition: #TestCarrito category: #'Tus-Libros' stamp: 'JCCCT 10/31/2019 14:34:08'!
TestCase subclass: #TestCarrito
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!TestCarrito methodsFor: 'as yet unclassified' stamp: 'JCCT 10/30/2019 23:10:01'!
test01AddSingleBookToCart
	|aCart user passwordOfUser elNombreDelViento|
	user := 'juan'.
	passwordOfUser := '123'.
	elNombreDelViento := '978-950-644-174-6'.
	aCart := Carrito of: user WithPassword: passwordOfUser.
	aCart addBook: elNombreDelViento.
	
	self assert: (aCart hasBook: elNombreDelViento).
	self assert: (aCart bookCount: elNombreDelViento) = 1.! !

!TestCarrito methodsFor: 'as yet unclassified' stamp: 'JCCT 10/30/2019 23:10:21'!
test02AddTwodBooksToCart
	|aCart user passwordOfUser elNombreDelViento elTemorDeUnHombreSabio|
	user := 'juan'.
	passwordOfUser := '123'.
	elNombreDelViento := '978-950-644-174-6'.
	elTemorDeUnHombreSabio := '978-950-644-294-1'.
	aCart := Carrito of: user WithPassword: passwordOfUser.
	aCart addBook: elNombreDelViento.
	aCart addBook: elTemorDeUnHombreSabio.	
	
	self assert: (aCart hasBook: elNombreDelViento).
	self assert: (aCart bookCount: elNombreDelViento) = 1.
	self assert: (aCart hasBook: elTemorDeUnHombreSabio).
	self assert: (aCart bookCount: elTemorDeUnHombreSabio) = 1.
		! !

!TestCarrito methodsFor: 'as yet unclassified' stamp: 'JCCT 10/30/2019 23:08:57'!
test03SameBookTwiceToCart
	|aCart user passwordOfUser elNombreDelViento|
	user := 'juan'.
	passwordOfUser := '123'.
	elNombreDelViento := '978-950-644-174-6'.
	aCart := Carrito of: user WithPassword: passwordOfUser.
	aCart addBook: elNombreDelViento.
	aCart addBook: elNombreDelViento.	
	
	self assert: (aCart hasBook: elNombreDelViento).
	self assert: (aCart bookCount: elNombreDelViento) = 2.! !

!TestCarrito methodsFor: 'as yet unclassified' stamp: 'JCCCT 10/31/2019 14:29:11'!
test04BooksOfEmptyCartIsEmpty
	|aCart user passwordOfUser elNombreDelViento|
	user := 'juan'.
	passwordOfUser := '123'.
	elNombreDelViento := '978-950-644-174-6'.
	aCart := Carrito of: user WithPassword: passwordOfUser.
	
	self assert: (aCart hasNoBooks)! !

!TestCarrito methodsFor: 'as yet unclassified' stamp: 'JCCCT 10/31/2019 14:32:54'!
test05BooksOfWithOneBookCartAreTheOneAdded
	|aCart user passwordOfUser elNombreDelViento aDic| 
	user := 'juan'.
	passwordOfUser := '123'.
	elNombreDelViento := '978-950-644-174-6'.
	aCart := Carrito of: user WithPassword: passwordOfUser.
	aCart addBook: elNombreDelViento.
	aDic := Dictionary new.
	aDic at:elNombreDelViento put: 1.
	self deny: (aCart hasNoBooks).
	self assert: (aCart books = aDic ).! !


!classDefinition: #Carrito category: #'Tus-Libros' stamp: 'JCCCT 10/31/2019 14:34:08'!
Object subclass: #Carrito
	instanceVariableNames: 'user userPassword book books'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!Carrito methodsFor: 'initialization' stamp: 'JCCT 10/30/2019 23:11:02'!
initializeOf: aUser WithPassword: aUserPassword 
	user := aUser.
	userPassword := aUserPassword.
	books := Dictionary new.! !


!Carrito methodsFor: 'as yet unclassified' stamp: 'JCCT 10/30/2019 23:18:47'!
addBook: aBook 
	books at: aBook ifPresent: [: value | books at: aBook put: value + 1] ifAbsent:[books at: aBook put: 1].! !

!Carrito methodsFor: 'as yet unclassified' stamp: 'JCCT 10/30/2019 23:16:37'!
bookCount: aBook 
	^ books at: aBook ifPresent:[:aQuantityOfBook | ^aQuantityOfBook] ifAbsent:[^0].! !

!Carrito methodsFor: 'as yet unclassified' stamp: 'JCCT 10/30/2019 23:14:24'!
hasBook: aBook 
	^books includesKey: aBook.! !

!Carrito methodsFor: 'as yet unclassified' stamp: 'JCCCT 10/31/2019 14:33:31'!
hasNoBooks
	^ books isEmpty. ! !


!Carrito methodsFor: 'accessing' stamp: 'JCCCT 10/31/2019 14:33:44'!
books
	^books! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Carrito class' category: #'Tus-Libros' stamp: 'JCCCT 10/31/2019 14:34:08'!
Carrito class
	instanceVariableNames: ''!

!Carrito class methodsFor: 'instance creation' stamp: 'JCCT 10/30/2019 17:46:14'!
of: aUser WithPassword: aUserPassword 
	
	^self new initializeOf: aUser WithPassword: aUserPassword ! !
