!classDefinition: #TestTerniLapilli category: #TerniLapilli!
TestCase subclass: #TestTerniLapilli
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TestTerniLapilli methodsFor: 'Initialize' stamp: 'JJ 10/17/2019 12:54:46'!
testEmptyBoardWhenNoneChipHasBeenPlaced

	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	self assert: [juego boardIsEmpty.].! !

!TestTerniLapilli methodsFor: 'Initialize' stamp: 'JJ 10/17/2019 12:54:46'!
testGameIsNotOverWhenGameHasJustStarted

	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	self deny: juego finished.! !

!TestTerniLapilli methodsFor: 'Initialize' stamp: 'JJ 10/17/2019 12:54:46'!
testNoXChipsOnNewGame

	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	self assert: [juego xChips isEmpty.].! !

!TestTerniLapilli methodsFor: 'Initialize' stamp: 'JJ 10/17/2019 12:54:46'!
testNoYChipsBeforPlaying

	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	self assert: [juego oChips isEmpty.].! !

!TestTerniLapilli methodsFor: 'Initialize' stamp: 'JJ 10/17/2019 12:54:46'!
testXStartTheGame

	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	self assert: [juego nextPlayer isKindOf: XPlayer].! !


!TestTerniLapilli methodsFor: 'Playing' stamp: 'JJ 10/17/2019 12:54:46'!
testAfterOPlaysX

	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	self assert: [juego nextPlayer isKindOf: OPlayer].
	juego playIn: 0@1.
	self assert: [juego nextPlayer isKindOf: XPlayer].! !

!TestTerniLapilli methodsFor: 'Playing' stamp: 'JJ 10/17/2019 12:54:46'!
testAfterXPlaysO

	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	self assert: [juego nextPlayer isKindOf: XPlayer].
	juego playIn: 0@0.
	self assert: [juego nextPlayer isKindOf: OPlayer].! !

!TestTerniLapilli methodsFor: 'Playing' stamp: 'JJ 10/17/2019 12:54:46'!
testCantPlacedMoreThan3Chips
	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	juego playIn: 1@0.
	juego playIn: 0@1.
	juego playIn: 1@1.	
	juego playIn: 2@2.
	juego playIn: 2@1.
	self should: [ juego playIn: 2@0.]
		 raise: Error
		 withExceptionDo: [ :anError | self assert: anError messageText = 'No hay más fichas']! !

!TestTerniLapilli methodsFor: 'Playing' stamp: 'JJ 10/17/2019 12:54:46'!
testOneXChipAndOneOChipWhenEachPlayedOnce
	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	juego playIn: 0@1.
	self assert: [(juego xChips size) = 1.].
	self assert: [(juego oChips size) = 1.].! !

!TestTerniLapilli methodsFor: 'Playing' stamp: 'JJ 10/17/2019 12:54:46'!
testOneXChipWhenXPlayedOnce

	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	self assert: [juego xChips size = 1.].
	self assert: [juego oChips isEmpty].! !


!TestTerniLapilli methodsFor: 'CheckPosition' stamp: 'JJ 10/17/2019 12:54:46'!
testCantPlacedAChipInAInvalidPosition

	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	self should: [ juego playIn: 0@-1. ]
		 raise: Error
		 withExceptionDo: [ :anError | self assert: anError messageText = 'Posición Inválida']	! !

!TestTerniLapilli methodsFor: 'CheckPosition' stamp: 'JJ 10/17/2019 12:54:46'!
testCantPlacedAChipOnAnOcupiedPosition

	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	self should: [ juego playIn: 0@0. ]
		 raise: Error
		 withExceptionDo: [ :anError | self assert: anError messageText = 'Posición Ocupada']	! !


!TestTerniLapilli methodsFor: 'CheckMovemets' stamp: 'JJ 10/17/2019 12:54:46'!
testAfterOMovesComesX
	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	juego playIn: 0@1.	
	juego playIn: 1@1.
	juego playIn: 0@2.
	juego playIn: 1@2.
	juego playIn: 1@0.
	juego move: 1@1 to: 2@1.
	self assert: (juego nextPlayer isKindOf: OPlayer).
	juego move: 1@0 to: 2@0.
	self assert: (juego nextPlayer isKindOf: XPlayer).! !

