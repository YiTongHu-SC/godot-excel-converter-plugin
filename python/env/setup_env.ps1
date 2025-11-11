# Excel to JSON Converter Plugin - Python Environment Setup Script (Windows)
# 此脚本用于设置插件的 Python 虚拟环境和依赖

param(
    [switch]$Force = $false,
    [string]$PythonCommand = "python"
)

$ErrorActionPreference = "Stop"

$SCRIPT_DIR = $PSScriptRoot
$ENV_DIR = Join-Path $SCRIPT_DIR "venv"

Write-Host "=== Excel转换器插件 - Python环境设置 ===" -ForegroundColor Green
Write-Host "脚本目录: $SCRIPT_DIR" -ForegroundColor Cyan
Write-Host "虚拟环境目录: $ENV_DIR" -ForegroundColor Cyan
Write-Host ""

# 检查 Python 是否可用
try {
    $pythonVersion = & $PythonCommand --version 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "Python 命令执行失败"
    }
    Write-Host "✅ 检测到 Python 版本: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ 错误: 未找到 Python 命令: $PythonCommand" -ForegroundColor Red
    Write-Host "请确保 Python 已安装并添加到 PATH，或指定正确的 Python 命令:" -ForegroundColor Yellow
    Write-Host "  .\setup_env.ps1 -PythonCommand 'python3'" -ForegroundColor Yellow
    Write-Host "  .\setup_env.ps1 -PythonCommand 'C:\Python312\python.exe'" -ForegroundColor Yellow
    exit 1
}

# 创建虚拟环境
if (!(Test-Path $ENV_DIR) -or $Force) {
    if ($Force -and (Test-Path $ENV_DIR)) {
        Write-Host "🔄 强制重新创建虚拟环境..." -ForegroundColor Yellow
        Remove-Item -Recurse -Force $ENV_DIR
    } else {
        Write-Host "📦 创建虚拟环境..." -ForegroundColor Yellow
    }
    
    & $PythonCommand -m venv $ENV_DIR
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ 虚拟环境创建失败" -ForegroundColor Red
        exit 1
    }
    Write-Host "✅ 虚拟环境已创建" -ForegroundColor Green
} else {
    Write-Host "📦 虚拟环境已存在，跳过创建" -ForegroundColor Yellow
    Write-Host "如需重新创建，请使用 -Force 参数" -ForegroundColor Cyan
}

# 激活虚拟环境
Write-Host "🔧 激活虚拟环境..." -ForegroundColor Yellow
$activateScript = Join-Path $ENV_DIR "Scripts\Activate.ps1"
if (Test-Path $activateScript) {
    & $activateScript
} else {
    Write-Host "❌ 无法找到激活脚本: $activateScript" -ForegroundColor Red
    exit 1
}

# 更新 pip
Write-Host "⬆️  更新 pip..." -ForegroundColor Yellow
python -m pip install --upgrade pip

# 安装依赖
Write-Host "📦 安装依赖包..." -ForegroundColor Yellow

$requirementsFile = Join-Path $SCRIPT_DIR "requirements.txt"
if (Test-Path $requirementsFile) {
    pip install -r $requirementsFile
    Write-Host "✅ 已从 requirements.txt 安装依赖" -ForegroundColor Green
}

$pipfile = Join-Path $SCRIPT_DIR "Pipfile"
if (Test-Path $pipfile) {
    try {
        $pipenvVersion = pipenv --version 2>&1
        if ($LASTEXITCODE -eq 0) {
            Write-Host "📦 使用 Pipenv 安装依赖..." -ForegroundColor Yellow
            Set-Location $SCRIPT_DIR
            pipenv install --dev
            Write-Host "✅ 已从 Pipfile 安装依赖" -ForegroundColor Green
        } else {
            throw "Pipenv 不可用"
        }
    } catch {
        Write-Host "⚠️  未找到 pipenv，跳过 Pipfile 安装" -ForegroundColor Yellow
        Write-Host "如需使用 Pipfile，请运行: pip install pipenv" -ForegroundColor Cyan
    }
}

Write-Host ""
Write-Host "🎉 Python 环境设置完成！" -ForegroundColor Green
Write-Host ""
Write-Host "使用方法：" -ForegroundColor Cyan
Write-Host "1. 激活环境: $ENV_DIR\Scripts\Activate.ps1" -ForegroundColor White
Write-Host "2. 运行插件的 Python 脚本" -ForegroundColor White
Write-Host "3. 退出环境: deactivate" -ForegroundColor White
Write-Host ""
Write-Host "Godot 中的 Python 路径设置：" -ForegroundColor Cyan
Write-Host "Python 可执行文件: $ENV_DIR\Scripts\python.exe" -ForegroundColor White