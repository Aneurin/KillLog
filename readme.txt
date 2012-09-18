----
Name
----

KillLog



-------
New
-------
-------
Updates
-------

+ Version 5.0.5
  * Changes:-
    Track deaths due to environmental damage (falling, fatigue, etc.).
    Numerous code cleanups.

+ Version 5.0.4
  * Changes:-
    Update for WoW 5.0
    Allow storing up to 90 levels of monsters, to reflect MoP level cap.

+ Version 4.2.0
  * Changes:-
    Update for WoW 4.2

+ Version 4.1.0
  * Changes:-
    Update for WoW 4.1

+ Version 4.0.3
  * Changes:-
    Update for WoW 4.0
    Removed a lot of dead code
  * Bug Fixes
    Creep list is once again coloured appropriately
    Old creep data will be correctly expired when the number of levels to store
    is greater than 70 but less than the current character level.
  * Known Issues:
    The number of levels to track isn't automatically increased. If you
    currently have it set to 80 and want to store all creep history then you'll
    need to increase it to 85 in tho options pane.

+ Version 2.99.0
  * Changes:-
    Update for WoW 3.0.2.
    Colouring of creep names in the log is disabled until I have the time to
    research how this should be done now.
    This has been briefly tested and all other incompatibilities should be
    fixed, but for the moment should be considered beta. When the colouring is
    fixed and I've used it a little more, I'll release it as version 3.0 (or
    perhaps even 3.0.2) and try to track the WoW version so as to indicate the
    version compatibility.

+ Version 2.7.0
  * Changes:-
    Reinstated death tracking, now that WoW 2.4.2 has been released,
    making it once again possible to detect when the player dies.
  * Known Issues:-
    This should have the same behaviour as the feature prior to WoW 2.4.0.
    This means it infers the killer based on who hit the player last,
    according to the combat log. Consequently it may (in theory) suffer
    from races, if combat messages do not arrive in the correct order, and
    it can't track environmental deaths (falling, drowning, lava, ...).

+ Version 2.6.9
  * Changes:-
    Updated to record combat information provided by the new combat log system
    introduced in patch 2.4.0.
    The method for tracking kills has changed, and is described in the
    'Description' section below.
  * Known Issues:-
    Player deaths are not recorded, due to a bug in the game: the 'UNIT_DIED'
    combat event does not fire upon the death of the player. As a workaround, I
    tried registering for notification of the 10% durability loss on equipped
    items instead, but couldn't get it to work.
    The fix for this issue is scheduled to be included in WoW 2.4.2.

    The combat parsing system is more simplistic than the ChatParse system - for
    example it is not possible to unregister for an event, and the registrant
    must know the order of arguments provided by the registered event.
    This system is currently not documented.

+ Version 2.6.2a
  * Bug Fixes:-
    Fixes bug with debugging messages with fresh installs only (this version is not needed if you are updating from an earlier version)

+ Version 2.6.2
  * Bug Fixes:-
    Added additional checks for max level, should correct the issue of data recording being unreliable at max level.
    Implemented smeehrr's fix as an additional check.

+ Version 2.6.1
  * Additions:-
    - Adjusted the way location data is saved, resulting in a smaller saved variable file
    ** Please be advised that depending on the amount of data you have the first time you load WoW could take anywhere from an additonal 30 seconds to 1 minute to load.
       (Only happens once)

