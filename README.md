<div align="center">

# 🛑 Stop Before Code (SBC)

**The "Stop-and-Think" Product Brain for AI Coding Agents.**  
*Don't let your AI write a single line of code until you've shaped the soul of your product.*

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Supported Agents](https://img.shields.io/badge/Agents-Claude%20Code%20%7C%20Cursor%20%7C%20Antigravity%20%7C%20Windsurf-orange)](#-multi-agent-setup)
[![Methodology](https://img.shields.io/badge/Methodology-Shape%20Up%20%2B%20Inspired-success)](#-the-philosophy-behind-sbc)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/Koaaa-sysu/stop-before-code/pulls)

<p align="center">
  <a href="README.md"><b>English</b></a> | <a href="README_CN.md"><b>简体中文</b></a>
</p>

<p align="center">
  <img src="assets/hero-banner.jpg" alt="Stop Before Code Hero Banner" width="100%" style="border-radius: 12px; box-shadow: 0 8px 24px rgba(0,0,0,0.15);" />
</p>

</div>

---

> *"The biggest waste of all is to build something with great efficiency that shouldn't have been built at all."*  
> —— **Marty Cagan**, *Inspired*

---

## 💥 The Problem We All Face

In the era of frontier reasoning engines and autonomous agents (**GPT-6.1, CloudOps 5.5, Claude 4.5, and Gemini 3 Ultra**), **generating thousands of lines of code takes merely seconds**.

Yet, every developer has lived through this nightmare:
1. You casually type: *"Build a simple note-taking bookmark tool."*
2. Your AI gets hyper-excited, creates 18 files, spins up a Docker container, configures Redux, installs Tailwind, Prisma, and PostgreSQL.
3. 20 minutes later, you are staring at 30 compiler errors, broken dependencies, and context explosion.
4. **You wanted a bicycle; the AI attempted to build a spaceship and crashed in your living room.**

<p align="center">
  <img src="assets/comparison.jpg" alt="Without SBC vs With SBC Comic" width="100%" style="border-radius: 8px;" />
</p>

**Stop Before Code (SBC)** is an agent skill that enforces a **strict physical kill-switch** on all coding tools until your idea has been shaped, prioritized, and locked down into an executable single-page specification.

---

## 🏛️ The Product Philosophy Behind SBC

SBC does not use random prompt tricks. It distills decades of world-class product wisdom into executable agent rules:

- **Basecamp's *Shape Up* (Ryan Singer & Jason Fried)**:
  - **Appetite over Estimation**: Don't ask how long it takes. Decide how much appetite (30 mins vs. half-day) you have, and cut everything else.
  - **Rabbit Holes**: Spot and explicitly ban technical quicksand (e.g. premature multi-tenancy, custom OAuth) before writing code.
  - **Fat-Marker Sketches**: Use rough ASCII wireframes to visualize affordances instead of pixel-perfect distractions.
- **Marty Cagan's *Inspired***:
  - Kill **Value Risk** at second zero. Eliminate features that shouldn't exist.
- **Amazon's *Working Backwards***:
  - Before any architecture diagram, write a 2-sentence release manifesto that explains the human value.

---

## ⚡ The 4-Step Shaping Machine

Whenever you mention an idea or request, SBC intercepts the agent through a rigorous state machine:

<p align="center">
  <img src="assets/workflow-infographic.jpg" alt="Stop Before Code 4-Step State Machine" width="100%" style="border-radius: 12px; box-shadow: 0 8px 24px rgba(0,0,0,0.15);" />
</p>

1. **Phase 1: Working Backwards** — Write a 2-sentence release manifesto defining target context, human value, and minimal delivery form.
2. **Phase 2: Socratic 3-Shaping** — Ask strictly 3 multiple-choice questions (Appetite & Form, Anti-Scope 3 cuts, Adaptive cold-start/edge experience).
3. **Phase 3: Fat-Marker Prototype** — Render an instant low-fi terminal layout to visually lock down UI affordances.
4. **Phase 4: Pitch & Contract Signing** — Generate `.product-spec.md` with explicit Definition of Done (DoD). Wait for your `CONFIRM` or `确认` to unlock physical coding tools!

---

## 🖥️ Live Showcase

Check out the real-world step-by-step transcripts:

1. **[01. CLI Stream Data Sanitizer](examples/01-cli-data-tool.md)**: From 500MB OOM crash to a 60-line zero-dependency streaming victory.
2. **[02. Browser Inspiration Clipper](examples/02-browser-extension.md)**: Cut out Webpack & React bloat; shipped a clean 3-file Vanilla Extension with Shadow DOM.
3. **[03. SVG QuickColor Web Tool](examples/03-fullstack-micro-saas.md)**: Banned backend databases and servers; delivered a pure client-side single HTML app.

---

## 🚀 Quick Start & Multi-Agent Setup

### Option 1: Claude Code
```bash
# Add directly to your Claude skills
claude skill add stop-before-code
# OR copy SKILL.md to your project:
cp adapters/CLAUDE.md ./CLAUDE.md
```

### Option 2: Cursor / Windsurf
Copy `adapters/.cursorrules` directly to your repository root:
```bash
curl -fsSL https://raw.githubusercontent.com/Koaaa-sysu/stop-before-code/main/adapters/.cursorrules -o .cursorrules
```

### Option 3: Antigravity / Gemini Agents
Copy the `SKILL.md` to your global or workspace skills directory:
```bash
mkdir -p ~/.gemini/antigravity/skills/stop-before-code
cp SKILL.md references/ ~/.gemini/antigravity/skills/stop-before-code/
```

---

## 📄 The Output: `.product-spec.md`

When SBC finishes shaping, it commits a single file: `.product-spec.md` (under 120 lines):

```markdown
# Product Spec: SVG QuickColor (Single-Page App)
> **Appetite**: Small Batch (30 mins) | **Form**: Single HTML (Alpine.js CDN)

## 1. Core Value & JTBD
- When developers need to batch-recolor icons locally, they drop SVG files into the browser and download a ZIP, with zero privacy risks.

## 2. Anti-Scope (No-Gos)
- ❌ No backend server / No database
- ❌ No user accounts / No cloud storage
- ❌ Bypass gradient tags in v1 (solid path fill only)

## 3. Cold Start & Edge Experience
- Empty State: Clean dashed dropzone with prompt "Drop SVG here or click to browse".
- Resilience: Process in Web Workers to prevent UI freezing on 50+ files.

## 4. Definition of Done (DoD)
- [ ] Double-click `index.html`, drop 3 SVGs, change color to `#FF5722`.
- [ ] Click "Download ZIP", extract, verify valid color in SVG source.
```

Only when you reply **`CONFIRM`**, the agent unlocks the code editor and executes precisely to the spec!

---

## 🤝 Contributing & Community

We believe product discipline is the single most valuable skill in the age of autonomous coding.

- Star this repo if it saved you from AI code bloat! ⭐
- PRs for additional agent adapters (Devin, Roo Code, Aider, OpenHands) are warmly welcome.

## 👥 Authors & Pair Programming

This project was conceived and architected through human-AI pair programming:
- **Minghao Lin** ([@Koaaa-sysu](https://github.com/Koaaa-sysu)) — Creator & Lead Architect
- **Claude** (Anthropic) — AI Pair Programmer & Spec Reviewer
- **Antigravity** (Google DeepMind) — AI Pair Programmer & Co-Designer

See [CONTRIBUTORS.md](CONTRIBUTORS.md) for full contributor details.

---

## 📜 License

[MIT License](LICENSE) © 2026 Minghao Lin & Contributors.
