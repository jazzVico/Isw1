!classDefinition: #CartTest category: #TusLibros stamp: 'JCCCT 11/7/2019 16:55:40'!
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


!classDefinition: #CashierTest category: #TusLibros stamp: 'JCCCT 11/7/2019 16:55:40'!
TestCase subclass: #CashierTest
	instanceVariableNames: 'aClosure'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JAV 11/4/2019 21:47:41'!
debit
	aClosure value.	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/7/2019 11:28:09'!
test01CashierCantCheckoutEmptyCart
	|aCashier aCart aCard salesBook|
	salesBook:=Array new.
	aCashier:=Cashier initializeWith:salesBook.
	aCart:=Cart acceptingItemsOf: Dictionary new.
	aCard:=CreditCard withNumber:123456 expirationDate: (GregorianMonthOfYear year: (FixedGregorianDate today year next ) month: November ) name:'Juana Perez'.
	self should:[aCashier checkout: aCart withCreditCard: aCard]	
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = aCashier class EmptyCartErrorMessage.
			self assert: aCashier hasNoSales.
			 ]
		
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/7/2019 11:27:18'!
test02CashierCheckoutsCartWithOneBook
	|aCashier aCart  aBook aCatalog aCard aSalesBook |
	aCard:= CreditCard withNumber:123456 expirationDate: (GregorianMonthOfYear year: (FixedGregorianDate today year next ) month: November ) name:'Juana Perez'.
	aBook:='book'.
	aCatalog := Dictionary new .
	aCatalog add: aBook -> 10.
	aSalesBook:= Dictionary new.
	aCashier:=Cashier initializeWith:aSalesBook.	
	aCart:=Cart acceptingItemsOf: aCatalog.	
	aCart add: aBook.	
	aCashier checkout: aCart withCreditCard: aCard.	
	self assert:[aCashier hasSaleFrom: 'Juana Perez' of:10].
	
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/7/2019 16:51:59'!
test03CashierCheckoutsCartWithOneBookAndMerchantProcessor
	|aCashier aCart  aBook aCatalog aCard aSalesBook aFlag aTime|
	aCard:= CreditCard withNumber:123456 expirationDate: (GregorianMonthOfYear year: (FixedGregorianDate today year next ) month: November ) name:'Juana Perez'.
	aBook:='book'.
	aCatalog := Dictionary new .
	aCatalog add: aBook -> 10.
	aSalesBook:= OrderedCollection new.
	aCashier:=Cashier initializeWith:aSalesBook.	
	aCart:=Cart acceptingItemsOf: aCatalog.	
	aCart add: aBook.		
	aFlag:=false.
	aClosure:=[aFlag:=true].
	aTime := GregorianDateTime now.
	aCashier checkout: aCart withCreditCard: aCard withMerchantProcessor:self withTime:aTime.
	self assert:[aFlag=true].	
	self assert:[aCashier hasSaleFrom: 'Juana Perez' of:10 withBooks: aCart items withTime: aTime].
	
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/7/2019 16:54:44'!
test04CashierCheckoutsTwoCartsWithBooksAndMerchantProcessor
	|aCashier aCart  aSecondCart aBook aCatalog aCard aSecondCard aSalesBook aFlag aDate aTime|
	aDate := GregorianMonthOfYear year: (FixedGregorianDate today year next ) month: November.
	aCard:= CreditCard withNumber:123456 expirationDate: aDate name:'Juana Perez'.

	aSecondCard:= CreditCard withNumber:654321 expirationDate: aDate name:'Juan Pereira'.
	aBook:='book'.
	aCatalog := Dictionary new .
	aCatalog add: aBook -> 10.
	aSalesBook:= OrderedCollection new.
	
	aCart:=Cart acceptingItemsOf: aCatalog.
	aCart add: aBook.	
	aCart add: aBook.		
	aSecondCart := Cart acceptingItemsOf:aCatalog.
	aSecondCart add: aBook.
	aCashier:=Cashier initializeWith:aSalesBook.	
	aFlag:=false.
	aClosure:=[aFlag:=true].
	aTime := GregorianDateTime now.
	aCashier checkout: aCart withCreditCard: aCard withMerchantProcessor:self withTime:aTime.
	aCashier checkout: aSecondCart withCreditCard: aSecondCard withMerchantProcessor:self withTime:aTime.
	self assert:[aFlag=true].

	self assert:[aCashier hasSaleFrom:  'Juana Perez'  of: 20 withBooks: aCart items withDate: aTime].
	self assert:[aCashier hasSaleFrom: 'Juan Pereira' of: 10 withBooks: aSecondCart items withDate: aTime].	
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/7/2019 16:47:02'!
test05CashierDoesNotRegisterSaleWhenMerchantProcessorFails
	|aCashier aCart  aBook aCatalog aCard aSalesBook aFlag|
	
	aCard:= CreditCard withNumber:123456 expirationDate: (GregorianMonthOfYear year: 	(FixedGregorianDate today year next ) month: November ) name:'Juana Perez'.
	aBook:='book'.
	aCatalog := Dictionary new .
	aCatalog add: aBook -> 10.
	
	aSalesBook:= Dictionary new.

	aCashier:=Cashier initializeWith:aSalesBook.	
	aCart:=Cart acceptingItemsOf: aCatalog.	
	aCart add: aBook.
			
	aFlag:=false.
	aClosure:=[aFlag:=true. self error:Error].
	
	self 
		should: [aCashier checkout: aCart withCreditCard: aCard withMerchantProcessor:self withTime:GregorianDateTime now. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: aFlag=true.
			self assert: aCashier hasNoSales].
	

	

	
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/7/2019 16:47:19'!
test06CashierFailsWhenCreditCardIsExpiredAndDoesNotExecuteMerchantProcessor
	
	|aCashier aCart  aBook aCatalog aCard aSalesBook aFlag|
	
	aCard:= CreditCard withNumber:123456 expirationDate: (GregorianMonthOfYear year: 	(FixedGregorianDate today year previous ) month: November ) name:'Juana Perez'.
	aBook:='book'.
	aCatalog := Dictionary new .
	aCatalog add: aBook -> 10.
	
	aSalesBook:= Dictionary new.

	aCashier:=Cashier initializeWith:aSalesBook.	
	aCart:=Cart acceptingItemsOf: aCatalog.	
	aCart add: aBook.
			
	aFlag:=false.
	aClosure:=[aFlag:=true.].
	
	self 
		should: [aCashier checkout: aCart withCreditCard: aCard withMerchantProcessor:self withTime:GregorianDateTime now. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: aFlag=false.
			self assert: aCashier hasNoSales.
			self assert: anError messageText  = 'Can not checkout empty cart'].
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/7/2019 16:55:29'!
test07CashierShouldIdentifyDifferentSales
	
	|aCashier aCart  aBook aSecondBook aCatalog aCard aSalesBook aFlag aSecondCart aTime|
	
	aCard:= CreditCard withNumber:123456 expirationDate: (GregorianMonthOfYear year:(FixedGregorianDate today year next ) month: November ) name:'Juana Perez'.
	aBook:='book'.
	aSecondBook := 'book2'.
	aCatalog := Dictionary new .
	aCatalog add: aBook -> 10.
	aCatalog add: aSecondBook -> 10.
	aSalesBook:= OrderedCollection new.

	aCashier:=Cashier initializeWith:aSalesBook.	
	aCart:=Cart acceptingItemsOf: aCatalog.	
	aCart add: aBook.
	aSecondCart := Cart acceptingItemsOf: aCatalog.
	aSecondCart add: aSecondBook.
			
	aFlag:=false.
	aClosure:=[aFlag:=true.].
	aTime := GregorianDateTime now.
	aCashier checkout: aCart withCreditCard: aCard withMerchantProcessor:self withTime: aTime.
	aCashier checkout: aSecondCart withCreditCard: aCard withMerchantProcessor:self withTime: aTime.
	self assert:[aFlag=true].	
	
	self assert:[aCashier hasSaleFrom: 'Juana Perez' of: 10 withBooks:aCart items withTime: aTime].
	self assert:[aCashier  hasSaleFrom: 'Juana Perez' of: 10 withBooks:aSecondCart items withTime: aTime].
	! !


