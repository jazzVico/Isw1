!classDefinition: #PortfolioTest category: #'Portfolio-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

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


!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:17:51'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:15'!
test08PortfolioTransasctionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

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


!classDefinition: #ReportTest category: #'Portfolio-Solucion'!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReportTest methodsFor: 'as yet unclassified' stamp: 'JAV 10/25/2019 17:37:28'!
test01AccountSummaryForAccountWithoutTransactions

	|account accountSummary res|
	
	account:=ReceptiveAccount new.
	accountSummary:= AccountSummary new initializeFor:account.
	
	res:=OrderedCollection new.
	res add: 'Balance = 0.'.
	self assert: (accountSummary value = res ).! !

!ReportTest methodsFor: 'as yet unclassified' stamp: 'JAV 10/25/2019 17:37:22'!
test02AccountSummaryForAccountWithDeposit

	|account accountSummary resToAssert|
	
	account:=ReceptiveAccount new.
	Deposit register:100 on:account.
	accountSummary:= AccountSummary new initializeFor:account.
	
	resToAssert:=OrderedCollection new.
	resToAssert add:'Depósito por 100.'.
	resToAssert add:'Balance = 100.'.
	self assert: accountSummary value = resToAssert.! !

!ReportTest methodsFor: 'as yet unclassified' stamp: 'JAV 10/24/2019 21:04:46'!
test03AccountSummaryForAccountWithTransaction

	|account1 account2 accountSummary res|
	
	account1:=ReceptiveAccount new.
	account2:=ReceptiveAccount new.
	Deposit register:10 on:account2.
	Deposit register:100 on:account1.
	Withdraw  register: 50 on:account1.
	Transfer register: 20 from:account1  to: account2.
	Transfer register: 30 from: account2 to: account1.
	
	accountSummary:= AccountSummary new initializeFor:account1.
	res:=OrderedCollection  new.
	res add: 'Depósito por 100.'.
	res add: 'Extracción por 50.'.
	res add: 'Salida por transferencia de 20.'.
	res add: 'Entrada por transferencia de 30.'.
	res add: 'Balance = 60.'.
	self assert: accountSummary value = res.
		
		
		
		
		! !

!ReportTest methodsFor: 'as yet unclassified' stamp: 'JAV 10/26/2019 17:07:32'!
test04AccountSummaryForEmptyPortfolio

	|portfolio accountSummary res|
	
	portfolio :=Portfolio new.
	accountSummary:= AccountSummary new initializeFor:portfolio .
	
	res:=OrderedCollection new.
	res add: 'Balance = 0.'.
	self assert: (accountSummary value = res ).! !

!ReportTest methodsFor: 'as yet unclassified' stamp: 'JAV 10/26/2019 17:48:37'!
test05AccountSummaryForPortfolioWithAccountsWithTransactions

	|account1 account2 account3 portfolio accountSummary res|
	
	account1:=ReceptiveAccount new.
	account2:=ReceptiveAccount new.
	account3:=ReceptiveAccount new.		
	Deposit register:200 on:account2.
	Deposit register:100 on:account1.
	Withdraw  register: 50 on:account1.
	Transfer register: 20 from:account1  to: account2.
	Transfer register: 30 from: account2 to: account1.
	Transfer register: 100 from:account2  to:account3.
	portfolio :=Portfolio  new.
	portfolio add:account1 .
	portfolio  add:account2 .
	
	accountSummary:= AccountSummary new initializeFor:portfolio.
	res:=OrderedCollection  new.
	res add: 'Depósito por 100.'.
	res add: 'Extracción por 50.'.
	res add: 'Salida por transferencia de 20.'.
	res add: 'Entrada por transferencia de 30.'.
	res add: 'Depósito por 200.'.
	res add: 'Entrada por transferencia de 20.'.
	res add:'Salida por transferencia de 30.'.
	res add:'Salida por transferencia de 100.'.
	res add: 'Balance = 150.'.	
	self assert: accountSummary value = res.
		
		
		
		
		! !

