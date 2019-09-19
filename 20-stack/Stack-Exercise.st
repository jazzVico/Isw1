!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stackForTesting emptyStackForTesting finder smallStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'J 9/19/2019 14:37:07'!
setUp
	stackForTesting:= OOStack new. 
	stackForTesting push: 'Muchos años después, frente al pelotón de fusilamiento, el coronel Aureliano Buendía había de recordar aquella tarde remota en que su padre lo llevó a conocer el hielo.'.
	stackForTesting push: 'El mundo era tan reciente, que muchas cosas carecían de nombre, y para mencionarlas había que señarlarlas con el dedo.'.
	stackForTesting push: 'Sólo él sabía entonces que su aturdido corazón estaba condenado para siempre a la incertidumbre. '.
	stackForTesting push: 'el mundo se redujo en la superficie de su piel, y el interior quedó a salvo de toda amargura. '.
	stackForTesting push: 'Elaboró el plan con tanto odio que la estremeció la idea de que lo habría hecho de igual modo si hubiera sido con amor.'.
	stackForTesting push: 'No se le había ocurrido pensar hasta entonces que la literatura fuera el mejor juguete que se había inventado para burlarse de la gente.'.
	stackForTesting push: 'Había perdido en la espera la fuerza de los muslos, la dureza de los senos, el hábito de la ternura, pero conservaba intacta la locura del corazón.'.
	stackForTesting push: 'No entendía cómo se llegaba al extremo de hacer una guerra por cosas que no podían tocarse con las manos.'.
	stackForTesting push: 'Uno no se muere cuando debe, sino cuando puede'.
	stackForTesting push:'el secreto de una buena vejez no es otra cosa que un pacto honrado con la soledad'.
	stackForTesting push: 'Tenía la rara virtud de no existir por completo sino en el momento oportuno'.
	
	emptyStackForTesting := OOStack new.
	
	smallStack := OOStack new.
	smallStack push: 'first'.
	smallStack push: 'second'.
	smallStack push: 'third'.	
	
	finder := SentenceFinderByPrefix new! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jj 9/19/2019 00:58:23'!
test01ShouldNotFindOnEmptyStack

	| suffixStack|
	
	
	
	suffixStack := finder find:'asd' in:emptyStackForTesting.
	
	self assert: suffixStack isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jj 9/19/2019 00:58:33'!
test02ShouldOnlyFindOneElementOnElementStack

	|  suffixStack word|
	word := 'Sólo'.

	
	
	suffixStack := finder find:word in:stackForTesting.
	
	self assert: suffixStack size = 1.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jj 9/19/2019 00:58:52'!
test03ShouldBreakOnEmptyString
	
	self
		should: [ finder find:'' in:stackForTesting]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidStringErrorDescription ]
		
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jj 9/19/2019 00:59:44'!
test04ShouldBreakOnStringWithSpaces

	self
		should: [ finder find:'asd ' in:stackForTesting]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix invalidStringErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jj 9/19/2019 01:27:08'!
test05ShouldOnlyFindTheElementsWithPrefixInLowerCase
		| suffixStack primerFrase segundaFrase prefix|
		
		prefix:='el'.
	suffixStack:= finder find:prefix in:stackForTesting.
	
		self assert: suffixStack size = 2.
		primerFrase:=suffixStack top.
		self assert: [(primerFrase copyFrom: 1 to: 2)=prefix].
		suffixStack pop.
		segundaFrase:= suffixStack top.
		self assert: [(segundaFrase copyFrom: 1 to: 2)=prefix].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'jj 9/19/2019 01:20:10'!
test06ShouldNotFindTheElement
	| suffixStack |

	suffixStack := finder find:'guitarra' in:stackForTesting.
	
		self assert: suffixStack size = 0.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'J 9/19/2019 14:32:09'!
test07ShouldFindOneElementOnElementStackForEachFind

	|  suffixStack word found|
	word := 'Sólo'.

	
	
	suffixStack := finder find:word in:stackForTesting.
	found := suffixStack top.	
	self assert: suffixStack size = 1.
	self assert: (found copyFrom: 1 to: 4) = word.
	
	suffixStack := finder find:word in:stackForTesting.
	found := suffixStack top.	
	self assert: suffixStack size = 1.
	self assert: (found copyFrom: 1 to: 4) = word.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'J 9/19/2019 14:44:09'!
test08StackShouldBeTheSameSizeAfterFind

	|word|
	word := 'Sólo'.

	finder find: word in: stackForTesting.
	
	self assert: stackForTesting size = 11.
! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'J 9/19/2019 14:41:55'!
test09StackShouldBeTheSameAfterFind

	|word stackTop|
	word := 'Sólo'.

	
	
	finder find:word in:smallStack.
	stackTop := smallStack pop.
	self assert: stackTop = 'third'.
	
	stackTop := smallStack pop.
	self assert: stackTop = 'second'.
	
	stackTop := smallStack pop.
	self assert: stackTop = 'first'.
	
	self assert: smallStack isEmpty.! !


