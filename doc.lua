digtron.doc = {}

if not minetest.get_modpath("doc") then
	return
end

-- internationalization boilerplate
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

local pipeworks_enabled = minetest.get_modpath("pipeworks") ~= nil
local hoppers_enabled = minetest.get_modpath("hopper") and hopper ~= nil and hopper.add_container ~= nil

digtron.doc.core_longdesc = S("A crafting component used in the manufacture of all Digtron block types.")
digtron.doc.core_usagehelp = S("Place the Digtron Core in the center of the crafting grid. All Digtron recipes consist of arranging various other materials around the central Digtron Core.")

--------------------------------------------------------------------

digtron.doc.builder_longdesc = S("A 'builder' module for a Digtron. By itself it does nothing, but as part of a Digtron it is used to construct user-defined blocks.")
digtron.doc.builder_usagehelp = S("A builder head is the most complex component of this system. It has period and offset properties, and also an inventory slot where you \"program\" it by placing an example of the block type that you want it to build.")
.."\n\n"..
S("When the \"Save & Show\" button is clicked the properties for period and offset will be saved, and markers will briefly be shown to indicate where the nearest spots corresponding to those values are. The builder will build its output at those locations provided it is moving along the matching axis.")
.."\n\n"..
S("The \"output\" side of a builder is the side with a black crosshair on it.")
.."\n\n"..
S("Builders also have a \"facing\" setting. If you haven't memorized the meaning of the 24 facing values yet, builder heads have a helpful \"Read & Save\" button to fill this value in for you. Simply build a temporary instance of the block in the output location in front of the builder, adjust it to the orientation you want using the screwdriver tool, and then when you click the \"Read & Save\" button the block's facing will be read and saved.")
.."\n\n"..
S("Note: if more than one builder tries to build into the same space simultaneously, it is not predictable which builder will take priority. One will succeed and the other will fail. You should arrange your builders to avoid this for consistent results.")


--------------------------------------------------------------------

digtron.doc.inventory_longdesc = S("Stores building materials for use by builder heads and materials dug up by digger heads.")
digtron.doc.inventory_usagehelp = S("Inventory modules have the same capacity as a chest. They're used both for storing the products of the digger heads and as the source of materials used by the builder heads. A digging machine whose builder heads are laying down cobble can automatically self-replenish in this way, but note that an inventory module is still required as buffer space even if the digger heads produced everything needed by the builder heads in a given cycle.")
.."\n\n"..
S("Inventory modules are not required for a digging-only machine. If there's not enough storage space to hold the materials produced by the digging heads the excess material will be ejected out the back of the control block. They're handy for accumulating ores and other building materials, though.")
.."\n\n"..
S("Digging machines can have multiple inventory modules added to expand their capacity.")

if hoppers_enabled then
	digtron.doc.inventory_usagehelp = digtron.doc.inventory_usagehelp
	.."\n\n"..
	S("Digtron inventory modules are compatible with hoppers, adjacent hoppers will add to or take from their inventories. Hoppers are not part of the Digtron and will not move with it, however. They may be useful for creating a \"docking station\" for a Digtron.")
end

if pipeworks_enabled then
	digtron.doc.inventory_usagehelp = digtron.doc.inventory_usagehelp
	.."\n\n"..
	S("Inventory modules are compatible with Pipeworks blocks. When a Digtron moves one of the inventory modules adjacent to a pipe it will automatically hook up to it, and disconnect again when it moves on.")
end

digtron.doc.fuelstore_longdesc = S("Stores fuel to run a Digtron")
digtron.doc.fuelstore_usagehelp = S("Digtrons have an appetite. Build operations and dig operations require a certain amount of fuel, and that fuel comes from fuel hopper modules. Note that movement does not require fuel, only digging and building.")
.."\n\n"..
S("When a control unit is triggered, it will tally up how much fuel is required for the next cycle and then burn items from the fuel hopper until a sufficient amount of heat has been generated to power the operation. Any leftover heat will be retained by the control unit for use in the next cycle; this is the \"heat remaining in controller furnace\". This means you don't have to worry too much about what kinds of fuel you put in the hopper, none will be wasted (unless you dig away a control unit with some heat remaining in it, that heat does get wasted).")
.."\n\n"..
S("The fuel costs for digging and building can be configured in the init.lua file. By default using one lump of coal as fuel a digtron can:").."\n"..
"\t"..S("Build 40 blocks").."\n"..
"\t"..S("Dig 40 stone blocks").."\n"..
"\t"..S("Dig 60 wood blocks").."\n"..
"\t"..S("Dig 80 dirt or sand blocks")

if hoppers_enabled then
	digtron.doc.fuelstore_usagehelp = digtron.doc.fuelstore_usagehelp
	.."\n\n"..
	S("Digtron fuel store modules are compatible with hoppers, adjacent hoppers will add to or take from their inventories. Hoppers are not part of the Digtron and will not move with it, however. They may be useful for creating a \"docking station\" for a Digtron.")
end

if pipeworks_enabled then
	digtron.doc.fuelstore_usagehelp = digtron.doc.fuelstore_usagehelp
	.."\n\n"..
	S("Fuel modules are compatible with Pipeworks blocks. When a Digtron moves one of the inventory modules adjacent to a pipe it will automatically hook up to it, and disconnect again when it moves on.")
end

digtron.doc.combined_storage_longdesc = S("Stores fuel for a Digtron and also has an inventory for building materials")
digtron.doc.combined_storage_usagehelp = S("For smaller jobs the two dedicated modules may simply be too much of a good thing, wasting precious Digtron space to give unneeded capacity. The combined storage module is the best of both worlds, splitting its internal space between building material inventory and fuel storage. It has 3/4 building material capacity and 1/4 fuel storage capacity.")

if hoppers_enabled then
	digtron.doc.combined_storage_usagehelp = digtron.doc.combined_storage_usagehelp
	.."\n\n"..
	S("Digtron inventory modules are compatible with hoppers, adjacent hoppers will add to or take from their inventories. A hopper on top of a combined inventory module will insert items into its general inventory, a side hopper will insert items into its fuel inventory, and a hopper on the bottom of a combined inventory module will take items from its general inventory. Hoppers are not part of the Digtron and will not move with it, however. They may be useful for creating a \"docking station\" for a Digtron.")
end

if pipeworks_enabled then
	digtron.doc.combined_storage_usagehelp = digtron.doc.combined_storage_usagehelp
	.."\n\n"..
	S("Combination modules are compatible with Pipeworks blocks. When a Digtron moves one of the inventory modules adjacent to a pipe it will automatically hook up to it, and disconnect again when it moves on. Items are extracted from the \"main\" inventory, and items coming into the combination module from any direction except the underside are inserted into \"main\". However, a pipe entering the combination module from the underside will attempt to insert items into the \"fuel\" inventory instead.")
end

---------------------------------------------------------------------

digtron.doc.empty_crate_longdesc = S("An empty crate that a Digtron can be stored in")
digtron.doc.empty_crate_usagehelp = S("Digtrons can be pushed around and rotated, and that may be enough for getting them perfectly positioned for the start of a run. But once your digger is a kilometer down under a shaft filled with stairs, how to get it back to the surface to run another pass?")
.."\n\n"..
S("Place an empty Digtron crate next to a Digtron and right-click it to pack the Digtron (and all its inventory and settings) into the crate. You can then collect the crate, bring it somewhere else, build the crate, and then unpack the Digtron from it again. The Digtron will appear in the same relative location and orientation to the crate as when it was packed away inside it.")

digtron.doc.loaded_crate_longdesc = S("A crate containing a Digtron array")
digtron.doc.loaded_crate_usagehelp = S("This crate contains a Digtron assembly that was stored in it earlier. Place it somewhere and right-click on it to access the label text that was applied to it. There's also a button that causes it to display the shape the deployed Digtron would take if you unpacked the crate, marking unbuildable blocks with a warning marker. And finally there's a button to actually deploy the Digtron, replacing this loaded crate with an empty that can be reused later.")

----------------------------------------------------------------------

digtron.doc.controller_longdesc = S("A basic controller to make a Digtron array move and operate.")
digtron.doc.controller_usagehelp = S("Right-click on this module to make the digging machine go one step. The digging machine will go in the direction that the control module is oriented.")
.."\n\n"..
S("A control module can only trigger once per second. Gives you time to enjoy the scenery and smell the flowers (or their mulched remains, at any rate).")
.."\n\n"..
S("If you're standing within the digging machine's volume, or in a block adjacent to it, you will be pulled along with the machine when it moves.")