!ReportTest methodsFor: 'as yet unclassified' stamp: 'JAV 10/26/2019 17:52:56'!
test06AccountSummaryForPortfolioWithAccountsAndPortfoliosWithTransactions

	|account1 account2 account3 portfolio portfolio2 accountSummary res|
	
	account1:=ReceptiveAccount new.
	account2:=ReceptiveAccount new.
	account3:=ReceptiveAccount new.		
	Deposit register:200 on:account2.
	Deposit register:100 on:account1.
	Withdraw  register: 50 on:account1.
	Transfer register: 20 from:account1  to: account2.
	Transfer register: 30 from: account2 to: account1.
	Transfer register: 100 from:account2  to:account3.
	Deposit register: 100 on: account3 .
	portfolio :=Portfolio  new.
	portfolio2 :=Portfolio new.
	portfolio add:account1 .
	portfolio  add:account2 .
	portfolio2 add:account3.
	portfolio add:portfolio2 .
	accountSummary:= AccountSummary new initializeFor:portfolio.
	res:=OrderedCollection  new.
	res add: 'Depósito por 100.'.
	res add: 'Extracción por 50.'.
	res add: 'Salida por transferencia de 20.'.
	res add: 'Entrada por transferencia de 30.'.
	res add: 'Depósito por 200.'.
	res add: 'Entrada por transferencia de 20.'.
	res add:'Salida por transferencia de 30.'.
	res add:'Salida por transferencia de 100.'.
	res add: 'Entrada por transferencia de 100.'.
	res add: 'Depósito por 100.'.
	res add: 'Balance = 350.'.	
	self assert: accountSummary value = res.
		
		
		
		
		! !

!ReportTest methodsFor: 'as yet unclassified' stamp: 'JAV 10/26/2019 19:06:07'!
test07TransferNetForAccountWithoutTransactions

	|account transferNet |
	
	account:=ReceptiveAccount new.
	transferNet:= TransferNet new initializeFor:account.
	
	self assert: (transferNet value = '0' ).! !

!ReportTest methodsFor: 'as yet unclassified' stamp: 'JAV 10/26/2019 19:06:51'!
test08TransferNetForAccountWithTransferDeposit

	|account1 account2 transferNet |
	
	account1:=ReceptiveAccount new.
	account2:=ReceptiveAccount new.
	Deposit register:100 on:account2.
	Transfer register: 50 from: account2  to: account1 .
	
	transferNet:= TransferNet new initializeFor:account1.

	self assert: transferNet value = '50'.! !

!ReportTest methodsFor: 'as yet unclassified' stamp: 'JAV 10/26/2019 19:22:46'!
test09TransferNetForAccountWithTransfers

	|account1 account2 transferNet |
	
	account1:=ReceptiveAccount new.
	account2:=ReceptiveAccount new.
	Deposit register:100 on:account2.
	Transfer register: 50 from: account2  to: account1 .
	Transfer register:20 from: account1 to: account2.
	
	transferNet:= TransferNet new initializeFor:account2.

	self assert: transferNet value = '-30'.! !

!ReportTest methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 19:37:31'!
test10TransferNetForPortfolio

	|account1 account2 account3 transferNet portfolio1 portfolio2 |
	
	account1:=ReceptiveAccount new.
	account2:=ReceptiveAccount new.
	account3:=ReceptiveAccount new.
	Deposit register:100 on:account2.
	Deposit register:300 on: account3.
	Transfer register: 50 from: account2  to: account1 .
	Transfer register:20 from: account1 to: account2.
	Transfer register: 200 from:account3 to: account1.
	Transfer register:50 from:account2 to:account3.
	
	portfolio1:=Portfolio  new.
	portfolio2 :=Portfolio new.
	portfolio1 add:account2.
	portfolio2 add: account1.
	portfolio1 add:portfolio2.
		
	transferNet:= TransferNet new initializeFor:portfolio1.

	self assert: transferNet value = '150'.! !

!ReportTest methodsFor: 'as yet unclassified' stamp: 'JAV 10/28/2019 01:57:19'!
test11TreeStructureOfEmptyPortfolio
|portfolio treeStructure res|
	
	portfolio:=Portfolio new initializeWithName:'empty portfolio'.
	treeStructure:= TreeStructure new initializeFor:portfolio .
	
	
	res := 'empty portfolio',String newLineString .
	self assert: (treeStructure value = res ).! !

!ReportTest methodsFor: 'as yet unclassified' stamp: 'JAV 10/28/2019 01:54:41'!
test12TreeStructureOfPortfolioWithAccount
|portfolio account treeStructure res|
	
	portfolio:=Portfolio new initializeWithName:'Portfolio de juan'.
	account:=ReceptiveAccount new initializeWithName: 'cuenta de juan'.
	treeStructure:= TreeStructure new initializeFor:portfolio .
	portfolio add: account.
	
	res :='Portfolio de juan', String newLineString .	
	res:=res,'cuenta de juan', String newLineString .
	
	self assert: (treeStructure value = res ).! !

