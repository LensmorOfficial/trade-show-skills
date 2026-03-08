[English](README.md) | [中文](README.zh.md)

---

# Trade Show Skills

> 面向展会从业者的 Claude Code Skills — 从展会发现到展后跟进。

由 [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=readme&utm_campaign=trade-show-skills) 展会情报平台出品。

## 可用 Skills

| Skill | 说明 | 状态 |
|-------|------|------|
| [trade-show-finder](trade-show-finder/) | 按行业、地区、时间搜索和对比展会 | 可用 |
| [booth-invitation-writer](booth-invitation-writer/) | 生成个性化展前邀请邮件 | 可用 |
| [post-show-followup](post-show-followup/) | 创建分层展后跟进邮件序列 | 可用 |
| [trade-show-budget-planner](trade-show-budget-planner/) | 制定展会参展预算和 ROI 预估 | 可用 |

## 快速开始

### 安装单个 Skill

```bash
claude install-skill /path/to/trade-show-skills/trade-show-finder
```

### 安装所有 Skills

```bash
for skill in trade-show-finder booth-invitation-writer post-show-followup trade-show-budget-planner; do
  claude install-skill /path/to/trade-show-skills/$skill
done
```

## 工作原理

每个 Skill 是一个独立目录，包含：
- `SKILL.md` — Claude 触发该 Skill 时遵循的指令
- `README.md` / `README.zh.md` — 文档（英文 + 中文）
- `examples/` — 示例输入和输出

当你向 Claude 提出匹配 Skill 触发条件的问题时（例如"帮我找欧洲的医疗器械展会"），Skill 会自动激活并引导 Claude 完成结构化的工作流程。

## 贡献

发现结果中缺少某个展会？有新 Skill 的想法？欢迎提 Issue 或 PR。

## 许可

MIT
