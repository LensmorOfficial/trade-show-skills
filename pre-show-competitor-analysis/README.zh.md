[English](README.md) | [中文](README.zh.md)

---

# Pre-Show Competitor Analysis — OpenClaw Skill

展会前分析竞品参展商名单与展位定位，为你的策略、信息表达和展台执行提供依据。

## 功能

把目标展会的参展商名单、展位图和公开定位信息交给智能体，它会输出：

- 竞品全景图：谁在参展、规模如何、位置如何
- 标准化威胁评分（3-15 分制），覆盖直接竞争程度、展位显眼程度、信息冲突程度
- 差异化切入角度和市场空白机会
- 反向定位建议，可直接用于展台话术和员工培训
- 知识盲区清单（待展中用 `competitor-radar` 核实）

所有数据点均使用来源标签标注（`[OBS]` 直接来源 / `[INF]` 推断 / `[HEARD]` 二手信息 / `[EST]` 估算 / `[UNK]` 未知），确保分析结论有据可查。

**展前阶段 · 竞品情报类技能**

## 使用时机

展会开幕前 4–8 周，当：
- 参展商名单已公布
- 展位图已上线
- 需要确定差异化定位和展台策略

**不适用**于展会现场的实时竞品观察——展中请使用 `competitor-radar`。

## 使用方式

```
MEDICA 2026 的手术机器人领域谁在参展？我们应该怎么跟他们差异化竞争？
```

```
帮我深挖一下 Acme Corp 在 PACK EXPO 的参展情况——展位位置、主打产品、跟我们的重叠程度。
```

```
给我做一份 Anuga FoodTec 2026 的竞品全景图，标出主要威胁和市场空白。
```

## 输出示例

每份分析包含：
- 执行摘要（威胁等级 + 战略影响）
- 竞品全景表（主要威胁 / 次要威胁 / 潜在合作方）
- 策略建议（信息表达、展台布局、外联时机）
- 知识盲区（展中需核实的内容）
- 后续技能衔接（直接指向 `booth-invitation-writer`、`competitor-radar`）

## 安装

```bash
# 安装到当前工作区
cp -r /path/to/trade-show-skills/pre-show-competitor-analysis <your-workspace>/skills/

# 安装到共享目录（所有工作区可用）
cp -r /path/to/trade-show-skills/pre-show-competitor-analysis ~/.openclaw/skills/
```

## 相关技能

- [trade-show-finder](../trade-show-finder/) — 决定优先参加哪些展会并给出参展建议
- [booth-invitation-writer](../booth-invitation-writer/) — 利用竞品洞察撰写差异化邀请邮件
- [competitor-radar](../competitor-radar/) — 展会现场的实时竞品观察（本技能是展前版本）
- [post-show-followup](../post-show-followup/) — 展后跟进邮件，可引用竞品情报强化卖点

---

> 由 [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=pre-show-competitor-analysis) 展会情报平台出品。
