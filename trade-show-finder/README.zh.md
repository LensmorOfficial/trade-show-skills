[English](README.md) | [中文](README.zh.md)

---

# Trade Show Finder — OpenClaw Skill

按行业、地区和时间搜索和对比展会 — 基于网络搜索获取最新信息。

## 功能

告诉智能体你的行业、目标地区和时间范围，它会搜索网络并返回：

- 结构化对比表格（日期、地点、参展商/观众数量、重点领域）
- 精选推荐及具体理由
- 实用信息：报名截止日期、同期活动、出行建议

**展前阶段 · 研究类技能**

## 使用方式

```
帮我找 2026 年下半年欧洲的包装行业展会
```

```
我们做工业自动化设备，亚洲今年有哪些大型展会？
```

```
对比一下 CES、MWC 和 IFA，我们是消费电子初创公司
```

```
MEDICA 2026 是什么时候？
```

## 输出示例

查看 [examples/medical-devices-europe.md](examples/medical-devices-europe.md) 获取完整示例。

## 安装

```bash
# 安装到当前工作区
cp -r /path/to/trade-show-skills/trade-show-finder <your-workspace>/skills/

# 安装到共享目录（所有工作区可用）
cp -r /path/to/trade-show-skills/trade-show-finder ~/.openclaw/skills/
```

## 相关技能

- [trade-show-budget-planner](../trade-show-budget-planner/) — 制定展会预算和 ROI 预估
- [booth-invitation-writer](../booth-invitation-writer/) — 生成展前邀请邮件
- [post-show-followup](../post-show-followup/) — 创建展后跟进邮件序列

---

> 由 [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-finder) 展会情报平台出品。
