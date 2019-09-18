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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'J 9/18/2019 10:11:56'!
test01ShouldNotFindOnEmptyStack

	|lookupStack finder suffixStack|
	lookupStack  := OOStack new.
	finder := SentenceFinderByPrefix with: lookupStack.
	
	suffixStack := finder find:'asd'.
	
	self assert: suffixStack isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'J 9/18/2019 10:16:36'!
test02ShouldOnlyFindOneElementOnElementStack

	|lookupStack finder suffixStack word|
	word := 'asd'.
	lookupStack  := OOStack new.
	lookupStack push: word. 
	finder := SentenceFinderByPrefix with: lookupStack.
	
	suffixStack := finder find:word.
	
	self assert: suffixStack size = 1.! !


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
	instanceVariableNames: 'inverseStack suffixStack lookupStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'J 9/18/2019 10:22:56'!
find: aString
	|topElement|
	lookupStack isEmpty ifTrue: [
		self reBuild.
		^suffixStack].
	
	topElement := lookupStack pop.
	inverseStack push: topElement.
	
	(topElement is: aString  substringAt: 1) ifTrue:[ suffixStack push:topElement]. 
	
	^self find:aString.
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'J 9/18/2019 10:14:37'!
initializeWith: aStack
	
	inverseStack := OOStack new.
	lookupStack := aStack.
	
	suffixStack := OOStack new.! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'J 9/18/2019 08:54:35'!
reBuild
	|element|
	inverseStack isEmpty ifTrue:[^lookupStack].

	element := inverseStack pop.
	lookupStack push: element.
	self reBuild.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'J 9/18/2019 10:13:37'!
with: aStack
	^self new initializeWith: aStack.! !
