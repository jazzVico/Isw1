!classDefinition: #CartTest category: #TusLibros stamp: 'JAV 11/11/2019 22:02:10'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
defaultCatalog
	
	^ Array with: self itemSellByTheStore! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: #TusLibros stamp: 'JAV 11/11/2019 22:02:10'!
TestCase subclass: #CashierTest
	instanceVariableNames: 'aClosure'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JAV 11/4/2019 21:47:41'!
debit
	aClosure value.	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JAV 11/4/2019 20:44:56'!
test01CashierCantCheckoutEmptyCart
	|cashier cart card salesBook|
	salesBook:=Array new.
	cashier:=Cashier initializeWith:salesBook.
	cart:=Cart acceptingItemsOf: Dictionary new.
	card:=CreditCard withNumber:123456 expirationDate: (GregorianMonthOfYear year: (FixedGregorianDate today year next ) month: November ) name:'Juana Perez'.
	self should:[cashier checkout: cart withCreditCard: card]	
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cashier class EmptyCartErrorMessage.
			self assert: salesBook isEmpty.
			 ]
		
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JAV 11/4/2019 20:36:20'!
test02CashierCheckoutsCartWithOneBook
	|aCashier aCart  aBook aDict aCard aSalesBook |
	aCard:= CreditCard withNumber:123456 expirationDate: (GregorianMonthOfYear year: (FixedGregorianDate today year next ) month: November ) name:'Juana Perez'.
	aBook:='book'.
	aDict := Dictionary new .
	aDict add: aBook -> 10.
	aSalesBook:= OrderedCollection new.
	aCashier:=Cashier initializeWith:aSalesBook.	
	aCart:=Cart acceptingItemsOf: aDict.	
	aCart add: aBook.	
	aCashier checkout: aCart withCreditCard: aCard.	
	self assert:[aSalesBook includes: 10].
	
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JAV 11/4/2019 21:53:55'!
test03CashierCheckoutsCartWithOneBookAndMerchantProcessor
	|aCashier aCart  aBook aDict aCard aSalesBook aFlag|
	aCard:= CreditCard withNumber:123456 expirationDate: (GregorianMonthOfYear year: (FixedGregorianDate today year next ) month: November ) name:'Juana Perez'.
	aBook:='book'.
	aDict := Dictionary new .
	aDict add: aBook -> 10.
	aSalesBook:= OrderedCollection new.
	aCashier:=Cashier initializeWith:aSalesBook.	
	aCart:=Cart acceptingItemsOf: aDict.	
	aCart add: aBook.		
	aFlag:=false.
	aClosure:=[aFlag:=true].
	aCashier checkout: aCart withCreditCard: aCard withMerchantProcessor:self.
	self assert:[aFlag=true].	
	self assert:[aSalesBook includes: 10].
	
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JAV 11/6/2019 22:56:45'!
test04CashierDoesNotRegisterSaleWhenMerchantProcessorFails
	|aCashier aCart  aBook aDict aCard aSalesBook aFlag|
	
	aCard:= CreditCard withNumber:123456 expirationDate: (GregorianMonthOfYear year: 	(FixedGregorianDate today year next ) month: November ) name:'Juana Perez'.
	aBook:='book'.
	aDict := Dictionary new .
	aDict add: aBook -> 10.
	
	aSalesBook:= OrderedCollection new.
	aCashier:=Cashier initializeWith:aSalesBook.	
	aCart:=Cart acceptingItemsOf: aDict.	
	aCart add: aBook.
			
	aFlag:=false.
	aClosure:=[aFlag:=true. self error:Error].
	
	self 
		should: [aCashier checkout: aCart withCreditCard: aCard withMerchantProcessor:self. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: aFlag=true.
			self assert: aSalesBook isEmpty ].
	

	

	
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JAV 11/6/2019 22:09:32'!
test05CashierFailsWhenCreditCardIsExpiredAndDoesNotExecuteMerchantProcessor
	

	
	! !