!ReportTest methodsFor: 'as yet unclassified' stamp: 'JAV 10/28/2019 02:31:11'!
test13TreeStructureOfPortfolioWithPortfolio
|portfolio portfolio2 account  account2 account3 treeStructure res|
	
	portfolio:=Portfolio new initializeWithName:'Portfolio de juan'.
	portfolio2:=Portfolio new initializeWithName: 'Portfolio de pepa'.
	account:=ReceptiveAccount new initializeWithName: 'cuenta de juan'.
	account2 :=ReceptiveAccount new initializeWithName: 'cuenta de pepa'.
	account3:=ReceptiveAccount new initializeWithName: 'cuenta de juan2'.	
	treeStructure:= TreeStructure new initializeFor:portfolio .
	portfolio add: account.
	portfolio add:account3.
	portfolio2 add: account2.
	portfolio add: portfolio2 .
		
	res :='Portfolio de juan', String newLineString .	
	res:=res,'cuenta de juan', String newLineString .
	res:=res,'cuenta de juan2', String newLineString .
	res:=res,'Portfolio de pepa', String newLineString .
	res:=res,'cuenta de pepa', String newLineString .
		
	self assert: (treeStructure value = res ).! !


!classDefinition: #TransferTest category: #'Portfolio-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'JAV 10/21/2019 20:52:24'!
test01TransferRegisteredCorrectlyInBothAccounts

| account1 account2 transfer |

account1:=ReceptiveAccount new.
account2:= ReceptiveAccount new.
Deposit register: 50  on:account1.
transfer:=Transfer register:50 from:account1 to:account2. 

self assert: account1 balance =0.
self assert: account2 balance =50.
self assert: (account1 hasRegistered: transfer transferWithdraw).
self assert: (account2 hasRegistered: transfer transferDeposit).
 
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'JAV 10/26/2019 20:49:58'!
test02CantTransferFromAccountIfTheBalanceIsNotEnough

	|account1 account2|
	account1:=ReceptiveAccount new.
	account2 :=ReceptiveAccount new.
	
	self should:[	
	Transfer register: 50 from: account1  to: account2 .]
	raise:Error-MessageNotUnderstood 
	withExceptionDo:[:anError|
		self assert: Transfer thereIsNotThatAmountOfMoneyInTheAccountErrorDescription = anError messageText ].
! !


!classDefinition: #Account category: #'Portfolio-Solucion'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Account methodsFor: 'as yet unclassified' stamp: 'JAV 10/28/2019 00:06:58'!
accountName

	^name .! !

!Account methodsFor: 'as yet unclassified' stamp: 'jj 10/20/2019 17:11:39'!
addParent: aPortfolio 
	self subclassResponsibility .! !

!Account methodsFor: 'as yet unclassified' stamp: 'JCCT 10/20/2019 11:35:49'!
hasOneParentInCommon: aPortfolio
	
	self subclassResponsibility .! !

!Account methodsFor: 'as yet unclassified' stamp: 'JCCT 10/20/2019 10:43:52'!
parents

	^parents.! !


!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'JAV 10/27/2019 13:53:26'!
doWithTransactions:aReport
	self transactions do:[:t| t acknowledgeReportOfSelf:aReport].! !

!Account methodsFor: 'transactions' stamp: 'JAV 10/27/2019 19:22:07'!
initializeWithName:aName
	name:=aName.
	! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: #'Portfolio-Solucion'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'as yet unclassified' stamp: 'JAV 10/26/2019 20:46:09'!
alreadyAddedAccountErrorDescription
	^'account already in portfolio'! !

!Account class methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 19:23:10'!
named:aName
	self new initializeWithName: aName.! !


!classDefinition: #Portfolio category: #'Portfolio-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'JAV 10/28/2019 00:03:59'!
doWithAccounts:aReport
	self accounts do:[:a| a acknowledgeReportOfSelf:aReport].! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'JAV 10/27/2019 19:28:52'!
initialize
	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'JAV 10/27/2019 19:24:24'!
initializeWithName:aName
	super initializeWithName: aName.
	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'JAV 10/28/2019 00:03:28'!
accounts
	^accounts copy.! !

!Portfolio methodsFor: 'transactions' stamp: 'JAV 10/28/2019 02:15:18'!
acknowledgeReportOfSelf:aReport
	aReport addPortfolioToReport: self.! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'jj 10/20/2019 17:11:08'!
