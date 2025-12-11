$Loc = @{
    EN = @{
        # Header
        TitleAscii      = " Paimon Slimmer "
        Version         = "v1.0"
        ModeInfo        = "Active Mode: 0-Byte Replace"
        
        # Path Selection
        PasteTitle      = " GAME DIRECTORY SETUP "
        PastePrompt     = "Please paste your game path:"
        PasteHint       = "Example: D:\Games\Genshin Impact\Genshin Impact game"
        PathFound       = " [OK] Valid game data found: {0}"
        PathSwitch      = " [>>] Switching context to: {0}"
        PathError       = " [X] Invalid path. Look for 'GenshinImpact_Data' or 'YuanShen_Data'."
        
        # Main Menu
        MenuHeader      = " AVAILABLE OPERATIONS "
        SectionVideos   = " [ Cutscenes / Videos ]"
        SectionExtra    = " [ Advanced / Extras ]"
        
        OptMond         = "1. Mondstadt"
        OptLiyue        = "2. Liyue"
        OptInazuma      = "3. Inazuma"
        OptSumeru       = "4. Sumeru"
        OptFontaine     = "5. Fontaine"
        OptNatlan       = "6. Natlan"
        OptNodKrai      = "7. NodKrai"         # New
        OptMissed       = "8. Missed Scenes (Shenhe/Yunjin/Ayaka etc.)" # New
        
        OptUGC          = "9. UGC Cache (Event/Custom Domains)"
        OptBoy          = "10. Aether/Boy Videos (Global Only)"
        OptGirl         = "11. Lumine/Girl Videos (Global Only)"
        
        OptAll          = "12. SLIM ALL (Regions 1-7 + Missed + UGC)"
        OptBypass       = "13. Apply Integrity Bypass (R/S/D Version Number)"
        OptQuit         = "Q. Quit"
        
        # Interaction
        InputPrompt     = " Select Option > "
        InvalidInput    = " [!] Invalid selection."
        PressEnter      = "Press [Enter] to continue..."
        
        # Processing
        ScanTitle       = " SCANNING FILES "
        NoFiles         = " [i] No files found for: {0}"
        AlreadySlim     = " [i] All matching files are already slimmed."
        
        ConfirmTitle    = " CONFIRMATION "
        FilesFound      = " Targets Found : {0}"
        PotSavings      = " Disk Savings  : {0} GB"
        FileListHeader  = " [!] Files to be slimmed:"
        AndMoreFiles    = " ... and {0} more files."
        ConfirmPrompt   = " Proceed with slimming? (Y/N) > "
        CancelMsg       = " [-] Operation cancelled."
        
        ProcessTitle    = " PROCESSING "
        ItemSlimmed     = " [v] Slimmed : {0}"
        ItemError       = " [X] Error   : {0} - {1}"
        DoneTitle       = " COMPLETED "
        SummaryMsg      = " Processed {0} files. Saved {1} GB total."
        
        # Bypass UI
        BypassHeader    = " INTEGRITY CHECK BYPASS "
        BypassWarn      = " [!] This modifies 'Persistent' data to skip file verification."
        BypassStep1     = " 1. Removing Read-Only attributes..."
        BypassStep2     = " 2. Version Configuration (Check Login Screen)"
        InputR          = "    > Res Version (R)     : "
        InputS          = "    > Silence Version (S) : "
        InputD          = "    > Data Version (D)    : "
        BypassStep3     = " 3. Applying Patches..."
        ActionDel       = "    [-] Delete : {0}"
        ActionRen       = "    [~] Rename : {0} -> {1}"
        ActionSet       = "    [+] Write  : {0}"
        BypassComplete  = " [v] Bypass applied successfully."
        PersistErr      = " [X] 'Persistent' folder not found. Run game once."
    }
    CN = @{
        # Header
        TitleAscii      = " 派蒙瘦身器 (Paimon Slimmer) "
        Version         = "v1.0"
        ModeInfo        = "当前模式: 0字节替换"
        
        # Path Selection
        PasteTitle      = " 游戏目录设置 "
        PastePrompt     = "请粘贴游戏文件路径:"
        PasteHint       = "示例: D:\Games\Genshin Impact\Genshin Impact game"
        PathFound       = " [OK] 找到有效游戏数据: {0}"
        PathSwitch      = " [>>] 切换上下文目录至: {0}"
        PathError       = " [X] 路径无效。未找到 'GenshinImpact_Data' 或 'YuanShen_Data'。"
        
        # Main Menu
        MenuHeader      = " 可用操作菜单 "
        SectionVideos   = " [ 剧情动画 / 视频 ]"
        SectionExtra    = " [ 高级选项 / 额外 ]"
        
        OptMond         = "1. 蒙德 (Mondstadt)"
        OptLiyue        = "2. 璃月 (Liyue)"
        OptInazuma      = "3. 稻妻 (Inazuma)"
        OptSumeru       = "4. 须弥 (Sumeru)"
        OptFontaine     = "5. 枫丹 (Fontaine)"
        OptNatlan       = "6. 纳塔 (Natlan)"
        OptNodKrai      = "7. 挪德卡莱 (NodKrai)"   # New
        OptMissed       = "8. 遗漏剧情 (申鹤/云堇/绫华等)" # New
        
        OptUGC          = "9. UGC 缓存 (活动/自制关卡)"
        OptBoy          = "10. 男主(空)视频 (全局)"
        OptGirl         = "11. 女主(荧)视频 (全局)"
        
        OptAll          = "12. 全部精简 (区域 1-7 + 遗漏 + UGC)"
        OptBypass       = "13. 应用校验绕过 (需R/S/D版本号，用于跳过校验)"
        OptQuit         = "Q. 退出"
        
        # Interaction
        InputPrompt     = " 选择操作 > "
        InvalidInput    = " [!] 无效的选择。"
        PressEnter      = "按 [回车键] 继续..."
        
        # Processing
        ScanTitle       = " 扫描文件中 "
        NoFiles         = " [i] 未找到相关文件: {0}"
        AlreadySlim     = " [i] 所有匹配文件已是精简状态。"
        
        ConfirmTitle    = " 确认操作 "
        FilesFound      = " 目标文件数 : {0}"
        PotSavings      = " 预计节省空间 : {0} GB"
        FileListHeader  = " [!] 即将被清理的文件:"
        AndMoreFiles    = " ... (以及另外 {0} 个文件)"
        ConfirmPrompt   = " 确认开始瘦身? (Y/N) > "
        CancelMsg       = " [-] 操作已取消。"
        
        ProcessTitle    = " 处理中 "
        ItemSlimmed     = " [v] 已精简 : {0}"
        ItemError       = " [X] 错误   : {0} - {1}"
        DoneTitle       = " 完成 "
        SummaryMsg      = " 成功处理 {0} 个文件。共节省 {1} GB 空间。"
        
        # Bypass UI
        BypassHeader    = " 完整性校验绕过 "
        BypassWarn      = " [!] 此操作将修改 Persistent 数据以跳过启动时文件校验。"
        BypassStep1     = " 1. 移除只读属性..."
        BypassStep2     = " 2. 版本配置 (请查看游戏登录界面的右下角)"
        InputR          = "    > 资源版本 (Res)      : "
        InputS          = "    > 静默版本 (Silence)  : "
        InputD          = "    > 数据版本 (Data)     : "
        BypassStep3     = " 3. 应用补丁中..."
        ActionDel       = "    [-] 删除 : {0}"
        ActionRen       = "    [~] 重命名 : {0} -> {1}"
        ActionSet       = "    [+] 写入 : {0}"
        BypassComplete  = " [v] 绕过补丁应用成功。"
        PersistErr      = " [X] 未找到 'Persistent' 文件夹。请先运行一次游戏。"
    }
}

