--//Made By Ic35k_Jason

local ApplyKnockBack = {}
ApplyKnockBack.__index = ApplyKnockBack

function ApplyKnockBack.new(EnemyCharacter: Model,Character: Model,Range: number,Height: number)
    local self = setmetatable({
        _EnemyCharacter = EnemyCharacter;
        _Character = Character;
        _Range = Range;
        _Height = Height;
    },ApplyKnockBack)

    return self
end

function ApplyKnockBack:CalculateMass(Model: Model)
    assert(Model and Model:IsA("Model"),"Type[Model] Argument Must Be Model!")
    local TotalMass = 0;
    for _,Values in pairs(Model:GetDescendants()) do
        if (Values:IsA("BasePart")) then
            TotalMass += Values.AssemblyMass;
        end
    end
    return TotalMass
end

function ApplyKnockBack:Construct()
    local Character = self._Character
    local EnemyCharacter = self._EnemyCharacter

    local Range = self._Range
    local Height = self._Height

    EnemyCharacter.PrimaryPart:SetNetworkOwner(nil)
    EnemyCharacter.PrimaryPart:ApplyImpulse(Character.PrimaryPart.CFrame.LookVector * ApplyKnockBack:CalculateMass(EnemyCharacter) * Range + Vector3.new(0, ApplyKnockBack:CalculateMass(EnemyCharacter) * Height, 0))
end

return ApplyKnockBack
