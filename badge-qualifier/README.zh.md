[English](README.md) | [中文](README.zh.md)

---

# Badge Qualifier — OpenClaw Skill

将展位现场的对话笔记、badge 扫描记录或语音摘要，整理成结构化的 CRM 就绪线索卡片。

## 功能

把展位笔记、名片 OCR 文本或手打备注交给智能体，它会输出：

- 线索分级（Hot / Warm / Cold），基于决策权、需求、紧迫度、ICP 匹配度
- 字段来源明确的结构化联系人记录（不猜测、不填空）
- 已确认信息与未知信息的清晰区分
- 与分级匹配的下一步建议
- 批量处理多条线索时附 Batch Summary

**展中阶段 · 线索定性类技能**

## 使用方式

```
刚和 Kauffmann GmbH 的 VP Operations Marcus Hofer 聊了，他问了我们的包装线产能——目前有 3 条手工线，想自动化。他说预算"在明年规划中"。Badge 已扫。
```

```
Badge 只扫了一下：Sarah Chen，Siemens AG 高级工程师，s.chen@siemens.com。没有对话，只拿了一张宣传册。
```

```
帮我批量定性今天的 4 个展位线索：
1. James Rivera，ConAgra 工厂总监——聊了替换现有系统，月底前要报价
2. Ava Mueller，市场经理，公司不详——问了一些通用问题
3. Badge 扫描：Wei Zhang，Engineer，宁德时代
4. Thomas Bauer，PackTech CPO——演示了设备，很感兴趣，问了 ROI 周期
```

## 输出示例

查看 [examples/medica-booth-lead.md](examples/medica-booth-lead.md) 获取完整示例。

## 安装

```bash
# 安装到当前工作区
cp -r /path/to/trade-show-skills/badge-qualifier <your-workspace>/skills/

# 安装到共享目录（所有工作区可用）
cp -r /path/to/trade-show-skills/badge-qualifier ~/.openclaw/skills/
```

## 相关技能

- [trade-show-finder](../trade-show-finder/) — 决定优先参加哪些展会并给出参展建议
- [competitor-radar](../competitor-radar/) — 现场记录竞品展台情报
- [post-show-followup](../post-show-followup/) — 返程后生成分级跟进邮件序列

---

> 由 [Lensmor](https://www.lensmor.com/?utm_source=github&utm_medium=skill&utm_campaign=badge-qualifier) 展会情报平台出品。
