-- Christopher Lewis
-- majorcallisto.com
-- version 1.0
-- Copyright [yyyy] [name of copyright owner]

-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at

-- http://www.apache.org/licenses/LICENSE-2.0

-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

macroScript ModifierDeleter
category:"Major Callisto"
toolTip:"Modifier-Delete"
icon:#( "Modifier-Delete", 1 )
(
	fn getSelectedModifiers = (
		modList = #( )
		for theNode in selection do (
			for index = theNode.modifiers.count to 1 by -1 do (
				appendIfUnique modList theNode.modifiers[index].name
				print theNode.modifiers[index].name
			)
		)
		sort modList
		return modList
	)
	
	fn deleteModifiers deleteList = (
		for item in deleteList do (
			
			mlbSelectedName = sceneSelectedList[item]
			print mlbSelectedName
			for theNode in selection do (
				for index = theNode.modifiers.count to 1 by -1 do (
					
					--format "The Name: % - mlbName % - equals - %\n" theNode.modifiers[index].name mlbSelectedName (theNode.modifiers[index].name == mlbSelectedName)
					
					if theNode.modifiers[index].name == mlbSelectedName do (
						deleteModifier theNode index
					)
					
				)
			)
		)
	)
	
	
	fn resetListbox mlb = (
		sceneSelectedList = getSelectedModifiers()
		
		mlb.items = sceneSelectedList
		mlb.selection = #( )
	)

	rolloutW = 180
	rolloutH = 300
	padding = 10

	sceneSelectedList = getSelectedModifiers()
	
	rollout mdRollout "Modifier Delete" (
		label labelIntro "Generates a list of all modifiers in selection and lets you delete them. Use ctrl to select multiple" width:( rolloutW - padding * 2 ) height:28 pos:[padding, padding]
		multiListBox mlb "Modifiers in Selected" items:sceneSelectedList selection:#( )
		button btnDeleteModifier "Delete" enabled:false
		button btnRefresh "Refresh"
		label aboutLabel "majorcallisto.com"
		
		on mlb selected val do (
			format "selected: % - %\n" val mlb.items[val]
			format "count %\n" ( mlb.selection.numberSet )
			if ( mlb.selection.numberSet > 0 ) then (
				btnDeleteModifier.enabled = true
			) else (
				btnDeleteModifier.enabled = false
			)
		)
		
		on btnRefresh pressed do (
			resetListbox mlb
		)
		on btnDeleteModifier pressed do (
			btnDeleteModifier.enabled = false
			deleteModifiers mlb.selection
			resetListbox mlb
		)
	)


	createDialog mdRollout rolloutW rolloutH
)