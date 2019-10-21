!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'test - transactions' stamp: 'JCCT 10/20/2019 23:30:17'!
test08TransactionsOfEmptyPortfolioIsEmpty
	
	| portfolio |
	
	portfolio := PortfolioAccount new.
	
	self assert: 0 equals: portfolio amountsOfTransactions .! !

!PortfolioTest methodsFor: 'test - transactions' stamp: 'JCCT 10/20/2019 23:30:46'!
test09TransactionsOfPortfolioWithAccountReturnsTransactionOfAcount
	
	| portfolio acount |
	
	acount:= ReceptiveAccount new.
	Deposit register: 100 on: acount .
	portfolio := PortfolioAccount new.
	portfolio add: acount .

	self assert: acount transactions equals: portfolio transactions .! !

!PortfolioTest methodsFor: 'test - transactions' stamp: 'JCCT 10/20/2019 23:13:21'!
test10Add2AccountsInPortfolioWithTransactions
	
	| portfolio account1 account2 transactionsToTest|
	account1 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	transactionsToTest := account1 transactions.
	
	account2 := ReceptiveAccount new.
	Withdraw register: 50 on: account2.
	account2 transactions do:[:aTransaction| transactionsToTest add:aTransaction].
	portfolio := PortfolioAccount new.
	portfolio add: account1.
	portfolio add: account2.
	
	self assert: transactionsToTest equals: portfolio transactions .! !

!PortfolioTest methodsFor: 'test - transactions' stamp: 'JCCT 10/20/2019 23:13:22'!
test11AddAPortfolioInPortfolioWithTransactions
	
	| portfolio aPortfolio|
	aPortfolio :=PortfolioAccount new.
	portfolio := PortfolioAccount new.
	portfolio add: aPortfolio.
	self assert: aPortfolio transactions equals: portfolio transactions .! !

!PortfolioTest methodsFor: 'test - transactions' stamp: 'JCCT 10/20/2019 23:13:21'!
test12AddAccountInPortfolioWithTransactions
	
	| portfolio account|
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := PortfolioAccount new.
	portfolio add: account.
	self assert: account transactions equals: portfolio transactions .! !

!PortfolioTest methodsFor: 'test - transactions' stamp: 'JCCT 10/20/2019 23:13:21'!
test13AddAPortfolioWithAcountAndAcountToOtherPortfolioCheckTransactions
	
	| portfolio aPortfolio acount acount2 aDeposit aWithdraw|
	acount := ReceptiveAccount new. 
	acount2:= ReceptiveAccount  new.
	aDeposit := Deposit register: 100 on: acount .
	aWithdraw := Withdraw register: 50 on: acount2.
	aPortfolio :=PortfolioAccount new.
	aPortfolio add: acount .
	portfolio := PortfolioAccount new.
	portfolio add:acount2 .
	portfolio add: aPortfolio.
	self assert:  portfolio transactions includes: aWithdraw .
	self assert:  portfolio transactions includes: aDeposit.! !


!PortfolioTest methodsFor: 'test - registered transactions' stamp: 'JCCT 10/20/2019 23:13:21'!
test14TransactionsOfPortfolioWithAccountIsRegistered
	
	|aDeposit portfolio acount |
	
	acount:= ReceptiveAccount new.
	aDeposit := Deposit register: 100 on: acount .
	portfolio := PortfolioAccount new.
	portfolio add: acount .

	self assert: (portfolio hasRegistered: aDeposit).! !

!PortfolioTest methodsFor: 'test - registered transactions' stamp: 'JCCT 10/20/2019 23:13:21'!
test15TransactionsOfDifferentAccountsInPortfolioAreRegistered
	
		| portfolio account1 account2 aDeposit aWithdraw |
	account1 := ReceptiveAccount new.
	aDeposit := Deposit register: 100 on: account1.
	
	account2 := ReceptiveAccount new.
	aWithdraw := Withdraw register: 50 on: account2.
	
	portfolio := PortfolioAccount new.
	portfolio add: account1.
	portfolio add: account2.
	
	self assert: (portfolio hasRegistered: aDeposit).
	self assert: (portfolio hasRegistered: aWithdraw).! !

!PortfolioTest methodsFor: 'test - registered transactions' stamp: 'JCCT 10/20/2019 23:13:21'!
test16AddAPortfolioWithAcountAndAcountToOtherPortfolioCheckIfTransactionsAreRegistered
	
	| portfolio aPortfolio acount acount2 aDeposit aWithdraw|
	acount := ReceptiveAccount new. 
	acount2:= ReceptiveAccount  new.
	aDeposit := Deposit register: 100 on: acount .
	aWithdraw := Withdraw register: 50 on: acount2.
	aPortfolio :=PortfolioAccount new.
	aPortfolio add: acount .
	portfolio := PortfolioAccount new.
	portfolio add:acount2 .
	portfolio add: aPortfolio.
	self assert:  (portfolio hasRegistered: aWithdraw) .
	self assert:  (portfolio hasRegistered: aDeposit).! !

