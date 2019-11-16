!classDefinition: #CartTest category: #TusLibros stamp: 'JCCCT 11/16/2019 18:18:02'!
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


!classDefinition: #CashierTest category: #TusLibros stamp: 'JCCCT 11/16/2019 18:18:02'!
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

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/16/2019 11:31:23'!
test03CashierCheckoutsCartWithOneBookAndMerchantProcessor
	|aCashier aCart  aBook aDict aCard aSalesBook aFlag aSale|
	aCard:= CreditCard withNumber:123456 expirationDate: (GregorianMonthOfYear year: (FixedGregorianDate today year next ) month: November ) name:'Juana Perez'.
	aBook:='book'.
	aDict := Dictionary new .
	aDict add: aBook -> 10.
	aSalesBook:= OrderedCollection new.
	aCashier:=Cashier initializeWith:aSalesBook.	
	aCart:=Cart acceptingItemsOf: aDict.	
	aCart add: aBook.		
	aFlag:=false.
	aSale := Sale of:10 withItems: aCart items.
	aClosure:=[aFlag:=true].
	aCashier checkout: aCart withCreditCard: aCard withMerchantProcessor:self.
	self assert:[aFlag=true].	
	self assert:[aSalesBook includes: aSale].
	
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


!classDefinition: #XXXTest category: #TusLibros stamp: 'JCCCT 11/16/2019 18:18:02'!
TestCase subclass: #XXXTest
	instanceVariableNames: 'aClosure'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!XXXTest methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/15/2019 19:51:48'!
test01CreateAnEmptyCartAndListItemsAskingById
	|anInternalMerchantProcessor cartId itemsOfCart storeFactory|
	storeFactory := StoreTestObjectsFactory new.
	anInternalMerchantProcessor _ storeFactory defaultXXX.
	cartId _ anInternalMerchantProcessor createCartOfUser: 'juan' WithPassword: 'Nahuel' .
	itemsOfCart  _ anInternalMerchantProcessor listItemsOfCart:cartId.
	self assert: itemsOfCart isEmpty. 
	
	! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/16/2019 11:41:32'!
test02CreateACartAndListItemsAskingById
	|xxx cartId itemsOfCart storeFactory|
	storeFactory := StoreTestObjectsFactory new.
	xxx _ storeFactory defaultXXX.
	
	cartId _ xxx createCartOfUser: storeFactory validUser WithPassword: storeFactory validPassword.
	
	xxx addToCart:cartId item: storeFactory itemSellByTheStore quantity:3.
	itemsOfCart  _ xxx listItemsOfCart:cartId.
	
	self assert: itemsOfCart size =3.
	self assert: itemsOfCart includes: storeFactory itemSellByTheStore. ! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/15/2019 20:02:22'!
test03CantCreateACartWithInvalidUser
	|xxx   storeFactory|
	storeFactory := StoreTestObjectsFactory new.
	xxx _ storeFactory defaultXXX.
	
	self should:[ xxx createCartOfUser: storeFactory invalidUser WithPassword: storeFactory invalidPassword.]
	raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = XXX InvalidUserMessage].

	! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/15/2019 20:03:20'!
test04CantCreateACartWithInvalidPassword
	|xxx   storeFactory|
	storeFactory := StoreTestObjectsFactory new.
	xxx _ storeFactory defaultXXX.
	
	self should:[ xxx createCartOfUser: storeFactory validUser WithPassword: storeFactory invalidPassword.]
	raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = XXX InvalidUserMessage].
	! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/15/2019 20:05:14'!
testx1CantAddToCartAfter30Min
 |xxx  cartId aClock storeFactory|
	storeFactory := StoreTestObjectsFactory new.
	xxx _ storeFactory defaultXXX.
	
	cartId _ xxx createCartOfUser: storeFactory validUser WithPassword: storeFactory validPassword.
	aClock := storeFactory clock.	

	 aClock incrementMinutes: 30.
	self should:[xxx addToCart: cartId item: storeFactory itemSellByTheStore quantity: 2]
  		 raise: Error - MessageNotUnderstood
  		withExceptionDo: [ :anError |
   							self assert: anError messageText = XXX TimeElapsed].

	

! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/15/2019 20:11:02'!
testx2CantCheckoutCartAfter30Min
 |xxx  cartId aCreditCard aClock storeFactory |

	storeFactory := StoreTestObjectsFactory new.
	xxx _ storeFactory defaultXXX.
	
	cartId _ xxx createCartOfUser: storeFactory validUser WithPassword: storeFactory validPassword.
	aClock := storeFactory clock.	

	 aClock incrementMinutes: 10.
	xxx addToCart: cartId item: storeFactory itemSellByTheStore quantity: 2.
 	aClock incrementMinutes: 30.
	aCreditCard := storeFactory validCreditCard.
	
 	self should:[xxx checkoutWithCartId: cartId withCardNumber:aCreditCard number expirationDate: aCreditCard expirationDate name:aCreditCard name user:storeFactory validUser.]
  raise: Error - MessageNotUnderstood
  withExceptionDo: [ :anError |
   self assert: anError messageText = XXX TimeElapsed].

	

! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/16/2019 15:56:30'!
testx3CheckoutSucceds
	|xxx  cartId aCreditCard aClock storeFactory aSale books|

	storeFactory := StoreTestObjectsFactory new.
	xxx _ storeFactory defaultXXX.
	
	cartId _ xxx createCartOfUser: storeFactory validUser WithPassword: storeFactory validPassword.
	aClock := storeFactory clock.	

	 aClock incrementMinutes: 10.
	xxx addToCart: cartId item: storeFactory itemSellByTheStore quantity: 2.
 	aClock incrementMinutes: 10.
	aCreditCard := storeFactory validCreditCard.
	books := OrderedCollection new.
	books add: storeFactory itemSellByTheStore.
	books add: storeFactory itemSellByTheStore.
	aSale := Sale of: (storeFactory itemSellByTheStorePrice * 2) withItems: books. 
	xxx checkoutWithCartId: cartId withCardNumber:aCreditCard number expirationDate: aCreditCard expirationDate name:aCreditCard name user:storeFactory validUser.

	self assert: [(xxx listOfPurchasesOfUser: storeFactory validUser withPassword: storeFactory validPassword ) = aSale]

	
	

! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/15/2019 20:14:11'!
testx4CantListPurchasesWithInvalidUser
	|xxx  cartId aCreditCard aClock storeFactory |

	storeFactory := StoreTestObjectsFactory new.
	xxx _ storeFactory defaultXXX.
	
	cartId _ xxx createCartOfUser: storeFactory validUser WithPassword: storeFactory validPassword.
	aClock := storeFactory clock.	

	 aClock incrementMinutes: 10.
	xxx addToCart: cartId item: storeFactory itemSellByTheStore quantity: 2.
 	aClock incrementMinutes: 10.
	aCreditCard := storeFactory validCreditCard.
	
	xxx checkoutWithCartId: cartId withCardNumber:aCreditCard number expirationDate: 	aCreditCard expirationDate name:aCreditCard name user:storeFactory validUser.


self should: [xxx listOfPurchasesOfUser:storeFactory invalidUser withPassword: storeFactory validPassword ]
	  raise: Error - MessageNotUnderstood
	  withExceptionDo: [ :anError |
	   self assert: anError messageText = XXX InvalidUserMessage ].


	

! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/15/2019 20:14:37'!
testx5CantListPurchasesWithInvalidPassword
	|xxx  cartId aCreditCard aClock storeFactory |

	storeFactory := StoreTestObjectsFactory new.
	xxx _ storeFactory defaultXXX.
	
	cartId _ xxx createCartOfUser: storeFactory validUser WithPassword: storeFactory validPassword.
	aClock := storeFactory clock.	

	 aClock incrementMinutes: 10.
	xxx addToCart: cartId item: storeFactory itemSellByTheStore quantity: 2.
 	aClock incrementMinutes: 10.
	aCreditCard := storeFactory validCreditCard.
	
	xxx checkoutWithCartId: cartId withCardNumber:aCreditCard number expirationDate: 	aCreditCard expirationDate name:aCreditCard name user:storeFactory validUser.


self should: [xxx listOfPurchasesOfUser:storeFactory validUser withPassword: storeFactory invalidPassword ]
	  raise: Error - MessageNotUnderstood
	  withExceptionDo: [ :anError |
	   self assert: anError messageText = XXX InvalidUserMessage ].


	

! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/16/2019 18:17:56'!
testx6MultipleCheckouts
	|xxx  cartId aCreditCard aClock storeFactory aSale books|

	storeFactory := StoreTestObjectsFactory new.
	xxx _ storeFactory defaultXXX.
	
	cartId _ xxx createCartOfUser: storeFactory validUser WithPassword: storeFactory validPassword.
	aClock := storeFactory clock.	

	 aClock incrementMinutes: 10.
	xxx addToCart: cartId item: storeFactory itemSellByTheStore quantity: 2.
 	aClock incrementMinutes: 10.
	aCreditCard := storeFactory validCreditCard.
	books := OrderedCollection new.
	books add: storeFactory itemSellByTheStore.
	books add: storeFactory itemSellByTheStore.
	aSale := Sale of: (storeFactory itemSellByTheStorePrice * 2) withItems: books. 
	xxx checkoutWithCartId: cartId withCardNumber:aCreditCard number expirationDate: aCreditCard expirationDate name:aCreditCard name user:storeFactory validUser.
	
	self assert: [(xxx listOfPurchasesOfUser: storeFactory validUser withPassword: storeFactory validPassword ) = aSale]

	
	

! !


!classDefinition: #Cart category: #TusLibros stamp: 'JCCCT 11/16/2019 18:18:02'!
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

!classDefinition: 'Cart class' category: #TusLibros stamp: 'JCCCT 11/16/2019 18:18:02'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros stamp: 'JCCCT 11/16/2019 18:18:02'!
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

!Cashier methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/16/2019 11:53:44'!
checkout: aCart withCreditCard: aCard withMerchantProcessor:amerchantProcessor
	|aSale|
	aCart isEmpty ifTrue:[ self error: self class EmptyCartErrorMessage].
	
	amerchantProcessor debit.	
	aSale := Sale of:aCart total withItems: aCart items.
	salesBook add: aSale.
	^aSale.
	
	! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JAV 11/4/2019 19:52:20'!
initializeWith:aSalesBook
	salesBook :=aSalesBook .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros stamp: 'JCCCT 11/16/2019 18:18:02'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'JAV 10/31/2019 21:13:44'!
EmptyCartErrorMessage
	^'Can not checkout empty cart'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'JAV 11/4/2019 19:51:53'!
initializeWith: aSalesBook

	^self new initializeWith:aSalesBook. ! !


!classDefinition: #CreditCard category: #TusLibros stamp: 'JCCCT 11/16/2019 18:18:02'!
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

!CreditCard methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/15/2019 20:09:31'!
expirationDate
	^expDate.! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'JAV 11/4/2019 20:42:41'!
isEpiredOnDate: aDate
	^ expDate < aDate! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/15/2019 20:09:17'!
number
	^number! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros stamp: 'JCCCT 11/16/2019 18:18:02'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'JAV 11/4/2019 19:24:42'!
withNumber:aNumber expirationDate:aDate name:aName

	^self new createWithNumber:aNumber expirationDate:aDate name:aName.! !


!classDefinition: #FakeDate category: #TusLibros stamp: 'JCCCT 11/16/2019 18:18:02'!
Object subclass: #FakeDate
	instanceVariableNames: 'lastDate increment'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!FakeDate methodsFor: 'as yet unclassified' stamp: 'jj 11/14/2019 19:21:11'!
incrementMinutes: aMinuteAmount 
	lastDate := lastDate + aMinuteAmount minutes.! !

!FakeDate methodsFor: 'as yet unclassified' stamp: 'jj 11/14/2019 19:19:46'!
initialize.
	lastDate _ DateAndTime now.
! !

!FakeDate methodsFor: 'as yet unclassified' stamp: 'jj 11/14/2019 19:19:34'!
now
	^lastDate
	
! !


!classDefinition: #FakeMerchantProcessor category: #TusLibros stamp: 'JCCCT 11/16/2019 18:18:02'!
Object subclass: #FakeMerchantProcessor
	instanceVariableNames: 'closure'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!FakeMerchantProcessor methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/16/2019 15:35:29'!
debit
	^closure value.! !

!FakeMerchantProcessor methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/16/2019 15:35:23'!
withAction:aClosure
	closure := aClosure.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FakeMerchantProcessor class' category: #TusLibros stamp: 'JCCCT 11/16/2019 18:18:02'!
FakeMerchantProcessor class
	instanceVariableNames: ''!

!FakeMerchantProcessor class methodsFor: 'instance creation' stamp: 'JCCCT 11/16/2019 15:34:40'!
withAction:aClosure
	^ self new withAction: aClosure.! !


!classDefinition: #Sale category: #TusLibros stamp: 'JCCCT 11/16/2019 18:18:02'!
Object subclass: #Sale
	instanceVariableNames: 'total items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'total' stamp: 'jj 11/13/2019 15:17:17'!
