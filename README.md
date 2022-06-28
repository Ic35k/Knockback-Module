# Knockback-Module
Simple Knockback Module For Roblox Community

Here Is The Example On How To Use It

```
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ApplyKnockBack = require(ReplicatedStorage:WaitForChild("ApplyKnockBack_Module"))

local KnockBackConstructor = ApplyKnockBack.new(EnemyCharacter,Character,2.5 -- Range, 1.5 -- Height) 
    KnockBackConstructor:Construct()
```
