NetChatLink Changelog
=====================

NetChatLink Alpha 8
-------------------
- Fix: Client tag now properly formatted (in NMDC and ADC)
- Fix: NMDC $Lock/$Key handshake fixed (Thanks Light-Angel)

NetChatLink Alpha 7 - Bugfixes
------------------------------
- Fix: Debug log getting too long and using up a ton of memory
- Fix: Changed strings to WideStrings to fix encoding issues
- Fix: No more duplicated messages from NickServ and ChanServ
- Fix: Action messages being sent twice from IRC
- Fix: Bot discarding nick for a SID if an INF was sent that didn't include the nick
- Fix: Special characters (|, $, etc) being transmitted to NMDC hubs
- Fix: Ignored auto-check for updates option (always checked)
- Fix: Some characters (like ê and ç) not being transmitted from IRC
- Fix: Inconsistent capitilization
- Added: Ability to relay parts from users (not joins yet)
- Change: Debug log now automatically writes to file and clears in-program log
- Change: Disabled automatically checking for updates on startup (until it works properly in the background)

NetChatLink Alpha 6 - Feature additions
---------------------------------------
- Fix: Bug in channel parsing (trailing comma)
- Fix: Bot now recognizes when it is signed in on NMDC hubs that don't support 'LOGEDIN'
- Fix: Dynamic user list could be edited (no effect on backend data)
- Fix: Rare crash on userlist cleaning
- Fix: Tab order
- Added: Dynamic PID (generated on first run)
- Added: Ability to connect to enabled connections on startup
- Added: Ability to run custom commands on IRC connect
- Added: Help tooltips (hover over things to see them)
- Added: Main program window can now be resized, minimized, maximized, etc.
- Added: Update feature (click the 'Check for Updates' button)
- Added: Update check at startup (can be disabled via the XML file)
- Removed: Option for custom IRC description (is now consistant with DC)
- Change: Filtered words are now \*d out instead of discarding the entire message
- Change: Data is now saved in a single XML file (old saves will automatically be converted until v1.0)
- Change: Project now advertizes itself when you send the '.about' command
- Change: Non-controllers can use the '.about' command.
- Change: Default share is now 10GB instead of 1GB (still user-configurable)
- Change: Unescape efficiency boost
- Change: GUI tweaks (sizes/tab order)
- Change: Increased form display speed by moving code out of the constructor.

NetChatLink Alpha 5 - Bugfixes and ADC Password support
-------------------------------------------------------
- Fix: Widestring usernames now appear properly in user control panel
- Fix: Error on password field left blank in ADC
- Fix: Error when recieving a QUI command
- Added: Can now be registered in ADC hubs (password hashing works properly)

NetChatLink Alpha 4 - A lot of changes, probably a few bugs
-----------------------------------------------------------
- Fix: Will no longer respond to hub-described bots in ADC (unless you override it)
- Fix: Now sends messages to chats that are connected, even if they aren't enabled
- Fix: Crash on uninitilized ADC SID array in certain cases
- Fix: Character encoding bugs
- Fix: Links command now shows all connected connections, not enabled ones
- Fix: Messages will no longer send from connections that are not fully connected
- Fix: Memory leak
- Fix: Connections can no longer have the same name (caused problems with ini parsing)
- Fix: Tab ordering and alt+character shortcuts
- Added: Save and clear options for debug log
- Added: Seperate queue and rate control for PMs and mainchat messages
- Added: Ability to ignore PMs and mainchat from users
- Added: GUI interface for managing users (User control panel)
- Added: Hub user quit detection (Remove from OPList/SID table)
- Added: Error messages for incomplete connection information
- Change: Connections are now sorted by name
- Change: ADC blocked OPs and controlling users now based off name, not SID
- Change: Better layout when using links command
- Change: Made main GUI easier to use/understand (merged Add and Update together)
- Change: Hub now disconnects when updating it to apply settings

NetChatLink Alpha 3 - IRC fixes
-------------------------------
- Fix: NickServ IDENTIFY parameters corrected
- Fix: When post rate was 0 no messages would send.
- Fix: Joining multiple IRC channels with channel key(s) present
- Fix: Stripping channel keys out of channel text
- Added: All Chan/NickServ messages are sent to debug messages
- Added: More specific error messages
- Added: Flexible channel list parser

NetChatLink Alpha 2 - Working out the ADC kinks and some new features
---------------------------------------------------------------------
- Fix: ADC OP SIDs are loaded on connect
- Fix: Displaying the oplist of an ADC hub now outputs the nicks, not the SIDs
- Fix: ADC Multiline messages now sent properly when sending in one line chunks
- Added: Per-connection option to control minimum time between chat messages (anti-flood)
- Added: Multiline messages can now be sent one chat message per line
- Added: Status icon for disabled connection (will still change if manually connected to)

NetChatLink Alpha 1 - Bugfixes, changes and feature additions from codebase
---------------------------------------------------------------------------
- Fix: Empty NMDC '$Support' command not supported by some hubsofts, changed to '$Support NoHello NoGetInfo'
- Fix: Sending a chat message while a connection wasn't fully logged in would cause problems. Chats are now locked until they're ready to recieve messages
- Fix: Escaped <-> Unescaped conversions (ADC <-> NMDC)
- Added: Hubs and IRC channels are now identified by name
- Added: IRC channel keys are now supported
- Added: Debug log
- Added: ADC compatibility (doesn't support passwords yet)
- Added: GUI improvements (Adding a new connection selects it, deleting a connection selects the next item)
- Added: More status icons (off or error/connecting/connected and logged in)
- Added: About tab
- Change: GUI size is now limited
- Change: Prefix is now completely up to the user (WYSIWYG, no extra characters)
- Change: Cleaner message display format (Used to be '<Bot> {Prefix}Nick: Msg', is now '<Bot> <PrefixNick> Msg')
- Change: Disabled GUI items when they have no effect (for clarity)
