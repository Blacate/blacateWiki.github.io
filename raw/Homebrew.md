---
title: Homebrew
category: OS X
time: 1551170723307
---
### Update Mirrors

```bash
# brew
cd "$(brew --repo)"
git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git

# brew core
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git

# brew cask
cd "$(brew --repo)"/Library/Taps/homebrew/homebrew-cask
git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git
```

`brew update`会检查`brew`、`brew-core`、`brew-cask`三个仓库的更新。由于这三个仓库是在github上，所以速度会很爆炸，更换为国内镜像的时候需要将这三个都替换掉。具体的信息可以通过`brew update -v`查看。

### References

+ https://mirror.tuna.tsinghua.edu.cn/help/homebrew/

+ https://mirrors.ustc.edu.cn/help/homebrew-cask.git.html