digtron.doc.auto_controller_longdesc = S("A more sophisticated controller that includes the ability to set the number of cycles it will run for, as well as diagonal movement.")
digtron.doc.auto_controller_usagehelp = S("An Auto-control module can be set to run for an arbitrary number of cycles. Once it's running, right-click on it again to interrupt its rampage. If anything interrupts it - the player's click, an undiggable obstruction, running out of fuel - it will remember the number of remaining cycles so that you can fix the problem and set it running again to complete the original plan.")
.."\n\n"..
S("The digging machine will go in the direction that the control module is oriented.")
.."\n\n"..
S("Auto-controllers can also be set to move diagonally by setting the \"Slope\" parameter to a non-zero value. The controller will then shunt the Digtron in the direction of the arrows painted on its sides every X steps it moves. The Digtron will trigger dig heads when it shunts to the side, but will not trigger builder modules or intermittent dig heads. The \"Offset\" setting determines at what point the lateral motion will take place.")
.."\n\n"..
S("The \"Stop block\" inventory slot in an auto-controller allows you to program an auto-controller to treat certain block types as impenetrable obstructions. This can allow you to fence a Digtron in with something so you don't have to carefully count exactly how many steps it should take, for example.")
.."\n\n"..
S("Note that the Digtron detects an undiggable block by the item that would be produced when digging it. Setting cobble as the stop block will make both cobble and regular stone undiggable, but setting a block of regular stone (produced from cobble in a furnace) as the stop block will *not* stop a Digtron from digging regular stone (since digging regular stone produces cobble, not stone).")

digtron.doc.pusher_longdesc = S("A simplified controller that merely moves a Digtron around without triggering its builder or digger modules")
digtron.doc.pusher_usagehelp = S("Aka the \"can you rebuild it six inches to the left\" module. This is a much simplified control module that does not trigger the digger or builder heads when right-clicked, it only moves the digging machine. It's up to you to ensure there's space for it to move into.")
.."\n\n"..
S("Since movement alone does not require fuel, a pusher module has no internal furnace. Pushers also don't require traction, since their primary purpose is repositioning Digtrons let's say they have a built-in crane or something.")

digtron.doc.axle_longdesc = S("A device that allows one to rotate their Digtron into new orientations")
digtron.doc.axle_usagehelp = S("This magical module can rotate a Digtron array in place around itself. Right-clicking on it will rotate the Digtron 90 degrees in the direction the orange arrows on its sides indicate (widdershins around the Y axis by default, use the screwdriver to change this) assuming there's space for the Digtron in its new orientation. Builders and diggers will not trigger on rotation.")

---------------------------------------------------------------------

digtron.doc.digger_longdesc = S("A standard Digtron digger head")
digtron.doc.digger_usagehelp = S("Facing of a digger head is significant; it will excavate material from the block on the spinning grinder wheel face of the digger head. Generally speaking, you'll want these to face forward - though having them aimed to the sides can also be useful.")

digtron.doc.dual_digger_longdesc = S("Two standard Digtron digger heads merged at 90 degrees to each other")
digtron.doc.dual_digger_usagehelp = S("This digger head is mainly of use when you want to build a Digtron capable of digging diagonal paths. A normal one-direction dig head would be unable to clear blocks in both of the directions it would be called upon to move, resulting in a stuck Digtron.")
.."\n\n"..
S("One can also make use of dual dig heads to simplify the size and layout of a Digtron, though this is generally not of practical use.")

digtron.doc.dual_soft_digger_longdesc = S("Two standard soft-material Digtron digger heads merged at 90 degrees to each other")
digtron.doc.dual_soft_digger_usagehelp = S("This digger head is mainly of use when you want to build a Digtron capable of digging diagonal paths. A normal one-direction dig head would be unable to clear blocks in both of the directions it would be called upon to move, resulting in a stuck Digtron.")
.."\n\n"..
S("Like a normal single-direction soft digger head, this digger only excavates material belonging to groups softer than stone.")
.."\n\n"..
S("One can make use of dual dig heads to simplify the size and layout of a Digtron.")

digtron.doc.intermittent_digger_longdesc = S("A standard Digtron digger head that only triggers periodically")
digtron.doc.intermittent_digger_usagehelp = S("This is a standard digger head capable of digging any material, but it will only trigger periodically as the Digtron moves. This can be useful for punching regularly-spaced holes in a tunnel wall, for example.")