addParent: aPortfolio 
	self parents add: aPortfolio! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'JAV 10/27/2019 19:29:07'!
initialize
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'JAV 10/27/2019 19:25:24'!
initializeWithName:aName

	super initializeWithName: aName.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'JAV 10/28/2019 00:24:42'!
acknowledgeReportOfSelf:aReport
	aReport addAccountToReport: self.! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'JCCT 10/20/2019 11:34:53'!
hasOneParentInCommon: aPortfolio

	self parents do:[:aParent | (aPortfolio parents includes: aParent) ifTrue:[^true]].
	^false.! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!classDefinition: #AccountTransaction category: #'Portfolio-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'JAV 10/27/2019 13:53:51'!
acknowledgeReportOfSelf:aReport
	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'jj 10/17/2019 19:17:49'!
balanceValue 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'balance' stamp: 'JAV 10/24/2019 21:01:38'!
consultTransactionAndValue

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Solucion'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'JAV 10/27/2019 13:52:36'!
acknowledgeReportOfSelf:aReport
	aReport addDepositToReport:self.! !

!Deposit methodsFor: 'value' stamp: 'jj 10/17/2019 19:18:43'!
balanceValue

	^ value.! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: #'Portfolio-Solucion'!
AccountTransaction subclass: #Transfer
	instanceVariableNames: 'value transferDeposit transferWithdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Transfer methodsFor: 'as yet unclassified' stamp: 'JAV 10/21/2019 20:28:22'!
affectBalance: aBalance
	 ^self subclassResponsibility.
	! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'JAV 10/21/2019 20:30:41'!
balanceValue
	^self  subclassResponsibility.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'JAV 10/21/2019 20:23:20'!
for: aValue from: account1 to: account2
		value:=aValue.
		transferDeposit:= TransferDeposit new withParent:self from:account1.
		transferWithdraw:= TransferWithdraw new withParent:self to:account2.
	! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'JAV 10/21/2019 20:44:38'!
transferDeposit
	^transferDeposit.! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'JAV 10/21/2019 20:44:21'!
transferWithdraw
	^transferWithdraw .! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'JAV 10/21/2019 20:29:41'!
value
	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'Portfolio-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'initialization' stamp: 'JAV 10/26/2019 21:00:04'!
register: value from: account1 to: account2 


	| transaction |
	(value> account1 balance) ifTrue:[self error: Transfer thereIsNotThatAmountOfMoneyInTheAccountErrorDescription ].
	transaction := self new for: value from:account1 to:account2.
	
	account1 register: transaction transferWithdraw.
	account2 register:transaction transferDeposit.
		
	^ transaction! !

!Transfer class methodsFor: 'initialization' stamp: 'JAV 10/26/2019 20:49:00'!
thereIsNotThatAmountOfMoneyInTheAccountErrorDescription
	^'There is not Enought money to transfer.'! !



!classDefinition: #TransferDeposit category: #'Portfolio-Solucion'!
Transfer subclass: #TransferDeposit
	instanceVariableNames: 'parentTransfer account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 13:54:37'!
acknowledgeReportOfSelf:aReport
	aReport addTransferDepositToReport:self.! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'JAV 10/21/2019 20:27:15'!
affectBalance: aBalance
	 ^aBalance+parentTransfer value.
	! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'JAV 10/21/2019 20:32:37'!
balanceValue
	^parentTransfer  value.! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 14:10:32'!
value
	^parentTransfer value.! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'JAV 10/21/2019 20:48:44'!
withParent:parent from: anAccount
	
	parentTransfer:= parent.
	account:=anAccount. 
	^self. ! !


!classDefinition: #TransferWithdraw category: #'Portfolio-Solucion'!
Transfer subclass: #TransferWithdraw
	instanceVariableNames: 'parentTransfer account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 13:55:06'!
acknowledgeReportOfSelf:aReport
	aReport addTransferWithdrawToReport:self.! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'JAV 10/21/2019 20:27:40'!
affectBalance: aBalance
	 ^aBalance-parentTransfer value.
	! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'JAV 10/21/2019 20:34:12'!
balanceValue
	^(-1)*parentTransfer value.! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 14:10:55'!
value
	^parentTransfer value.! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'JAV 10/21/2019 20:24:20'!
withParent:parent to:anAccount

	parentTransfer:=parent.
	account:=anAccount.
	^self. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: #'Portfolio-Solucion'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'JAV 10/24/2019 20:34:48'!
for: aSmallInteger 
	self shouldBeImplemented.! !