!PortfolioTest methodsFor: 'test - registered transactions' stamp: 'JCCT 10/20/2019 23:13:21'!
test17AddTransactionsOnAccountOnAThreePortfolioDeepListCheckIfRegistered
	
	|aPortfolio3 aPortfolio2 aPortfolio1 acount aDeposit aWithdraw|
	acount := ReceptiveAccount new. 
	acount:= ReceptiveAccount  new.
	aDeposit := Deposit register: 100 on: acount .
	aWithdraw := Withdraw register: 50 on: acount.
	aPortfolio1 :=PortfolioAccount new.
	aPortfolio1 add: acount .
	
	aPortfolio2 := PortfolioAccount new.
	aPortfolio2 add: aPortfolio1.
	aPortfolio3 := PortfolioAccount new.
	aPortfolio3 add: aPortfolio2.
	
	self assert:  (aPortfolio3 hasRegistered: aWithdraw) .
	self assert:  (aPortfolio3 hasRegistered: aDeposit).! !


!PortfolioTest methodsFor: 'test - invalid portfolios' stamp: 'JCCT 10/20/2019 23:13:21'!
test18CantAddTwiceSameAccount
	
	| portfolio account1 |
	account1 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	
	portfolio := PortfolioAccount new.
	portfolio add: account1.
	self should:[
		portfolio add: account1.]
	raise:Error-MessageNotUnderstood
	withExceptionDo:[:anError|
		self assert: PortfolioAccount alreadyAddedXXXErrorDescription = anError messageText ].
	! !

!PortfolioTest methodsFor: 'test - invalid portfolios' stamp: 'JCCT 10/20/2019 23:13:21'!
test19CantAddPorfolioToItSelf
	
	| portfolio|
	
	portfolio := PortfolioAccount new.
	
	self should:[
		portfolio add: portfolio.]
	raise:Error-MessageNotUnderstood
	withExceptionDo:[:anError|
		self assert: PortfolioAccount alreadyAddedXXXErrorDescription = anError messageText ].
	! !

!PortfolioTest methodsFor: 'test - invalid portfolios' stamp: 'JCCT 10/20/2019 23:13:21'!
test20CantAddPortfolioWithAccountIfTheAccountIsAlreadyAdded
	
	| portfolio account1 portfolio2 |
	account1 := ReceptiveAccount new.	
	portfolio := PortfolioAccount new.
	portfolio2 := PortfolioAccount new.
	portfolio add: account1.
	portfolio2 add: account1.
	self should:[
		portfolio add: portfolio2.]
	raise:Error-MessageNotUnderstood
	withExceptionDo:[:anError|
		self assert: PortfolioAccount alreadyAddedXXXErrorDescription = anError messageText ].
	! !

!PortfolioTest methodsFor: 'test - invalid portfolios' stamp: 'JCCT 10/20/2019 23:13:21'!
test21CantAddAccountToPortfolioToAPortfolioThatIsIncludedInAPortfolioWithThatAccount
	
	| portfolio account1 portfolio2 |
	account1 := ReceptiveAccount new.	
	portfolio := PortfolioAccount new.
	portfolio2 := PortfolioAccount new.
	portfolio add: account1.
	portfolio add: portfolio2.

	self should:[
		portfolio2 add: account1.]
	raise:Error-MessageNotUnderstood
	withExceptionDo:[:anError|
		self assert: PortfolioAccount alreadyAddedXXXErrorDescription = anError messageText ].
	! !

!PortfolioTest methodsFor: 'test - invalid portfolios' stamp: 'JCCT 10/20/2019 23:13:21'!
test22PortfolioWithAccountCantAddToOneOfItsPortfoliosANOtherOneWithThatAccount
	
	| portfolio account1 portfolio2 portfolio3|
	account1 := ReceptiveAccount new.	
	portfolio := PortfolioAccount new.
	portfolio2 := PortfolioAccount new.
	portfolio3:=PortfolioAccount new.
	portfolio add: account1.
	portfolio2 add: portfolio3.
	portfolio2 add: account1.

	self should:[
		portfolio3 add: portfolio.]
	raise:Error-MessageNotUnderstood
	withExceptionDo:[:anError|
		self assert: PortfolioAccount alreadyAddedXXXErrorDescription = anError messageText ].
	! !