!classDefinition: #XXXTest category: #TusLibros stamp: 'JAV 11/11/2019 22:02:10'!
TestCase subclass: #XXXTest
	instanceVariableNames: 'aClosure'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!XXXTest methodsFor: 'as yet unclassified' stamp: 'JAV 11/11/2019 21:34:07'!
dtest05CheckOutSucceds
	|xxx  aCatalog aUsersWithPasswords cartId card transactionId aListOfPurchases abook|
	aUsersWithPasswords := Dictionary new.
	aUsersWithPasswords add: 'juan' -> 'Nahuel'.
	aCatalog _ Dictionary new.
	abook _ 'abook'.
	xxx _ XXX initializeInternalMerchantProcessorWithCatalog:aCatalog AndUsersWithPasswords: aUsersWithPasswords withClock: FakeDate.
	cartId _ xxx createCartOfUser: 'juan' WithPassword: 'Nahuel'.
	xxx addToCart: cartId item:  abook quantity: 2.
	card _ CreditCard withNumber:123456 expirationDate: (GregorianMonthOfYear year: (FixedGregorianDate today year next ) month: November ) name:'Juana Perez'.
	
	transactionId _ xxx checkOutCart: cartId withCreditCard:card.
	aListOfPurchases _ xxx listPurchasesOf: 'juan' WithPassword: 'Nahuel'.
	

! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'JAV 11/11/2019 21:55:37'!
test01CreateAnEmptyCartAndListItemsAskingById
	|anInternalMerchantProcessor cartId itemsOfCart aUsersWithPasswords|
	aUsersWithPasswords := Dictionary new.
	aUsersWithPasswords add: 'juan' -> 'Nahuel'.
	anInternalMerchantProcessor _ XXX initializeInternalMerchantProcessorWithCatalog:Dictionary new AndUsersWithPasswords: aUsersWithPasswords withClock:( FakeDate withTimeSkipOf:31).
	cartId _ anInternalMerchantProcessor createCartOfUser: 'juan' WithPassword: 'Nahuel' .
	itemsOfCart  _ anInternalMerchantProcessor listItemsOfCart:cartId.
	self assert: itemsOfCart isEmpty. 
	
	! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'JAV 11/11/2019 21:57:44'!
test02CreateACartAndListItemsAskingById
	|xxx cartId itemsOfCart anItem aCatalog aUsersWithPasswords|
	aUsersWithPasswords := Dictionary new.
	aUsersWithPasswords add: 'juan' -> 'Nahuel'.
	anItem _ 'a book'.
	aCatalog _ Dictionary new.
	aCatalog add: anItem->10.
	xxx _ XXX initializeInternalMerchantProcessorWithCatalog:aCatalog AndUsersWithPasswords:aUsersWithPasswords withClock:DateAndTime.
	cartId _ xxx createCartOfUser: 'juan' WithPassword: 'Nahuel'.
	
	xxx addToCart:cartId item:anItem quantity:3.
	itemsOfCart  _ xxx listItemsOfCart:cartId.
	
	self assert: itemsOfCart size =3. ! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'JAV 11/11/2019 21:34:44'!
test03CantCreateACartWithInvalidUser
	|xxx   aCatalog aUsersWithPasswords|
	aUsersWithPasswords := Dictionary new.
	aUsersWithPasswords add: 'juan' -> 'Nahuel'.
	aCatalog _ Dictionary new.
	
	xxx _ XXX initializeInternalMerchantProcessorWithCatalog:aCatalog AndUsersWithPasswords: aUsersWithPasswords withClock: FakeDate.
	
	self should:[ xxx createCartOfUser:'juanito' WithPassword:'Nahuel'.]
	raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = XXX InvalidUserMessage].

	! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'JAV 11/11/2019 21:34:52'!
test04CantCreateACartWithInvalidPassword
	|xxx   aCatalog aUsersWithPasswords|
	aUsersWithPasswords := Dictionary new.
	aUsersWithPasswords add: 'juan' -> 'Nahuel'.
	aCatalog _ Dictionary new.
	
	xxx _ XXX initializeInternalMerchantProcessorWithCatalog:aCatalog AndUsersWithPasswords: aUsersWithPasswords withClock: FakeDate.
	
	self should:[ xxx createCartOfUser:'juan' WithPassword:'Nahuelito'.]
	raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = XXX InvalidUserMessage].

	! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'JAV 11/11/2019 21:49:44'!
