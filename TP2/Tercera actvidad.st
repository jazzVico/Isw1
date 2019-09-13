!classDefinition: #AlanKay category: #'Tercera actvidad'!
DenotativeObject subclass: #AlanKay
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tercera actvidad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AlanKay class' category: #'Tercera actvidad'!
AlanKay class
	instanceVariableNames: 'currentCompany'!

!AlanKay class methodsFor: 'as yet unclassified' stamp: 'J 8/15/2019 21:03:31'!
dateOfBirth
	^May/17/1940! !

!AlanKay class methodsFor: 'as yet unclassified' stamp: 'jj 8/26/2019 18:16:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	currentCompany := nil.! !


!classDefinition: #AlanTuring category: #'Tercera actvidad'!
DenotativeObject subclass: #AlanTuring
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tercera actvidad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AlanTuring class' category: #'Tercera actvidad'!
AlanTuring class
	instanceVariableNames: ''!

!AlanTuring class methodsFor: 'personal info' stamp: 'J 8/21/2019 18:58:50'!
dateOfBirth

	^June/23/1912! !

!AlanTuring class methodsFor: 'personal info' stamp: 'J 8/21/2019 18:41:49'!
doesNotUnderstand: aMessage

	^ ('No entiendo a que te referis con ', aMessage name)! !


!classDefinition: #AlonsoChurch category: #'Tercera actvidad'!
DenotativeObject subclass: #AlonsoChurch
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tercera actvidad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AlonsoChurch class' category: #'Tercera actvidad'!
AlonsoChurch class
	instanceVariableNames: ''!

!AlonsoChurch class methodsFor: 'as yet unclassified' stamp: 'J 8/15/2019 21:45:08'!
ageDifferenceWith: otherPerson
	
	^  (self dateOfBirth) distanceTo: (otherPerson dateOfBirth) ! !

!AlonsoChurch class methodsFor: 'as yet unclassified' stamp: 'J 8/15/2019 21:10:36'!
ageDifferenceWithAlanTuring
	
	^ (self dateOfBirth) distanceTo: (AlanTuring dateOfBirth)! !

!AlonsoChurch class methodsFor: 'as yet unclassified' stamp: 'J 8/15/2019 20:55:56'!
dateOfBirth
	^June/14/1903! !

!AlonsoChurch class methodsFor: 'as yet unclassified' stamp: 'jj 8/22/2019 21:02:41'!
isBiggerThan:aPerson
	^(self ageDifferenceWith:aPerson)positive! !

!AlonsoChurch class methodsFor: 'as yet unclassified' stamp: 'jj 8/22/2019 21:04:44'!
m1:collaborator1
	||
	^thisContext! !


!classDefinition: #DanIngalls category: #'Tercera actvidad'!
DenotativeObject subclass: #DanIngalls
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tercera actvidad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DanIngalls class' category: #'Tercera actvidad'!
DanIngalls class
	instanceVariableNames: ''!

!DanIngalls class methodsFor: 'as yet unclassified' stamp: 'J 8/15/2019 21:15:09'!
dateOfBirth
	^October/6/1944! !


!classDefinition: #mulaConAlforja category: #'Tercera actvidad'!
DenotativeObject subclass: #mulaConAlforja
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tercera actvidad'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'mulaConAlforja class' category: #'Tercera actvidad'!
mulaConAlforja class
	instanceVariableNames: ''!

!mulaConAlforja class methodsFor: 'as yet unclassified' stamp: 'J 8/15/2019 20:11:05'!
asHtml! !

!mulaConAlforja class methodsFor: 'as yet unclassified' stamp: 'J 8/15/2019 20:11:19'!
asJson! !

!mulaConAlforja class methodsFor: 'as yet unclassified' stamp: 'J 8/15/2019 20:01:07'!
break! !

!mulaConAlforja class methodsFor: 'as yet unclassified' stamp: 'J 8/15/2019 20:03:44'!
openTrunk! !

!mulaConAlforja class methodsFor: 'as yet unclassified' stamp: 'J 8/15/2019 20:11:14'!
save! !

!mulaConAlforja class methodsFor: 'as yet unclassified' stamp: 'J 8/15/2019 20:00:57'!
speedUp! !

!mulaConAlforja class methodsFor: 'as yet unclassified' stamp: 'J 8/15/2019 20:00:39'!
turnOff! !

!mulaConAlforja class methodsFor: 'as yet unclassified' stamp: 'J 8/15/2019 19:59:18'!
turnOn! !

AlanKay initializeAfterFileIn!