# --- UI HELPERS ---
function Draw-Line {
    Write-Host "" -ForegroundColor DarkGray
}

function Draw-Header {
    param ([string]$Title)
    Write-Host ""
    Write-Host " :: $Title" -ForegroundColor Cyan
    Draw-Line
}

function Wait-For-Language {
    Clear-Host
    Write-Host "`n PAIMON SLIMMER SETUP" -ForegroundColor Cyan
    Write-Host "" -ForegroundColor DarkGray
    Write-Host " 1. English"
    Write-Host " 2. 简体中文 (Chinese)"
    Write-Host ""
    $valid = $false
    while (-not $valid) {
        Write-Host " Select > " -NoNewline -ForegroundColor Yellow
        $langChoice = Read-Host
        if ($langChoice -eq '1') { $script:Lang = "EN"; $valid = $true }
        elseif ($langChoice -eq '2') { $script:Lang = "CN"; $valid = $true }
    }
}

# --- CONSTANTS ---
$RelPath_Videos = "VideoAssets\StandaloneWindows64"
$RelPath_UGC    = "AudioAssets\BeyondUGC"
$Lang = "EN"

# --- CORE FUNCTIONS ---

function Get-GamePath {
    Clear-Host
    Draw-Header $Loc[$Lang]['PasteTitle']
    
    Write-Host " $($Loc[$Lang]['PastePrompt'])" -ForegroundColor White
    Write-Host " $($Loc[$Lang]['PasteHint'])" -ForegroundColor DarkGray
    Write-Host ""
    
    $validPathFound = $false
    
    $checkSubPathGlobal = "GenshinImpact_Data\StreamingAssets\VideoAssets\StandaloneWindows64"
    $checkSubPathCN     = "YuanShen_Data\StreamingAssets\VideoAssets\StandaloneWindows64"
    $targetSubPathGlobal = "GenshinImpact_Data\StreamingAssets"
    $targetSubPathCN     = "YuanShen_Data\StreamingAssets"

    while (-not $validPathFound) {
        Write-Host " Path > " -NoNewline -ForegroundColor Yellow
        $userInput = Read-Host 
        $userInput = ($userInput -replace '"', '').Trim()
        
        $fullCheckGlobal = Join-Path -Path $userInput -ChildPath $checkSubPathGlobal
        $fullCheckCN     = Join-Path -Path $userInput -ChildPath $checkSubPathCN

        if (Test-Path $fullCheckGlobal) {
            Write-Host ($Loc[$Lang]['PathFound'] -f "Global") -ForegroundColor Green
            $target = Join-Path -Path $userInput -ChildPath $targetSubPathGlobal
            Set-Location $target
            Write-Host ($Loc[$Lang]['PathSwitch'] -f "StreamingAssets") -ForegroundColor DarkGray
            $validPathFound = $true
        } 
        elseif (Test-Path $fullCheckCN) {
            Write-Host ($Loc[$Lang]['PathFound'] -f "CN (YuanShen)") -ForegroundColor Green
            $target = Join-Path -Path $userInput -ChildPath $targetSubPathCN
            Set-Location $target
            Write-Host ($Loc[$Lang]['PathSwitch'] -f "StreamingAssets") -ForegroundColor DarkGray
            $validPathFound = $true
        } 
        else {
            Write-Host $Loc[$Lang]['PathError'] -ForegroundColor Red
        }
    }
    Start-Sleep -Seconds 1
}