!TestTerniLapilli methodsFor: 'CheckMovemets' stamp: 'JJ 10/17/2019 12:54:46'!
testAfterXMovesComesO
	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	juego playIn: 0@1.	
	juego playIn: 1@1.
	juego playIn: 0@2.
	juego playIn: 1@2.
	juego playIn: 1@0.
	self assert: (juego nextPlayer isKindOf: XPlayer).
	juego move: 1@1 to: 2@1.
	self assert: (juego nextPlayer isKindOf: OPlayer).! !

!TestTerniLapilli methodsFor: 'CheckMovemets' stamp: 'JJ 10/17/2019 12:54:46'!
testCantMakeAnInvalidMovement
	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	juego playIn: 1@0.
	juego playIn: 0@1.
	juego playIn: 1@1.	
	juego playIn: 2@0.
	juego playIn: 2@1.
	self should: [ juego move: 0@0 to: 2@2.]
		 raise: Error
		 withExceptionDo: [ :anError | self assert: anError messageText = 'Movimiento Invá¡lido']
	! !

!TestTerniLapilli methodsFor: 'CheckMovemets' stamp: 'JJ 10/17/2019 12:54:46'!
testCantMoveBeforeAllChipsArePlaced
	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	juego playIn: 0@1.
	juego playIn: 1@1.

	self should: [juego move: 1@1 to: 1@2.]
		 raise: Error
		 withExceptionDo: [ :anError | self assert: anError messageText = 'Todavía no se puede efectuar este mvimiento']
! !

!TestTerniLapilli methodsFor: 'CheckMovemets' stamp: 'JJ 10/17/2019 12:54:46'!
testCantMoveFromAnEmptyPosition
	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	juego playIn: 1@0.
	juego playIn: 0@1.
	juego playIn: 1@1.	
	juego playIn: 2@2.	
	juego playIn: 2@1.
	self should: [ juego move: 2@0 to: 1@1.]
		 raise: Error
		 withExceptionDo: [ :anError | self assert: anError messageText = 'Posición Desocupada']! !

!TestTerniLapilli methodsFor: 'CheckMovemets' stamp: 'JJ 10/17/2019 12:54:46'!
testCantMoveOtherPlayersChip
	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	juego playIn: 0@1.
	juego playIn: 1@1.
	juego playIn: 0@2.
	juego playIn: 1@2.
	juego playIn: 1@0.

	self should: [juego move: 1@0 to: 2@0.] raise: Error withExceptionDo: [:anError | self assert: anError messageText = 'Esta ficha no la podes mover']. ! !

!TestTerniLapilli methodsFor: 'CheckMovemets' stamp: 'JJ 10/17/2019 12:54:46'!
testCantMoveToAnOcupiedPosition
	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	juego playIn: 1@0.
	juego playIn: 0@1.
	juego playIn: 1@1.	
	juego playIn: 2@2.
	juego playIn: 2@1.
	self should: [ juego move: 0@0 to: 1@0.]
		 raise: Error
		 withExceptionDo: [ :anError | self assert: anError messageText = 'Posición Ocupada']
	! !

!TestTerniLapilli methodsFor: 'CheckMovemets' stamp: 'JJ 10/17/2019 12:54:46'!
testCantMoveToInvalidPosition
	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	juego playIn: 0@1.
	juego playIn: 0@2.
	juego playIn: 2@0.
	juego playIn: 2@1.
	juego playIn: 2@2.
		
	self should: [ juego move: 0@0 to: 0@-1.]
		 raise: Error
		 withExceptionDo: [ :anError | self assert: anError messageText = 'Posición Inválida']
	! !

!TestTerniLapilli methodsFor: 'CheckMovemets' stamp: 'JJ 10/17/2019 12:54:46'!
testValidMoveChangesChipsPositions
	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	juego playIn: 1@0.
	juego playIn: 0@1.
	juego playIn: 1@1.	
	juego playIn: 2@2.
	juego playIn: 2@1.
	juego move:0@1  to: 0@2.
	self assert: [(juego xChips) includes: 0@2].
	self deny: (juego xChips includes: 0@1).! !


