# ================================
# Step 1: Download Jenkins Agent
# ================================
Write-Output "Downloading Jenkins agent jar..."
$agent_jar_path = "C:\Jenkins\agent.jar"
Invoke-WebRequest $agent_jar_url -OutFile $agent_jar_path
Write-Output "Jenkins agent jar downloaded to $agent_jar_path"

# ================================
# Step 2: Enable AutoLogon
# ================================
Write-Output "Enabling AutoLogon..."
$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
Set-ItemProperty -Path $RegPath -Name "AutoAdminLogon" -Value "1" -Type String
Set-ItemProperty -Path $RegPath -Name "DefaultUsername" -Value "$admin_username" -Type String
Set-ItemProperty -Path $RegPath -Name "DefaultPassword" -Value "$admin_password" -Type String

# Force AutoLogon to take effect
reg add "$RegPath" /v "AutoAdminLogon" /t REG_SZ /d "1" /f
reg add "$RegPath" /v "DefaultUsername" /t REG_SZ /d "$admin_username" /f
reg add "$RegPath" /v "DefaultPassword" /t REG_SZ /d "$admin_password" /f
Write-Output "AutoLogon enabled for $admin_username"

# ================================
# Step 3: Disable Screen Lock & Sleep Mode
# ================================
Write-Output "Disabling screen lock and sleep mode..."
powercfg /change monitor-timeout-ac 0
powercfg /change standby-timeout-ac 0
reg add "HKCU\Control Panel\Desktop" /v ScreenSaveActive /t REG_SZ /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v InactivityTimeoutSecs /t REG_DWORD /d 0 /f
Write-Output "Screen lock and sleep disabled."

# ================================
# Step 4: Add Jenkins Agent to Startup
# ================================
Write-Output "Adding Jenkins agent to startup..."
$StartupPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("Startup"), "start-jenkins-agent.bat")
Set-Content -Path $StartupPath -Value "@echo off`njava -jar $agent_jar_path -jnlpUrl $agent_jnlp_url -jnlpCredentials $jenkins_auth"
Write-Output "Jenkins agent startup script created at $StartupPath"

# ================================
# Step 5: Wait for the User Session to Initialize
# ================================
Write-Output "Waiting for an active user session..."
Start-Sleep -Seconds 10  # Allow time for login process

$session_id = $null
for ($i=0; $i -lt 10; $i++) {
    $session_output = quser | Where-Object { $_ -match "$admin_username" }
    if ($session_output) {
        $session_id = ($session_output -split '\s{2,}')[2]
        if ($session_id -match '^\d+$') {
            Write-Output "User session found: $session_id"
            break
        }
    }
    Write-Output "No active session found, retrying..."
    Start-Sleep -Seconds 5
}

if ($session_id) {
    # ================================
    # Step 6: Attach Session to Console (Make Interactive)
    # ================================
    Write-Output "Attaching session $session_id to the console..."
    Start-Process -FilePath "C:\Windows\System32\tscon.exe" -ArgumentList "$session_id /dest:console" -NoNewWindow -Wait
} else {
    Write-Output "No active session found after multiple attempts!"
}

# ================================
# Step 7: Start Jenkins Agent in Interactive Mode
# ================================
Write-Output "Starting Jenkins agent in interactive session..."
Start-Process -FilePath "cmd.exe" -ArgumentList "/c java -jar $agent_jar_path -jnlpUrl $agent_jnlp_url -jnlpCredentials $jenkins_auth" -NoNewWindow -Wait
Write-Output "Jenkins agent started successfully."
