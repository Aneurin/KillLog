-- Combat Parse: Used for processing information from the combat event system
-- introduced in WoW 2.4.0

local CombatParse_Events = { };

function CombatParse_OnLoad()
  CombatParseFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
end

function CombatParse_RegisterEvent(info)
  if ( type(info) ~= "table" ) then
    DebugMessage("CP", "Input to CombatParse_RegisterEvent must be a table!", "error");
    return nil;
  elseif ( not info.event or type(info.event) ~= "string" ) then
    DebugMessage("CP", "Input to CombatParse_RegisterEvent must contain an event to watch!", "error");
    return nil;
  elseif ( not info.func or type(info.func) ~= "function" ) then
    DebugMessage("CP", "Input to CombatParse_RegisterEvent must contain a function to call back to!", "error");
    return nil;
  elseif ( not info.template or type(info.template) ~= "table" ) then
    DebugMessage("CP", "Input to CombatParse_RegisterEvent must contain a template to map combat log variables to callback function variables", "error");
    return nil;

  elseif ( not CombatParse_Events[info.event] ) then
          CombatParse_Events[info.event] = { };
  end

  table.insert(CombatParse_Events[info.event], { func = info.func, mapping = info.template });
end

function CombatParse_OnEvent(event)
end
