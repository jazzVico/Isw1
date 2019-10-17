!classDefinition: #TerniLapilliTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'J 10/10/2019 18:26:23'!
test01XPlaysAtOriginPieceIsWellPlaced
	|aTerniLapilliGame|
	
	aTerniLapilliGame := TerniLapilli new.
	aTerniLapilliGame putXat: (0@0).
	self assert: aTerniLapilliGame xPositions includes: (0@0).
	self assert: aTerniLapilliGame xAmountOfpieces = 1.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'J 10/10/2019 18:26:01'!
test02XPlaysAwayFromOriginPieceIsWellPlaced
	|aTerniLapilliGame|
	
	aTerniLapilliGame := TerniLapilli new.
	aTerniLapilliGame putXat: (0@1).
	self assert: aTerniLapilliGame xPositions includes: (0@1).
	self assert: aTerniLapilliGame xAmountOfpieces = 1.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'J 10/10/2019 18:26:52'!
test03XPlayAndThenOdDoesBothPiecesAreWellPlaced
	|aTerniLapilliGame|
	
	aTerniLapilliGame := TerniLapilli new.
	aTerniLapilliGame putXat: (0@1).
	aTerniLapilliGame putOat:(0@0).
	self assert: aTerniLapilliGame xPositions includes: (0@1).
	self assert: aTerniLapilliGame xAmountOfpieces = 1.
		self assert: aTerniLapilliGame oPositions includes: (0@0).
	self assert: aTerniLapilliGame oAmountOfpieces = 1.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'J 10/10/2019 18:35:26'!
test04XplaysTwiceAndOOncePiecesAreWellPlaced
	|aTerniLapilliGame|
	
	aTerniLapilliGame := TerniLapilli new.
	aTerniLapilliGame putXat: (0@1).
	aTerniLapilliGame putOat:(0@0).
	aTerniLapilliGame putXat: (0@2).
	
	self assert: aTerniLapilliGame xPositions includes: (0@1).
	self assert: aTerniLapilliGame xPositions includes: (0@2).
	self assert: aTerniLapilliGame xAmountOfpieces = 2.
	self assert: aTerniLapilliGame oPositions includes: (0@0).
	self assert: aTerniLapilliGame oAmountOfpieces = 1.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'J 10/10/2019 18:35:47'!
test05XAndOPlayTwicePiecesAreWellPlaced
	|aTerniLapilliGame|
	
	aTerniLapilliGame := TerniLapilli new.
	aTerniLapilliGame putXat: (0@1).
	aTerniLapilliGame putOat:(0@0).
	aTerniLapilliGame putXat: (0@2).
	aTerniLapilliGame putOat:(1@0).
	self assert: aTerniLapilliGame xPositions includes: (0@1).
	self assert: aTerniLapilliGame xPositions includes: (0@2).
	self assert: aTerniLapilliGame xAmountOfpieces = 2.
	self assert: aTerniLapilliGame oPositions includes: (0@0).
	self assert: aTerniLapilliGame oPositions includes: (1@0).
	self assert: aTerniLapilliGame oAmountOfpieces = 2.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'J 10/10/2019 18:44:13'!
