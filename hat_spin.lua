local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character

local Flag = Character["Mini Pride Flag"] --// Open up dex, goto your player in the workspace, and find the name of the accessorie you want to use. https://coasts.cool/uploads/jrZZAH3XsA2Sp0LqjkQg.png
local Handle = Flag.Handle
local Offset = 5

local NetworkConnection = nil
NetworkConnection = RunService.RenderStepped:Connect(function()
    if not Character or not Character.Head then
        NetworkConnection:Disconnect()
    end
    
    setsimulationradius(math.huge, math.huge)
    settings().Physics.AllowSleep = false
end)

local FlagFloatPart = Instance.new("Part")
FlagFloatPart.Name = "FlagFloatPart"
FlagFloatPart.Parent = Character
FlagFloatPart.Anchored = true
FlagFloatPart.CanCollide = false
FlagFloatPart.Size = Vector3.new(1, 1, 1)
FlagFloatPart.Transparency = 1

local PositionConnection = nil
PositionConnection = RunService.RenderStepped:Connect(function()
    if not Character or not Character.Head then
        PositionConnection:Disconnect()
    end
    
    if Character and Character.Head then
        FlagFloatPart.CFrame = (Character.Head.CFrame + Vector3.new(0, Offset, 0))
    end
end)
Handle.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
Handle.CanCollide = false
Handle:BreakJoints()

local BodyAngularVelocity = Instance.new("BodyAngularVelocity")
BodyAngularVelocity.Parent = Handle
BodyAngularVelocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
BodyAngularVelocity.AngularVelocity = Vector3.new(0, -2, 0)

local AlignPosition = Instance.new("AlignPosition")
AlignPosition.Parent = Handle
AlignPosition.MaxForce = 1000000
AlignPosition.MaxVelocity = math.huge
AlignPosition.RigidityEnabled = false
AlignPosition.ApplyAtCenterOfMass = true
AlignPosition.Responsiveness = 200

local Attachment0 = Instance.new("Attachment")
Attachment0.Parent = Handle

local Attachment1 = Instance.new("Attachment")
Attachment1.Parent = FlagFloatPart

AlignPosition.Attachment0 = Attachment0
AlignPosition.Attachment1 = Attachment1