total
	^total.! !


!Sale methodsFor: 'initialization' stamp: 'JCCCT 11/16/2019 11:27:31'!
initializeTotal: aTotal withItems: someItems
	items := someItems.
	total := aTotal.! !


!Sale methodsFor: 'items' stamp: 'JCCCT 11/16/2019 11:32:32'!
items
	^items.! !


!Sale methodsFor: 'comparing' stamp: 'JCCCT 11/16/2019 11:32:20'!
= aSale
	^total = aSale total and:[items = aSale items].! !

!Sale methodsFor: 'comparing' stamp: 'JCCCT 11/16/2019 11:36:46'!
hash
	^total hash bitXor: items hash.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros stamp: 'JCCCT 11/16/2019 18:18:02'!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'as yet unclassified' stamp: 'jj 11/13/2019 15:24:47'!
InvalidTotalMessageDescription
	^'Total of sale should be positive'! !

!Sale class methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/16/2019 11:28:02'!
of: aTotal withItems: someItems
	aTotal <= 0 ifTrue:[self error: self InvalidTotalMessageDescription].
	^self new initializeTotal: aTotal withItems: someItems.! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros stamp: 'JCCCT 11/16/2019 18:18:02'!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'date' stamp: 'jj 11/13/2019 15:55:32'!
today

	^today. 
! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'jj 11/13/2019 15:54:33'!
expiredCreditCard
	|aDate|
	aDate := (GregorianMonthOfYear year: (FixedGregorianDate today year previous) month: November ).
	^ CreditCard withNumber: 123456 expirationDate: aDate name: self expiredCreditCardUser. 
! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'jj 11/13/2019 15:49:00'!
expiredCreditCardUser

	^ 'Charlie González'. 
! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'jj 11/13/2019 15:54:11'!
validCreditCard
	|aDate|
	aDate := (GregorianMonthOfYear year: (FixedGregorianDate today year next) month: November ).
	^ CreditCard withNumber: 123456 expirationDate: aDate name: self validCreditCardUser. 
! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'jj 11/13/2019 15:55:10'!
validCreditCardUser

	^ 'Amatista Elizabeth González'. 
! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'jj 11/13/2019 15:31:26'!
createCart
	^Cart acceptingItemsOf: self defaultCatalog.! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'JCCCT 11/15/2019 19:53:23'!
defaultCatalog 
	^ Dictionary new
	at: self itemSellByTheStore put: self itemSellByTheStorePrice;
	yourself! !


!StoreTestObjectsFactory methodsFor: 'items' stamp: 'jj 11/13/2019 15:53:24'!
itemNotSellByTheStore

	^'invalidBook'. 
! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'jj 11/13/2019 15:53:15'!
itemSellByTheStore

	^'validBook'. 
! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'jj 11/13/2019 15:53:40'!
itemSellByTheStorePrice

	^10. 
! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'JCCCT 11/15/2019 19:56:20'!
initialize

	today := FakeDate new now. 
	clock := FakeDate new.! !


!StoreTestObjectsFactory methodsFor: 'xxx' stamp: 'JCCCT 11/15/2019 19:57:03'!
clock
	^clock.! !

!StoreTestObjectsFactory methodsFor: 'xxx' stamp: 'JCCCT 11/16/2019 15:50:07'!
defaultXXX
	
	^XXX initializeXXXWithCatalog:self defaultCatalog andUsersWithPasswords: self usersAndPasswords withClock: self clock withMerchantProcessor: self succesfullMerchantProcessor.! !

!StoreTestObjectsFactory methodsFor: 'xxx' stamp: 'JCCCT 11/15/2019 19:48:31'!
usersAndPasswords
	|aDic|
	aDic := Dictionary new.
	aDic add: 'juan' -> 'Nahuel'.
	^ aDic.! !


!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/15/2019 20:02:37'!
invalidPassword
	^'Nahuelito'! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/15/2019 20:02:06'!
invalidUser
	^'Juanito'! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/16/2019 15:51:42'!
succesfullMerchantProcessor
	^ FakeMerchantProcessor withAction: [true].! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/15/2019 19:59:54'!
validPassword
	^'Nahuel'! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/15/2019 19:59:40'!
validUser
	^'juan'! !


