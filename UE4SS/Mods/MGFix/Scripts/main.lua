-- WARNING! These values are FRAMERATE DEPENDANT, and will give different
-- results at different framerates!
-- The defaults were tested at 60 FPS

-- Use positive values to make skirts floatier and more likely to lift
-- Or you can use negative values to "weigh" skirts down
-- Set to 0 for vanilla behavior
SKIRT_GRAVITY = 2500

-- Controls how drastic skirt floppiness is allowed to be
-- Use values closer to 0 for floppier skirts that react more strongly to
-- character movements
-- Set to 1 for vanilla behavior
SKIRT_DAMPING = 0.5

-- Controls how closely skirts should conform or return to a "neutral" position
-- Careful! if you set this to 0 and gravity to a positive number, the skirt
-- *will* go up and never come back down! 🤣
-- Set to 1 for vanilla behavior
SKIRT_STIFFNESS = 0.7

-- Disable the angle limit on the back of the skirt so it can flip properly
-- Set to false for vanilla behavior
SKIRT_UNCONSTRAINED = true

function applySkirtPhysics(inst)
    if inst == nil or not inst:IsValid() then return end

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

        if string.find(target.RootBone.BoneName:ToString(), "Skirt") then
            target.Gravity.Z = SKIRT_GRAVITY
            target.DampingCurveData.EditorCurveData.Keys = {{Time = 0, Value = SKIRT_DAMPING}}
            target.StiffnessCurveData.EditorCurveData.Keys = {{Time = 0, Value = SKIRT_STIFFNESS}}
            if SKIRT_UNCONSTRAINED then
                target.LimitAngleCurveData.EditorCurveData.Keys = {{Time = 0, Value = 0}}
            else
                target.LimitAngleCurveData.EditorCurveData.Keys = {}
            end
        end
    end
end

NotifyOnNewObject("/Script/MG.yFreeCameraActorBase", function(FreeCamera)
    local sphere = FreeCamera.SphereComponent
    sphere.SetCollisionResponseToAllChannels("ECR_Ignore")
end)

NotifyOnNewObject("/Script/Engine.AnimInstance", function(Anim)
    applySkirtPhysics(Anim)
end)

local insts = FindAllOf("AnimInstance")
if insts ~= nil then
    for _, inst in ipairs(insts) do
        applySkirtPhysics(inst)
    end
end
