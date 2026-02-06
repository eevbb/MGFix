-- WARNING! Skirt values are FRAMERATE DEPENDANT, and will give different
-- results at different framerates!
-- The defaults were tested at 60 FPS.

-- Use positive values to make skirts floatier and more likely to lift.
-- Or you can use negative values to "weigh" skirts down.
-- Warning! if you set this to a high number (like ~2000 or so) the skirt may
-- look fine during gameplay, but flip completely upside-down during certain
-- cutscenes, like some special moves.
-- Set to 0 for vanilla behavior.
SKIRT_GRAVITY = 100

-- Controls how drastic skirt floppiness is allowed to be.
-- Use values closer to 0 for floppier skirts that react more strongly to
-- character movements.
-- Set to 1 for vanilla behavior.
SKIRT_DAMPING = 0.5

-- Controls how closely skirts should conform or return to a
-- "neutral" position.
-- Careful! if you set this to 0 and gravity to a positive number, the skirt
-- *will* go up and never come back down! 🤣
-- Set to 1 for vanilla behavior.
SKIRT_STIFFNESS = 0.45

-- Disable the angle limit on the back of the skirt so it can flip properly.
-- Set to false for vanilla behavior.
SKIRT_UNCONSTRAINED = true

-- Hide the pesky drone during vent crawling cutscenes.
-- Set to false for vanilla behavior.
HIDE_VENT_DRONE = true

RegisterCustomProperty({
    ["Name"] = "UnderwearIndex",
    ["Type"] = PropertyTypes.IntProperty,
    ["BelongsToClass"] = "/Script/MG.yInGamePermanentDataSubsystem",
    ["OffsetInternal"] = 0xA8,
})

function applySkirtPhysics(inst, func)
    if inst == nil or not inst:IsValid() then return end

    local gravity = 0
    local damping = 1
    local stiffness = 1
    local unconstrained = false
    if modded then
        gravity = SKIRT_GRAVITY
        damping = SKIRT_DAMPING
        stiffness = SKIRT_STIFFNESS
        unconstrained = SKIRT_UNCONSTRAINED
    end

    local count = 0
    while true do
        local target = nil
        if count == 0 then
            target = inst["AnimGraphNode_KawaiiPhysics"]
        else
            target = inst[string.format("AnimGraphNode_KawaiiPhysics_%i", count)]
        end

        count = count + 1
        if target == nil or not target:IsValid() or count > 100 then break end

        if string.find(target.RootBone.BoneName:ToString():lower(), "skirt")
            or string.find(target.RootBone.BoneName:ToString():lower(), "mg01_jacket")
            then
            func(target)
        end
    end
end

function applySkirtPhysicsToAll(func)
    local insts = FindAllOf("AnimInstance")
    if insts ~= nil then
        for _, inst in ipairs(insts) do
            applySkirtPhysics(inst, func)
        end
    end
end

function skirtPhysicsVanilla(target)
    target.Gravity.Z = 0
    target.DampingCurveData.EditorCurveData.Keys = {}
    target.StiffnessCurveData.EditorCurveData.Keys = {}
    target.LimitAngleCurveData.EditorCurveData.Keys = {}
end

function skirtPhysicsModded(target)
    target.Gravity.Z = SKIRT_GRAVITY
    target.DampingCurveData.EditorCurveData.Keys = {{Time = 0, Value = SKIRT_DAMPING}}
    target.StiffnessCurveData.EditorCurveData.Keys = {{Time = 0, Value = SKIRT_STIFFNESS}}
    if SKIRT_UNCONSTRAINED then
        target.LimitAngleCurveData.EditorCurveData.Keys = {{Time = 0, Value = 0}}
    else
        target.LimitAngleCurveData.EditorCurveData.Keys = {}
    end
end

function skirtPhysicsFlip(target)
    target.Gravity.Z = 2500
    target.DampingCurveData.EditorCurveData.Keys = {{Time = 0, Value = 0}}
    target.StiffnessCurveData.EditorCurveData.Keys = {{Time = 0, Value = 0}}
    target.LimitAngleCurveData.EditorCurveData.Keys = {{Time = 0, Value = 0}}
end

function setUnderwearIndex(i)
    local data = FindFirstOf("yInGamePermanentDataSubsystem")
    if data == nil or not data:IsValid() then return end
    data.UnderwearIndex = i
end

NotifyOnNewObject("/Script/MG.yFreeCameraActorBase", function(FreeCamera)
    local sphere = FreeCamera.SphereComponent
    sphere.SetCollisionResponseToAllChannels("ECR_Ignore")
end)

NotifyOnNewObject("/Script/Engine.AnimInstance", function(Anim)
    applySkirtPhysics(Anim, skirtPhysicsModded)
end)

NotifyOnNewObject("/Script/Engine.SkeletalMeshActor", function(Actor)
    local name = Actor:GetFullName()
    -- This *may* end up triggering during other cutscenes... not sure.
    if not string.find(name, "SK_Drone") then return end
    Actor:SetActorHiddenInGame(true)
end)

RegisterKeyBind(Key.F1, function() applySkirtPhysicsToAll(skirtPhysicsFlip) end)
RegisterKeyBind(Key.F2, function() applySkirtPhysicsToAll(skirtPhysicsModded) end)

RegisterKeyBind(Key.ONE, { ModifierKey.CONTROL }, function() setUnderwearIndex(0) end)
RegisterKeyBind(Key.TWO, { ModifierKey.CONTROL }, function() setUnderwearIndex(1) end)
RegisterKeyBind(Key.THREE, { ModifierKey.CONTROL }, function() setUnderwearIndex(2) end)
RegisterKeyBind(Key.FOUR, { ModifierKey.CONTROL }, function() setUnderwearIndex(3) end)
RegisterKeyBind(Key.FIVE, { ModifierKey.CONTROL }, function() setUnderwearIndex(4) end)
RegisterKeyBind(Key.SIX, { ModifierKey.CONTROL }, function() setUnderwearIndex(5) end)
RegisterKeyBind(Key.SEVEN, { ModifierKey.CONTROL }, function() setUnderwearIndex(6) end)

applySkirtPhysicsToAll(skirtPhysicsModded)
