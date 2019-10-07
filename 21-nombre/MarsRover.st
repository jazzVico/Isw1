!classDefinition: #MarsRoverTest category: #MarsRover!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/5/2019 10:07:42'!
marsRover:aMarsRover ShouldBeAtPosition: aPoint WithDirection: aDirection

	self assert: (aMarsRover position = aPoint).
	self assert: (aMarsRover direction = aDirection).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:24'!
test01EmptyStringMantainsPosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: 'N'.
	
	aMarsRover doActions: ''.

	self marsRover:aMarsRover ShouldBeAtPosition: (0@0) WithDirection: 'N'.	
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:24'!
test02MovingFowardatOriginFacingNorthWillUpdatePosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: 'N'.
	
	aMarsRover doActions: 'f'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (0@1) WithDirection: 'N'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:24'!
test03MovingBackwardFacingNorthWillUpdatePosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: 'N'.
	
	aMarsRover doActions: 'b'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (0@-1) WithDirection: 'N'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:23'!
test04RotateLeftWhileFacingNorthWillFaceWest
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: 'N'.
	
	aMarsRover doActions: 'l'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (0@0) WithDirection: 'W'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:24'!
test05RotateRightWhileFacingNorthWillFaceEast

	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: 'N'.
	
	aMarsRover doActions: 'r'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (0@0) WithDirection: 'E'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:24'!
test06MovingFowardAwayFromOriginFacingNorthWillUpdatePosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 5@5 facing: 'N'.
	
	aMarsRover doActions: 'f'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (5@6) WithDirection: 'N'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:23'!
test07MovingBackwardAwayFromOriginFacingNorthWillUpdatePosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 5@5 facing: 'N'.
	
	aMarsRover doActions: 'b'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (5@4) WithDirection: 'N'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:24'!
test08MovingFowardFacingEastWillUpdatePosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 5@5 facing: 'E'.
	
	aMarsRover doActions: 'f'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (6@5) WithDirection: 'E'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:23'!
test09MovingFowardFacingWeastWillUpdatePosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 5@5 facing: 'W'.
	
	aMarsRover doActions: 'f'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (4@5) WithDirection: 'W'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:23'!
test10MovingFowardFacingSouthWillUpdatePosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 5@5 facing: 'S'.
	
	aMarsRover doActions: 'f'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (5@4) WithDirection: 'S'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:24'!
test11MovingBackwardFacingEastWillUpdatePosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 5@5 facing: 'E'.
	
	aMarsRover doActions: 'b'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (4@5) WithDirection: 'E'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:24'!
test12MovingBackwardFacingWeastWillUpdatePosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 5@5 facing: 'W'.
	
	aMarsRover doActions: 'b'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (6@5) WithDirection: 'W'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:23'!
test13MovingFowardFacingSouthWillUpdatePosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 5@5 facing: 'S'.
	
	aMarsRover doActions: 'b'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (5@6) WithDirection: 'S'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:24'!
test14RotateLeftWhileFacingWestWillFaceSouth
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: 'W'.
	
	aMarsRover doActions: 'l'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (0@0) WithDirection: 'S'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:24'!
test15RotateLeftWhileFacingSouthWillFaceEast
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: 'S'.
	
	aMarsRover doActions: 'l'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (0@0) WithDirection: 'E'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:23'!
test16RotateLeftWhileFacingEastWillFaceNorth
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: 'E'.
	
	aMarsRover doActions: 'l'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (0@0) WithDirection: 'N'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:23'!
test17RotateRightWhileFacingWestWillFaceNorth
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: 'W'.
	
	aMarsRover doActions: 'r'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (0@0) WithDirection: 'N'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:24'!
test18RotateRightWhileFacingSouthWillFaceWest
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: 'S'.
	
	aMarsRover doActions: 'r'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (0@0) WithDirection: 'W'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:23'!
test19RotateRightWhileFacingEastWillFaceSouth
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: 'E'.
	
	aMarsRover doActions: 'r'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (0@0) WithDirection: 'S'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:24'!