!classDefinition: #Cart category: #TusLibros stamp: 'JCCCT 11/7/2019 16:55:40'!
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


!Cart methodsFor: 'items' stamp: 'JCCCT 11/7/2019 15:14:22'!
items
	^items.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros stamp: 'JCCCT 11/7/2019 16:55:40'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros stamp: 'JCCCT 11/7/2019 16:55:40'!
Object subclass: #Cashier
	instanceVariableNames: 'salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/6/2019 23:19:44'!
checkout: aCart withCreditCard: aCard
	aCart isEmpty ifTrue:[ self error: self class EmptyCartErrorMessage].
	salesBook add: aCard name -> (aCart total).
	
	
	! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/7/2019 16:49:03'!
checkout: aCart withCreditCard: aCard withMerchantProcessor:amerchantProcessor withTime: aDate
	|aSale|
	aCart isEmpty ifTrue:[ self error: self class EmptyCartErrorMessage].
	(aCard isEpiredOnDate: GregorianMonthOfYear current) ifTrue:[self error: self class ExpiredCardErrorMessage].
	amerchantProcessor debit.	
	aSale := Sale From: aCard name  withValue: aCart total  WithBooks: aCart items WithDate: aDate.
	salesBook add: aSale.
	
	
	! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/6/2019 22:33:50'!