!PortfolioTest methodsFor: 'test - invalid portfolios' stamp: 'JCCT 10/20/2019 23:13:21'!
test23TwoPortfoliosThatShareAnAccountAndAthirPortolioShouldFailWhenAccountIsAddedToSharedPortfolio
	
	| portfolio account1 portfolio2 portfolio3|
	account1 := ReceptiveAccount new.	
	portfolio := PortfolioAccount new.
	portfolio2 := PortfolioAccount new.
	portfolio3:=PortfolioAccount new.
	portfolio add: account1.
	portfolio add: portfolio2.
	portfolio3 add: account1.
	portfolio3 add: portfolio2.

	self should:[
		portfolio2 add: account1.]
	raise:Error-MessageNotUnderstood
	withExceptionDo:[:anError|
		self assert: PortfolioAccount alreadyAddedXXXErrorDescription = anError messageText ].
	! !

!PortfolioTest methodsFor: 'test - invalid portfolios' stamp: 'JCCT 10/20/2019 23:13:22'!
test24MultiplePortfolioChainWithOneAccountAtTheStartWontAdmitTheAccount
	
	| portfolio account1 portfolio2 portfolio3 portfolio4 portfolio5|
	account1 := ReceptiveAccount new.	
	portfolio := PortfolioAccount new.
	portfolio2 := PortfolioAccount new.
	portfolio3:=PortfolioAccount new.
	portfolio4:=PortfolioAccount new.
	portfolio5:=PortfolioAccount new.
	portfolio add:account1.
	portfolio2 add: account1.
	portfolio3 add:account1.
	portfolio4 add:portfolio.
	portfolio5 add:portfolio4.

	self should:[
		portfolio5 add: account1.]
	raise:Error-MessageNotUnderstood
	withExceptionDo:[:anError|
		self assert: PortfolioAccount alreadyAddedXXXErrorDescription = anError messageText ].
	! !

!PortfolioTest methodsFor: 'test - invalid portfolios' stamp: 'JCCT 10/20/2019 23:24:24'!
test25CantAddAnAccountToAPortfolioIfItIsLinkedToOtherPortfoliosWithSameAccount
	
	| portfolio account1 portfolio2 portfolio3|
	account1 := ReceptiveAccount new.	
	portfolio := PortfolioAccount new.
	portfolio2 := PortfolioAccount new.
	portfolio3:=PortfolioAccount new.
	portfolio add:account1.
	portfolio add: portfolio2.
	portfolio3 add:account1.
	portfolio3 add:portfolio2.
	self should:[
		portfolio2 add: account1.]
	raise:Error-MessageNotUnderstood
	withExceptionDo:[:anError|
		self assert: PortfolioAccount alreadyAddedXXXErrorDescription = anError messageText ].
	! !


!PortfolioTest methodsFor: 'test - balance' stamp: 'JCCT 10/20/2019 23:13:21'!
test01BalanceEmptyPortfolioIsCero
	
	| portfolio |
	
	portfolio := PortfolioAccount new.

	self assert: 0 equals: portfolio balance .! !

!PortfolioTest methodsFor: 'test - balance' stamp: 'JCCT 10/20/2019 23:13:22'!
test02AddAccountInPortfolioWithNoBalance
	
	| portfolio account|
	account := ReceptiveAccount new.
	portfolio := PortfolioAccount new.
	portfolio add: account.
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'test - balance' stamp: 'JCCT 10/20/2019 23:13:21'!
test03AddAccountInPortfolioWithBalance
	
	| portfolio account|
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := PortfolioAccount new.
	portfolio add: account.
	self assert: 100 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'test - balance' stamp: 'JCCT 10/20/2019 23:13:21'!
test04Add2AccountsInPortfolioWithBalance
	
	| portfolio account1 account2|
	account1 := ReceptiveAccount new.
	Deposit register: 100 on: account1.
	account2 := ReceptiveAccount new.
	Withdraw register: 50 on: account2.
	portfolio := PortfolioAccount new.
	portfolio add: account1.
	portfolio add: account2.
	self assert: 50 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'test - balance' stamp: 'JCCT 10/20/2019 23:13:21'!
test05AddAPortfolioInPortfolioWithBalance
	
	| portfolio aPortfolio|
	aPortfolio :=PortfolioAccount new.
	portfolio := PortfolioAccount new.
	portfolio add: aPortfolio.
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'test - balance' stamp: 'JCCT 10/20/2019 23:13:21'!
test06AddANotEmptyPortfolioWithBalanceInPortfolioWithBalance
	
	| portfolio aPortfolio acount|
	acount := ReceptiveAccount new. 
	Deposit register: 100 on: acount .
	
	aPortfolio :=PortfolioAccount new.
	aPortfolio add: acount .
	portfolio := PortfolioAccount new.
	portfolio add: aPortfolio.
	self assert: 100 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'test - balance' stamp: 'JCCT 10/20/2019 23:13:21'!
