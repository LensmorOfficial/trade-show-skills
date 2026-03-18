[English](README.md) | [中文](README.zh.md)

---

# Post-Show Follow-up — OpenClaw Skill

创建分层展后跟进邮件序列，将展位交流转化为销售机会。

## 功能

告诉智能体刚结束的展会名称和你的产品，它会生成：

- 3 级线索分类（热 / 温 / 冷），附判定标准
- 每级多封邮件序列，每封邮件采用不同切入角度
- 个性化字段和 CRM 合并标签支持（HubSpot、Salesforce 等）
- 推荐发送时间和实用技巧（含 48 小时跟进窗口说明）

**展后阶段 · 线索转化类技能**

## 使用方式

```
MEDICA 刚结束，帮我写跟进邮件给收集到的线索。
```

```
我们在 Interpack 扫了 200 个 badge，其中 30 个有实质对话，10 个问了价格。帮我写各组的跟进邮件。
```

```
帮我写一封展后感谢邮件，给在 CES 参观过我们 demo 的人。
```

## 输出示例

查看 [examples/post-medica-sequence.md](examples/post-medica-sequence.md) 获取完整示例。

## 安装

```bash
# 安装到当前工作区
cp -r /path/to/trade-show-skills/post-show-followup <your-workspace>/skills/

# 安装到共享目录（所有工作区可用）
cp -r /path/to/trade-show-skills/post-show-followup ~/.openclaw/skills/
```

## 相关技能

- [trade-show-finder](../trade-show-finder/) — 按行业和地区查找展会
- [booth-invitation-writer](../booth-invitation-writer/) — 生成展前邀请邮件
- [trade-show-budget-planner](../trade-show-budget-planner/) — 制定预算和 ROI 预估

---

> 由 [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=post-show-followup) 展会情报平台出品。
