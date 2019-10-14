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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'J 10/10/2019 18:32:28'!
test05xxxx
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

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'J 10/10/2019 18:23:45'!
oPositions
	^oBoardPieces! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'J 10/10/2019 18:42:38'!
putOat: aPoint 
	previousPlayer = nil ifTrue:[^self error: self class anInvalidStartErrorDescription].
	oBoardPieces add: aPoint.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'J 10/10/2019 18:44:58'!
putXat: aPoint 
	previousPlayer := #X.
	xBoardPieces add:aPoint.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'J 10/10/2019 18:29:57'!
xAmountOfpieces
	^xBoardPieces size.! !

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