!classDefinition: #NameOfSubclass category: #'Stack-Exercise'!
Object subclass: #NameOfSubclass
	instanceVariableNames: 'lookUpStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #Node category: #'Stack-Exercise'!
Object subclass: #Node
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'as yet unclassified' stamp: 'jj 9/17/2019 22:54:04'!
element
		self subclassResponsibility ! !

!Node methodsFor: 'as yet unclassified' stamp: 'jj 9/17/2019 22:54:10'!
initializeWithValue:anObject PreviousNode: aNode
		self subclassResponsibility ! !

!Node methodsFor: 'as yet unclassified' stamp: 'jj 9/17/2019 22:54:26'!
isEmpty
	self subclassResponsibility ! !

!Node methodsFor: 'as yet unclassified' stamp: 'jj 9/17/2019 22:54:17'!
previous
		self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Node class' category: #'Stack-Exercise'!
Node class
	instanceVariableNames: ''!

!Node class methodsFor: 'as yet unclassified' stamp: 'jj 9/16/2019 21:44:21'!
withValue: anObject withPrevious: previous
	^self new initializeWithValue:anObject PreviousNode:previous.! !


!classDefinition: #EmptyNode category: #'Stack-Exercise'!
Node subclass: #EmptyNode
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyNode methodsFor: 'as yet unclassified' stamp: 'jj 9/17/2019 22:47:33'!
element
  ^ OOStack error: OOStack stackEmptyErrorDescription  . ! !

!EmptyNode methodsFor: 'as yet unclassified' stamp: 'jj 9/16/2019 21:35:31'!
initialize
	value:= nil.
	"mmmmm no se como hacer estooo"! !

!EmptyNode methodsFor: 'as yet unclassified' stamp: 'jj 9/16/2019 20:25:38'!
isEmpty
 ^ true.! !

!EmptyNode methodsFor: 'as yet unclassified' stamp: 'jj 9/17/2019 22:47:57'!
previous
	^  OOStack error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #NodeWithContent category: #'Stack-Exercise'!
Node subclass: #NodeWithContent
	instanceVariableNames: 'previousNode value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NodeWithContent methodsFor: 'as yet unclassified' stamp: 'jj 9/17/2019 22:50:38'!
element
	^value.! !

!NodeWithContent methodsFor: 'as yet unclassified' stamp: 'jj 9/17/2019 22:50:53'!
initializeWithValue:anObject PreviousNode: aNode
	value:= anObject.
	previousNode := aNode.
	! !

!NodeWithContent methodsFor: 'as yet unclassified' stamp: 'jj 9/17/2019 22:51:04'!
isEmpty
	^false.! !

!NodeWithContent methodsFor: 'as yet unclassified' stamp: 'jj 9/17/2019 22:51:14'!
previous
	^previousNode.! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topNode size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'jj 9/16/2019 20:33:12'!
initialize
	topNode := EmptyNode new.
	size := 0.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'jj 9/16/2019 20:24:24'!
isEmpty
	^topNode isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'jj 9/17/2019 22:42:51'!
pop
|actualNodeValue |
	actualNodeValue := topNode element.
	topNode := topNode previous.
	"element tira un error si topNode es vacio"
	
	size := size -1.
	
	^actualNodeValue.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'jj 9/17/2019 22:55:53'!
push:anObject
	|newNode|
	newNode := NodeWithContent withValue: anObject withPrevious: topNode.
	topNode := newNode.
	size := size + 1.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'jj 9/16/2019 20:33:04'!
size
	^size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'jj 9/17/2019 22:38:01'!
top
	^topNode element.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: 'collection'!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'inverseStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'J 9/19/2019 00:23:01'!
checkForValidString: aString

	aString isEmpty ifTrue:[^self class error: self class invalidStringErrorDescription].
	(aString findString: ' ') = 0 ifFalse:[^self class error: self class invalidStringErrorDescription].
! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'J 9/19/2019 00:13:04'!
find: aString in: aStack
	| anwserStack |
	self checkForValidString: aString.
	anwserStack := OOStack new.
	^self find: aString in: aStack  storeAt: anwserStack.
! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'J 9/19/2019 00:03:00'!
find: aString in: aStack storeAt: anAnswerStack
	|topElement|
	aStack isEmpty ifTrue: [
		self reBuild: aStack.
		^anAnswerStack].
	
	topElement := aStack pop.
	inverseStack push: topElement.
	
	(topElement is: aString  substringAt: 1) ifTrue:[ anAnswerStack push:topElement]. 
	
	^self find:aString in:aStack storeAt:anAnswerStack.
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'J 9/18/2019 23:59:19'!
initialize
	
	inverseStack := OOStack new.
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'J 9/18/2019 23:55:12'!
reBuild: aStack
	|element|
	inverseStack isEmpty ifTrue:[^aStack].

	element := inverseStack pop.
	aStack push: element.
	self reBuild: aStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'J 9/18/2019 10:13:37'!
with: aStack
	^self new initializeWith: aStack.! !


!SentenceFinderByPrefix class methodsFor: 'error description' stamp: 'J 9/19/2019 00:10:53'!
invalidStringErrorDescription
	
	^ 'String has an invalid format'! !