!TestTerniLapilli methodsFor: 'CheckState' stamp: 'JJ 10/17/2019 12:54:46'!
testCantPlayIfGameOver
	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	juego playIn: 1@0.
	juego playIn: 0@1.
	juego playIn: 1@1.	
	juego playIn: 0@2.
	self should: [juego playIn: 2@2.]
		 raise: Error
		 withExceptionDo: [ :anError | self assert: anError messageText = 'Juego terminado']	! !

!TestTerniLapilli methodsFor: 'CheckState' stamp: 'JJ 10/17/2019 12:54:46'!
testDiagonalPlacedChipsCanWinAGame
	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	juego playIn: 1@0.
	juego playIn: 1@1.
	juego playIn: 2@1.	
	juego playIn: 2@2.
	self assert: [juego finished].
	! !

!TestTerniLapilli methodsFor: 'CheckState' stamp: 'JJ 10/17/2019 12:54:46'!
testHorizontalPlacedChipsCanWinAGame
	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	juego playIn: 1@0.
	juego playIn: 0@1.
	juego playIn: 1@1.	
	juego playIn: 0@2.
	self assert: [juego finished].
	! !

!TestTerniLapilli methodsFor: 'CheckState' stamp: 'JJ 10/17/2019 12:54:46'!
testMovingAChipCanWinAGame
	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	juego playIn: 0@1.
	juego playIn: 1@1.
	juego playIn: 0@2.
	juego playIn: 1@2.
	juego playIn: 2@0.
	juego move: 1@2 to: 2@2.
	self assert: (juego finished).! !

!TestTerniLapilli methodsFor: 'CheckState' stamp: 'JJ 10/17/2019 12:54:46'!
testNonWinningSetupDoesNotEndGame
	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	juego playIn: 1@0.
	juego playIn: 1@2.
	juego playIn: 1@1.	
	juego playIn: 2@1.
	self deny: (juego finished).! !

!TestTerniLapilli methodsFor: 'CheckState' stamp: 'JJ 10/17/2019 12:54:46'!
testVerticalPlacedChipsCanWinAGame
	|juego|
	juego _ TerniLapilli new.
	juego initGame.
	juego playIn: 0@0.
	juego playIn: 1@2.
	juego playIn: 1@0.
	juego playIn: 1@1.	
	juego playIn: 2@0.
	self assert: [juego finished].
	! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'xChips oChips nextPlayer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'Initialize' stamp: 'n 5/25/2019 15:51:04'!
initGame
	xChips _ OrderedCollection new.
	oChips _ OrderedCollection new.
	nextPlayer _ XPlayer new.! !


!TerniLapilli methodsFor: 'Playing' stamp: 'JJ 10/17/2019 12:56:06'!
changePlayer: aPlayer

	nextPlayer _ aPlayer .! !

!TerniLapilli methodsFor: 'Playing' stamp: 'JJ 10/17/2019 12:56:15'!
oPlaysIn: aChipPosition

	self playingIn: aChipPosition withChips: oChips.! !

!TerniLapilli methodsFor: 'Playing' stamp: 'JJ 10/17/2019 12:56:22'!
playIn: aChipPosition

	self isNotOcupied: aChipPosition.
	self isValid: aChipPosition.
	self isNotFinished.
	nextPlayer play: aChipPosition in: self.! !

!TerniLapilli methodsFor: 'Playing' stamp: 'n 5/25/2019 16:37:17'!
playingIn: aChipPosition withChips: aChipsCollection

	aChipsCollection size = 3 ifTrue: [self error: 'No hay más fichas']
	ifFalse:[aChipsCollection add: aChipPosition.]	! !

!TerniLapilli methodsFor: 'Playing' stamp: 'n 5/25/2019 16:37:26'!
xPlaysIn: aChipPosition

	self playingIn: aChipPosition withChips: xChips	! !


