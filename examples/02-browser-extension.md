# 实战案例 2：Chrome 极简灵感收集插件

> **场景**：开发者向 AI 提出：“我想做一个 Chrome 插件，浏览网页时一键摘录选中的文字，并能加上自己的便签保存。”

---

## 传统 AI Coding 的惨痛对局（Without SBC）
1. AI 听到“Chrome 插件”，直接创建了包含 React, Vite, Tailwind, CRXJS 的完整现代前端工程。
2. 配置了 Background Service Worker, Content Script, Popup, Options Page，洋洋洒洒生成了 25 个文件。
3. 开发者尝试加载未打包扩展，报错：Content Security Policy (CSP) 冲突、Vite 热更新在 Extension 环境失效。
4. 只是想存几段文字，结果花了一个下午在配置打包器和解决 Manifest V3 的权限报错。

---

## Stop Before Code 的防冲动实战（With SBC）

### Phase 1: Working Backwards
> 🛑 **【代码门禁生效中 · 请先定型】**  
> **逆向产品宣言**：这是一个让知识工作者在阅读网页时，选中文字按快捷键 `Alt+S` 即可无感吸纳至本地右侧抽屉、永不打断阅读心流的“原子级便签插件”。

### Phase 2: Socratic 3-Shaping
> 1. **胃口与形态（Appetite）**：
>    - A. [强烈推荐] 纯原生零构建单文件插件（Small Batch / 单个 `manifest.json` + `content.js` + `style.css`，直接在浏览器加载，0 构建依赖，5 秒可测）
>    - B. 重度 React+Tailwind 打包扩展（Medium Batch）
> 2. **暴力减法（Anti-Scope）**：
>    - 建议砍掉：**第一版绝对不做用户登录、不搞云端同步、不搞多标签分类**。所有便签直接存入浏览器的 `chrome.storage.local`。是否认可？
> 3. **冷启动与空状态（Empty State & Edge）**：
>    - **首屏空状态**：当用户刚刚安装好插件、首次打开抽屉列表时，没有任何摘录内容。此时界面绝不能空荡荡，应当展示一张极简卡片：“划选任意网页文字，按 Alt+S 试试看 🚀”。
>    - **兔子洞预警**：避免在宿主网页上注入样式污染（CSS Leaks），必须采用 `Shadow DOM` 隔离样式。

### Phase 3: Fat-Marker Prototype（粗笔 ASCII 原型草图）
```text
+-----------------------------------------------------------+
| 网页主体内容 (宿主页面)                                     |
|  "大模型改变了软件工程范式..." [已划选高亮]                 |
|                               +-------------------------+ |
|                               | 💡 灵感抽屉 (Shadow DOM) | |
|                               +-------------------------+ |
|                               | [已摘录文字]:            | |
|                               | "大模型改变了软件工程..."| |
|                               |                         | |
|                               | 我的思考便签:           | |
|                               | [键入你的想法...      ] | |
|                               |                         | |
|                               | [保存到本地] [Esc 关闭] | |
|                               +-------------------------+ |
+-----------------------------------------------------------+
```

### Phase 4: Pitch & Spec 签署
生成 `.product-spec.md` 契约，明确使用原生 Shadow DOM 与 `chrome.storage.local`，明确不引入任何打包工具。
开发者回复：**`CONFIRM`**。

### Phase 5: 解锁执行
AI 仅产出 3 个干净的原生文件（`manifest.json`, `content.js`, `content.css`），开发者把文件夹拖进 Chrome 扩展管理，10 秒内一次性跑通！
