-- Combat Parse: Used for processing information from the combat event system
-- introduced in WoW 2.4.0

local CombatParse_Events = { };

function CombatParse_OnLoad()
  CombatParseFrame:SetScript("OnEvent",CombatParse_OnEvent)
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

function CombatParse_OnEvent(self, event, timestamp, combat_event, hideCaster, srcGUID, srcName, srcFlags, srcRaidFlags, dstGUID, dstName, dstFlags, dstRaidFlags, ...)
 --if (event ~= "COMBAT_LOG_EVENT_UNFILTERED") then return
  local listeners = CombatParse_Events[combat_event];
  if not listeners then return end; -- nobody cares about this event

  local arglist = {...} or {}

  arglist.srcName = srcName;
  arglist.dstName = dstName;
  arglist.srcFlags = srcFlags;
  arglist.dstFlags = dstFlags;

  local listener, t, src, dst;
  for _, listener in pairs(listeners) do
    t = {};
    for src, dst in pairs(listener.mapping) do
      t[dst] = arglist[src]
    end
    listener.func(t);
  end
end

local toc = select(4, GetBuildInfo())
if toc < 40200 then
    local CombatParse_OnEvent_40200 = CombatParse_OnEvent
    CombatParse_OnEvent = function(self, event, timestamp, combat_event, hideCaster, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)
        return CombatParse_OnEvent_40200(self, event, timestamp, combat_event, hideCaster, srcGUID, srcName, srcFlags, nil, dstGUID, dstName, dstFlags, nil, ...)
    end
end