testx1CantAddToCartAfter30Min
	|xxx  aCatalog aUsersWithPasswords cartId abook|
	aUsersWithPasswords := Dictionary new.
	aUsersWithPasswords add: 'juan' -> 'Nahuel'.
	aCatalog _ Dictionary new.
	abook _ 'abook'.
	xxx _ XXX initializeInternalMerchantProcessorWithCatalog:aCatalog AndUsersWithPasswords: aUsersWithPasswords withClock:( FakeDate withTimeSkipOf:31).
	cartId _ xxx createCartOfUser: 'juan' WithPassword: 'Nahuel'.
	
	self should:[xxx addToCart: cartId item: abook quantity: 2]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = XXX TimeElapsed].

	

! !


!classDefinition: #Cart category: #TusLibros stamp: 'JAV 11/11/2019 22:02:10'!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'JAV 11/4/2019 20:12:54'!
assertIsValidItem: anItem

	(catalog keys includes: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'JAV 11/7/2019 20:27:22'!
items

	^items .! !

!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !

!Cart methodsFor: 'queries' stamp: 'JAV 11/4/2019 19:01:39'!
total
	|res|
	res:=0.
	items do:[:item| res:=res+(catalog at: item)] . 
	^res.! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros stamp: 'JAV 11/11/2019 22:02:10'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros stamp: 'JAV 11/11/2019 22:02:10'!
Object subclass: #Cashier
	instanceVariableNames: 'salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'JAV 11/4/2019 20:35:42'!
checkout: aCart withCreditCard: aCard
	aCart isEmpty ifTrue:[ self error: self class EmptyCartErrorMessage].
	salesBook add: (aCart total).
	
	
	! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JAV 11/6/2019 22:48:20'!
checkout: aCart withCreditCard: aCard withMerchantProcessor:amerchantProcessor
	
	aCart isEmpty ifTrue:[ self error: self class EmptyCartErrorMessage].
	
	amerchantProcessor debit.	
	
	salesBook add: (aCart total).
	
	
	! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JAV 11/4/2019 19:52:20'!
initializeWith:aSalesBook
	salesBook :=aSalesBook .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros stamp: 'JAV 11/11/2019 22:02:10'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'JAV 10/31/2019 21:13:44'!
EmptyCartErrorMessage
	^'Can not checkout empty cart'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'JAV 11/4/2019 19:51:53'!
initializeWith: aSalesBook

	^self new initializeWith:aSalesBook. ! !


!classDefinition: #CreditCard category: #TusLibros stamp: 'JAV 11/11/2019 22:02:10'!
Object subclass: #CreditCard
	instanceVariableNames: 'name number expDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'as yet unclassified' stamp: 'JAV 11/4/2019 19:28:13'!
createWithNumber:aNumber expirationDate:aDate name:aName
	name:=aName.
	number:=aNumber.
	expDate:=aDate.! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'JAV 11/4/2019 20:42:41'!
isEpiredOnDate: aDate
	^ expDate < aDate! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros stamp: 'JAV 11/11/2019 22:02:10'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'JAV 11/4/2019 19:24:42'!
withNumber:aNumber expirationDate:aDate name:aName

	^self new createWithNumber:aNumber expirationDate:aDate name:aName.! !


!classDefinition: #FakeDate category: #TusLibros stamp: 'JAV 11/11/2019 22:02:10'!
Object subclass: #FakeDate
	instanceVariableNames: 'lastDate increment'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!FakeDate methodsFor: 'as yet unclassified' stamp: 'JAV 11/11/2019 21:05:50'!
initializeWithTimeSkipOf:minutes.
	lastDate _ DateAndTime now.
	increment _ minutes minutes.
	
! !

!FakeDate methodsFor: 'as yet unclassified' stamp: 'JAV 11/11/2019 21:05:34'!
now
	^lastDate+increment
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FakeDate class' category: #TusLibros stamp: 'JAV 11/11/2019 22:02:10'!
FakeDate class
	instanceVariableNames: ''!

!FakeDate class methodsFor: 'as yet unclassified' stamp: 'JAV 11/11/2019 20:52:15'!
withTimeSkipOf:minutes
	^self new initializeWithTimeSkipOf:minutes.! !


!classDefinition: #XXX category: #TusLibros stamp: 'JAV 11/11/2019 22:02:10'!
Object subclass: #XXX
	instanceVariableNames: 'catalog carts nextCartId timeOfCarts usersWithPassword clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!XXX methodsFor: 'initialization' stamp: 'JAV 11/11/2019 21:51:43'!
initializeInitializeInternalMerchantProcessorWithCatalog: aCatalog AndUsersWithPasswords: aUsersWithPasswords withClock: aClock
	clock:=aClock.
	usersWithPassword  := aUsersWithPasswords.
	carts _ Dictionary new. 
	timeOfCarts _ Dictionary new. 
	catalog _ aCatalog.
	nextCartId _ 0.! !


!XXX methodsFor: 'as yet unclassified' stamp: 'JAV 11/11/2019 22:01:14'!
addToCart: cartId item: anItem quantity: aQuantity 
	((timeOfCarts at: cartId)>= (clock now - 30 minutes)) ifTrue:[self error:  self class TimeElapsed ].
	timeOfCarts at: cartId ->clock now. 
	(carts at: cartId) add:aQuantity of:anItem.! !

!XXX methodsFor: 'as yet unclassified' stamp: 'JAV 11/7/2019 20:07:48'!
catalog
	
	^catalog! !

!XXX methodsFor: 'as yet unclassified' stamp: 'JAV 11/7/2019 20:29:02'!
createCart

	carts add: nextCartId->(Cart acceptingItemsOf: catalog).
	nextCartId _ nextCartId+1.
	^nextCartId-1.! !

!XXX methodsFor: 'as yet unclassified' stamp: 'JAV 11/11/2019 21:37:47'!
createCartOfUser: aUser WithPassword:aPassword 
	(self isValidUser: aUser WithPassword: aPassword) ifFalse: [^self error: self class InvalidUserMessage].
	
	carts add: nextCartId->(Cart acceptingItemsOf: catalog).
	timeOfCarts add: nextCartId->(clock now ).
	nextCartId _ nextCartId+1.
	^nextCartId-1.! !

!XXX methodsFor: 'as yet unclassified' stamp: 'JAV 11/7/2019 20:07:57'!
createCartWith: aDictionary 
	self shouldBeImplemented.! !

!XXX methodsFor: 'as yet unclassified' stamp: 'JAV 11/11/2019 18:03:29'!
isValidUser: aUser WithPassword: aPassword
	^(usersWithPassword includesKey: aUser) and:[(usersWithPassword at: aUser) = aPassword].! !

!XXX methodsFor: 'as yet unclassified' stamp: 'JAV 11/7/2019 20:25:53'!
listItemsOfCart: anId 
	^ (carts at: anId) items .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXX class' category: #TusLibros stamp: 'JAV 11/11/2019 22:02:10'!
XXX class
	instanceVariableNames: ''!

!XXX class methodsFor: 'instance creation' stamp: 'JAV 11/11/2019 21:33:32'!
initializeInternalMerchantProcessorWithCatalog: aCatalog  AndUsersWithPasswords: aUsersWithPasswords withClock:aClock
	
	^self new initializeInitializeInternalMerchantProcessorWithCatalog: aCatalog AndUsersWithPasswords: aUsersWithPasswords withClock:aClock. ! !


!XXX class methodsFor: 'as yet unclassified' stamp: 'JAV 11/11/2019 17:56:50'!
InvalidUserMessage
	^'Invalid User or Password'.! !

!XXX class methodsFor: 'as yet unclassified' stamp: 'JAV 11/11/2019 20:18:36'!
TimeElapsed
	^'Time elapsed and cart wad destroyed.'.! !
