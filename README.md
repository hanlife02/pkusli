# pkusli

一个基于 Typst 与 [Touying](https://typst.app/universe/package/touying/) 的演示模板。

## AI Agent 快速使用

1. Clone 本项目。

   ```bash
   git clone git@github.com:hanlife02/pkusli.git
   cd pkusli
   ```

2. 在项目根目录打开 AI Agent，例如 Codex 或 Claude Code。

3. 让 Agent 安装本项目 Skill 到本地。

   ```text
   帮我安装本项目的 Skill 到本地。
   ```

4. 使用 Skill 完成演示稿。

   ```text
   $pkusli-slides 把这个项目改成一份关于「你的主题」的演示稿。如果信息不够，请一次性问完需要的问题，然后更新 task.md、config.md 和 main.typ，并运行 typst compile main.typ 验证。
   ```