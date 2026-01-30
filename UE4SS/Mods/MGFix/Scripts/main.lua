NotifyOnNewObject("/Script/MG.yFreeCameraActorBase", function(FreeCamera)
    local sphere = FreeCamera.SphereComponent
    sphere.SetCollisionResponseToAllChannels("ECR_Ignore")
end)

local insts = FindAllOf("AnimInstance")
if insts ~= nil then
    local gravity = 1000
    local damping = 0.5
    local stiffness = 0.7
    for i, inst in ipairs(insts) do
        if inst == nil or not inst:IsValid() then goto continue end

        print(string.format("%i\n", i))

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
            print(target.RootBone.BoneName:ToString())
            print("\n")
            if string.find(target.RootBone.BoneName:ToString(), "Skirt") then
                target.Gravity.Z = gravity
                target.DampingCurveData.EditorCurveData.Keys = {{Time = 0, Value = damping}}
                target.StiffnessCurveData.EditorCurveData.Keys = {{Time = 0, Value = stiffness}}
            end
        end

        ::continue::
    end
end
