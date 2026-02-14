---
name: skills-list
description: 查看所有可用的 Claude Code Skills。当用户询问"有哪些skills"、"查看skills"、"skills列表"、"什么技能可用"时动态扫描并展示。
---

# Skills 列表查看器

当用户询问技能列表时，**动态扫描**以下位置并分类展示结果。

## 扫描步骤

### 1. 项目本地 Skills (当前项目)
```bash
ls -1 .claude/skills/ | grep -v README.md
```
- 每个目录或 `.md` 文件是一个 skill
- 读取 `SKILL.md` 或 `.md` 文件的 `description` 字段

### 2. 用户级 Skills (用户主目录)
```bash
ls -1 ~/.claude/skills/ 2>/dev/null
```
- 扫描 `~/.claude/skills/` 目录
- 这些是跨项目共享的用户级技能

### 3. 插件级 Skills (系统上下文)
- 从系统 `available_skills` 中筛选 `location: "plugin"` 的技能
- 按 plugin 名称分组显示

---

## 输出格式

```
📊 Skills 完整列表

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

## 📂 项目本地 Skills (N个)
> 来源: .claude/skills/

| # | Skill | 描述 |
|---|-------|------|
| 1 | skill-name | 描述内容 |
| 2 | ... | ... |

## 👤 用户级 Skills (N个)
> 来源: ~/.claude/skills/

| # | Skill | 描述 |
|---|-------|------|

## 🔌 插件级 Skills (N个)
> 来源: Claude Code 插件系统

### plugin-name
| # | Skill | 描述 |
|---|-------|------|

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

**总计**: X 个技能
```

---

## 分类标签

根据 skill 名称或描述自动归类：

| 标签 | 关键词 |
|------|--------|
| 📝 内容创作 | writer, copy, edit, script, writing |
| 📱 平台发布 | platform, social, email, publisher, x-article |
| 🔧 工具 | diagram, notebooklm, digest, psychology |
| 🧪 科学计算 | scientific, bio, chem, ml, data |
| 🚀 部署 | vercel, deploy, setup |
| 🔍 代码审查 | code-review, review |
| 🤖 AI/Agent | agent, ai, llm |

---

## 注意事项

- **不要硬编码技能列表** - 每次都执行实际扫描
- 用户级目录可能不存在，需处理错误 (`2>/dev/null`)
- 优先读取 skill 文件的 `description` 字段
- 按用途分类展示，提升可读性
- 显示总数统计

---

## 快速使用示例

用户可以这样触发此 skill：

```
"有哪些skills？"
"查看skills列表"
"什么技能可用？"
"列出所有skills"
```