test06OCantStart
	|aTerniLapilliGame|
	
	
	
		self should: [ 
			aTerniLapilliGame := TerniLapilli new.
			aTerniLapilliGame putOat:(0@0).]
		 raise: Error - MessageNotUnderstood 
		description:  'O cant start a game of Ternilapilli'.
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'jj 10/16/2019 15:25:59'!
test07XCantPlayTwiceInSequence
	|aTerniLapilliGame|
	
	
	self should: [ 
			aTerniLapilliGame := TerniLapilli new.
			aTerniLapilliGame putXat: (0@1).	
			aTerniLapilliGame putXat: (0@2).]
		 raise: Error - MessageNotUnderstood 
		description:  'player cant play twice in sequence'.
	

	
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'jj 10/16/2019 15:26:05'!
test08OCantPlayTwiceInSequence
	|aTerniLapilliGame|
	
	
	self should: [ 
			aTerniLapilliGame := TerniLapilli new.
			aTerniLapilliGame putXat: (0@1).
			aTerniLapilliGame putOat: (0@0).	
			aTerniLapilliGame putOat: (0@2).]
		 raise: Error - MessageNotUnderstood 
		description:  'player cant play twice in sequence'.
	

	
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'JJ 10/16/2019 18:10:23'!
test09XCantPutFourPieces
	|aTerniLapilliGame|
	
	
	self should: [ 
			aTerniLapilliGame := TerniLapilli new.
			aTerniLapilliGame putXat: (0@1).
			aTerniLapilliGame putOat: (0@0).
			aTerniLapilliGame putXat: (2@2).
			aTerniLapilliGame putOat: (1@0).
			aTerniLapilliGame putXat: (0@2).
			aTerniLapilliGame putOat: (1@2).	
			aTerniLapilliGame putXat: (2@0).]
		 raise: Error - MessageNotUnderstood  
		withExceptionDo:[:anError|
			self assert: anError messageText = TerniLapilli playerCantPlaceMoreThanThreePiecesErrorDescription 
			]
	

	
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'JJ 10/16/2019 18:20:40'!
test10XCanMoveToValidPlace
	|aTerniLapilliGame|
	

	aTerniLapilliGame := TerniLapilli new.
	aTerniLapilliGame putXat: (0@1).
	aTerniLapilliGame putOat: (0@0).
	aTerniLapilliGame putXat: (2@2).
	aTerniLapilliGame putOat: (1@0).
	aTerniLapilliGame putXat: (0@2).
	aTerniLapilliGame putOat: (1@2).	
	aTerniLapilliGame xMoveFrom: (0@2) to:(1@1).

	self assert: aTerniLapilliGame xPositions includes: (1@1).
	self deny: (aTerniLapilliGame xPositions includes: (0@2)).
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'JJ 10/16/2019 18:21:07'!
test11OCanMoveToValidPlace
	|aTerniLapilliGame|
	

	aTerniLapilliGame := TerniLapilli new.
	aTerniLapilliGame putXat: (0@1).
	aTerniLapilliGame putOat: (0@0).
	aTerniLapilliGame putXat: (2@2).
	aTerniLapilliGame putOat: (1@0).
	aTerniLapilliGame putXat: (0@2).
	aTerniLapilliGame putOat: (1@2).	
	aTerniLapilliGame xMoveFrom: (0@2) to:(1@1).
	aTerniLapilliGame oMoveFrom: (1@0) to:(2@0).
	
	self assert: aTerniLapilliGame xPositions includes: (1@1).
	self deny: (aTerniLapilliGame xPositions includes: (0@2)).
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'JJ 10/16/2019 18:21:53'!
test12OCantPutFourPieces
	|aTerniLapilliGame|
	
	
	self should: [ 
			aTerniLapilliGame := TerniLapilli new.
			aTerniLapilliGame putXat: (0@1).
			aTerniLapilliGame putOat: (0@0).
			aTerniLapilliGame putXat: (2@2).
			aTerniLapilliGame putOat: (1@0).
			aTerniLapilliGame putXat: (0@2).
			aTerniLapilliGame putOat: (1@2).	
			aTerniLapilliGame xMoveFrom:(0@2)to:(1@1).
			aTerniLapilliGame putOat:(2@1)
			]
		 raise: Error - MessageNotUnderstood  
		withExceptionDo:[:anError|
			self assert: anError messageText = TerniLapilli playerCantPlaceMoreThanThreePiecesErrorDescription 
			]
	

	
! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'xBoardPieces oBoardPieces previousPlayer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'J 10/10/2019 18:42:56'!
initialize 
	xBoardPieces := OrderedCollection new.
	oBoardPieces := OrderedCollection new.
	previousPlayer := nil.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'J 10/10/2019 18:30:48'!
oAmountOfpieces
	^oBoardPieces size.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'JJ 10/16/2019 18:21:07'!
oMoveFrom: aPoint to: aPoint2 
	
	self oPositions remove:aPoint .
	self oPositions add:aPoint2 .
	previousPlayer:=#O.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'J 10/10/2019 18:23:45'!
oPositions
	^oBoardPieces! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'JJ 10/16/2019 18:22:40'!
putOat: aPoint 
	previousPlayer = nil ifTrue:[^self error: self class anInvalidStartErrorDescription].
	previousPlayer=#O ifTrue:[^self error: self class playerCantPlayTwiceInSequenceErrorDescription].
	self oAmountOfpieces=3 ifTrue:[^self error: self class playerCantPlaceMoreThanThreePiecesErrorDescription].
	previousPlayer:= #O.
	oBoardPieces add: aPoint.
	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'jj 10/16/2019 15:35:22'!
putXat: aPoint 
	previousPlayer=#X ifTrue:[^self error: self class playerCantPlayTwiceInSequenceErrorDescription].
	self xAmountOfpieces=3 ifTrue:[^self error: self class playerCantPlaceMoreThanThreePiecesErrorDescription].
	previousPlayer := #X.
	xBoardPieces add:aPoint.
	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'J 10/10/2019 18:29:57'!
xAmountOfpieces
	^xBoardPieces size.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'JJ 10/16/2019 18:35:49'!
xMoveFrom: aPoint to: aPoint2 
	self xPositions remove:  aPoint.
	self xPositions  add: aPoint2 .
	previousPlayer := #X.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'J 10/10/2019 18:20:24'!
xPositions

	^xBoardPieces.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'J 10/10/2019 18:44:19'!
anInvalidStartErrorDescription
	^'O cant start a game of Ternilapilli'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'jj 10/16/2019 15:32:59'!
playerCantPlaceMoreThanThreePiecesErrorDescription
	^'player cant place more than three pieces'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'jj 10/16/2019 15:24:27'!
playerCantPlayTwiceInSequenceErrorDescription
	^'player cant play twice in sequence'! !