test20MoveThreeTimesFowardAndOnceBackWillUpdatePosition
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: 'E'.
	
	aMarsRover doActions: 'fffb'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (2@0) WithDirection: 'E'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:24'!
test21MoveThreeTimesFowardAndOnceBackWillUpdatePosition
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: 'E'.
	
	aMarsRover doActions: 'fffb'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (2@0) WithDirection: 'E'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:24'!
test22MoveThreeTimesFowardRotateLeftAndOnceBackWillUpdatePosition
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: 'E'.
	
	aMarsRover doActions: 'ffflb'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (3@-1) WithDirection: 'N'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 09:44:24'!
test23MoveThreeTimesFowardRotateTwoTimesLeftAndOnceBackWillUpdatePosition
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: 'E'.
	
	aMarsRover doActions: 'fffllb'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (4@0) WithDirection: 'W'.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'J 10/6/2019 10:31:52'!
test24MoveThreeTimesFowardWrongStringRotateTwoTimesLeftAndOnceBackWillUpdatePosition
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: 'E'.
	
	
	self should: [aMarsRover doActions: 'fffsllb'.]
		 raise: Error - MessageNotUnderstood 
		description:  'There was an invalid command'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (3@0) WithDirection: 'E'.! !


!classDefinition: #MarsRover category: #MarsRover!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction validCommands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'J 10/6/2019 10:28:00'!
initializeAtPosition: aPoint facing: aDirection
	position := aPoint.
	direction := aDirection.
	validCommands := #($r $l $f $b).! !


!MarsRover methodsFor: 'private' stamp: 'J 10/6/2019 08:58:16'!
moveBackward.
	direction = 'N' ifTrue:[
		position :=  position + (0@-1).
		].
	direction = 'S' ifTrue:[
		position :=  position + (0@1).
		].
	direction = 'E' ifTrue:[
		position :=  position + (-1@0).
		].
	direction = 'W' ifTrue:[
		position :=  position + (1@0).
		].
! !

!MarsRover methodsFor: 'private' stamp: 'J 10/6/2019 08:57:01'!
moveFoward
	direction = 'N' ifTrue:[
					position :=  position + (0@1).
					].
	direction = 'S' ifTrue:[
		position :=  position + (0@-1).
		].
	direction = 'E' ifTrue:[
		position :=  position + (1@0).
		].
	direction = 'W' ifTrue:[
		position :=  position + (-1@0).
		].! !

!MarsRover methodsFor: 'private' stamp: 'J 10/6/2019 09:02:03'!
rotateLeft
	|aDirectionToUpdate|

	direction = 'N' ifTrue:[
		aDirectionToUpdate := 'W'.
		].
	direction = 'W' ifTrue:[
		aDirectionToUpdate := 'S'.
		].
	direction = 'S' ifTrue:[
		aDirectionToUpdate := 'E'.
		].
	direction = 'E' ifTrue:[
		aDirectionToUpdate := 'N'.
		].
	direction := aDirectionToUpdate.! !

!MarsRover methodsFor: 'private' stamp: 'J 10/6/2019 09:03:04'!
rotateRight
| aDirectionToUpdate |
	direction = 'N' ifTrue:[
		aDirectionToUpdate := 'E'.
		].
	direction = 'S' ifTrue:[
		aDirectionToUpdate := 'W'.
		].
	direction = 'E' ifTrue:[
		aDirectionToUpdate := 'S'.
		].
	direction = 'W' ifTrue:[
		aDirectionToUpdate := 'N'.
		].
	direction := aDirectionToUpdate.
! !


!MarsRover methodsFor: 'accessing' stamp: 'J 10/5/2019 09:58:02'!
direction
	^direction! !

!MarsRover methodsFor: 'accessing' stamp: 'J 10/5/2019 09:57:18'!
position
	^position! !


!MarsRover methodsFor: 'valid Command' stamp: 'J 10/6/2019 10:00:52'!
isValidCommand: aCommand 
	^ validCommands includes: aCommand.! !