function Get-MatchingFiles {
    param ([string]$RelativePath, [array]$Patterns)
    $fullPath = Join-Path (Get-Location) $RelativePath
    if (-not (Test-Path $fullPath)) { return @() }

    return Get-ChildItem -Path $fullPath -File | Where-Object { 
        $name = $_.Name
        $isMatch = $false
        foreach ($pattern in $Patterns) { 
            if ($name -like $pattern) { $isMatch = $true; break } 
        }
        $isMatch
    }
}

function Invoke-RSDBypass {
    Clear-Host
    Draw-Header $Loc[$Lang]['BypassHeader']
    Write-Host " $($Loc[$Lang]['BypassWarn'])" -ForegroundColor Yellow
    Write-Host ""
    
    $currentDir = Get-Location
    $parentDir = Split-Path -Path $currentDir -Parent
    $persistDir = Join-Path -Path $parentDir -ChildPath "Persistent"

    if (-not (Test-Path $persistDir)) {
        Write-Host " $($Loc[$Lang]['PersistErr'])" -ForegroundColor Red
        Read-Host $Loc[$Lang]['PressEnter']
        return
    }

    # Step 1: Remove Read-Only
    Write-Host $Loc[$Lang]['BypassStep1'] -ForegroundColor Cyan
    try {
        $folderItem = Get-Item $persistDir
        if ($folderItem.IsReadOnly) { $folderItem.IsReadOnly = $false }
        Get-ChildItem -Path $persistDir -Recurse | ForEach-Object {
            if ($_.IsReadOnly) { $_.IsReadOnly = $false }
        }
    } catch { }
    Write-Host "    [OK] Attributes Cleaned." -ForegroundColor DarkGray
    Write-Host ""

    # Step 2: Inputs
    Write-Host $Loc[$Lang]['BypassStep2'] -ForegroundColor Cyan
    
    Write-Host $Loc[$Lang]['InputR'] -NoNewline -ForegroundColor White
    $valR = Read-Host
    Write-Host $Loc[$Lang]['InputS'] -NoNewline -ForegroundColor White
    $valS = Read-Host
    Write-Host $Loc[$Lang]['InputD'] -NoNewline -ForegroundColor White
    $valD = Read-Host

    if ([string]::IsNullOrWhiteSpace($valR) -or [string]::IsNullOrWhiteSpace($valS) -or [string]::IsNullOrWhiteSpace($valD)) {
        Write-Host " [!] Error: Values cannot be empty." -ForegroundColor Red
        Read-Host $Loc[$Lang]['PressEnter']
        return
    }

    # Step 3: Patching
    Write-Host ""
    Write-Host $Loc[$Lang]['BypassStep3'] -ForegroundColor Cyan
    
    $filesToDelete = @("base_revision", "cache_versions_*", "data_versions_persist", "res_versions_persist", "silence_data_versions_persist")
    foreach ($pattern in $filesToDelete) {
        Get-ChildItem -Path $persistDir -Filter $pattern -ErrorAction SilentlyContinue | ForEach-Object {
            Write-Host ($Loc[$Lang]['ActionDel'] -f $_.Name) -ForegroundColor DarkGray
            Remove-Item $_.FullName -Force -ErrorAction SilentlyContinue
        }
    }

    $renames = @{
        "data_versions_remote" = "data_versions_persist"
        "res_versions_remote" = "res_versions_persist"
        "silence_data_versions_remote" = "silence_data_versions_persist"
    }
    foreach ($srcName in $renames.Keys) {
        $srcPath = Join-Path $persistDir $srcName
        $destName = $renames[$srcName]
        $destPath = Join-Path $persistDir $destName
        if (Test-Path $srcPath) {
            if (Test-Path $destPath) { Remove-Item $destPath -Force }
            Write-Host ($Loc[$Lang]['ActionRen'] -f $srcName, $destName) -ForegroundColor DarkGray
            Rename-Item -Path $srcPath -NewName $destName -Force
        }
    }

    try {
        Set-Content -Path (Join-Path $persistDir "res_revision") -Value $valR -Force
        Write-Host ($Loc[$Lang]['ActionSet'] -f "res_revision") -ForegroundColor Green
        Set-Content -Path (Join-Path $persistDir "silence_revision") -Value $valS -Force
        Write-Host ($Loc[$Lang]['ActionSet'] -f "silence_revision") -ForegroundColor Green
        Set-Content -Path (Join-Path $persistDir "data_revision") -Value $valD -Force
        Write-Host ($Loc[$Lang]['ActionSet'] -f "data_revision") -ForegroundColor Green
    } catch {
        Write-Host " [!] Write Error: $_" -ForegroundColor Red
    }

    Write-Host ""
    Draw-Line
    Write-Host $Loc[$Lang]['BypassComplete'] -ForegroundColor Yellow
    Read-Host $Loc[$Lang]['PressEnter']
}

