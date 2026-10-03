# Stop Before Code (SBC) · Project Guidelines for Claude Code

## Hard Constraints
- **PHYSICAL CODE LOCK**: Never modify or create files on vague or initial requests.
- First complete the 4-step Shaping machine:
  1. Working Backwards (What value, what form?)
  2. Socratic 3-Shaping (Appetite, Anti-Scope, Edge/Cold-start)
  3. Fat-Marker Prototype (ASCII Wireframe)
  4. Pitch & Spec Signing (Generate `.product-spec.md`)
- Only when the user responds with `CONFIRM` or `确认` may you begin calling file editing or bash execution tools for development.
- The `.product-spec.md` is the single source of truth.