!MarsRover methodsFor: 'read Commands' stamp: 'J 10/6/2019 09:44:49'!
doAction: aCommand
	aCommand = $f ifTrue:[
			self moveFoward.
			].
	aCommand = $b ifTrue:[
			self moveBackward.
			].
	aCommand = $l ifTrue:[
			self rotateLeft.
			].
	aCommand = $r ifTrue:[
			self rotateRight.
		 ].
! !

!MarsRover methodsFor: 'read Commands' stamp: 'J 10/6/2019 10:01:17'!
doActions: aCommandSequence

	aCommandSequence do: [:aCommand |
		(self isValidCommand: aCommand) ifFalse:[^self error: self class anInvalidCommandErrorDescription].
		self doAction: aCommand.
		].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRover!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'J 10/6/2019 10:07:26'!
anInvalidCommandErrorDescription
	^ 'There was an invalid command'.! !

!MarsRover class methodsFor: 'initialization' stamp: 'J 10/5/2019 09:56:47'!
at: aPoint facing: aDirection 
	^self new initializeAtPosition: aPoint facing: aDirection.! !


!classDefinition: #MarsRoverState category: #MarsRover!
Object subclass: #MarsRoverState
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverState methodsFor: 'initialization' stamp: 'J 10/6/2019 09:29:51'!
initializeFor: aMarsRover
	marsRover := aMarsRover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverState class' category: #MarsRover!
MarsRoverState class
	instanceVariableNames: ''!

!MarsRoverState class methodsFor: 'instance creation' stamp: 'J 10/6/2019 09:30:57'!
for: aMarsRover
	^self new initializeFor: aMarsRover.! !


!MarsRoverState class methodsFor: 'state selection' stamp: 'J 10/6/2019 09:30:27'!
canHandle: aMarsRover
	self subclassResponsibility.! !

!MarsRoverState class methodsFor: 'state selection' stamp: 'J 10/6/2019 09:31:48'!
stateFor: aMarsRover
	^(self subclasses detect: [:aStackStateClass | aStackStateClass canHandle: aMarsRover ]) for: aMarsRover! !


!classDefinition: #EastFacingMarsRoverState category: #MarsRover!
MarsRoverState subclass: #EastFacingMarsRoverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EastFacingMarsRoverState class' category: #MarsRover!
EastFacingMarsRoverState class
	instanceVariableNames: ''!

!EastFacingMarsRoverState class methodsFor: 'state selection' stamp: 'J 10/6/2019 09:38:15'!
canHandle: aMarsRover
	^aMarsRover direction = 'E'.! !


!classDefinition: #NorthFacingMarsRoverState category: #MarsRover!
MarsRoverState subclass: #NorthFacingMarsRoverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NorthFacingMarsRoverState class' category: #MarsRover!
NorthFacingMarsRoverState class
	instanceVariableNames: ''!

!NorthFacingMarsRoverState class methodsFor: 'state selection' stamp: 'J 10/6/2019 09:38:28'!
canHandle: aMarsRover
	^aMarsRover direction = 'N'.! !


!classDefinition: #SouthFacingMarsRoverState category: #MarsRover!
MarsRoverState subclass: #SouthFacingMarsRoverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SouthFacingMarsRoverState class' category: #MarsRover!
SouthFacingMarsRoverState class
	instanceVariableNames: ''!

!SouthFacingMarsRoverState class methodsFor: 'state selection' stamp: 'J 10/6/2019 09:39:07'!
canHandle: aMarsRover
	^aMarsRover direction = 'S'.! !


!classDefinition: #WestFacingMarsRoverState category: #MarsRover!
MarsRoverState subclass: #WestFacingMarsRoverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WestFacingMarsRoverState class' category: #MarsRover!
WestFacingMarsRoverState class
	instanceVariableNames: ''!

!WestFacingMarsRoverState class methodsFor: 'state selection' stamp: 'J 10/6/2019 09:39:30'!
canHandle: aMarsRover
	^aMarsRover direction = 'W'.! !