test07AddAPortfolioWithAcountAndAcountToOtherPortfolio
	
	| portfolio aPortfolio acount acount2|
	acount := ReceptiveAccount new. 
	acount2:= ReceptiveAccount  new.
	Deposit register: 100 on: acount .
	Withdraw register: 50 on: acount2.
	aPortfolio :=PortfolioAccount new.
	aPortfolio add: acount .
	portfolio := PortfolioAccount new.
	portfolio add:acount2 .
	portfolio add: aPortfolio.
	self assert: 50 equals: portfolio balance.! !


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


!classDefinition: #Account category: #'Portfolio-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: 'parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Account methodsFor: 'as yet unclassified' stamp: 'jj 10/20/2019 17:11:39'!
addParent: aPortfolio 
	self subclassResponsibility .! !

!Account methodsFor: 'as yet unclassified' stamp: 'JCCT 10/20/2019 11:35:49'!
hasOneParentInCommon: aPortfolio
	
	self subclassResponsibility .! !

!Account methodsFor: 'as yet unclassified' stamp: 'JCCT 10/20/2019 10:43:52'!
parents

	^parents.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: #'Portfolio-Ejercicio'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'as yet unclassified' stamp: 'jj 10/20/2019 16:56:19'!
alreadyAddedXXXErrorDescription
	^'account already in portfolio'! !


!classDefinition: #PortfolioAccount category: #'Portfolio-Ejercicio'!
Account subclass: #PortfolioAccount
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioAccount methodsFor: 'initialization' stamp: 'JCCT 10/20/2019 23:15:34'!
initialize
	accounts := OrderedCollection new.
	parents:= OrderedCollection new.
	parents add: self.! !


!PortfolioAccount methodsFor: 'testing' stamp: 'jj 10/17/2019 21:28:04'!
hasRegistered: aTransaction

	^ self transactions includes: aTransaction 
! !


!PortfolioAccount methodsFor: 'balance' stamp: 'JCCT 10/20/2019 23:15:27'!
balance
	^ self accounts sum:[:anAccount| anAccount balance ] ifEmpty:[0].! !


!PortfolioAccount methodsFor: 'accounts' stamp: 'JCCT 10/20/2019 23:15:34'!
accounts
	^accounts ! !

!PortfolioAccount methodsFor: 'accounts' stamp: 'JCCT 10/20/2019 23:16:26'!
amountOfAccounts
	^accounts size.! !


!PortfolioAccount methodsFor: 'account addition' stamp: 'JCCT 10/20/2019 23:18:59'!
add: anAccount
	
 	"si tiene un padre en comun no se puede agregar"	 
	(anAccount hasOneParentInCommon: self) ifTrue:[^self error: self class alreadyAddedXXXErrorDescription ].
	anAccount addParent: self.
	"si soy mi propio padre, osea nadie me agrego, actualizo mi padre"
	(anAccount parents includes:anAccount) ifTrue:[anAccount parents remove:anAccount].
	self accounts add: anAccount! !


!PortfolioAccount methodsFor: 'private - account addition' stamp: 'JCCT 10/20/2019 23:15:27'!
addParent: aPortfolio 
	self parents add: aPortfolio.
	self accounts do:[:acc| acc addParent:aPortfolio].! !

!PortfolioAccount methodsFor: 'private - account addition' stamp: 'JCCT 10/20/2019 23:15:27'!
hasOneParentInCommon: aPortfolio

	self parents do:[:aParent | (aPortfolio parents includes: aParent) ifTrue:[^true]].
	self accounts do: [:anAccount | (anAccount hasOneParentInCommon: aPortfolio) ifTrue:[^true]].
	^false.! !


!PortfolioAccount methodsFor: 'transactions' stamp: 'JCCT 10/20/2019 23:29:43'!
amountsOfTransactions
	^ self transactions size.! !

!PortfolioAccount methodsFor: 'transactions' stamp: 'JCCT 10/20/2019 23:15:27'!
transactions
	|trans|
	trans := OrderedCollection new.
	self accounts do:[:anAccount | trans addAll: anAccount transactions].
	^trans copy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioAccount class' category: #'Portfolio-Ejercicio'!
PortfolioAccount class
	instanceVariableNames: ''!

!PortfolioAccount class methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 21:49:40'!
alreadyAddedXXXErrorDescription
	^'account already in portfolio'! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'jj 10/20/2019 17:11:08'!
addParent: aPortfolio 
	self parents add: aPortfolio! !

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


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'JCCT 10/20/2019 11:34:53'!
hasOneParentInCommon: aPortfolio

	self parents do:[:aParent | (aPortfolio parents includes: aParent) ifTrue:[^true]].
	^false.! !


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
