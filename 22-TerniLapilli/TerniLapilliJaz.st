!classDefinition: #TaTeTiTest category: #TerniLapilli!
TestCase subclass: #TaTeTiTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TaTeTiTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 03:31:02'!
test01XPlaysAtOriginPieceIsWellPlaced
	|aTaTeTi|
	
	aTaTeTi := TaTeTi new.
	aTaTeTi putAPieceOf:#X at: (0@0).
	self assert: aTaTeTi TaTeTiBoard amountOfpieces=1.
	self assert: ( aTaTeTi TaTeTiBoard pieceAtPosition:(0@0)) chipPlayer=#X.! !

!TaTeTiTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 03:38:11'!
test02OCantStart
	|aTaTeTi|
	
	aTaTeTi := TaTeTi new.
	
	self should: [
		aTaTeTi putAPieceOf:#O at: (0@0).]
	 raise: Error - MessageNotUnderstood 
	withExceptionDo:[:anError|
			self assert: TaTeTi NotPlayersTurnErrorDescription = anError messageText].! !

!TaTeTiTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 03:45:06'!
test03XCantPlaceTwiceInSequence
	|aTaTeTi|
	
	aTaTeTi := TaTeTi new.
	aTaTeTi putAPieceOf:#X at: (1@1).
	
	self should: [
	
	aTaTeTi putAPieceOf:#X at: (1@0).]
	 raise: Error - MessageNotUnderstood 
	withExceptionDo:[:anError|
			self assert: TaTeTi NotPlayersTurnErrorDescription = anError messageText].! !

!TaTeTiTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 04:06:22'!
test04PlayerCantPlaceMoreThanThreePieces
	|aTaTeTi|
	
	aTaTeTi := TaTeTi new.
	aTaTeTi putAPieceOf: #X at: (1@1).
	aTaTeTi putAPieceOf: #O at: (1@0).
	aTaTeTi putAPieceOf: #X at: (0@1).
	aTaTeTi putAPieceOf: #O at: (2@0).
	aTaTeTi putAPieceOf: #X at: (2@1).
	aTaTeTi putAPieceOf: #O at: (1@2).
	self should: [	
		aTaTeTi putAPieceOf: #X at: (2@1).]
	 raise: Error - MessageNotUnderstood 
	withExceptionDo:[:anError|
			self assert: TerniLapilliBoard PlayerCantHaveMoraThan3ChipsErrorDescription = anError messageText].! !

!TaTeTiTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 10:54:19'!
test05XCantMoveTwiceInSequence
	|aTaTeTi|
	
	aTaTeTi := TaTeTi new.
	aTaTeTi putAPieceOf:#X at: (1@1).
	aTaTeTi putAPieceOf:#O at: (2@0).
	aTaTeTi putAPieceOf:#X at: (2@1).
	aTaTeTi putAPieceOf:#O at: (2@2).
	aTaTeTi putAPieceOf:#X at: (0@2).
	aTaTeTi putAPieceOf:#O at: (0@0).
		
	self should: [	
	aTaTeTi moveAPieceOf:#X from:(1@1)to: (1@0).
	aTaTeTi moveAPieceOf:#X from:(0@2)to: (1@2).]
	 raise: Error - MessageNotUnderstood 
	withExceptionDo:[:anError|
			self assert: TaTeTi NotPlayersTurnErrorDescription = anError messageText].! !


!classDefinition: #TerniLapilliBoardTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliBoardTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliBoardTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 00:57:16'!
test01PieceIsWellPlacedAtOrigin
	|aTerniLapilliBoard|
	
	aTerniLapilliBoard := TerniLapilliBoard new.
	aTerniLapilliBoard putPieceAt: (0@0).
	self assert: aTerniLapilliBoard positions includes: (0@0).
	self assert: aTerniLapilliBoard amountOfpieces = 1.! !

!TerniLapilliBoardTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 01:24:10'!
test02CantPutTwoPiecesInTheSamePlace
	|aTerniLapilliBoard|
	
	aTerniLapilliBoard := TerniLapilliBoard new.
	aTerniLapilliBoard putPieceAt: (0@0).
	self should: [ 				
			aTerniLapilliBoard putPieceAt: (0@0).]
		 raise: Error - MessageNotUnderstood 
		withExceptionDo:[:anError|
			self assert: TerniLapilliBoard alreadyAPieceInThatPlaceErrorDescription = anError messageText].! !

!TerniLapilliBoardTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 02:21:50'!
test03MovePieceInValidPosition
	|aTerniLapilliBoard|
	
	aTerniLapilliBoard := TerniLapilliBoard new.
	aTerniLapilliBoard putPieceAt: (1@1).
	aTerniLapilliBoard movePieceFrom:(1@1) to: (2@2).
	self assert: (aTerniLapilliBoard positions includes: (2@2)).
	self assert: aTerniLapilliBoard amountOfpieces = 1.! !

!TerniLapilliBoardTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 01:36:50'!
test04CantPutPieceOutOfTheBoard
	|aTerniLapilliBoard|
	
	aTerniLapilliBoard := TerniLapilliBoard new.
	
	self should: [ 				
			aTerniLapilliBoard putPieceAt: (0@3)]
		 raise: Error - MessageNotUnderstood 
		withExceptionDo:[:anError|
			self assert: TerniLapilliBoard positionOutOfBoardErrorDescription = anError messageText].! !

!TerniLapilliBoardTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 01:39:58'!
test05CantMovePieceOutOfTheBoard
	|aTerniLapilliBoard|
	
	aTerniLapilliBoard := TerniLapilliBoard new.
	aTerniLapilliBoard putPieceAt: (0@2).
	self should: [ 				
			aTerniLapilliBoard movePieceFrom: (0@2)to:(0@3)]
		 raise: Error - MessageNotUnderstood 
		withExceptionDo:[:anError|
			self assert: TerniLapilliBoard positionOutOfBoardErrorDescription = anError messageText].! !

!TerniLapilliBoardTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 01:58:00'!
test06CantMoveAPieceToAnOcuppiedPlace
	|aTerniLapilliBoard|
	
	aTerniLapilliBoard := TerniLapilliBoard new.
	aTerniLapilliBoard putPieceAt: (0@0).
	aTerniLapilliBoard putPieceAt: (0@1).
	self should: [ 				
			aTerniLapilliBoard movePieceFrom: (0@1) to: (0@0).]
		 raise: Error - MessageNotUnderstood 
		withExceptionDo:[:anError|
			self assert: TerniLapilliBoard alreadyAPieceInThatPlaceErrorDescription = anError messageText].! !

!TerniLapilliBoardTest methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 02:20:28'!
test07CantMoveAPieceTwoSteps
	|aTerniLapilliBoard|
	
	aTerniLapilliBoard := TerniLapilliBoard new.
	aTerniLapilliBoard putPieceAt: (0@2).	
	self should: [ 				
			aTerniLapilliBoard movePieceFrom: (0@2) to: (2@0).]
		 raise: Error - MessageNotUnderstood 
		withExceptionDo:[:anError|
			self assert: TerniLapilliBoard cantMoveMoveMoreThanOneStepErrorDescription = anError messageText].! !


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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'jj 10/16/2019 15:31:53'!
test08XCantPutFourPieces
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
		description:  'player cant place more than three pieces'.
	

	
! !


!classDefinition: #TaTeTi category: #TerniLapilli!
Object subclass: #TaTeTi
	instanceVariableNames: 'board nextPlayer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TaTeTi methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 03:10:02'!
TaTeTiBoard
	^board.! !

!TaTeTi methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 03:46:53'!
changePlayer
	nextPlayer=#X ifTrue:[nextPlayer:=#O]
	ifFalse:[nextPlayer:=#X].! !

!TaTeTi methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 02:37:55'!
initialize
	board := TerniLapilliBoard new. 
	nextPlayer := #X. ! !

!TaTeTi methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 10:53:25'!
moveAPieceOf: aPlayer from: aPoint to:aPoint2 
	
	nextPlayer=aPlayer ifFalse:[^self error: self class NotPlayersTurnErrorDescription ].		
	self TaTeTiBoard movePieceOf:aPlayer from:aPoint to: aPoint2.
	self changePlayer.! !

!TaTeTi methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 03:45:47'!
putAPieceOf: aPlayer at: aPoint 
	|newChip|
	nextPlayer=aPlayer ifFalse:[^self error: self class NotPlayersTurnErrorDescription ].
	newChip := TerniLapilliChip new initializeWith:aPlayer at:aPoint.	
	self TaTeTiBoard putPiece: newChip.
	self changePlayer.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TaTeTi class' category: #TerniLapilli!
TaTeTi class
	instanceVariableNames: ''!

!TaTeTi class methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 03:38:57'!
NotPlayersTurnErrorDescription
	^'not players turn'! !


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

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'jj 10/16/2019 15:24:20'!
putOat: aPoint 
	previousPlayer = nil ifTrue:[^self error: self class anInvalidStartErrorDescription].
	previousPlayer=#O ifTrue:[^self error: self class playerCantPlayTwiceInSequenceErrorDescription].
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


!classDefinition: #TerniLapilliBoard category: #TerniLapilli!
Object subclass: #TerniLapilliBoard
	instanceVariableNames: 'boardPieces'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliBoard methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 10:29:00'!
amountOfPiecesOfPlayer:aPlayer
	"devuelve el la cantidad de fichas de un jugador"
	^ (self positions select:[:aPiece | aPiece chipPlayer = aPlayer]) size.
! !

!TerniLapilliBoard methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 01:09:28'!
amountOfpieces
	^boardPieces size.! !

!TerniLapilliBoard methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 00:50:29'!
initialize
	boardPieces := OrderedCollection new. ! !

!TerniLapilliBoard methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 01:35:35'!
isAValidPosition:aPoint
	^ aPoint x>=0 and: aPoint x<=2 and:aPoint y>=0 and: aPoint y<=2
! !

!TerniLapilliBoard methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 03:26:58'!
isOccupied:aPoint
	^  (self pieceAtPosition:aPoint ) notNil.  
! !

!TerniLapilliBoard methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 10:42:13'!
move:aPlayer from:aPoint to: aPoint2.
	(self isAValidPosition:aPoint2 )ifFalse:[^self error: self class positionOutOfBoardErrorDescription ].
	(self isOccupied:aPoint2 )ifTrue:[^self error: self class alreadyAPieceInThatPlaceErrorDescription ].
	(self validDistanceFrom: aPoint to: aPoint2 )ifFalse:[^self error: self class cantMoveMoveMoreThanOneStepErrorDescription ].
	boardPieces remove:aPoint .
	boardPieces add: aPoint2 .! !

!TerniLapilliBoard methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 10:53:43'!
movePieceOf:aPlayer from: aPoint to: aPoint2 
	|newChip|
	(self isAValidPosition:aPoint2 )ifFalse:[^self error: self class positionOutOfBoardErrorDescription ].
	(self isOccupied:aPoint2 )ifTrue:[^self error: self class alreadyAPieceInThatPlaceErrorDescription ].
	(self validDistanceFrom: aPoint to: aPoint2 )ifFalse:[^self error: self class cantMoveMoveMoreThanOneStepErrorDescription ].
	self removePieceAt:aPoint .
	newChip:= TerniLapilliChip new initializeWith:aPlayer at:aPoint2.
	self putPiece: newChip! !

!TerniLapilliBoard methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 03:24:38'!
pieceAtPosition:aPoint
	^ self positions detect:[:aPiece| aPiece chipPosition = aPoint] ifNone: [^nil].
! !

!TerniLapilliBoard methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 00:58:51'!
positions
	^boardPieces.! !

!TerniLapilliBoard methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 10:30:03'!
putPiece: aPiece
	((self amountOfPiecesOfPlayer: aPiece chipPlayer) =3) ifTrue:[^self error: self class PlayerCantHaveMoraThan3ChipsErrorDescription ].
	(self isOccupied: aPiece chipPosition ) ifTrue:[^self error: self class alreadyAPieceInThatPlaceErrorDescription ].
	(self isAValidPosition: aPiece chipPosition ) ifFalse:[^self error: self class positionOutOfBoardErrorDescription ].
	boardPieces add:aPiece.! !

!TerniLapilliBoard methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 01:33:23'!
putPieceAt: aPoint 
	(self positions includes: aPoint) ifTrue:[^self error: self class alreadyAPieceInThatPlaceErrorDescription ].
	(self isAValidPosition: aPoint) ifFalse:[^self error: self class positionOutOfBoardErrorDescription ].
	boardPieces add:aPoint.! !

!TerniLapilliBoard methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 10:46:35'!
removePieceAt:aPoint
	boardPieces remove: (self pieceAtPosition:aPoint).

! !

!TerniLapilliBoard methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 02:18:24'!
validDistanceFrom:aPoint to:aPoint2
	^ (aPoint dist: aPoint2 ) < 2.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliBoard class' category: #TerniLapilli!
TerniLapilliBoard class
	instanceVariableNames: ''!

!TerniLapilliBoard class methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 04:01:02'!
PlayerCantHaveMoraThan3ChipsErrorDescription
	^'cant have more than 3 chips.'! !

!TerniLapilliBoard class methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 01:18:35'!
alreadyAPieceInThatPlaceErrorDescription
	^'cant put a piece because there already is a piece in that Position.'! !

!TerniLapilliBoard class methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 02:05:14'!
cantMoveMoveMoreThanOneStepErrorDescription
	^'cant move more than one step.'! !

!TerniLapilliBoard class methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 01:31:02'!
positionOutOfBoardErrorDescription
	^'That position is out of the board'! !


!classDefinition: #TerniLapilliChip category: #TerniLapilli!
Object subclass: #TerniLapilliChip
	instanceVariableNames: 'player position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliChip methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 02:32:52'!
chipPlayer
	^player.! !

!TerniLapilliChip methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 02:32:31'!
chipPosition
	^position.! !

!TerniLapilliChip methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 02:32:13'!
chipPosition:aPoint
	position := aPoint .! !

!TerniLapilliChip methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 02:27:26'!
initializeWith: aPlayer at: aPosition
	player := aPlayer.
	position:= aPosition .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliChip class' category: #TerniLapilli!
TerniLapilliChip class
	instanceVariableNames: ''!

!TerniLapilliChip class methodsFor: 'as yet unclassified' stamp: 'jj 10/17/2019 02:28:47'!
initializeWith: aPlayer at: aPoint
	^self new initializeWith: aPlayer at: aPoint .! !
