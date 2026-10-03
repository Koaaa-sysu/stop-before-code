# 实战案例 1：CLI 数据清洗工具

> **场景**：开发者向 AI 发送了一句模糊的话：“帮我写个脚本，把一个很大的 JSON 数据导出转换成 Excel 或 CSV，并按日期去重。”

---

## 传统 AI Coding 的惨痛对局（Without SBC）
1. AI 听到“大数据”、“Excel”、“按日期去重”，瞬间兴奋。
2. 立即写了 150 行代码，引入了 `pandas`, `openpyxl`, `xlsxwriter`，甚至还准备建个临时 SQLite 缓存。
3. 开发者一跑，报错：`ModuleNotFoundError: No module named 'pandas'`。
4. 安装完 pandas，一跑 500MB 的文件，内存直接打爆 OOM 崩溃。
5. 两个小时过去了，不仅没用上，还拉了一堆笨重依赖。

---

## Stop Before Code 的防冲动实战（With SBC）

### Phase 1: Working Backwards
> 🛑 **【代码门禁生效中 · 请先定型】**  
> **逆向产品宣言**：这是一个为开发者解决“无需打开臃肿 IDE 或安装 GB 级 Python 科学计算库，在终端一秒流式清洗并去重超大 JSON 数据”的轻量命令行小瑞士军刀。

### Phase 2: Socratic 3-Shaping
> 1. **胃口与形态（Appetite）**：
>    - A. [推荐] 极简流式脚本（Small Batch / 单文件 Node 或 Python，只依赖标准库，流式读写，内存消耗 < 30MB）
>    - B. 完整 CLI 脚手架（包含 Commander 命令行、支持多格式输出）  
> 2. **暴力减法（Anti-Scope）**：
>    - 建议砍掉：本期**坚决不生成 `.xlsx` 二进制文件**，直接输出标准化 `.csv`（任何 Excel/Numbers 双击都能秒开，且无需引入数十兆的重量级编译库）。是否同意？
> 3. **兔子洞与容错体验（Edge & Rabbit Hole）**：
>    - **兔子洞预警**：大 JSON 一次性 `JSON.parse()` 必将导致 OOM 爆内存。必须采用流式逐行解析（NDJSON / Line-by-Line）。
>    - **输入容错**：如果用户指定的输入文件路径不存在，或者某一行数据缺少“日期”字段，是直接闪退，还是在终端输出黄色警告并继续处理后续数据？

### Phase 3: Fat-Marker Prototype（终端粗笔交互）
```text
$ fast-json-dedup --input data.jsonl --out result.csv --key created_at

[STREAM] Reading data.jsonl (Streaming buffer)...
[WARN]   Line 42: Missing 'created_at', skipped.
[DEDUP]  Processed: 120,400 rows | Duplicates Dropped: 3,120
[DONE]   Written to result.csv in 1.4s (Peak Memory: 18MB)
```

### Phase 4: Pitch & Spec 签署
生成一份包含流式处理算法与明确 DoD 的 `.product-spec.md`。
开发者回复：**`CONFIRM`**。

### Phase 5: 解锁执行
AI 仅用 60 行原生 Python 脚本（标准库 `csv` + `json`），一次性交付，100% 达成预期，0 报错。
