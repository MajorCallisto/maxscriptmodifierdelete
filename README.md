# Maxscript Modifier Delete

A Maxscript Utility for deleting modifiers across multiple selected items

## Installation

- Clone the repo
- Run the maxscript file
- Customize > Customize User Interface or right-click > Customize on the tool ribbon
- Select Category > Major Callisto
- Click and drag the Modifier-Delete action to the appropriate menu - I tend to use Default Viewport Quad to right-click in the views and select the utility

## Use

On launching the utility, the rollout will display. It will automatically try to load modifiers from the selection at launch.

When the selected meshes change, the utility needs to automatically be refreshed using the _Refresh_ button.

Select the modifiers you want to delete and click the _Delete_ button.

Multiple modifiers can be selected at once using the ctrl and/or select key.

**_Warning_** the tool deletes modifiers _by name_ - if multiple modifiers in the stack have the same name, they will all be deleted; e.g. 5 Edit Poly mods in the stack will all be deleted.