function Process-Deletion {
    param ([array]$FilesToDelete, [string]$Description)

    Clear-Host
    Draw-Header $Loc[$Lang]['ScanTitle']
    Write-Host " Target: $Description" -ForegroundColor White
    
    $FilesToProcess = $FilesToDelete | Where-Object { $_.Length -gt 0 }

    if ($FilesToDelete.Count -eq 0) {
        Write-Host ($Loc[$Lang]['NoFiles'] -f $Description) -ForegroundColor Yellow
        Read-Host $Loc[$Lang]['PressEnter']
        return
    }

    if ($FilesToProcess.Count -eq 0) {
        Write-Host $Loc[$Lang]['AlreadySlim'] -ForegroundColor Green
        Start-Sleep -Seconds 1
        return
    }

    $totalBytes = ($FilesToProcess | Measure-Object -Property Length -Sum).Sum
    $totalGB = [math]::Round($totalBytes / 1GB, 2)

    # Confirm UI
    Write-Host ""
    Draw-Header $Loc[$Lang]['ConfirmTitle']
    Write-Host ($Loc[$Lang]['FilesFound'] -f $FilesToProcess.Count) -ForegroundColor White
    Write-Host ($Loc[$Lang]['PotSavings'] -f $totalGB) -ForegroundColor Green
    Write-Host ""

    # --- Show File Details ---
    Write-Host $Loc[$Lang]['FileListHeader'] -ForegroundColor Cyan
    
    if ($FilesToProcess.Count -le 20) {
        foreach ($f in $FilesToProcess) {
            Write-Host "    - $($f.Name)" -ForegroundColor DarkGray
        }
    } else {
        for ($i = 0; $i -lt 10; $i++) {
            Write-Host "    - $($FilesToProcess[$i].Name)" -ForegroundColor DarkGray
        }
        Write-Host "    ..." -ForegroundColor White
        $remaining = $FilesToProcess.Count - 15
        if ($remaining -gt 0) {
             Write-Host ($Loc[$Lang]['AndMoreFiles'] -f $remaining) -ForegroundColor Yellow
        }
        for ($i = $FilesToProcess.Count - 5; $i -lt $FilesToProcess.Count; $i++) {
             Write-Host "    - $($FilesToProcess[$i].Name)" -ForegroundColor DarkGray
        }
    }
    Write-Host ""
    # -----------------------------
    
    Write-Host $Loc[$Lang]['ConfirmPrompt'] -NoNewline -ForegroundColor Yellow
    $confirmation = Read-Host
    
    if ($confirmation -eq 'Y' -or $confirmation -eq 'y') {
        Write-Host ""
        Write-Host $Loc[$Lang]['ProcessTitle'] -ForegroundColor Cyan
        Draw-Line
        
        $deletedCount = 0
        $deletedSize = 0
        
        foreach ($file in $FilesToProcess) {
            try {
                $size = $file.Length
                Clear-Content $file.FullName -Force -ErrorAction Stop
                Write-Host ($Loc[$Lang]['ItemSlimmed'] -f $file.Name) -ForegroundColor DarkGray
                $deletedCount++
                $deletedSize += $size
            }
            catch {
                Write-Host ($Loc[$Lang]['ItemError'] -f $file.Name, $_) -ForegroundColor Red
            }
        }

        $finalSavedGB = [math]::Round($deletedSize / 1GB, 2)
        
        Write-Host ""
        Draw-Header $Loc[$Lang]['DoneTitle']
        Write-Host ($Loc[$Lang]['SummaryMsg'] -f $deletedCount, $finalSavedGB) -ForegroundColor Green
    } else {
        Write-Host $Loc[$Lang]['CancelMsg'] -ForegroundColor Yellow
    }
    
    Read-Host $Loc[$Lang]['PressEnter']
}

