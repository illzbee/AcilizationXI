-----------------------------------------
-- ID: 4586
-- Item: Broiled Carp
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Dexterity 2
-- Mind -1
-- Ranged ATT % 14 (cap 45)
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,4586);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 2);
    target:addMod(MOD_MND, -1);
    target:addMod(MOD_FOOD_RATTP, 14);
    target:addMod(MOD_FOOD_RATT_CAP, 45);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 2);
    target:delMod(MOD_MND, -1);
    target:delMod(MOD_FOOD_RATTP, 14);
    target:delMod(MOD_FOOD_RATT_CAP, 45);
end;
