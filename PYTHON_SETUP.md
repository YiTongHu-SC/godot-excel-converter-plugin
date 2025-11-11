# 🐍 Python 环境快速设置指南

本指南帮助您快速为 Excel 转换器插件设置 Python 环境。

## ⚡ 一键设置

### Windows 用户

```powershell
# 在插件目录运行
cd addons/py_excel_tool/python/env
.\setup_env.ps1
```

### Linux/macOS 用户

```bash
# 在插件目录运行
cd addons/py_excel_tool/python/env
chmod +x setup_env.sh
./setup_env.sh
```

## 🎯 设置后配置 Godot

1. 打开 Godot 项目
2. 进入 **项目设置 → 插件**
3. 启用 **Excel to JSON Converter** 插件
4. 使用工具菜单 → **Excel转换器设置**
5. 设置 Python 路径：
   - **Windows**: `addons/py_excel_tool/python/env/venv/Scripts/python.exe`
   - **Linux/macOS**: `addons/py_excel_tool/python/env/venv/bin/python`

## 📋 验证安装

运行以下命令验证环境是否正确设置：

```bash
# 激活虚拟环境
# Windows: addons/py_excel_tool/python/env/venv/Scripts/activate
# Linux/macOS: source addons/py_excel_tool/python/env/venv/bin/activate

# 验证依赖
python -c "import pandas, openpyxl; print('✅ 所有依赖已正确安装')"
```

## 🛠 故障排除

### 脚本执行权限问题 (Windows)

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Python 未找到

确保 Python 3.7+ 已安装并在系统 PATH 中。

### 依赖安装失败

```bash
# 使用镜像源加速
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
```

## 📖 详细文档

查看 `python/env/README.md` 获取完整的配置文档。