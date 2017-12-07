-----------------------------------------
-- Spell: Cursna
-- Removes curse and bane from target.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local curse = target:getStatusEffect(EFFECT_CURSE_I);
    local curse2 = target:getStatusEffect(EFFECT_CURSE_II);
    local bane = target:getStatusEffect(EFFECT_BANE);
    local bonus = caster:getMod(MOD_ENHANCES_CURSNA) + target:getMod(MOD_ENHANCES_CURSNA_RCVD);
    local power = 25*((100+bonus)/100); -- This 25 is temp until the skill calculation is in.

    spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    if (target:hasStatusEffect(EFFECT_DOOM) and power > math.random(1, 100)) then
        -- remove doom
        final = EFFECT_DOOM;
        target:delStatusEffect(EFFECT_DOOM);
        spell:setMsg(msgBasic.NARROWLY_ESCAPE);
    elseif (curse ~= nil and curse2 ~= nil and bane ~= nil) then
        target:delStatusEffect(EFFECT_CURSE_I);
        target:delStatusEffect(EFFECT_CURSE_II);
        target:delStatusEffect(EFFECT_BANE);
        final = EFFECT_CURSE_II;
        spell:setMsg(msgBasic.MAGIC_REMOVE_EFFECT);
    elseif (curse ~= nil and bane ~= nil) then
        target:delStatusEffect(EFFECT_CURSE_I);
        target:delStatusEffect(EFFECT_BANE);
        final = EFFECT_CURSE_I;
        spell:setMsg(msgBasic.MAGIC_REMOVE_EFFECT);
    elseif (curse2 ~= nil and bane ~= nil) then
        target:delStatusEffect(EFFECT_CURSE_II);
        target:delStatusEffect(EFFECT_BANE);
        final = EFFECT_CURSE_II;
        spell:setMsg(msgBasic.MAGIC_REMOVE_EFFECT);
    elseif (curse ~= nil) then
        target:delStatusEffect(EFFECT_CURSE_I);
        final = EFFECT_CURSE_I;
        spell:setMsg(msgBasic.MAGIC_REMOVE_EFFECT);
    elseif (curse2 ~= nil) then
        target:delStatusEffect(EFFECT_CURSE_II);
        final = EFFECT_CURSE_II;
        spell:setMsg(msgBasic.MAGIC_REMOVE_EFFECT);
    elseif (bane ~= nil) then
        target:delStatusEffect(EFFECT_BANE);
        final = EFFECT_BANE;
        spell:setMsg(msgBasic.MAGIC_REMOVE_EFFECT);
    end

    return final;
end;