!classDefinition: #Withdraw category: #'Portfolio-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'JAV 10/27/2019 13:55:26'!
acknowledgeReportOfSelf:aReport
	aReport addWithdrawToReport: self.! !

!Withdraw methodsFor: 'value' stamp: 'jj 10/17/2019 19:19:27'!
balanceValue

	^ value*(-1).! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Report category: #'Portfolio-Solucion'!
Object subclass: #Report
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!Report methodsFor: 'nil' stamp: 'JAV 10/27/2019 13:26:56'!
addDepositToReport:aDeposit
	^self subclassResponsibility ! !


!Report methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 13:27:39'!
addTransferDepositToReport:aTransferDeposit
	^self subclassResponsibility ! !

!Report methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 13:27:27'!
addTransferWithdrawToReport:aTransferWithdraw
	^self subclassResponsibility ! !

!Report methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 13:27:49'!
addWithdrawToReport:aWithdraw
	^self subclassResponsibility ! !

!Report methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 19:33:28'!
value
	^self subclassResponsibility ! !


!classDefinition: #AccountSummary category: #'Portfolio-Solucion'!
Report subclass: #AccountSummary
	instanceVariableNames: 'account report'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 13:25:36'!
addDepositToReport: aDeposit
	report add: 'Depósito por ',(aDeposit value)asString,'.'! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 14:02:48'!
addTransferDepositToReport: aTransferDeposit
	report add: 'Entrada por transferencia de ',(aTransferDeposit value)asString,'.'! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 13:25:42'!
addTransferWithdrawToReport: aTransferWithdraw
	report add: 'Salida por transferencia de ',(aTransferWithdraw value)asString,'.'! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 14:03:13'!
addWithdrawToReport: aTransferWithdraw
	report add: 'Extracción por ',(aTransferWithdraw value)asString,'.'! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 13:36:38'!
initializeFor: anAccount
	account:=anAccount.
	report:= OrderedCollection  new.! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 13:39:14'!
value		
	account doWithTransactions:self.	
	report add: 'Balance = ', (account  balance)printString,'.' .
	^report.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: #'Portfolio-Solucion'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'as yet unclassified' stamp: 'JAV 10/23/2019 20:08:03'!
for:account
	^ self new initializeFor:account.! !

!AccountSummary class methodsFor: 'as yet unclassified' stamp: 'JAV 10/23/2019 20:15:16'!
initializeFor: account 
	| report |
	report:='Balance=0'! !


!classDefinition: #TransferNet category: #'Portfolio-Solucion'!
Report subclass: #TransferNet
	instanceVariableNames: 'account report'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TransferNet methodsFor: 'nil' stamp: 'JAV 10/27/2019 13:34:59'!
initializeFor: anAccount
	account:=anAccount.
	report:=0.! !


!TransferNet methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 13:29:46'!
addDepositToReport:aDeposit! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 13:33:51'!
addTransferDepositToReport:aTransferDeposit
	report:=aTransferDeposit affectBalance: report.! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 13:34:22'!
addTransferWithdrawToReport:aTransferWithdraw
	report:=aTransferWithdraw affectBalance: report.! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 13:34:41'!
addWithdrawToReport:aWithdraw! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'JAV 10/27/2019 13:35:32'!
value		
	account doWithTransactions: self.
	^report asString .! !


!classDefinition: #TreeStructure category: #'Portfolio-Solucion'!
Report subclass: #TreeStructure
	instanceVariableNames: 'portfolio report'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Solucion'!

!TreeStructure methodsFor: 'as yet unclassified' stamp: 'JAV 10/28/2019 01:34:05'!
addAccountToReport:anAccount
	
	report:=report,(anAccount accountName),String newLineString  .
	! !

!TreeStructure methodsFor: 'as yet unclassified' stamp: 'JAV 10/28/2019 02:24:40'!
addPortfolioToReport:aPortfolio
	
	report:=report,(aPortfolio accountName),String newLineString,'   '.
	aPortfolio doWithAccounts: self.! !

!TreeStructure methodsFor: 'as yet unclassified' stamp: 'JAV 10/28/2019 02:22:33'!
initializeFor: aPortfolio
	portfolio:=aPortfolio.
	report:= aPortfolio accountName, String newLineString.! !

!TreeStructure methodsFor: 'as yet unclassified' stamp: 'JAV 10/28/2019 02:15:42'!
value	
	portfolio doWithAccounts: self.
	^report.! !
