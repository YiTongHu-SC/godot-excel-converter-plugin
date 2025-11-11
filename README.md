# Excel to JSON Converter - Godot Plugin

一个功能强大的 Godot 4 编辑器插件，用于将 Excel 文件批量转换为 JSON 格式，并自动生成对应的 GDScript 数据类。

## 🚀 功能特性

- ✅ 批量转换Excel文件(.xlsx, .xls)到JSON格式
- ✅ 支持多工作表Excel文件
- ✅ 自动生成GDScript数据类和加载器
- ✅ 可视化操作界面（停靠面板）
- ✅ 项目设置集成
- ✅ 智能类型推断
- ✅ 完整的错误处理和日志输出

## 📦 安装方式

### 方法 1: Git 子模块（推荐）

在你的 Godot 项目根目录执行：

```bash
git submodule add https://github.com/YiTongHu-SC/godot-excel-converter-plugin.git addons/py_excel_tool
git submodule update --init --recursive
```

### 方法 2: 直接下载

1. 下载本插件的 ZIP 文件
2. 解压到你项目的 `addons/py_excel_tool/` 目录
3. 在 Godot 项目设置中启用插件

### 方法 3: Git Clone

```bash
cd your_project/addons/
git clone https://github.com/YiTongHu-SC/godot-excel-converter-plugin.git py_excel_tool
```

## ⚡ 快速开始

1. **安装 Python 环境**：
   ```bash
   pip install pipenv
   cd addons/py_excel_tool/src
   pipenv install
   ```

2. **启用插件**：
   - 打开 Godot 项目
   - 进入 **项目设置 → 插件**
   - 启用 **"Excel to JSON Converter"** 插件

3. **配置设置**：
   - 使用工具菜单 → **"Excel转换器设置"**
   - 设置 Python 路径（留空自动检测）
   - 配置输入输出目录

4. **转换文件**：
   - 将 Excel 文件放入输入目录
   - 使用工具菜单 → **"转换Excel并生成GDScript"**

## 📊 数据格式示例

**Excel 输入**：
| ID | Name | Level | HP | Attack |
|----|------|-------|----|----|
| 1  | Slime | 1    | 10 | 5  |
| 2  | Goblin| 2    | 25 | 8  |

**生成的 GDScript 数据类**：
```gdscript
class_name MonsterData

var id: int = 0
var name: String = ""
var level: int = 0
var hp: int = 0
var attack: int = 0

func _init(data: Dictionary = {}):
    # 自动生成的构造函数
```

**生成的加载器类**：
```gdscript
class_name MonsterLoader

func get_by_id(id: int) -> MonsterData:
    # 根据 ID 获取数据

func get_all() -> Array[MonsterData]:
    # 获取所有数据
```

## 🛠 使用方式

### 工具菜单
- **转换Excel文件为JSON** - 执行批量转换
- **转换Excel并生成GDScript** - 转换并生成代码
- **Excel转换器设置** - 配置选项
- **打开Excel转换器面板** - 显示停靠面板

### 停靠面板
- 可视化界面操作
- 实时日志显示
- 进度状态提示

## 🔧 配置文件

Python 配置文件 `src/config.ini`：

```ini
[DEFAULT]
input_directory = ./excel_files
output_directory = ./json_files
log_level = INFO

[GDSCRIPT]
data_class_output = scripts/generated/data/
loader_class_output = scripts/generated/loader/
```

## 📋 依赖要求

- **Godot**: 4.0+
- **Python**: 3.7+
- **Python 包**: pandas, openpyxl

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

MIT License

## 🔗 相关链接

- [主项目仓库](https://github.com/YiTongHu-SC/py_excel_tool)
- [使用文档](https://github.com/YiTongHu-SC/py_excel_tool/blob/main/readme.md)
- [问题反馈](https://github.com/YiTongHu-SC/py_excel_tool/issues)