local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

    local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
    local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
    local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
    local Window = Library:CreateWindow({

        Title = 'Darkware -- V2ab',
        Center = true, 
        AutoShow = true,
    })


    local Tabs = {
        Changelogs = Window:AddTab('Changelogs'), 
        PSX = Window:AddTab('Main Scripts'), 
        ['UI Settings'] = Window:AddTab('GUI Settings'),
    }
    local LeftGroupBox = Tabs.Changelogs:AddLeftGroupbox('Changelogs')
    LeftGroupBox:AddLabel('For All The Scripts!')
    LeftGroupBox:AddLabel('🟢 Working! 🟠 In Development 🔴 Patched!')
    LeftGroupBox:AddLabel('🟡 Buggy/Glitchy!')
    LeftGroupBox:AddLabel('---------------------------------')
    LeftGroupBox:AddLabel('Small Changes 1.2ab')
    LeftGroupBox:AddLabel('(+) Rc = Race Clickers')
    LeftGroupBox:AddLabel('(+) Added Another script for Rc')
    local MyButton = LeftGroupBox:AddButton('My Discord Server', function()
        game.StarterGui:SetCore("SendNotification", {Title = "Notification", Text = "Paste My Discord Server Into your Browser!", Icon = "rbxassetid://10550885987", Duration = 5})
        setclipboard("https://discord.gg/kVVgyNNy")
    end)
    local LeftGroupBox = Tabs.PSX:AddLeftGroupbox('------- This is a test ---------')
    LeftGroupBox:AddToggle('MyToggle', {
    Text = 'This is a toggle',
    Default = false, -- Default value (true / false)
    Tooltip = 'This is a tooltip', -- Information shown when you hover over the toggle
})
LeftGroupBox:AddDivider()
LeftGroupBox:AddSlider('Walkspeed', {
    Text = 'Walkspeed Slider',

    Default = 16,
    Min = 16,
    Max = 500,
    Rounding = 1,

    Compact = false, -- If set to true, then it will hide the label
})

local Number = Options.MySlider.Value
Options.MySlider:OnChanged(function()
    print('MySlider was changed! New value:', Options.MySlider.Value)
end)
      -- Library functions
    -- Sets the watermark visibility
    Library:SetWatermarkVisibility(true)

    -- Sets the watermark text
    Library:SetWatermark('Darkware V1 Winning') -- Set WaterMark To Public If V5

    Library:OnUnload(function()
        Library.Unloaded = true
    end)

    local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
    MenuGroup:AddButton('Destroy Gui', function() Library:Unload() end)
    MenuGroup:AddLabel('Menu KeyBind'):AddKeyPicker('MenuKeybind', { Default = 'E', NoUI = true, Text = 'Menu keybind' })

    Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

    ThemeManager:SetLibrary(Library)
    SaveManager:SetLibrary(Library)

    SaveManager:IgnoreThemeSettings() 

    SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 

    ThemeManager:SetFolder('MyScriptHub')
    SaveManager:SetFolder('MyScriptHub/specific-game')

    SaveManager:BuildConfigSection(Tabs['UI Settings']) 

    ThemeManager:ApplyToTab(Tabs['UI Settings'])