+ Version 2.5.2b
  * Bug Fixes:-
    - Attempt to fix bug with creeps not being recorded at maximum level ( untested as I don't have a lvl 70 :P )

+ Version 2.5.2
  * Additions:-
    - The 'Level' list will now color the creeps according to the level at which you killed them, instead of based on your current level.
    - Added the new 'rare-elite' border to the rare-elite class in the listing
  * Fixes:-
    - A little more room at the bottom of the 'General Window' for widescreen resolutions.

+ Version 2.5.1
  * Bug Fixes:-
    - Fixed issue with maxLevel not being set with a fresh install.

+ Version 2.5.0
  * Additions:-
    - Check for TBC level 70 compatability.
    - Reworked the way the 'Family' information was updated (see notes below)
    - Debugging can now be enabled from the options menu
    - Debug levels 1 - 3 disabled.


+ Version 2.4.9
  * Additions:-
    - Added 2 new sorting levels to the dropdown menus, Class and Location
    - Made support for SCT optional, enable in the options tab.
    - Added option to change display color for the maximum damage notification.
  * Data Updates:-
    - Slight change to how the coordinates are saved to the database, allows for a reduction in memory usage.


+ Version 2.4.8
  * Additions:-
    - Added Hunter's autoshot to the list of recorded data.
  * Bug Fixes:-
    - Fixed issue with debugging being enabled by default instead of being disabled
    - Fixed error with checking current level information. (Problem with switching to a new character with a fresh install)


+ Version 2.4.7
  * Additions:-
    - Expanded Total Kills and Total Deaths on the General Tab to show all sources of your deaths and kills.
      (Thanks to Dridzt for the suggestion)
    - Maximum hit and crit information sent to SCT if installed
      (Thanks to IRID1UM for the suggestion)
  * Bug Fixes:-
    - Corrected issue with not being credited with the kill if the mob didnt give you xp.
    - Adjusted the ScrollFrame on the General Tab to view extra data missing from the end.


+ Version 2.4.6b
  * Updated to WoW 20003
  * Fixed saved variable saving per character instead of global.


+ Version 2.4.6
  * Additions:-
    - Added another debuging level (avoid using levels below 4 as all it will do is spam you to
      death with useless information)
  * Bug Fixes:-
    - Fixed error with current level information being missing from the database. (Happens if updating from
      older version of KillLog while gaining additional levels that are not recorded)


+ Version 2.3.1:
  * Additions:-
    - Added ability to store unknown creep family to database and to specify which family you want
    - Changed format of Death list
    - Expanded debug functionality to include adding a creep family you specify to the database

-----
Notes
------

I have improved upon the way Kill Log stores creep families to the database.
Creep families are defined as follows:-
Family for 'Venom Web Spider' would be Type <beast> Family <spider> or 
'Vicious Gray Bear' would be Type <beast> Family <bear>. It seems that anything of
the <beast> type has a 'family' and the rest dont. Frenn got around this originally by
dumping anything without a 'family' into either the <unknown> category or by obtaining
a family from his very limited localisation list.

I have added the option to add to Frenn's original list thus instead of the 'family' list
having a overly huge <unknown> category you can supply new families.

To add new families level 4 debugging needs to be enabled to see if a creep doesn't have a <family> type. 
Enable debugging through the options menu. Levels 1 - 3 have been disabled due to large amounts of unneeded data
being constantly sent to the chat window.

To update a creep family open the List window as normal and simply select the 'creep' you wish to update and Right-Click on it to bring up the menu. Select 'Change Creep Family' from the list and change it to what you wish.

To add a more generic name to a family use /kl update <family> <creepName> as in /kl update Zombie Zombie
This will add a generic name <Zombie> to the family <Zombie> which will then update all creeps with the word <Zombie>
found anywhere in their name to the family <Zombie>. This is useful if you know the creep will only be of one family 
type. 


If you choose to not make use of this feature however, I have adjusted it to use the creep 'Type' instead of <unknown> as before.


--------
Debuging
--------
Debugging has been improved upon from the original version. Currently there are 
5 levels of debugging. Essentially level 1 tracks everything that KillLog
does down to aquiring creep details and how it stores the information.

Level 1 returns 'function' data, used mostly in the list view.

Level 2 returns 'helper' data. Mostly used to determine what options are set.

Level 3 is mainly used to determine if creep classes are not found and how they 
are going to be stored (either from the type or the database)

Level 4 is used to inform you if a match for the creep family was not found from the
name or the database and requests you to add the creep to either a new family or an
existing family. 

Level 5 displays any critical errors that have been encountered.



-----------
<Original>
-----------
-----------
Description
-----------

Record number of creeps you kill and the amount of experience you receive.
Also records deaths.

As of WoW 2.4.0 it is possible to be informed of all player or party kills via
the PARTY_KILL event, hence the checks on whether a kill should be credited or
not are no longer needed. All PARTY_KILLs are now counted, and kill counts are
no longer incremented when recording XP gain, to avoid double counting.

This changes the behaviour of the addon slightly: creatures which do not yield
XP are now always tracked when the player or a party kills them, not just when
the creature killed was the one last hit by the player.

More simply: if the game considers you eligible for kill credit, it's counted.

NB: This has not been tested when a party member kills something too far away
for the player to receive XP, but close enough to be recorded in the combat
log. If this situation can occur, then it will still be counted as a kill.

The following information is historical:


The method of determining if you killed a creep or not is a bit fuzzy.  This
is the general style I used.  When a creep dies, 
  if you get experience, it is a kill
  if you should not get experience (low level / critter / pvp) and you have
    just done damage to the creep, it is a kill
  otherwise, it is not a kill

This means that if you kill a creep that you should get experience for but
it is tagged by someone else, it will not be counted as a kill.

UPDATE:  I have revised the above logic a bit to count a few more cases that
I had missed before.  It is basically the same as above.  The only exception
is that I check the level of the creep when you TARGET them.  If you will
not get experience for killing that creep, I will store their name and give
you credit when a creature with that name dies.  Before, I checked the 
maximum level of the creep that just died and would not count the kill if
the maximum level should give you experience.

This is still not perfect, since Blizzard does not provide any method to
track kills that you do not receive experience for.  But it is a little
better.

-----------------
Accessing the GUI
-----------------

There are now two methods to access the GUI.  You can either create a
keybinding for it, or use the slash command.
  /killlog
  /kl


----
Note
----
It is NOT possible to store the portraits of the creeps you have killed
between sessions.  My assumption for this is that the portraits are actually
created by merging various textures and for this reason you cannot find a
string to use to load the same texture later.  (human face #2 with hat #5
and shirt #23 or something)  I store up to 100 for the current session only.

I tried everything I could think of to avoid this at least and was not able
to find a way around it.


----
Todo
----
The next things I have planned:
[OPTION TAB]
  - filter trivial creeps from display list


-------
History
-------

+ Version 2.15:
  * removed a few debugging messages
  * changed formatting of Death tab a bit
  * added additional family specifications
  * corrected error in French translation regarding "Repose" vs. "En forme"

+ Version 2.14:
  * actually got in a large group and found the error tracking group experience!
    This is now fixed.
  * enabled storing death information.
  * suppressed KillLog loaded message
  * made another attempt to debug German client gathering crit information.

+ Version 2.13:
  * attempted to correct error tracking group experience properly
  * added options tab!

+ Version 2.12:
  * corrected data loading errors for non English localizations
  * sort by name now displays class (elite) instead of kill count and header
    displays number of unique creeps fought
  * I might have rested xp there now for different localizations.
  * Added some debugging information about matching crits...  I hope this
    will allow me to get that functioning correctly.
  * cleaned up code for counting trivial kills and what creep killed you
  * added more words to localization file

+ Version 2.11:
  * added French localization
  * updated interface version number
  * updated Death tab background to stone

+ Version 2.10:
  * Updated method of gathering CreepType and CreepFamily
  * Changed font color on General and Death tab so it is easier to read
  * Refined when I store portraits and creep info
  * Added some more checks to counting trivial kills, now watch enter/leave
    combat

+ Version 2.09:
  * Added general tab
  * Added death tab
  * Changed a few German strings
  * Added button to open window in Cosmos Menu for Cosmos users
  * Updated list page to show the Kill Count on several listing, and total
    Kill Count in the headers
  * added ability to delete creeps from the Kill Log

+ Version 2.08:
  * corrected data gathering for German client
  * added data gathering for recording Max hits
  * completed updating data gathering from using static strings to dynamically
    access the information from GlobalStrings.

+ Version 2.07:
  * corrected error causing loaded message to be displayed multiple times.

+ Version 2.06:
  * German localization
  * some support for new data gathering method
    I now use the GlobalStrings to create patterns to use to extract data
    from the combat messages.  So far, I have only updated a new things
    though, I still need to do most of the combat messages which are used to
    fill trivial creeps.
  * new initialization code; because of a Blizzard error with unregister
    event, I have retooled my initialization.  I hope that I will now load
    correctly regardless of what other AddOns do and that I will not prevent
    other AddOns from loading fully.

+ Version 2.05:
  * ability to reclassify creeps (humanoid => murloc, kobold, etc.)
  * added tracking of creep models and sorting by this
    this will allow me to show exactly how many murlocs you killed on the general tab
  * changed information on tooltip; I now show average xp instead of total xp
  * corrected some minor display things:
    - creep highlighting upon first load
    - switching between lists does not mess up highlight color
    - frame on scroll bar now
  * suppress listing creeps without sort values
    when sorting by xp, I do not list creeps that have 0 xp
  * added skull icon to portrait frame
    looks better than blank hole and there is not enough room to fit the level

+ Version 2.04:
  * small bug fixes only; no new features

+ Version 2.03:
  * Added slash command (/killlog or /kl) to open GUI
  * Added sorting options to listing
  * Added level select to view past data
  * I now hide the detail when no creep is selected
  * switching tabs and levels no maintains which headers are collapsed and
    expanded
  * new theory on counting trivial kills implemented

+ Version 2.02:
  * Added GUI for viewing your kill history
  * Incorporated kill/death/experience tracking based upon:
    - current session
    - overall
    - per level (storing five levels worth of data)

+ Version 2.01:
  * Removed warning if my Debug AddOn wasn't loaded.

+ Version 2.0:
  * Records kills and experience from fighting creeps
  * Records information about the creeps you encounter:
    - min level
    - max level
    - type (humanoid, beast, critter, etc.)
    - is pvp
    - is elite
  * updates tooltip with information regarding number of kills and
    experience gained
  * very cool combat log string matching code

+ Version 1.0:
  * long long ago... before stored variables and many combat log message
    events.


---------
Thanks to
---------
Finkle and Xila for helping to beta test new version and for providing
valuable feadback about how to create a friendly user interface.

Dead_Masters and Myth for help with the German translation.  Myth got me
started with a few words, but Dead_Masters did the rest.  All of the help is
greatly appreciated though!  Now Lunox has provided a few more localization
updates!  The most recent translations were actually provided by Lunox.
All of the assistance is greatly appreciated.

Juki for providing the French translation!



----------------
More information
----------------

To check for updates, please visit:
  http://wow.risse.com/

Please let me know if you encounter any errors while using this AddOn!


------
Authors
------

Daniel Risse <dan@risse.com>
Detritis <Slynx of Quel'thalas>