hasNoSales
	^salesBook isEmpty.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/6/2019 22:27:43'!
hasSaleFrom: aName of: aValue 
	
	^aValue = (salesBook at: aName ifAbsent: [^false]).! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/7/2019 15:29:05'!
hasSaleFrom: aUser of: aValue withBooks: anAmountOfBooks 
	| aSale |
	aSale := Sale From: aUser withValue: aValue WithBooks: anAmountOfBooks.
	^salesBook includes: aSale.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/7/2019 16:18:36'!
hasSaleFrom: aUser of: aValue withBooks: anAmountOfBooks withDate: aDate
	| aSale |
	aSale := Sale From: aUser withValue: aValue WithBooks: anAmountOfBooks WithDate: aDate.
	^salesBook includes: aSale.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/7/2019 16:50:16'!
hasSaleFrom: aUser of: aValue withBooks: anAmountOfBooks withTime: aDate
	| aSale |
	aSale := Sale From: aUser withValue: aValue WithBooks: anAmountOfBooks WithDate: aDate.
	^salesBook includes: aSale.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'JAV 11/4/2019 19:52:20'!
initializeWith:aSalesBook
	salesBook :=aSalesBook .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros stamp: 'JCCCT 11/7/2019 16:55:40'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'JAV 10/31/2019 21:13:44'!
EmptyCartErrorMessage
	^'Can not checkout empty cart'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/7/2019 12:04:45'!
ExpiredCardErrorMessage
	^'Can not checkout empty cart'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'JAV 11/4/2019 19:51:53'!
initializeWith: aSalesBook

	^self new initializeWith:aSalesBook. ! !


!classDefinition: #CreditCard category: #TusLibros stamp: 'JCCCT 11/7/2019 16:55:40'!
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

!CreditCard methodsFor: 'as yet unclassified' stamp: 'JCCCT 11/6/2019 22:31:05'!
name
	^ name.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros stamp: 'JCCCT 11/7/2019 16:55:40'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'JAV 11/4/2019 19:24:42'!
withNumber:aNumber expirationDate:aDate name:aName

	^self new createWithNumber:aNumber expirationDate:aDate name:aName.! !


!classDefinition: #Sale category: #TusLibros stamp: 'JCCCT 11/7/2019 16:55:40'!
Object subclass: #Sale
	instanceVariableNames: 'value items user dateOfSale'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'initialization' stamp: 'JCCCT 11/7/2019 16:21:13'!
= aSale 
	^ user = aSale user and:[value = aSale value and: [items = aSale items and:[dateOfSale = aSale dateOfSale]]].
! !

!Sale methodsFor: 'initialization' stamp: 'JCCCT 11/7/2019 16:19:12'!
dateOfSale
	^ dateOfSale.
! !

!Sale methodsFor: 'initialization' stamp: 'JCCCT 11/7/2019 16:13:02'!
initializeFrom: aUser withValue: aValue WithBooks: anAmountOfItems WithDate: aDate
	user := aUser.
	value := aValue.
	items := anAmountOfItems.
	dateOfSale := aDate.! !

!Sale methodsFor: 'initialization' stamp: 'JCCCT 11/7/2019 16:02:33'!
items
	^ items.
! !

!Sale methodsFor: 'initialization' stamp: 'JCCCT 11/7/2019 16:02:18'!
user
	^ user.
! !

!Sale methodsFor: 'initialization' stamp: 'JCCCT 11/7/2019 16:02:25'!
value
	^ value.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros stamp: 'JCCCT 11/7/2019 16:55:40'!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'JCCCT 11/7/2019 16:15:46'!
From: aUser withValue: aValue WithBooks: anAmountOfItems WithDate: aDate
	^ self new initializeFrom: aUser withValue: aValue WithBooks: anAmountOfItems WithDate: aDate
	! !
