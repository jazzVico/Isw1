!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'jj 9/2/2019 19:18:39'!
ClosureShouldNotTakeMoreThan: time unitOfTime: unit closure: aClosure

	|millisecondsBeforeRunning millisecondsAfterRunning |	
		
	millisecondsBeforeRunning := Time millisecondClockValue * unit.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * unit.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (time * unit)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jj 9/2/2019 20:12:21'!
checkNumberOfCostumers: customerBook  Active:numberOfActiveCostumers Suspended:numberOfSuspendedCostmuers Total:numberOfCostumers

	
	self assert: numberOfActiveCostumers equals: customerBook numberOfActiveCustomers.
	self assert: numberOfSuspendedCostmuers equals: customerBook numberOfSuspendedCustomers.
	self assert: numberOfCostumers equals: customerBook numberOfCustomers.
	


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jj 9/2/2019 19:50:25'!
suspendedCustomerAssertions: personToSuspend customerInBook: aPerson customerBook: customerBook
	
		
	[ customerBook suspendCustomerNamed: personToSuspend.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: aPerson) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jj 9/2/2019 19:27:54'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.	

	self ClosureShouldNotTakeMoreThan: 50 unitOfTime: millisecond closure: [customerBook addCustomerNamed: 'John Lennon'.]

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jj 9/2/2019 19:29:47'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	self ClosureShouldNotTakeMoreThan: 50 unitOfTime: millisecond closure: [customerBook removeCustomerNamed: paulMcCartney.] .
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jj 9/8/2019 11:40:01'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook aProblem aClosureMethod|
			
	customerBook := CustomerBook new.
	aProblem:=Error.
	aClosureMethod:= [ :aCustomerBook|aCustomerBook addCustomerNamed: ''.].

	self testCustomerBook: customerBook TestingMethod:aClosureMethod Problem:aProblem AssertionWithError:[ :aCustomerBook :anError| anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.].
	
		self testCustomerBook: customerBook TestingMethod:aClosureMethod Problem:aProblem AssertionWithError:[ :aCustomerBook :anError| aCustomerBook isEmpty ].
	
	
			! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jj 9/8/2019 11:40:57'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon aClosureMethod aProblem  |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	aClosureMethod := [:acustomerBook | acustomerBook removeCustomerNamed: 'Paul McCartney'.].
	aProblem := NotFound.	 
	 
	self testCustomerBook:customerBook TestingMethod:aClosureMethod Problem:aProblem AssertionWithError:[:acustomerBook :anError| acustomerBook  numberOfCustomers = 1.].
	
	self testCustomerBook:customerBook TestingMethod:aClosureMethod Problem:aProblem AssertionWithError:[:acustomerBook :anError| acustomerBook  includesCustomerNamed: johnLennon.].
	

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jj 9/2/2019 20:13:51'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self checkNumberOfCostumers: customerBook  Active:0 Suspended:1 Total:1.
	
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jj 9/2/2019 20:12:41'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.

	self checkNumberOfCostumers: customerBook  Active:0 Suspended:0 Total:0.
	
	self deny: (customerBook includesCustomerNamed: paulMcCartney).

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jj 9/2/2019 19:49:56'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	
	self suspendedCustomerAssertions: 'Paul McCartney' customerInBook:johnLennon customerBook: customerBook.
	

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jj 9/2/2019 19:51:28'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
		
	self suspendedCustomerAssertions: johnLennon customerInBook:johnLennon customerBook: customerBook.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jj 9/8/2019 11:39:38'!
testCustomerBook:customerBook TestingMethod: Method Problem:Problem AssertionWithError:Assertion


	[ Method value:customerBook.
	self fail ]
		on: Problem 
		do: [ :anError | 			
			self assert: (Assertion value:customerBook value:anError)]! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'jj 9/2/2019 20:34:25'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed:aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'jj 9/2/2019 20:56:03'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'jj 9/8/2019 12:34:46'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'jj 9/8/2019 13:20:46'!
removeCustomerNamed: aName 


	[active remove: aName.]
		on: Error
		do: [[suspended remove: aName]
			on: Error
			do: [^NotFound signal]].
		
	^aName! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/2/2019 14:41:10'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists.'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/2/2019 14:41:16'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty.'! !