# --- EXECUTION ---
$PatternsMondstadt = @("*Mengde*", "*MDAQ*", "*Venti*")
$PatternsLiyue     = @("*LiYue*", "*LYAQ*")
$PatternsInazuma   = @("*Inazuma*")
$PatternsSumeru    = @("*Sumeru*")
$PatternsFontaine  = @("*Fontaine*")
$PatternsNatlan    = @("*Natlan*")
# New Patterns
$PatternsNodKrai   = @("*NodKrai*")
$PatternsMissed    = @(
    "*ShenheBattle*", "*AfterBattle*", "*YunjinOpera*", "*Ayaka*", 
    "*ShougunBoss*", "*WanYeXian*", "*SHG*", "*Xiao*", "*Ambor*", 
    "*Summon*", "*BeforeBattle*", "*GYPersonal*", "*battlePass*", 
    "*ChangeWeather*", "*Memories*", "*ShieldingResources*"
)

$PatternsBoy       = @("*Boy.usm")
$PatternsGirl      = @("*Girl.usm")

Wait-For-Language
Get-GamePath

do {
    Clear-Host
    # Fancy Title
    Write-Host "=========================================================" -ForegroundColor Cyan
    Write-Host $Loc[$Lang]['TitleAscii'] -ForegroundColor Yellow -NoNewline
    Write-Host $Loc[$Lang]['Version'] -ForegroundColor DarkGray
    Write-Host "=========================================================" -ForegroundColor Cyan
    Write-Host " " $Loc[$Lang]['ModeInfo'] -ForegroundColor DarkGray
    Write-Host ""
    
    Write-Host $Loc[$Lang]['MenuHeader'] -ForegroundColor White
    Draw-Line
    
    # Section 1: Videos (Regions)
    Write-Host $Loc[$Lang]['SectionVideos'] -ForegroundColor Cyan
    Write-Host " $($Loc[$Lang]['OptMond'])" 
    Write-Host " $($Loc[$Lang]['OptLiyue'])" 
    Write-Host " $($Loc[$Lang]['OptInazuma'])" 
    Write-Host " $($Loc[$Lang]['OptSumeru'])" 
    Write-Host " $($Loc[$Lang]['OptFontaine'])" 
    Write-Host " $($Loc[$Lang]['OptNatlan'])" 
    Write-Host " $($Loc[$Lang]['OptNodKrai'])" # New
    Write-Host " $($Loc[$Lang]['OptMissed'])"  # New
    Write-Host ""
    
    # Section 2: Extras
    Write-Host $Loc[$Lang]['SectionExtra'] -ForegroundColor Cyan
    Write-Host " $($Loc[$Lang]['OptUGC'])" -ForegroundColor Gray
    Write-Host " $($Loc[$Lang]['OptBoy'])" -ForegroundColor Gray
    Write-Host " $($Loc[$Lang]['OptGirl'])" -ForegroundColor Gray
    Write-Host ""
    
    # Special Options
    Write-Host " $($Loc[$Lang]['OptAll'])" -ForegroundColor Magenta
    Write-Host " $($Loc[$Lang]['OptBypass'])" -ForegroundColor Green
    Draw-Line
    Write-Host " $($Loc[$Lang]['OptQuit'])" 
    Write-Host ""

    Write-Host $Loc[$Lang]['InputPrompt'] -NoNewline -ForegroundColor Yellow
    $choice = Read-Host
    
    $selection = @()
    $desc = ""

    switch ($choice) {
        '1' { $selection = Get-MatchingFiles $RelPath_Videos $PatternsMondstadt; $desc = $Loc[$Lang]['OptMond'] }
        '2' { $selection = Get-MatchingFiles $RelPath_Videos $PatternsLiyue;     $desc = $Loc[$Lang]['OptLiyue'] }
        '3' { $selection = Get-MatchingFiles $RelPath_Videos $PatternsInazuma;   $desc = $Loc[$Lang]['OptInazuma'] }
        '4' { $selection = Get-MatchingFiles $RelPath_Videos $PatternsSumeru;    $desc = $Loc[$Lang]['OptSumeru'] }
        '5' { $selection = Get-MatchingFiles $RelPath_Videos $PatternsFontaine;  $desc = $Loc[$Lang]['OptFontaine'] }
        '6' { $selection = Get-MatchingFiles $RelPath_Videos $PatternsNatlan;    $desc = $Loc[$Lang]['OptNatlan'] }
        '7' { $selection = Get-MatchingFiles $RelPath_Videos $PatternsNodKrai;   $desc = $Loc[$Lang]['OptNodKrai'] } # New Case
        '8' { $selection = Get-MatchingFiles $RelPath_Videos $PatternsMissed;    $desc = $Loc[$Lang]['OptMissed'] }  # New Case
        
        '9'  { $selection = Get-MatchingFiles $RelPath_UGC @("*");               $desc = $Loc[$Lang]['OptUGC'] }
        '10' { $selection = Get-MatchingFiles $RelPath_Videos $PatternsBoy;      $desc = $Loc[$Lang]['OptBoy'] }
        '11' { $selection = Get-MatchingFiles $RelPath_Videos $PatternsGirl;     $desc = $Loc[$Lang]['OptGirl'] }
        
        '12' { 
            # Updated All pattern to include NodKrai and Missed
            $AllVideoPatterns = $PatternsMondstadt + $PatternsLiyue + $PatternsInazuma + $PatternsSumeru + $PatternsFontaine + $PatternsNatlan + $PatternsNodKrai + $PatternsMissed
            $selection += Get-MatchingFiles $RelPath_Videos $AllVideoPatterns
            $selection += Get-MatchingFiles $RelPath_UGC @("*")
            $desc = $Loc[$Lang]['OptAll']
        }
        '13' { Invoke-RSDBypass }
        'Q' { exit } 
        'q' { exit } 
        Default { 
            if ($choice -ne '') {
                Write-Host $Loc[$Lang]['InvalidInput'] -ForegroundColor Red; Start-Sleep -Seconds 1 
            }
        }
    }

    if ($choice -in '1'..'12') {
        Process-Deletion -FilesToDelete $selection -Description $desc
    }
    
    $choice = $null

} until ($choice -eq 'Q' -or $choice -eq 'q')