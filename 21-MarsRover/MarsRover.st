!classDefinition: #MarsRoverTest category: #MarsRover!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'north south east west'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'assertions' stamp: 'J 10/8/2019 20:04:33'!
marsRover:aMarsRover ShouldBeAtPosition: aPoint WithDirection: aDirection

	self assert:  aPoint equals: aMarsRover position.
	self assert: aDirection equals: aMarsRover direction.! !


!MarsRoverTest methodsFor: 'setUp/tearDown' stamp: 'J 10/8/2019 20:27:47'!
setUp
	north := North new.
	south := South new.
	east := East new.
	west := West new.! !


!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:20:59'!
test01EmptyStringMantainsPosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: north.
	
	aMarsRover doActions: ''.

	self marsRover:aMarsRover ShouldBeAtPosition: (0@0) WithDirection: north.	
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:21:17'!
test02MovingFowardatOriginFacingNorthWillUpdatePosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: north.
	
	aMarsRover doActions: 'f'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (0@1) WithDirection: north.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:21:35'!
test03MovingBackwardFacingNorthWillUpdatePosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: north.
	
	aMarsRover doActions: 'b'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (0@-1) WithDirection: north.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:22:35'!
test04RotateLeftWhileFacingNorthWillFaceWest
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: north.
	
	aMarsRover doActions: 'l'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (0@0) WithDirection: west.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:22:46'!
test05RotateRightWhileFacingNorthWillFaceEast

	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: north.
	
	aMarsRover doActions: 'r'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (0@0) WithDirection: east.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:22:55'!
test06MovingFowardAwayFromOriginFacingNorthWillUpdatePosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 5@5 facing: north.
	
	aMarsRover doActions: 'f'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (5@6) WithDirection: north.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:23:04'!
test07MovingBackwardAwayFromOriginFacingNorthWillUpdatePosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 5@5 facing: north.
	
	aMarsRover doActions: 'b'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (5@4) WithDirection: north.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:23:13'!
test08MovingFowardFacingEastWillUpdatePosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 5@5 facing: east.
	
	aMarsRover doActions: 'f'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (6@5) WithDirection: east.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:23:36'!
test09MovingFowardFacingWeastWillUpdatePosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 5@5 facing: west.
	
	aMarsRover doActions: 'f'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (4@5) WithDirection: west.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:23:48'!
test10MovingFowardFacingSouthWillUpdatePosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 5@5 facing: south.
	
	aMarsRover doActions: 'f'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (5@4) WithDirection: south.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:24:00'!
test11MovingBackwardFacingEastWillUpdatePosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 5@5 facing: east.
	
	aMarsRover doActions: 'b'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (4@5) WithDirection: east.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:24:52'!
test12MovingBackwardFacingWeastWillUpdatePosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 5@5 facing: west.
	
	aMarsRover doActions: 'b'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (6@5) WithDirection: west.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:25:02'!
test13MovingFowardFacingSouthWillUpdatePosition

	|aMarsRover|
	
	aMarsRover := MarsRover at: 5@5 facing: south.
	
	aMarsRover doActions: 'b'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (5@6) WithDirection: south.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:25:15'!
test14RotateLeftWhileFacingWestWillFaceSouth
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: west.
	
	aMarsRover doActions: 'l'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (0@0) WithDirection: south.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:25:29'!
test15RotateLeftWhileFacingSouthWillFaceEast
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: south.
	
	aMarsRover doActions: 'l'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (0@0) WithDirection: east.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:27:13'!
test16RotateLeftWhileFacingEastWillFaceNorth
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: east.
	
	aMarsRover doActions: 'l'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (0@0) WithDirection: north.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:27:22'!
test17RotateRightWhileFacingWestWillFaceNorth
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: west.
	
	aMarsRover doActions: 'r'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (0@0) WithDirection: north.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:27:53'!
test18RotateRightWhileFacingSouthWillFaceWest
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: south.
	
	aMarsRover doActions: 'r'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (0@0) WithDirection: west.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:28:13'!
test19RotateRightWhileFacingEastWillFaceSouth
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: east.
	
	aMarsRover doActions: 'r'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (0@0) WithDirection: south.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:28:35'!
test20MoveThreeTimesFowardAndOnceBackWillUpdatePosition
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: east.
	
	aMarsRover doActions: 'fffb'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (2@0) WithDirection: east.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:28:44'!
test21MoveThreeTimesFowardAndOnceBackWillUpdatePosition
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: east.
	
	aMarsRover doActions: 'fffb'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (2@0) WithDirection: east.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:29:13'!
test22MoveThreeTimesFowardRotateLeftAndOnceBackWillUpdatePosition
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: east.
	
	aMarsRover doActions: 'ffflb'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (3@-1) WithDirection: north.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:29:22'!
test23MoveThreeTimesFowardRotateTwoTimesLeftAndOnceBackWillUpdatePosition
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: east.
	
	aMarsRover doActions: 'fffllb'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (4@0) WithDirection: west.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'J 10/9/2019 11:30:07'!
test24MoveThreeTimesFowardWrongStringRotateTwoTimesLeftAndOnceBackWillUpdatePosition
	|aMarsRover|
	
	aMarsRover := MarsRover at: 0@0 facing: east.
	
	
	self should: [aMarsRover doActions: 'fffsllb'.]
		 raise: Error - MessageNotUnderstood 
		description:  'There was an invalid command'.
	
	self marsRover:aMarsRover ShouldBeAtPosition: (3@0) WithDirection: east.! !