digtron.doc.intermittent_soft_digger_longdesc = S("A standard soft-material Digtron digger head that only triggers periodically")
digtron.doc.intermittent_soft_digger_usagehelp = S("This is a standard soft-material digger head capable of digging any material, but it will only trigger periodically as the Digtron moves. This can be useful for punching regularly-spaced holes in a tunnel wall, for example.")

digtron.doc.soft_digger_longdesc = S("A Digtron digger head that only excavates soft materials")
digtron.doc.soft_digger_usagehelp = S("This specialized digger head is designed to excavate only softer material such as sand or gravel. In technical terms, this digger digs blocks belonging to the \"crumbly\", \"choppy\", \"snappy\", \"oddly_diggable_by_hand\" and \"fleshy\" groups.")
.."\n\n"..
S("The intended purpose of this digger is to be aimed at the ceiling or walls of a tunnel being dug, making spaces to allow shoring blocks to be inserted into unstable roofs but leaving the wall alone if it's composed of a more stable material.")
.."\n\n"..
S("It can also serve as part of a lawnmower or tree-harvester.")

---------------------------------------------------------------------

digtron.doc.structure_longdesc = S("Structural component for a Digtron array")
digtron.doc.structure_usagehelp = S("These blocks allow otherwise-disconnected sections of digtron blocks to be linked together. They are not usually necessary for simple diggers but more elaborate builder arrays might have builder blocks that can't be placed directly adjacent to other digtron blocks and these blocks can serve to keep them connected to the controller.")
.."\n\n"..
S("They may also be used for providing additional traction if your digtron array is very tall compared to the terrain surface that it's touching.")
.."\n\n"..
S("You can also use them decoratively, or to build a platform to stand on as you ride your mighty mechanical leviathan through the landscape.")

digtron.doc.light_longdesc = S("Digtron light source")
digtron.doc.light_usagehelp = S("A light source that moves along with the digging machine. Convenient if you're digging a tunnel that you don't intend to outfit with torches or other permanent light fixtures. Not quite as bright as a torch since the protective lens tends to get grimy while burrowing through the earth.")

digtron.doc.panel_longdesc = S("Digtron panel")
digtron.doc.panel_usagehelp = S("A structural panel that can be made part of a Digtron to provide shelter for an operator, keep sand out of the Digtron's innards, or just to look cool.")

digtron.doc.edge_panel_longdesc = S("Digtron edge panel")
digtron.doc.edge_panel_usagehelp = S("A pair of structural panels that can be made part of a Digtron to provide shelter for an operator, keep sand out of the Digtron's innards, or just to look cool.")

digtron.doc.corner_panel_longdesc = S("Digtron corner panel")
digtron.doc.corner_panel_usagehelp = S("A trio of structural panels that can be made part of a Digtron to provide shelter for an operator, keep sand out of the Digtron's innards, or just to look cool.")

doc.add_category("digtron",
{
	name = S("Digtron"),
	description = S("The Digtron system is a set of blocks used to construct tunnel-boring and construction machines."),
	sorting = "custom",
	sorting_data = {"summary", "concepts", "noises", "tips"},
	build_formspec = doc.entry_builders.text_and_gallery,
})

doc.add_entry("digtron", "summary", {
	name = S("Summary"),
	data = { text = S("Digtron blocks can be used to construct highly customizable and modular tunnel-boring machines, bridge-builders, road-pavers, wall-o-matics, and other such construction/destruction contraptions.")
.."\n\n"..
S("The basic blocks that can be assembled into a functioning digging machine are:")
.."\n\n"..
S("* Diggers, which excavate material in front of them when the machine is triggered").."\n"..
S("* Builders, which build a user-configured block in front of them").."\n"..
S("* Inventory modules, which hold material produced by the digger and provide material to the builders").."\n"..
S("* Control block, used to trigger the machine and move it in a particular direction.")
.."\n\n"..
S("A digging machine's components must be connected to the control block via a path leading through the faces of the blocks - diagonal connections across edges and corners don't count.")
}})

