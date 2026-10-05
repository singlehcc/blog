## Cursor Cloud specific instructions

This repository is a Hexo 3 static blog (`Charlie hua的博客`). There is no backend, database, lint script, or test script. `package.json` lists dependencies only.

- Dev server: `npx hexo server` (http://localhost:4000). Static build: `npx hexo generate` (output in `public/`, gitignored). `npm install` on the VM's current Node (22.x) is enough; it resolves Hexo 3.9 from `hexo: ^3.2.0` because `package-lock.json` was removed on purpose in `94265e4`. Do not commit a regenerated lockfile.
- `themes/hexo-theme-next` is a gitlink (`d80c748`) with no `.gitmodules` and no theme objects in this clone. Those later submodule commits were never pushed. The theme the site actually renders is NexT 5.1.4 (Swig layouts) stored in history as `themes/hexo-theme-next.zip` at commit `4e9de21`. If `themes/hexo-theme-next/layout/index.swig` is missing, restore that zip into `themes/` before `hexo server` or `hexo generate`. Do not swap in current NexT (v6+) or switch `_config.yml` to `landscape`; both break this Hexo 3 site. Restored theme files sit inside the gitlink and should not be committed.
- Running any `hexo` command rewrites the `hexo.version` field in `package.json` to the installed release (3.9.0) and may drop the trailing newline. Leave that file unchanged unless you meant to edit dependencies.
- `hexo deploy` pushes over SSH to `git@github.com:singlehcc/singlehcc.github.io.git` and is not needed for local preview.
- Startup logs warn that NexT moved repositories and that Highlight.js 9 / `util.isDate` are deprecated. Those warnings are expected; generation still succeeds.
