# latexindent.pl with some customizations

| Option  | Description                                                                         |
|-------- |------------------------------------------------------------------------------------ |
| `-m`    | breaks lines; useful to format LaTeX so that each sentence is on one physical line  |
| `-g`    | send `indent.log` to `/dev/null`                                                      |
| `-l`    | use settings from `~/.latexindent.yaml`                                             |

Add alias in `.bashrc`:

```bash
alias latexindent='latexindent -m -g /dev/null -l="$HOME/.latexindent.yaml"'
```
