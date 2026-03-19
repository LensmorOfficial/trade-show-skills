[English](README.md) | [中文](README.zh.md)

---

# Competitor Radar — OpenClaw Skill

将展会现场的竞品展台观察记录，整理为结构化的情报笔记和 battlecard 摘要，并严格区分亲历观察与推断内容。

## 功能

把现场手打笔记、宣传册文字、价格线索或偷听到的只言片语交给智能体，它会输出：

- 每家竞品的结构化情报笔记，附来源标签（[OBS] 直接观察 / [INF] 合理推断 / [HEARD] 未经证实的听闻）
- 定位摘要、价格信号、claimed 差异化卖点
- 威胁等级评估，附明确的证据支撑
- 内部行动建议：对我方的影响和后续步骤
- 展后需要进一步核查的信息缺口

**展中阶段 · 竞品情报类技能**

## 使用方式

```
在 Interpack 看到了 Krones AG。超大展台，双层，估计 400 平米。发布了叫 "VarioDrive" 的新品——展板上写着"换型步骤减少 40%"。好多产线操作员停下来看。拿了他们的产品单页。
```

```
ProPak Asia 竞品展台笔记：
- Syntegon：标准大小，没有新东西
- Coesia：全新"互联产线"定位，到处是 IoT 传感器，销售代表跟访客说"起步 18 万欧"（偷听的，未确认）
- IMA：我路过两次展台都没人
```

```
这是我在汉诺威工业博览会上拿到的一本竞品宣传册文字，帮我提炼他们的定位，并标出跟我们产品主张重叠的部分。
```

## 输出示例

查看 [examples/competitor-booth-note.md](examples/competitor-booth-note.md) 获取完整示例。

## 安装

```bash
# 安装到当前工作区
cp -r /path/to/trade-show-skills/competitor-radar <your-workspace>/skills/

# 安装到共享目录（所有工作区可用）
cp -r /path/to/trade-show-skills/competitor-radar ~/.openclaw/skills/
```

## 相关技能

- [trade-show-finder](../trade-show-finder/) — 决定优先参加哪些展会并给出参展建议
- [badge-qualifier](../badge-qualifier/) — 从展位笔记和 badge 扫描中定性线索
- [post-show-followup](../post-show-followup/) — 创建展后跟进邮件序列

---

> 由 [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=competitor-radar) 展会情报平台出品。
