# skills-list

> 📊 动态查看所有可用的 Claude Code Skills - 一个 skill 管理/发现工具

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 功能

- 🔍 **动态扫描** - 自动发现所有已安装的 skills
- 📂 **多来源支持** - 项目本地、用户级、插件级
- 🏷️ **智能分类** - 按用途自动归类展示
- 📊 **统计汇总** - 显示总数和分类统计

## 为什么需要这个？

目前 Claude Code **没有内置命令**来查看所有可用的 skills。

- [GitHub Issue #12140](https://github.com/anthropics/claude-code/issues/12140) - 官方功能请求仍未实现
- 现有工具（如 plugin-manager）只能列出从 GitHub 安装的技能
- **skills-list** 填补了这个空白，可以列出**所有来源**的技能

## 安装

### 方式 1: curl 一键安装（推荐）

**项目级安装**（仅当前项目可用）：
```bash
curl -sSL https://raw.githubusercontent.com/Ming-H/skills-list/main/install.sh | bash
```

**用户级安装**（所有项目可用）：
```bash
curl -sSL https://raw.githubusercontent.com/Ming-H/skills-list/main/install.sh | bash -s -- --global
```

### 方式 2: 手动复制

**项目级**：
```bash
mkdir -p .claude/skills
curl -o .claude/skills/skills-list.md https://raw.githubusercontent.com/Ming-H/skills-list/main/SKILL.md
```

**用户级**：
```bash
mkdir -p ~/.claude/skills
curl -o ~/.claude/skills/skills-list.md https://raw.githubusercontent.com/Ming-H/skills-list/main/SKILL.md
```

### 方式 3: 使用 skillset 工具

```bash
skillset install Ming-H/skills-list
```

## 使用方法

安装后，在 Claude Code 中直接询问：

```
有哪些skills？
查看skills列表
什么技能可用？
```

## 示例输出

```
📊 Skills 完整列表

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## 📂 项目本地 Skills (14个)
> 来源: .claude/skills/

| # | Skill | 描述 |
|---|-------|------|
| 1 | content-research-writer | 深度研究与写作，带引用验证 |
| 2 | copywriting | 营销文案写作 |
| 3 | copy-editing | 文章编辑润色 |
| 4 | scriptwriting | 中文剧本创作 |
| 5 | platform-adaptation | 多平台适配（小红书/公众号/知乎） |

## 👤 用户级 Skills (1个)
> 来源: ~/.claude/skills/

| # | Skill | 描述 |
|---|-------|------|
| 1 | commit | 规范化 Git 提交 |

## 🔌 插件级 Skills (16+个)
> 来源: Claude Code 插件系统

### vercel
| # | Skill | 描述 |
|---|-------|------|
| 1 | vercel:deploy | 部署到 Vercel |
| 2 | vercel:logs | 查看 Vercel 日志 |

### code-review
| # | Skill | 描述 |
|---|-------|------|
| 1 | code-review:code-review | 代码审查 PR |

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

**总计**: 31+ 个技能
```

## 扫描范围

| 来源 | 路径 | 说明 |
|------|------|------|
| 项目本地 | `.claude/skills/` | 当前项目专属技能 |
| 用户级 | `~/.claude/skills/` | 跨项目共享技能 |
| 插件级 | Claude Code 插件系统 | 通过插件安装的技能 |

## 相关资源

- [Claude Code 官方文档](https://docs.anthropic.com/claude-code)
- [GitHub Issue #12140](https://github.com/anthropics/claude-code/issues/12140) - 官方功能请求
- [awesome-claude-skills](https://github.com/travisvn/awesome-claude-skills) - Skills 资源收集

## License

MIT © [Ming-H](https://github.com/Ming-H)