!classDefinition: #XXX category: #TusLibros stamp: 'JCCCT 11/16/2019 18:18:02'!
Object subclass: #XXX
	instanceVariableNames: 'catalog carts nextCartId timeOfCarts usersWithPassword clock salesOfUsers merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!XXX methodsFor: 'initialization' stamp: 'JCCCT 11/16/2019 11:56:59'!
initializeXXXWithCatalog: aCatalog andUsersWithPasswords: aUsersWithPasswords withClock: aClock withMerchantProcessor: aMerchProcessor
	salesOfUsers := Dictionary new.
	clock:=aClock.
	usersWithPassword  := aUsersWithPasswords.
	merchantProcessor := aMerchProcessor.
	carts _ Dictionary new. 
	timeOfCarts _ Dictionary new. 
	catalog _ aCatalog.
	nextCartId _ 0.! !


!XXX methodsFor: 'as yet unclassified' stamp: 'jj 11/14/2019 19:45:11'!
addToCart: cartId item: anItem quantity: aQuantity 
	|aPreviousTime nextTime|
	aPreviousTime := timeOfCarts at: cartId.
	nextTime := clock now.
	aPreviousTime <= ( nextTime- 30 minutes) ifTrue:[self error:  self class TimeElapsed ].
	timeOfCarts at: cartId put:nextTime. 
	(carts at: cartId) add:aQuantity of:anItem.! !

!XXX methodsFor: 'as yet unclassified' stamp: 'JAV 11/7/2019 20:07:48'!
catalog
	
	^catalog! !

!XXX methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/16/2019 11:55:44'!
checkoutWithCartId: cartId withCardNumber: cardNumber expirationDate: aDate name: aName user:userId
	|aCashier aSalesBook aCard aSale|
	((timeOfCarts at:cartId) <= (clock now -30 minutes)) ifTrue:[^self error: self class TimeElapsed ].
	aSalesBook := OrderedCollection new.
	aCashier := Cashier initializeWith: aSalesBook.
	aCard := CreditCard withNumber: cardNumber expirationDate: aDate  name: aName.
	aSale := aCashier checkout: (carts at: cartId) withCreditCard: aCard withMerchantProcessor: merchantProcessor.
	salesOfUsers add: userId -> aSale.! !

!XXX methodsFor: 'as yet unclassified' stamp: 'JAV 11/11/2019 21:37:47'!
createCartOfUser: aUser WithPassword:aPassword 
	(self isValidUser: aUser WithPassword: aPassword) ifFalse: [^self error: self class InvalidUserMessage].
	
	carts add: nextCartId->(Cart acceptingItemsOf: catalog).
	timeOfCarts add: nextCartId->(clock now ).
	nextCartId _ nextCartId+1.
	^nextCartId-1.! !

!XXX methodsFor: 'as yet unclassified' stamp: 'JAV 11/11/2019 18:03:29'!
isValidUser: aUser WithPassword: aPassword
	^(usersWithPassword includesKey: aUser) and:[(usersWithPassword at: aUser) = aPassword].! !

!XXX methodsFor: 'as yet unclassified' stamp: 'JAV 11/7/2019 20:25:53'!
listItemsOfCart: anId 
	^ (carts at: anId) items .! !

!XXX methodsFor: 'as yet unclassified' stamp: 'jav 11/14/2019 21:11:31'!
listOfPurchasesOfUser: userId withPassword: pw 
	(self isValidUser: userId WithPassword: pw) ifFalse: [^self error: self class InvalidUserMessage].
	^salesOfUsers at: userId.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXX class' category: #TusLibros stamp: 'JCCCT 11/16/2019 18:18:02'!
XXX class
	instanceVariableNames: ''!

!XXX class methodsFor: 'instance creation' stamp: 'JCCCT 11/16/2019 11:57:15'!
initializeXXXWithCatalog: aCatalog  andUsersWithPasswords: aUsersWithPasswords withClock:aClock withMerchantProcessor: aMerchantProcessor
	
	^self new initializeXXXWithCatalog: aCatalog andUsersWithPasswords: aUsersWithPasswords withClock:aClock withMerchantProcessor: aMerchantProcessor. ! !


!XXX class methodsFor: 'as yet unclassified' stamp: 'JAV 11/11/2019 17:56:50'!
InvalidUserMessage
	^'Invalid User or Password'.! !

!XXX class methodsFor: 'as yet unclassified' stamp: 'JAV 11/11/2019 20:18:36'!
TimeElapsed
	^'Time elapsed and cart wad destroyed.'.! !
