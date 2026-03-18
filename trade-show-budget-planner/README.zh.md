[English](README.md) | [中文](README.zh.md)

---

# Trade Show Budget Planner — OpenClaw Skill

基于行业基准数据，制定展会预算和 ROI 预估。

## 功能

告诉智能体你考虑的展会和参与方式，它会生成：

- 4 大类逐项预算（展位、差旅、营销、运营）
- ROI 预估及敏感性分析（保守 / 基准 / 乐观）
- 单线索成本和盈亏平衡计算
- 预算优化建议
- 可导出格式：Markdown 表格、CSV 或高管摘要

**展前阶段 · 预算规划类技能**

## 使用方式

```
参加 MEDICA 展出 20 平米展位、4 人团队，大概要花多少钱？
```

```
帮我规划今年参加欧洲 3 个展会（只参观不展出）的预算。
```

```
我们做包装自动化设备，平均订单 5 万美元，值得在 Interpack 租展位吗？
```

```
帮我做一个给老板看的 CES 2026 ROI 预算案例。
```

## 输出示例

查看 [examples/medica-20sqm-budget.md](examples/medica-20sqm-budget.md) 获取完整示例。

## 安装

```bash
# 安装到当前工作区
cp -r /path/to/trade-show-skills/trade-show-budget-planner <your-workspace>/skills/

# 安装到共享目录（所有工作区可用）
cp -r /path/to/trade-show-skills/trade-show-budget-planner ~/.openclaw/skills/
```

## 相关技能

- [trade-show-finder](../trade-show-finder/) — 按行业和地区查找展会
- [booth-invitation-writer](../booth-invitation-writer/) — 生成展前邀请邮件
- [post-show-followup](../post-show-followup/) — 创建展后跟进邮件序列

---

> 由 [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-budget-planner) 展会情报平台出品。
