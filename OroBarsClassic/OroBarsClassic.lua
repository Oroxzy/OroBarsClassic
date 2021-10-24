--Oro_UI by jeremymeile. Based on BFA UI for Classic 

	MainMenuXPBarTexture2:Hide()
		MainMenuXPBarTexture3:Hide()
		MainMenuBarTexture2:Hide()
		MainMenuBarTexture3:Hide()
		MainMenuBarPageNumber:Hide()
local function Kill(frame)
    if type(frame) == 'table' and frame.SetScript then
        frame:UnregisterAllEvents()
		--frame:ClearAllPoints()
        frame:SetScript('OnEvent',nil)
        frame:SetScript('OnUpdate',nil)
        frame:SetScript('OnHide',nil)
        frame:Hide()
		--frame:SetAlpha(0)
        frame.SetScript = null
        frame.RegisterEvent = null
        frame.RegisterAllEvents = null
        frame.Show = null
    end
end

--Kill(MainMenuBar)
Kill(MainMenuBarPerformanceBarFrame)
Kill(CharacterMicroButton)
Kill(SpellbookMicroButton)
Kill(TalentMicroButton)
Kill(QuestLogMicroButton)
Kill(MainMenuMicroButton)
Kill(HelpMicroButton)
Kill(SocialsMicroButton)
Kill(WorldMapMicroButton)
Kill(AchievementMicroButton)
Kill(MainMenuBarBackpackButton)
Kill(UIErrorsFrame)
Kill(ActionBarUpButton)
Kill(ActionBarDownButton)
Kill(MainMenuMaxLevelBar2)
Kill(MainMenuMaxLevelBar3)
Kill(KeyRingButton)

for i = 1,12 do
    Kill(_G[('ActionButton%d'):format(i)])
end

for i = 0,3 do
    Kill(_G[('CharacterBag%dSlot'):format(i)])
end


-- Hide textures
for _, texture in ipairs({
	ReputationWatchBarTexture2,
	ReputationWatchBarTexture3,
	ReputationXPBarTexture2,
	ReputationXPBarTexture3,
	StanceButton1,
	StanceButton2,
	StanceButton3,
	SlidingActionBarTexture0,
	SlidingActionBarTexture1,
	MainMenuXPBarTexture2,
	MainMenuXPBarTexture3,
	MainMenuBarTexture2,
	MainMenuBarTexture3,
	KeyRingButton,
	}) do
	texture:SetTexture(nil)
end

	-- Hide Keyring
	KeyRingButton:SetMovable(true)
	KeyRingButton:SetUserPlaced(true)
	KeyRingButton:ClearAllPoints()
	KeyRingButton:Hide()
	-- Hide TalentMicroButton
	TalentMicroButton:SetMovable(true)
	TalentMicroButton:SetUserPlaced(true)
	TalentMicroButton:ClearAllPoints()
	TalentMicroButton:Hide()
	
	-- Setwidth
	local width = 512
	MainMenuBar:SetWidth(width)
	MainMenuExpBar:SetWidth(width)
	MainMenuBarMaxLevelBar:SetWidth(width)

	-- Setpoint
	local yOffset = 5

	-- HelpMicroButton
	--HelpMicroButton:ClearAllPoints()
	--HelpMicroButton:SetPoint("BOTTOM", "MainMenuBarRightEndCap", 0 , yOffset)

	-- XPBar
	MainMenuXPBarTexture0:SetPoint("LEFT", MainMenuExpBar, "LEFT")
	MainMenuXPBarTexture1:SetPoint("RIGHT", MainMenuExpBar, "RIGHT")

	-- XPBarArt
	--MainMenuBarArtFrame:ClearAllPoints()
	--MainMenuMaxLevelBar0:SetPoint('BOTTOM', MainMenuBarMaxLevelBar, 'TOP', -128, 0)
	MainMenuMaxLevelBar0:SetPoint("LEFT", MainMenuBarArtFrame, "LEFT")
	MainMenuBarTexture0:SetPoint("LEFT", MainMenuBarArtFrame, "LEFT")
	MainMenuBarTexture1:SetPoint("RIGHT", MainMenuBarArtFrame, "RIGHT")
	-- Endcaps
	MainMenuBarLeftEndCap:SetPoint("RIGHT", MainMenuBarArtFrame, "LEFT", 30, 0)
	MainMenuBarRightEndCap:SetPoint("LEFT", MainMenuBarArtFrame, "RIGHT", -30, 0)

	-- MultiBarBottomRight
	MultiBarBottomRight:ClearAllPoints()
	MultiBarBottomRight:SetPoint("BOTTOM", MultiBarBottomLeft, "TOP", 0, yOffset)

	--StanceBarFrame:ClearAllPoints()
	StanceBarFrame:ClearAllPoints()
	StanceButton1:ClearAllPoints()
	local StanceBar_yOffset = -10
	local StanceBar_xOffset = 0
	
	StanceButton1:SetPoint("BOTTOM", MultiBarBottomRight, "TOP", -30, 4)
	
	if StanceButton1:IsVisible() then
		StanceButton1:SetPoint("BOTTOM", MultiBarBottomRight, "TOP", 30, 4)
		if StanceButton2:IsVisible() then
			StanceButton1:SetPoint("BOTTOM", MultiBarBottomRight, "TOP", -30, 4)
		end
		if StanceButton3:IsVisible() then
			StanceButton1:SetPoint("BOTTOM", MultiBarBottomRight, "TOP", -60, 4)
		end
	end

	-- PetActionBarFrame
	-- PetActionBarFrame:ClearAllPoints()
	-- PetActionBarFrame:SetMovable(true)
	-- PetActionBarFrame:SetUserPlaced(true)
	-- local PetAction_yOffset = -30
	-- if MultiBarBottomRight:IsVisible() then
	-- 	PetActionBarFrame:SetPoint("BOTTOM", UIParent, "TOP", 0, PetAction_yOffset)
	-- elseif MultiBarBottomLeft:IsVisible() then
	-- 	PetActionBarFrame:SetPoint("BOTTOM", UIParent, "TOP", 0, PetAction_yOffset)
	-- else
	-- 	PetActionBarFrame:SetPoint("BOTTOM", UIParent, "TOP", 0, PetAction_yOffset)
	-- end

	-- PetActionBarFrame
	PetActionButton1:ClearAllPoints()
	PetActionButton1:SetPoint("BOTTOM", MultiBarBottomRight, "TOP", -170, 4)
	for i=1, 10 do _G["PetActionButton"..i]:SetParent(MultiBarBottomRight) end
	RegisterStateDriver(PetActionBarFrame,"visibility", "hide")

	MultiBarBottomLeft:ClearAllPoints()
	local MultiBarBottomLeft_yOffset = -3

	if MainMenuExpBar:IsVisible() then
		MultiBarBottomLeft:SetPoint("BOTTOM", MainMenuBar, "TOP", 0, 3)
	else 
		MultiBarBottomLeft:SetPoint("BOTTOM", MainMenuBar, "TOP", 0, MultiBarBottomLeft_yOffset)
	end

		-- CastingBarFrame
	CastingBarFrame:SetMovable(true)
	CastingBarFrame:SetUserPlaced(true)
	CastingBarFrame:ClearAllPoints()
	local castBar_yOffset = 10
	CastingBarFrame:SetPoint("BOTTOM", MultiBarBottomRight, "TOP", 0, 120)

