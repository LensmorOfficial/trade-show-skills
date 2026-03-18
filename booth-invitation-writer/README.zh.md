[English](README.md) | [中文](README.zh.md)

---

# Booth Invitation Writer — OpenClaw Skill

生成个性化的展前邀请邮件 — 按受众类型和关系定制，告别千篇一律的"欢迎来展位"群发。

## 功能

提供展会信息和受众类型，智能体会生成：

- 个性化邀请邮件（不是通用的"欢迎参观我们展位"模板）
- 邮件标题 A/B 测试版本
- 可选的跟进提醒邮件
- 多语言支持，适用于国际展会

支持冷启动潜客、现有客户、合作伙伴、VIP/高管等不同模板。

**展前阶段 · 邀约外联类技能**

## 使用方式

```
帮我写一封 MEDICA 2026 的展位邀请邮件，展位号 5C42，我们要发布新的手术机器人。
```

```
我需要邀请 3 类人来 Interpack 展位：现有经销商、新潜客和媒体联系人。
```

```
帮我写一个 Hannover Messe 的三封邮件序列，目标是工厂自动化采购负责人。
```

## 输出示例

查看 [examples/medica-cold-prospect.md](examples/medica-cold-prospect.md) 获取完整示例。

## 安装

```bash
# 安装到当前工作区
cp -r /path/to/trade-show-skills/booth-invitation-writer <your-workspace>/skills/

# 安装到共享目录（所有工作区可用）
cp -r /path/to/trade-show-skills/booth-invitation-writer ~/.openclaw/skills/
```

## 相关技能

- [trade-show-finder](../trade-show-finder/) — 按行业和地区查找展会
- [post-show-followup](../post-show-followup/) — 创建展后跟进邮件序列
- [trade-show-budget-planner](../trade-show-budget-planner/) — 制定预算和 ROI 预估

---

> 由 [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=booth-invitation-writer) 展会情报平台出品。
