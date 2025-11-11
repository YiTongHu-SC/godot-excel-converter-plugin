#!/bin/bash
# 
# Excel to JSON Converter Plugin - Python Environment Setup Script (Linux/macOS)
# 此脚本用于设置插件的 Python 虚拟环境和依赖

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_DIR="$SCRIPT_DIR/venv"

echo "=== Excel转换器插件 - Python环境设置 ==="
echo "脚本目录: $SCRIPT_DIR"
echo "虚拟环境目录: $ENV_DIR"
echo

# 检查 Python 是否可用
if ! command -v python3 &> /dev/null; then
    echo "❌ 错误: 未找到 python3 命令"
    echo "请先安装 Python 3.7 或更高版本"
    exit 1
fi

PYTHON_VERSION=$(python3 --version 2>&1 | sed 's/Python //')
echo "✅ 检测到 Python 版本: $PYTHON_VERSION"

# 创建虚拟环境
if [ ! -d "$ENV_DIR" ]; then
    echo "📦 创建虚拟环境..."
    python3 -m venv "$ENV_DIR"
    echo "✅ 虚拟环境已创建"
else
    echo "📦 虚拟环境已存在，跳过创建"
fi

# 激活虚拟环境
echo "🔧 激活虚拟环境..."
source "$ENV_DIR/bin/activate"

# 更新 pip
echo "⬆️  更新 pip..."
pip install --upgrade pip

# 安装依赖
echo "📦 安装依赖包..."
if [ -f "$SCRIPT_DIR/requirements.txt" ]; then
    pip install -r "$SCRIPT_DIR/requirements.txt"
    echo "✅ 已从 requirements.txt 安装依赖"
fi

if [ -f "$SCRIPT_DIR/Pipfile" ]; then
    if command -v pipenv &> /dev/null; then
        echo "📦 使用 Pipenv 安装依赖..."
        pipenv install --dev
        echo "✅ 已从 Pipfile 安装依赖"
    else
        echo "⚠️  未找到 pipenv，跳过 Pipfile 安装"
        echo "如需使用 Pipfile，请运行: pip install pipenv"
    fi
fi

echo
echo "🎉 Python 环境设置完成！"
echo
echo "使用方法："
echo "1. 激活环境: source $ENV_DIR/bin/activate"
echo "2. 运行插件的 Python 脚本"
echo "3. 退出环境: deactivate"
echo
echo "Godot 中的 Python 路径设置："
echo "Python 可执行文件: $ENV_DIR/bin/python"