NotifyOnNewObject("/Script/MG.yFreeCameraActorBase", function(FreeCamera)
    local sphere = FreeCamera.SphereComponent
    sphere.SetCollisionResponseToAllChannels("ECR_Ignore")
end)
