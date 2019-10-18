!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 19:20:52'!
test01BalanceEmptyPortfolioIsCero
	
	| portfolio |
	
	portfolio := Portfolio new.

	self assert: 0 equals: portfolio balance .! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 19:32:18'!
test02AddAccountInPortfolioWithNoBalance
	
	| portfolio account|
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	portfolio add: account.
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 19:34:15'!
test03AddAccountInPortfolioWithBalance
	
	| portfolio account|
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio new.
	portfolio add: account.
	self assert: 100 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 19:45:26'!
test04Add2AccountsInPortfolioWithBalance
	
	| portfolio account1 account2|
	account1 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	account2 := ReceptiveAccount new.
	Withdraw register: 50 on: account2.
	portfolio := Portfolio new.
	portfolio add: account1.
	portfolio add: account2.
	self assert: 50 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 20:07:49'!
test05AddAPortfolioInPortfolioWithBalance
	
	| portfolio aPortfolio|
	aPortfolio :=Portfolio new.
	portfolio := Portfolio new.
	portfolio add: aPortfolio.
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 20:10:23'!
test06AddANotEmptyPortfolioWithBalanceInPortfolioWithBalance
	
	| portfolio aPortfolio acount|
	acount := ReceptiveAccount new. 
	Deposit register: 100 on: acount .
	
	aPortfolio :=Portfolio new.
	aPortfolio add: acount .
	portfolio := Portfolio new.
	portfolio add: aPortfolio.
	self assert: 100 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 20:13:27'!
test07AddAPortfolioWithAcountAndAcountToOtherPortfolio
	
	| portfolio aPortfolio acount acount2|
	acount := ReceptiveAccount new. 
	acount2:= ReceptiveAccount  new.
	Deposit register: 100 on: acount .
	Withdraw register: 50 on: acount2.
	aPortfolio :=Portfolio new.
	aPortfolio add: acount .
	portfolio := Portfolio new.
	portfolio add:acount2 .
	portfolio add: aPortfolio.
	self assert: 50 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 20:26:14'!
test08TransactionsOfEmptyPortfolioIsEmpty
	
	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio transactions size .! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 20:20:08'!
test09TransactionsOfPortfolioWithAccountReturnsTransactionOfAcount
	
	| portfolio acount |
	
	acount:= ReceptiveAccount new.
	Deposit register: 100 on: acount .
	portfolio := Portfolio new.
	portfolio add: acount .

	self assert:acount transactions equals: portfolio transactions .! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 20:31:44'!
test10Add2AccountsInPortfolioWithTransactions
	
	| portfolio account1 account2 transactionsToTest|
	account1 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	transactionsToTest := account1 transactions.
	
	account2 := ReceptiveAccount new.
	Withdraw register: 50 on: account2.
	account2 transactions do:[:aTransaction| transactionsToTest add:aTransaction].
	portfolio := Portfolio new.
	portfolio add: account1.
	portfolio add: account2.
	
	self assert: transactionsToTest equals: portfolio transactions .! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 20:32:34'!
test11AddAPortfolioInPortfolioWithTransactions
	
	| portfolio aPortfolio|
	aPortfolio :=Portfolio new.
	portfolio := Portfolio new.
	portfolio add: aPortfolio.
	self assert: aPortfolio transactions equals: portfolio transactions .! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 20:35:33'!
test12AddAccountInPortfolioWithTransactions
	
	| portfolio account|
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio new.
	portfolio add: account.
	self assert: account transactions equals: portfolio transactions .! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 21:33:23'!
test13AddAPortfolioWithAcountAndAcountToOtherPortfolioCheckTransactions
	
	| portfolio aPortfolio acount acount2 aDeposit aWithdraw|
	acount := ReceptiveAccount new. 
	acount2:= ReceptiveAccount  new.
	aDeposit := Deposit register: 100 on: acount .
	aWithdraw := Withdraw register: 50 on: acount2.
	aPortfolio :=Portfolio new.
	aPortfolio add: acount .
	portfolio := Portfolio new.
	portfolio add:acount2 .
	portfolio add: aPortfolio.
	self assert:  portfolio transactions includes: aWithdraw .
	self assert:  portfolio transactions includes: aDeposit.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 21:34:55'!