!TerniLapilli methodsFor: 'Sliding' stamp: 'n 5/25/2019 16:34:56'!
move: aChipPosition to: otherChipPosition
	self canMakeMovement.
	self isOcupied: aChipPosition.
	self isNotOcupied: otherChipPosition.
	self isValid: otherChipPosition.
	self isValidMovementFrom: aChipPosition to: otherChipPosition.
	nextPlayer move: aChipPosition to: otherChipPosition in: self! !

!TerniLapilli methodsFor: 'Sliding' stamp: 'n 5/25/2019 16:34:41'!
moveO: aChipPosition to: otherChipPosition

	self moving: aChipPosition to: otherChipPosition chips: oChips  nextPlayer: XPlayer new.! !

!TerniLapilli methodsFor: 'Sliding' stamp: 'n 5/25/2019 16:34:23'!
moveX: aChipPosition to: otherChipPosition
	self moving: aChipPosition to: otherChipPosition chips: xChips  nextPlayer: OPlayer new.! !

!TerniLapilli methodsFor: 'Sliding' stamp: 'n 5/25/2019 16:36:57'!
moving: aChipPosition to: otherChipPosition chips: aChipsCollection nextPlayer: aPlayer

	(aChipsCollection includes: aChipPosition) ifTrue: [aChipsCollection remove: aChipPosition.
	self playIn: otherChipPosition.
	self changePlayer: aPlayer.]
	ifFalse: [self error: 'Esta ficha no la podes mover'].! !


!TerniLapilli methodsFor: 'CheckPosotion' stamp: 'n 5/25/2019 16:37:52'!
isNotOcupied: aChipPosition

	^ ((xChips includes: aChipPosition) or: (oChips includes: aChipPosition)) ifTrue: [self error: 'Posición Ocupada'].! !

!TerniLapilli methodsFor: 'CheckPosotion' stamp: 'n 5/25/2019 16:38:05'!
isOcupied: aChipPosition

	^ ((xChips includes: aChipPosition) or: (oChips includes: aChipPosition)) ifFalse: [self error: 'Posición Desocupada'].! !

!TerniLapilli methodsFor: 'CheckPosotion' stamp: 'n 5/26/2019 20:17:32'!
isValid: aChipPosition

	^ (aChipPosition between: 0@0 and: 2@2) ifFalse: [self error: 'Posición Inválida'].
! !


!TerniLapilli methodsFor: 'Observadores' stamp: 'n 5/25/2019 16:13:50'!
nextPlayer

	^nextPlayer ! !

!TerniLapilli methodsFor: 'Observadores' stamp: 'n 5/25/2019 16:13:55'!
oChips
	^ oChips.! !

!TerniLapilli methodsFor: 'Observadores' stamp: 'n 5/25/2019 16:14:02'!
xChips

	^ xChips.! !


!TerniLapilli methodsFor: 'CheckMovements' stamp: 'n 5/25/2019 16:13:44'!
canMakeMovement

	^ ((xChips size = 3) and: (oChips size = 3)) ifFalse: [self error: 'Todavía no se puede efectuar este mvimiento']! !

!TerniLapilli methodsFor: 'CheckMovements' stamp: 'n 5/25/2019 16:38:49'!
isValidMovementFrom: aChipPosition to: otherChipPosition

	^ ((aChipPosition dist: otherChipPosition) = 1) ifFalse: [self error: 'Movimiento Invá¡lido'].! !


!TerniLapilli methodsFor: 'CheckState' stamp: 'n 5/25/2019 16:12:57'!
boardIsEmpty

	^ (self xChips size =0) and: (self oChips size =0).! !

!TerniLapilli methodsFor: 'CheckState' stamp: 'n 5/25/2019 16:13:03'!
finished

	^((self won: xChips )or: (self won: oChips)).! !

!TerniLapilli methodsFor: 'CheckState' stamp: 'n 5/25/2019 16:13:08'!
isNotFinished

	^((self won: xChips )or: (self won: oChips)) ifTrue: [self error: 'Juego terminado'].! !

