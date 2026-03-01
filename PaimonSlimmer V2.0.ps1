<#
.SYNOPSIS
    PaimonSlimmer V2.0
    - Stubs files to 0KB to save space.
    - Applies "Aggressive Lock" (ACL Permissions) to prevent the game from redownloading.
    - Added Auto-Admin Elevation and Fixed Read-Only ACL exception.
#>

# --- ADMIN CHECK (自动请求管理员权限) ---
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host " [!] 需要管理员权限来修改文件安全策略。正在请求提权..." -ForegroundColor Yellow
    Start-Sleep -Seconds 1
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

$Loc = @{
    EN = @{
        # Header
        TitleAscii      = " Paimon Slimmer "
        Version         = "v1.2 Final"
        ModeInfo        = "Active Mode: 0-Byte Replace + ACL Lock"
        
        # Path Selection
        PasteTitle      = " GAME DIRECTORY SETUP "
        PastePrompt     = "Please paste your game path:"
        PasteHint       = "Example: D:\Games\Genshin Impact\Genshin Impact game"
        PathFound       = " [OK] Valid game data found: {0}"
        PathLoaded      = " [i] Loaded path from path.ini: {0}"
        PathSaved       = " [v] Path saved to path.ini"
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
        OptNodKrai      = "7. NodKrai"         
        OptMissed       = "8. Missed Scenes (Shenhe/Yunjin/Ayaka etc.)" 
        
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
        
        AlreadySlim     = " [i] All matching files appear to be already slimmed (0KB)."
        StubActionMenu  = " Select action for already slimmed files:"
        StubActCancel   = " 1. Cancel"
        StubActRelock   = " 2. Re-Apply Lock (Fix file permissions)"
        StubActRestore  = " 3. Unlock & Delete (Force game to redownload)"
        ActionRelocked  = " [v] Relocked : {0}"
        ActionUnlocked  = " [-] Unlocked & Deleted : {0}"

        ConfirmTitle    = " CONFIRMATION "
        FilesFound      = " Targets Found : {0}"
        PotSavings      = " Disk Savings  : {0} GB"
        FileListHeader  = " [!] Files to be slimmed & locked:"
        AndMoreFiles    = " ... and {0} more files."
        ConfirmPrompt   = " Proceed with slimming? (Y/N) > "
        CancelMsg       = " [-] Operation cancelled."
        
        ProcessTitle    = " PROCESSING "
        ItemSlimmed     = " [v] Stubbed & Locked : {0}"
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
        TitleAscii      = " 派蒙减负器 (Paimon Slimmer) "
        Version         = "v1.2 最终版"
        ModeInfo        = "当前模式: 0字节替换 + ACL权限锁定 (已开启管理员)"
        
        # Path Selection
        PasteTitle      = " 游戏目录设置 "
        PastePrompt     = "请粘贴游戏路径:"
        PasteHint       = "示例: D:\Games\Genshin Impact\Genshin Impact game"
        PathFound       = " [OK] 找到有效游戏数据: {0}"
        PathLoaded      = " [i] 从 path.ini 加载路径: {0}"
        PathSaved       = " [v] 路径已保存至 path.ini"
        PathError       = " [X] 路径无效，未找到 'GenshinImpact_Data' 或 'YuanShen_Data'"
        
        # Main Menu
        MenuHeader      = " 可用菜单 "
        SectionVideos   = " [ 过场动画 / 视频 ]"
        SectionExtra    = " [ 高级选项 / 附加 ]"
        
        OptMond         = "1. 蒙德 (Mondstadt)"
        OptLiyue        = "2. 璃月 (Liyue)"
        OptInazuma      = "3. 稻妻 (Inazuma)"
        OptSumeru       = "4. 须弥 (Sumeru)"
        OptFontaine     = "5. 枫丹 (Fontaine)"
        OptNatlan       = "6. 纳塔 (Natlan)"
        OptNodKrai      = "7. 诺德克莱 (NodKrai)"   
        OptMissed       = "8. 遗漏过场 (申鹤/云堇/绫华等)" 
        
        OptUGC          = "9. UGC 缓存 (活动/自定义秘境)"
        OptBoy          = "10. 空(男主)视频 (仅国际服)"
        OptGirl         = "11. 荧(女主)视频 (仅国际服)"
        
        OptAll          = "12. 全清 (区域 1-7 + 遗漏 + UGC)"
        OptBypass       = "13. 应用校验跳过 (R/S/D版本号校验)"
        OptQuit         = "Q. 退出"
        
        # Interaction
        InputPrompt     = " 请选择 > "
        InvalidInput    = " [!] 无效选择"
        PressEnter      = "按 [回车键] 继续..."
        
        # Processing
        ScanTitle       = " 扫描文件 "
        NoFiles         = " [i] 未找到匹配文件: {0}"
        
        AlreadySlim     = " [i] 所有匹配的文件似乎已经精简过了 (0KB)。"
        StubActionMenu  = " 请选择对已精简文件的操作:"
        StubActCancel   = " 1. 取消 (Cancel)"
        StubActRelock   = " 2. 重新锁定 (修复文件权限)"
        StubActRestore  = " 3. 解锁并删除 (强制游戏重新下载)"
        ActionRelocked  = " [v] 已重新锁定 : {0}"
        ActionUnlocked  = " [-] 已解锁并删除 : {0}"

        ConfirmTitle    = " 确认操作 "
        FilesFound      = " 目标文件 : {0}"
        PotSavings      = " 预计节省空间 : {0} GB"
        FileListHeader  = " [!] 即将精简并锁定的文件:"
        AndMoreFiles    = " ... (还有 {0} 个文件)"
        ConfirmPrompt   = " 确认开始? (Y/N) > "
        CancelMsg       = " [-] 操作已取消"
        
        ProcessTitle    = " 处理中 "
        ItemSlimmed     = " [v] 已精简并锁定 : {0}"
        ItemError       = " [X] 错误    : {0} - {1}"
        DoneTitle       = " 处理完成 "
        SummaryMsg      = " 成功处理 {0} 个文件，节省 {1} GB 空间。"
        
        # Bypass UI
        BypassHeader    = " 校验跳过 "
        BypassWarn      = " [!] 此操作将修改 Persistent 文件夹绕过实时文件校验。"
        BypassStep1     = " 1. 移除只读属性..."
        BypassStep2     = " 2. 版本号配置 (请查看游戏登录界面左下角)"
        InputR          = "    > 资源版本号 (Res)      : "
        InputS          = "    > 静默版本号 (Silence)  : "
        InputD          = "    > 数据版本号 (Data)     : "
        BypassStep3     = " 3. 应用补丁..."
        ActionDel       = "    [-] 删除 : {0}"
        ActionRen       = "    [~] 重命名 : {0} -> {1}"
        ActionSet       = "    [+] 写入 : {0}"
        BypassComplete  = " [v] 跳过补丁应用成功"
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
    Write-Host " 2. 中文 (Chinese)"
    Write-Host ""
    $valid = $false
    while (-not $valid) {
        Write-Host " Select > " -NoNewline -ForegroundColor Yellow
        $langChoice = Read-Host
        if ($langChoice -eq '1') { $script:Lang = "EN"; $valid = $true }
        elseif ($langChoice -eq '2') { $script:Lang = "CN"; $valid = $true }
    }
}

# --- CORE FUNCTIONS ---
function Get-GamePath {
    Clear-Host
    Draw-Header $Loc[$Lang]['PasteTitle']
    
    $ConfigPath = Join-Path $PSScriptRoot "path.ini"
    $validPathFound = $false

    # Check for saved path
    if (Test-Path $ConfigPath) {
        $SavedPath = Get-Content -Path $ConfigPath -Raw -ErrorAction SilentlyContinue
        if ($SavedPath) {
            $SavedPath = $SavedPath.Trim().Replace('"', '')
            if (Test-Path (Join-Path $SavedPath "GenshinImpact_Data")) {
                $script:DataFolder = "GenshinImpact_Data"
                Set-Location $SavedPath
                Write-Host ($Loc[$Lang]['PathLoaded'] -f $SavedPath) -ForegroundColor Green
                $validPathFound = $true
                Start-Sleep -Seconds 1
                return 
            } elseif (Test-Path (Join-Path $SavedPath "YuanShen_Data")) {
                $script:DataFolder = "YuanShen_Data"
                Set-Location $SavedPath
                Write-Host ($Loc[$Lang]['PathLoaded'] -f $SavedPath) -ForegroundColor Green
                $validPathFound = $true
                Start-Sleep -Seconds 1
                return 
            }
        }
    }

    Write-Host " $($Loc[$Lang]['PastePrompt'])" -ForegroundColor White
    Write-Host " $($Loc[$Lang]['PasteHint'])" -ForegroundColor DarkGray
    Write-Host ""

    while (-not $validPathFound) {
        Write-Host " Path > " -NoNewline -ForegroundColor Yellow
        $userInput = Read-Host 
        $userInput = ($userInput -replace '"', '').Trim()

        if (Test-Path (Join-Path $userInput "GenshinImpact_Data")) {
            $script:DataFolder = "GenshinImpact_Data"
            Set-Location $userInput
            try { $userInput | Out-File -FilePath $ConfigPath -Encoding utf8 -Force } catch {}
            Write-Host ($Loc[$Lang]['PathFound'] -f "Global") -ForegroundColor Green
            Write-Host $Loc[$Lang]['PathSaved'] -ForegroundColor DarkGray
            $validPathFound = $true
        } elseif (Test-Path (Join-Path $userInput "YuanShen_Data")) {
            $script:DataFolder = "YuanShen_Data"
            Set-Location $userInput
            try { $userInput | Out-File -FilePath $ConfigPath -Encoding utf8 -Force } catch {}
            Write-Host ($Loc[$Lang]['PathFound'] -f "CN (YuanShen)") -ForegroundColor Green
            Write-Host $Loc[$Lang]['PathSaved'] -ForegroundColor DarkGray
            $validPathFound = $true
        } else {
            Write-Host $Loc[$Lang]['PathError'] -ForegroundColor Red
        }
    }
    Start-Sleep -Seconds 1
}

function Toggle-FileLock {
    param (
        [string]$Path,
        [bool]$Lock
    )
    if (-not (Test-Path -LiteralPath $Path)) { return }
    $file = Get-Item -LiteralPath $Path -Force
    
    # 关键修复: 如果文件是只读状态，SetAccessControl 会因为未经授权直接抛错。
    # 必须在修改 ACL (安全选项) 之前先解除只读。
    if ($file.IsReadOnly) {
        try { $file.IsReadOnly = $false } catch {}
    }
    
    try {
        $acl = $file.GetAccessControl()
        $permission = "Everyone"
        $rights = "Write, Delete" 
        $type = "Deny"
        $rule = New-Object System.Security.AccessControl.FileSystemAccessRule($permission, $rights, $type)
        
        if ($Lock) {
            $acl.AddAccessRule($rule)
            $file.SetAccessControl($acl)
            
            # 添加完 Deny Write 安全锁之后，再重新加上只读（即使加不上，ACL锁也足够防御验证）
            try { $file.IsReadOnly = $true } catch {}
        } else {
            $acl.RemoveAccessRule($rule) | Out-Null
            $file.SetAccessControl($acl)
        }
    } catch {
        # 将底层报错抛出让上层捕获
        throw $_
    }
}

function Get-MatchingFiles {
    param ([array]$RelativePaths, [array]$Patterns)
    $AllFiles = @()
    $CurrentLocation = Get-Location

    foreach ($path in $RelativePaths) {
        $fullPath = Join-Path $CurrentLocation $path
        if (Test-Path $fullPath) {
            $files = Get-ChildItem -Path $fullPath -File | Where-Object { 
                $name = $_.Name
                $matched = $false
                foreach ($pattern in $Patterns) { if ($name -like $pattern) { $matched = $true; break } }
                $matched
            }
            $AllFiles += $files
        }
    }
    return $AllFiles
}

function Invoke-RSDBypass {
    Clear-Host
    Draw-Header $Loc[$Lang]['BypassHeader']
    Write-Host " $($Loc[$Lang]['BypassWarn'])" -ForegroundColor Yellow
    Write-Host ""
    
    $persistDir = Join-Path (Get-Location) "$script:DataFolder\Persistent"

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
            Remove-Item -LiteralPath $_.FullName -Force -ErrorAction SilentlyContinue
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
            if (Test-Path $destPath) { Remove-Item -LiteralPath $destPath -Force }
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
    
    if ($FilesToDelete.Count -eq 0) {
        Write-Host ($Loc[$Lang]['NoFiles'] -f $Description) -ForegroundColor Yellow
        Read-Host $Loc[$Lang]['PressEnter']
        return
    }

    $totalBytes = 0
    if ($FilesToDelete) {
        $totalBytes = ($FilesToDelete | Measure-Object -Property Length -Sum).Sum
    }

    # Check if files are mostly 0 bytes (Already slimmed)
    if ($totalBytes -lt ($FilesToDelete.Count * 1024)) {
        Write-Host ""
        Write-Host $Loc[$Lang]['AlreadySlim'] -ForegroundColor Green
        Write-Host ""
        Write-Host $Loc[$Lang]['StubActionMenu']
        Write-Host " $($Loc[$Lang]['StubActCancel'])"
        Write-Host " $($Loc[$Lang]['StubActRelock'])"
        Write-Host " $($Loc[$Lang]['StubActRestore'])"
        Write-Host ""
        $action = Read-Host $Loc[$Lang]['InputPrompt']

        if ($action -eq '2') {
            foreach ($file in $FilesToDelete) {
                try {
                    Toggle-FileLock -Path $file.FullName -Lock $false
                    Toggle-FileLock -Path $file.FullName -Lock $true
                    Write-Host ($Loc[$Lang]['ActionRelocked'] -f $file.Name) -ForegroundColor DarkGray
                } catch { Write-Host ($Loc[$Lang]['ItemError'] -f $file.Name, $_.Exception.Message) -ForegroundColor Red }
            }
        } elseif ($action -eq '3') {
            foreach ($file in $FilesToDelete) {
                try {
                    Toggle-FileLock -Path $file.FullName -Lock $false
                    Remove-Item -LiteralPath $file.FullName -Force
                    Write-Host ($Loc[$Lang]['ActionUnlocked'] -f $file.Name) -ForegroundColor DarkGray
                } catch { Write-Host ($Loc[$Lang]['ItemError'] -f $file.Name, $_.Exception.Message) -ForegroundColor Red }
            }
        }
        Read-Host $Loc[$Lang]['PressEnter']
        return
    }

    $FilesToProcess = $FilesToDelete | Where-Object { $_.Length -gt 0 }
    $totalGB = [math]::Round($totalBytes / 1GB, 2)

    # Confirm UI
    Write-Host ""
    Draw-Header $Loc[$Lang]['ConfirmTitle']
    Write-Host ($Loc[$Lang]['FilesFound'] -f $FilesToProcess.Count) -ForegroundColor White
    Write-Host ($Loc[$Lang]['PotSavings'] -f $totalGB) -ForegroundColor Green
    Write-Host ""

    Write-Host $Loc[$Lang]['FileListHeader'] -ForegroundColor Cyan
    if ($FilesToProcess.Count -le 20) {
        foreach ($f in $FilesToProcess) { Write-Host "    - $($f.Name)" -ForegroundColor DarkGray }
    } else {
        for ($i = 0; $i -lt 10; $i++) { Write-Host "    - $($FilesToProcess[$i].Name)" -ForegroundColor DarkGray }
        Write-Host "    ..." -ForegroundColor White
        $remaining = $FilesToProcess.Count - 15
        if ($remaining -gt 0) { Write-Host ($Loc[$Lang]['AndMoreFiles'] -f $remaining) -ForegroundColor Yellow }
        for ($i = $FilesToProcess.Count - 5; $i -lt $FilesToProcess.Count; $i++) { Write-Host "    - $($FilesToProcess[$i].Name)" -ForegroundColor DarkGray }
    }
    Write-Host ""
    
    Write-Host $Loc[$Lang]['ConfirmPrompt'] -NoNewline -ForegroundColor Yellow
    $confirmation = Read-Host
    
    if ($confirmation -match '^[Yy]$') {
        Write-Host ""
        Write-Host $Loc[$Lang]['ProcessTitle'] -ForegroundColor Cyan
        Draw-Line
        
        $deletedCount = 0
        $deletedSize = 0
        
        foreach ($file in $FilesToProcess) {
            try {
                $size = $file.Length
                
                # 1. 尝试先解开原有的锁（清理干净）
                try { Toggle-FileLock -Path $file.FullName -Lock $false } catch {}
                
                # 2. 清空文件数据（变为0KB）
                Clear-Content -LiteralPath $file.FullName -Force -ErrorAction Stop
                
                # 3. 强力加锁（拒绝读取/写入）
                Toggle-FileLock -Path $file.FullName -Lock $true

                Write-Host ($Loc[$Lang]['ItemSlimmed'] -f $file.Name) -ForegroundColor DarkGray
                $deletedCount++
                $deletedSize += $size
            }
            catch {
                Write-Host ($Loc[$Lang]['ItemError'] -f $file.Name, $_.Exception.Message) -ForegroundColor Red
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
Wait-For-Language
Get-GamePath

# Setting up dual-directory paths based on discovered Data folder
$RelPaths_Videos = @(
    "$script:DataFolder\StreamingAssets\VideoAssets\StandaloneWindows64",
    "$script:DataFolder\Persistent\VideoAssets\StandaloneWindows64"
)
$RelPaths_UGC = @(
    "$script:DataFolder\StreamingAssets\AudioAssets\BeyondUGC",
    "$script:DataFolder\Persistent\AudioAssets\BeyondUGC"
)

$PatternsMondstadt = @("*Mengde*", "*MDAQ*", "*Venti*")
$PatternsLiyue     = @("*LiYue*", "*LYAQ*")
$PatternsInazuma   = @("*Inazuma*")
$PatternsSumeru    = @("*Sumeru*")
$PatternsFontaine  = @("*Fontaine*")
$PatternsNatlan    = @("*Natlan*")
$PatternsNodKrai   = @("*NodKrai*")
$PatternsMissed    = @(
    "*ShenheBattle*", "*AfterBattle*", "*YunjinOpera*", "*Ayaka*", 
    "*ShougunBoss*", "*WanYeXian*", "*SHG*", "*Xiao*", "*Ambor*", 
    "*Summon*", "*BeforeBattle*", "*GYPersonal*", "*battlePass*", 
    "*ChangeWeather*", "*Memories*", "*ShieldingResources*"
)
$PatternsBoy       = @("*Boy.usm")
$PatternsGirl      = @("*Girl.usm")

do {
    Clear-Host
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
    Write-Host " $($Loc[$Lang]['OptNodKrai'])" 
    Write-Host " $($Loc[$Lang]['OptMissed'])"  
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
        '1' { $selection = Get-MatchingFiles $RelPaths_Videos $PatternsMondstadt; $desc = $Loc[$Lang]['OptMond'] }
        '2' { $selection = Get-MatchingFiles $RelPaths_Videos $PatternsLiyue;     $desc = $Loc[$Lang]['OptLiyue'] }
        '3' { $selection = Get-MatchingFiles $RelPaths_Videos $PatternsInazuma;   $desc = $Loc[$Lang]['OptInazuma'] }
        '4' { $selection = Get-MatchingFiles $RelPaths_Videos $PatternsSumeru;    $desc = $Loc[$Lang]['OptSumeru'] }
        '5' { $selection = Get-MatchingFiles $RelPaths_Videos $PatternsFontaine;  $desc = $Loc[$Lang]['OptFontaine'] }
        '6' { $selection = Get-MatchingFiles $RelPaths_Videos $PatternsNatlan;    $desc = $Loc[$Lang]['OptNatlan'] }
        '7' { $selection = Get-MatchingFiles $RelPaths_Videos $PatternsNodKrai;   $desc = $Loc[$Lang]['OptNodKrai'] }
        '8' { $selection = Get-MatchingFiles $RelPaths_Videos $PatternsMissed;    $desc = $Loc[$Lang]['OptMissed'] }
        
        '9'  { $selection = Get-MatchingFiles $RelPaths_UGC @("*");               $desc = $Loc[$Lang]['OptUGC'] }
        '10' { $selection = Get-MatchingFiles $RelPaths_Videos $PatternsBoy;      $desc = $Loc[$Lang]['OptBoy'] }
        '11' { $selection = Get-MatchingFiles $RelPaths_Videos $PatternsGirl;     $desc = $Loc[$Lang]['OptGirl'] }
        
        '12' { 
            $AllVideoPatterns = $PatternsMondstadt + $PatternsLiyue + $PatternsInazuma + $PatternsSumeru + $PatternsFontaine + $PatternsNatlan + $PatternsNodKrai + $PatternsMissed
            $selection += Get-MatchingFiles $RelPaths_Videos $AllVideoPatterns
            $selection += Get-MatchingFiles $RelPaths_UGC @("*")
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