doc.add_entry("digtron", "concepts", {
	name = S("Concepts"),
	data = { text =
S("Several general concepts are important when building more sophisticated diggers.")
.."\n\n"..
S("Facing - a number between 0-23 that determines which direction a block is facing and what orientation it has. Not all blocks make use of facing (basic blocks such as cobble or sand have no facing, for example) so it's not always necessary to set this when configuring a builder head. The facing of already-placed blocks can be altered through the use of the screwdriver tool.")
.."\n\n"..
S("Period - Builder and digger heads can be made periodic by changing the period value to something other than 1. This determines how frequently they trigger. A period of 1 triggers on every block, a period of 2 triggers once every second block, a period of 3 triggers once every third block, etc. These are useful when setting up a machine to place regularly-spaced features as it goes. For example, you could have a builder head that places a torch every 8 steps, or a digger block that punches a landing in the side of a vertical stairwell at every level.")
.."\n\n"..
S("Offset - The location at which a periodic module triggers is globally uniform. This is handy if you want to line up the blocks you're building (for example, placing pillars and a crosspiece every 4 blocks in a tunnel, or punching alcoves in a wall to place glass windows). If you wish to change how the pattern lines up, modify the \"offset\" setting.")
.."\n\n"..
S("Shift-right-clicking - since most of the blocks of the digging machine have control screens associated with right-clicking, building additional blocks on top of them or rotating them with the screwdriver requires the shift key to be held down when right-clicking on them.")
.."\n\n"..
S("Traction - Digtrons cannot fly. By default, they need to be touching one block of solid ground for every three blocks of Digtron in order to move. Digtrons can fall, though - traction is never needed when a Digtron is moving downward. \"Pusher\" controllers can ignore the need for traction when moving in any direction.")
}})

doc.add_entry("digtron", "noises", {
	name = S("Audio cues"),
	data = { text =
S("When a digging machine is unable to complete a cycle it will make one of several noises to indicate what the problem is. It will also set its mouseover text to explain what went wrong.")
.."\n\n"..
S("Squealing traction wheels indicates a mobility problem. If the squealing is accompanied by a buzzer, the digging machine has encountered an obstruction it can't dig through. This could be a protected region (the digging machine has only the priviledges of the player triggering it), a chest containing items, or perhaps the digger was incorrectly designed and can't dig the correctly sized and shaped cavity for it to move forward into. There are many possibilities.")
.."\n\n"..
S("Squealing traction wheels with no accompanying buzzer indicates that the digging machine doesn't have enough solid adjacent blocks to push off of. Tunnel boring machines cannot fly or swim, not even through lava, and they don't dig fast enough to \"catch sick air\" when they emerge from a cliffside. If you wish to cross a chasm you'll need to ensure that there are builder heads placing a solid surface as you go. If you've built a very tall digtron with a small surface footprint you may need to improve its traction by adding structural modules that touch the ground.")
.."\n\n"..
S("A buzzer by itself indicates that the Digtron has run out of fuel. There may be traces remaining in the hopper, but they're not enough to execute the next dig/build cycle.")
.."\n\n"..
S("A ringing bell indicates that there are insufficient materials in inventory to supply all the builder heads for this cycle.")
.."\n\n"..
S("A short high-pitched honk means that one or more of the builder heads don't have an item set. A common oversight, especially with large and elaborate digging machines, that might be hard to notice and annoying to fix if not noticed right away.")
.."\n\n"..
S("Splooshing water sounds means your Digtron is digging adjacent to (or through) water-containing blocks. Digtrons are waterproof, but this might be a useful indication that you should take care when installing doors in the tunnel walls you've placed here.")
.."\n\n"..
S("A triple \"voop voop voop!\" alarm indicates that there is lava adjacent to your Digtron. Digtrons can't penetrate lava by default, and this alarm indicates that a non-lava-proof Digtron operator may wish to exercise caution when opening the door to clear the obstruction.")
}})

doc.add_entry("digtron", "tips", {
	name = S("Tips and Tricks"),
	data = { text =
S("To more easily visualize the operation of a Digtron, imagine that its cycle of operation follows these steps in order:")
.."\n\n"..
S("* Dig\n* Move\n* Build\n* Allow dust to settle (ie, sand and gravel fall)")
.."\n\n"..
S("If you're building a repeating pattern of blocks, your periodicity should be one larger than your largest offset. For example, if you've laid out builders to create a set of spiral stairs and the offsets are from 0 to 11, you'll want to use periodicity 12.")
.."\n\n"..
S("A good way to program a set of builders is to build a complete example of the structure you want them to create, then place builders against the structure and have them \"read\" all of its facings. This also lets you more easily visualize the tricks that might be needed to allow the digtron to pass through the structure as it's being built.")
}})