test14XXXXXTransactionsOfPortfolioWithAccountReturnsTransactionOfAcount
	
	|aDeposit portfolio acount |
	
	acount:= ReceptiveAccount new.
	aDeposit := Deposit register: 100 on: acount .
	portfolio := Portfolio new.
	portfolio add: acount .

	self assert: (portfolio hasRegistered: aDeposit).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 21:49:40'!
test18CantAddTwiceSameAccount
	
	| portfolio account1 |
	account1 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	
	portfolio := Portfolio new.
	portfolio add: account1.
	self should:[
		portfolio add: account1.]
	raise:Error-MessageNotUnderstood
	withExceptionDo:[:anError|
		self assert: Portfolio alreadyAddedXXXErrorDescription = anError messageText ].
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 21:48:16'!
test19CantAddPorfolioToItsSelf
	
	| portfolio|
	
	portfolio := Portfolio new.
	
	self should:[
		portfolio add: portfolio.]
	raise:Error-MessageNotUnderstood
	withExceptionDo:[:anError|
		self assert: Portfolio alreadyAddedXXXErrorDescription = anError messageText ].
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 21:46:46'!
test20CantAddPortfolioWithAccountIfTheAccountIsAlreadyAdded
	
	| portfolio account1 portfolio2 |
	account1 := ReceptiveAccount new.	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio add: account1.
	portfolio2 add: account1.
	self should:[
		portfolio add: portfolio2.]
	raise:Error-MessageNotUnderstood
	withExceptionDo:[:anError|
		self assert: Portfolio alreadyAddedXXXErrorDescription = anError messageText ].
	! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'jj 10/17/2019 19:17:49'!
balanceValue 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'jj 10/17/2019 19:18:43'!
balanceValue

	^ value.! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'jj 10/17/2019 19:19:27'!
balanceValue

	^ value*(-1).! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #XXX category: #'Portfolio-Ejercicio'!
Object subclass: #XXX
	instanceVariableNames: 'parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
XXX subclass: #Portfolio
	instanceVariableNames: 'AccountsAndPortfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 19:41:26'!
accountsAndPortfolios
	^AccountsAndPortfolios ! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 21:55:12'!
add: anAccount 
	(self accountsAndPortfolios includes: anAccount) ifTrue:[ ^self error: self class alreadyAddedXXXErrorDescription ].
	(self==anAccount)ifTrue:[^self error: self class alreadyAddedXXXErrorDescription ].
	(self parents includes: anAccount) ifTrue:[^self error: self class alreadyAddedXXXErrorDescription ].
	self accountsAndPortfolios add: anAccount! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 19:29:08'!
amountOfAccountsAndPortfolios
	^AccountsAndPortfolios size.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 19:42:52'!
balance
	^ self accountsAndPortfolios sum:[:anAccount| anAccount balance ] ifEmpty:[0].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 21:28:04'!
hasRegistered: aTransaction

	^ self transactions includes: aTransaction 
! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 21:40:21'!
initialize
	AccountsAndPortfolios := OrderedCollection new.
	parents:= OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 20:46:13'!
transactions
	|trans|
	trans := OrderedCollection new.
	self accountsAndPortfolios do:[:anAccount | trans addAll: anAccount transactions].
	^trans copy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 21:49:40'!
alreadyAddedXXXErrorDescription
	^'account already in portfolio'! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
XXX subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'jj 10/17/2019 21:40:51'!
initialize

	transactions := OrderedCollection new.
	parents:=OrderedCollection new. ! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'jj 10/17/2019 19:17:34'!
balance
	
	^ transactions sum: [ :aTransaction | aTransaction balanceValue ] ifEmpty: [ 0 ].
	
	! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !
