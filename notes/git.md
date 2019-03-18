title: git
category: Tools
time: 1487085418618
---
### Daily Use

```bash
git init // 初始化git仓库
git status // 查看当前状态
git diff // 查看工作区和暂存区文件改动
git add . // 追踪所有文件
git commit -m "message" // 将暂存区的改动保存到版本库
git push origin master // 将本地库的改动同步到远程仓库
git show commitId [fileName] // 查看某个commit修改的内容,可选指定文件
```

### Advanced Usage

```shell
// 新建一个空白分支, orphan参数是文件存在，但commit记录不存在
git checkout --orphan new-branch && git rm -rf ./
// 查找某个author的提交，可选：加上指定文件
git log --author="Neail" [src/App.vue]
// 查找commit log中相关内容
git log --grep="update" [src/App.vue]
```

### 合并commit/修改commit信息

```bash
# 修改最近一次提交
git commit --amend -m "some message"
# 修改多个提交信息
git rebase -i HEAD~3
```

### [移除一个commit](https://github.com/zhongxia245/blog/issues/81)

```shell
# 1. 查看任务A相关代码commit的id
git log 

# 2. 回退到不包含任务A部分代码的commit 位置
git reset --soft commitid

# 3. commit之后的代码，还存在 modified 区域
git rm 任务A的文件

# 4. 提交代码
git commit -am '提交任务B代码，任务B描述'

# 5. push 到个人远程仓库分支
git push -f 

# 6. 搞定
```

### 断点续传

```bash
git fetch git://github.com/repo.git
git checkout FETCH_HEAD
```

### Git Conf

```bash
git config --global user.name "Your Name"
git config --global user.email "email@example.com"
git config --global push.followTags true // 推送tag
```

### Update a fork

```bash
git remote add upstream <repo url>
git fetch upstream // 存储在本地分支 upstream/master 上
git checkout master
git merge upstream/master
```

### Version Manage

```bash
// 工作区 暂存区 版本库
git log [--pretty=oneline] [--abbrev-commit] // 显示版本库的提交日志
// HEAD 表示当前版本 HEAD^表示上一个版本
git reset --hard HEAD^
git reflog // 查看git命令历史，方便回到未来的版本
git checkout -- file // 工作区文件回到暂存区/版本库最近的状态
git reset HEAD file //　暂存区文件回到版本库最近的状态
git rm // 删除文件
get revert <commit id> // 用一个新提交来消除一个历史提交所做的任何修改
git fetch --all && git reset --hard origin/master && git pull // 强制覆盖本地文件
```

### Remote Repo

```bash
git remote -v // 查看远程仓库配置
git remote add origin git@github.com:blacate/wiki.git // 添加远程仓库，别名为origin
git push [--force] origin master // 把版本库同步到远程仓库
git push origin :master // 删除远程仓库master分支
git fetch origin // 取回远程仓库
git merge origin/next // 把远程仓库的origin的next分支合并到当前分支
git pull origin next // git fetch origin && git merge origin/next
git pull origin next:master // 把远程的next分支合并到本地master分支
git branch --set-upstream dev origin/dev //设置远程分支origin/dev的链接
git pull origin // 如果远程仓库只有一个分支
git pull // 如果只有一个远程仓库
```

### Branch

```bash
git branch new // 新建远程分支new
git checkout new // 切换到远程分支new
git checkout -b new // 创建并切换到远程分支new
git branch // 查看所有分支
git merge new // 把new分支合并到当前分支
git merge --no-ff -m "no fast forward" second // merge时生成一个新的commit
git branch -d old // 删除old分支
git log --graph // 查看分支合并图
git stash // 把工作现场储存起来
git stash list // 查看工作现场列表
git stash apply/drop/pop // 恢复/删除/弹出工作现场
git branch -D needtodel // 强制删除needtodel分支
git branch --set-upstream dev origin/dev //设置远程分支origin/dev的链接
git rebase new // 在新的base上一个一个地运行new分支上的所有commits[1]
```

### Tag

```bash
git tag v1.0
git tag v0.9 <commit id>
git show v0.9
git push origin <tagname>
git push origin --tags
git tag -d <tagname>
git push origin :refs/tags/<tagname> // 删除远程标签
```

#### ref

+ [Git pull 强制覆盖本地文件](https://www.jianshu.com/p/3d0ae7fbbbe1)
+ [git reset revert](http://yijiebuyi.com/blog/8f985d539566d0bf3b804df6be4e0c90.html)
+ [廖雪峰git](https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)
+ [同步一个fork](https://gaohaoyang.github.io/2015/04/12/Syncing-a-fork/)
+ [git pull 命令](http://blog.csdn.net/qq_15037231/article/details/77937402)
+ **[1]**[git rebase vs git merge](https://www.cnblogs.com/kidsitcn/p/5339382.html)
+ [在GIT中创建一个空分支](https://segmentfault.com/a/1190000004931751)
+ [git log查找某一个author的提交](https://blog.csdn.net/gracioushe/article/details/6249480)
+ [重写历史](https://git-scm.com/book/zh/v2/Git-%E5%B7%A5%E5%85%B7-%E9%87%8D%E5%86%99%E5%8E%86%E5%8F%B2)