!TerniLapilli methodsFor: 'CheckState' stamp: 'n 5/25/2019 16:40:10'!
won: aChipCollection

	|chipNumber1 chipNumber2 chipNumber3|
		
	aChipCollection sort.
	aChipCollection size < 3 ifTrue: [^false].
	chipNumber1 _ aChipCollection at: 1.
	chipNumber2 _ aChipCollection at: 2.
	chipNumber3 _ aChipCollection at: 3.
	
	^(chipNumber1 x = chipNumber2 x and: chipNumber1 x = chipNumber3 x) or:
	(chipNumber1 y = chipNumber2 y and: chipNumber1 y = chipNumber3 y) or:
	(((chipNumber1 x isNotEqualTo: chipNumber2 x) and: (chipNumber1 x isNotEqualTo: chipNumber3 x) and: (chipNumber3 x isNotEqualTo: chipNumber2 x)) and:
		(chipNumber1 y isNotEqualTo: chipNumber2 y) and: (chipNumber1 y isNotEqualTo: chipNumber3 y) and: (chipNumber3 y isNotEqualTo: chipNumber2 y) and:(chipNumber1 dist: chipNumber2) = (chipNumber2 dist: chipNumber3)) .! !


!classDefinition: #TerniLapilliPlayer category: #TerniLapilli!
Object subclass: #TerniLapilliPlayer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliPlayer methodsFor: 'as yet unclassified' stamp: 'n 5/25/2019 16:20:40'!
move: unPunto to: otroPunto in: aTerniCapilliGame

	self subclassResponsibility! !

!TerniLapilliPlayer methodsFor: 'as yet unclassified' stamp: 'n 5/25/2019 16:20:35'!
play: unPunto in: aTerniCapilliGame

	self subclassResponsibility.
	! !


!classDefinition: #OPlayer category: #TerniLapilli!
TerniLapilliPlayer subclass: #OPlayer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!OPlayer methodsFor: 'as yet unclassified' stamp: 'n 5/25/2019 16:20:59'!
move: unPunto to: otroPunto in: aTerniCapilliGame

	aTerniCapilliGame moveO: unPunto to: otroPunto.
	aTerniCapilliGame changePlayer: XPlayer new.! !

!OPlayer methodsFor: 'as yet unclassified' stamp: 'n 5/25/2019 16:36:46'!
play: unPunto in: aTerniCapilliGame

	aTerniCapilliGame oPlaysIn: unPunto.
	aTerniCapilliGame changePlayer: XPlayer new.! !


!classDefinition: #XPlayer category: #TerniLapilli!
TerniLapilliPlayer subclass: #XPlayer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!XPlayer methodsFor: 'as yet unclassified' stamp: 'n 5/25/2019 16:21:07'!
move: unPunto to: otroPunto in: aTerniCapilliGame

	aTerniCapilliGame moveX: unPunto to: otroPunto.
	aTerniCapilliGame changePlayer: OPlayer new.! !

!XPlayer methodsFor: 'as yet unclassified' stamp: 'n 5/25/2019 16:37:26'!
play: unPunto in: aTerniCapilliGame

	aTerniCapilliGame xPlaysIn: unPunto.
	aTerniCapilliGame changePlayer: OPlayer new.! !


!classDefinition: #TerniLapilliState category: #TerniLapilli!
Object subclass: #TerniLapilliState
	instanceVariableNames: 'aTerniLapilliGame'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'JJ 10/17/2019 12:59:32'!
initializeFor:aTerniLapilli
	aTerniLapilliGame := aTerniLapilli.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliState class' category: #TerniLapilli!
TerniLapilliState class
	instanceVariableNames: ''!

!TerniLapilliState class methodsFor: 'instance creation' stamp: 'JJ 10/17/2019 13:00:57'!
for: aTerniLapilli
	^self new initializeFor:aTerniLapilli.! !


!TerniLapilliState class methodsFor: 'state selection' stamp: 'JJ 10/17/2019 13:00:34'!
canHandle: aTernilapilli
	self subclassResponsibility.! !

!TerniLapilliState class methodsFor: 'state selection' stamp: 'JJ 10/17/2019 13:01:34'!
stateFor: aTerniLapilli

	^(self subclasses detect: [:aTerniLapilliStateClass | aTerniLapilliStateClass canHandle: aTerniLapilli ]) for: aTerniLapilli! !
