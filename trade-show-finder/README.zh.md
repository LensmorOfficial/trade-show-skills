[English](README.md) | [中文](README.zh.md)

---

# Trade Show Finder — OpenClaw Skill

帮你决定哪些展会值得参展优先投入，而不只是“帮你找展会”。

## 功能

告诉智能体你的 ICP、目标买家、商业目标和目标区域，它会返回：

- 为参展决策服务的 shortlist 或对比结果
- **Show Fit Score（0-100）** 和优先级判断
- 对每个重点选项给出 **Exhibit / Attend only / Skip** 决策
- `Execution Readiness`（Ready / Conditional / Not assessed）
- 明确的下一步衔接：预算评估与展前邀约

它真正解决的是“我们今年到底该去哪些展”“如果只能去 2-3 个，为什么是这几个”。

**展前阶段 · 研究类技能**

## 使用方式

```
我们卖面向 DACH 200+ 床位医院的手术流程软件。MEDICA 2026 值得参展吗？
```

```
对比 Interpack 和 PACK EXPO International。我们是做包装 SaaS 的，目标客户是大型制造商。
```

```
帮我选出欧洲最值得参加的包装行业展会。我们是中型自动化厂商，目标是找经销商和 pipeline。
```

```
今年我们最多只能做 3 个展。我们卖工业自动化设备，想拓展东南亚，该优先哪些？
```

## 输出示例

- [examples/medica-go-no-go.md](examples/medica-go-no-go.md) — 单一展会 go / no-go 决策
- [examples/interpack-vs-pack-expo.md](examples/interpack-vs-pack-expo.md) — 两个展会的对比选择
- [examples/medical-devices-europe.md](examples/medical-devices-europe.md) — 带 fit score 的 shortlist 示例

## 安装

```bash
# 安装到当前工作区
cp -r /path/to/trade-show-skills/trade-show-finder <your-workspace>/skills/

# 安装到共享目录（所有工作区可用）
cp -r /path/to/trade-show-skills/trade-show-finder ~/.openclaw/skills/
```

## 相关技能

- [trade-show-budget-planner](../trade-show-budget-planner/) — 对选定展会做预算与 ROI 验证
- [booth-invitation-writer](../booth-invitation-writer/) — 把选定展会转成展前约见计划
- [post-show-followup](../post-show-followup/) — 将参展现场对话转成展后跟进序列

---

> 由 [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=trade-show-finder) 展会情报平台出品。