!classDefinition: #CardinalPoint category: #MarsRover!
Object subclass: #CardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalPoint class' category: #MarsRover!
CardinalPoint class
	instanceVariableNames: 'uniqueInstance'!

!CardinalPoint class methodsFor: 'as yet unclassified' stamp: 'J 10/8/2019 20:18:20'!
l
	^self subclassResponsibility .! !

!CardinalPoint class methodsFor: 'as yet unclassified' stamp: 'J 10/8/2019 20:18:18'!
r
	^self subclassResponsibility .! !


!classDefinition: #East category: #MarsRover!
CardinalPoint subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'as yet unclassified' stamp: 'J 10/9/2019 11:43:32'!
l
	^North new.! !

!East methodsFor: 'as yet unclassified' stamp: 'J 10/9/2019 11:43:46'!
r
	^South new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: #MarsRover!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'as yet unclassified' stamp: 'J 10/9/2019 11:06:47'!
initialize
	uniqueInstance := self basicNew.! !

!East class methodsFor: 'as yet unclassified' stamp: 'J 10/9/2019 11:07:23'!
new
	^uniqueInstance.! !


!classDefinition: #North category: #MarsRover!
CardinalPoint subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'as yet unclassified' stamp: 'J 10/9/2019 11:35:26'!
l
		^West new.! !

!North methodsFor: 'as yet unclassified' stamp: 'J 10/9/2019 11:35:31'!
r
		^East new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: #MarsRover!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'as yet unclassified' stamp: 'J 10/9/2019 11:06:52'!
initialize
	uniqueInstance := self basicNew.! !

!North class methodsFor: 'as yet unclassified' stamp: 'J 10/9/2019 11:07:29'!
new
	^uniqueInstance.! !


!classDefinition: #South category: #MarsRover!
CardinalPoint subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'as yet unclassified' stamp: 'J 10/9/2019 11:35:57'!
l
	^East new.! !

!South methodsFor: 'as yet unclassified' stamp: 'J 10/9/2019 11:36:02'!
r
	^West new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'South class' category: #MarsRover!
South class
	instanceVariableNames: ''!

!South class methodsFor: 'as yet unclassified' stamp: 'J 10/9/2019 11:07:01'!
initialize
	uniqueInstance := self basicNew.! !

!South class methodsFor: 'as yet unclassified' stamp: 'J 10/9/2019 11:07:37'!
new
	^uniqueInstance.! !


!classDefinition: #West category: #MarsRover!
CardinalPoint subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'as yet unclassified' stamp: 'J 10/9/2019 11:44:34'!
l
	^South new.! !

!West methodsFor: 'as yet unclassified' stamp: 'J 10/9/2019 11:44:45'!
r
	^North new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'West class' category: #MarsRover!
West class
	instanceVariableNames: ''!

!West class methodsFor: 'as yet unclassified' stamp: 'J 10/9/2019 11:07:09'!
initialize
	uniqueInstance := self basicNew.! !

!West class methodsFor: 'as yet unclassified' stamp: 'J 10/9/2019 11:07:42'!
new
	^uniqueInstance.! !


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


!MarsRover methodsFor: 'private' stamp: 'J 10/9/2019 11:41:42'!
moveBackward.
	direction = (North new) ifTrue:[
		position :=  position + (0@-1).
		].
	direction = (South new) ifTrue:[
		position :=  position + (0@1).
		].
	direction = (East new) ifTrue:[
		position :=  position + (-1@0).
		].
	direction = (West new) ifTrue:[
		position :=  position + (1@0).
		].! !

!MarsRover methodsFor: 'private' stamp: 'J 10/9/2019 11:41:51'!
moveFoward
	direction = (North new) ifTrue:[
		position :=  position + (0@1).
		].
	direction = (South new) ifTrue:[
		position :=  position + (0@-1).
		].
	direction = (East new) ifTrue:[
		position :=  position + (1@0).
		].
	direction = (West new) ifTrue:[
		position :=  position + (-1@0).
		].! !

!MarsRover methodsFor: 'private' stamp: 'J 10/9/2019 11:54:42'!
rotate: aCommand
	 direction := (aCommand asSymbol asMessage) sendTo: direction .! !

!MarsRover methodsFor: 'private' stamp: 'J 10/9/2019 11:34:01'!
rotateLeft
 direction := direction l.! !

!MarsRover methodsFor: 'private' stamp: 'J 10/9/2019 11:34:26'!
rotateRight
 direction := direction r.! !


!MarsRover methodsFor: 'accessing' stamp: 'J 10/5/2019 09:58:02'!
direction
	^direction! !

!MarsRover methodsFor: 'accessing' stamp: 'J 10/5/2019 09:57:18'!
position
	^position! !


!MarsRover methodsFor: 'valid Command' stamp: 'J 10/6/2019 10:00:52'!
isValidCommand: aCommand 
	^ validCommands includes: aCommand.! !


!MarsRover methodsFor: 'read Commands' stamp: 'J 10/9/2019 11:53:28'!
doAction: aCommand
	aCommand = $f ifTrue:[
			self moveFoward.
			].
	aCommand = $b ifTrue:[
			self moveBackward.
			].
	aCommand = $l ifTrue:[
			self rotate: aCommand.
			].
	aCommand = $r ifTrue:[
			self rotate: aCommand.
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

East initialize!
North initialize!
South initialize!
West initialize!