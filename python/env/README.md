# Python 环境配置

本目录包含 Excel 转换器插件的 Python 环境配置文件和设置脚本。

## 📁 目录结构

``` text
python/env/
├── Pipfile                # Pipenv 项目文件
├── Pipfile.lock           # Pipenv 锁定文件（精确版本）
├── requirements.txt       # pip 依赖文件（标准格式）
├── setup_env.sh          # Linux/macOS 环境设置脚本
├── setup_env.ps1         # Windows PowerShell 环境设置脚本
├── venv/                  # 虚拟环境目录（运行设置脚本后创建）
└── README.md             # 本文档
```

## 🚀 快速开始

### Windows 用户

```powershell
# 在 PowerShell 中运行
cd addons/py_excel_tool/python/env
.\setup_env.ps1
```

### Linux/macOS 用户

```bash
# 在终端中运行
cd addons/py_excel_tool/python/env
chmod +x setup_env.sh
./setup_env.sh
```

## 📦 依赖管理

插件提供两种依赖管理方式：

### 方式 1: requirements.txt (推荐)

```bash
# 安装依赖
pip install -r requirements.txt

# 生成新的 requirements.txt
pip freeze > requirements.txt
```

### 方式 2: Pipenv

```bash
# 安装 pipenv
pip install pipenv

# 安装依赖
pipenv install --dev

# 激活环境
pipenv shell
```

## 🔧 手动设置

如果自动脚本无法运行，可以手动设置：

### 1. 创建虚拟环境

```bash
# Windows
python -m venv venv
venv\Scripts\activate

# Linux/macOS
python3 -m venv venv
source venv/bin/activate
```

### 2. 安装依赖

```bash
pip install -r requirements.txt
```

### 3. 在 Godot 中配置

在 Godot 插件设置中设置 Python 路径：

- **Windows**: `[插件目录]/python/env/venv/Scripts/python.exe`
- **Linux/macOS**: `[插件目录]/python/env/venv/bin/python`

## 📋 核心依赖说明

| 包名称 | 版本要求 | 用途 |
|--------|----------|------|
| pandas | >=2.0.0 | 数据处理和分析，Excel 数据转换核心 |
| openpyxl | >=3.1.0 | Excel (.xlsx) 文件读写 |
| xlrd | >=2.0.0 | Excel (.xls) 文件读取支持 |

## 🐍 Python 版本要求

- **最低版本**: Python 3.7
- **推荐版本**: Python 3.11 或 3.12
- **测试版本**: Python 3.10, 3.11, 3.12

## 🔒 生产环境部署

### 选项 1: 包含虚拟环境

```bash
# 打包整个 venv 目录
# 适用于相同操作系统的部署
```

### 选项 2: 仅依赖文件

```bash
# 仅分发 requirements.txt 和 Pipfile
# 在目标环境重新创建虚拟环境
```

### 选项 3: 系统 Python

```bash
# 直接使用系统 Python 环境
pip install -r requirements.txt
```

## ⚠️ 注意事项

1. **虚拟环境隔离**: 建议使用虚拟环境避免依赖冲突
2. **路径配置**: 确保在 Godot 中正确配置 Python 可执行文件路径
3. **权限问题**: 在 Windows 上可能需要管理员权限执行 PowerShell 脚本
4. **代理设置**: 企业网络环境可能需要配置 pip 代理

## 🛠 故障排除

### Python 命令未找到

```bash
# 检查 Python 是否已安装
python --version
python3 --version

# 添加到 PATH 或使用绝对路径
```

### 权限拒绝（Windows）

```powershell
# 允许执行 PowerShell 脚本
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### 包安装失败

```bash
# 更新 pip
python -m pip install --upgrade pip

# 使用清华镜像加速
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
```

## 📈 开发环境

开发者可以安装额外的开发工具：

```bash
# 安装开发依赖（如果使用 Pipenv）
pipenv install --dev

# 或手动安装开发工具
pip install pytest black flake8 mypy
```
