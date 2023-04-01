# [git – small hints](http://linux.freeideas.cz/subdom/linux/git-small-hints/ "Permalink to git – small hints")


* find all git repositories on machine:

  <pre><div><div id="highlighter_614832" class="syntaxhighlighter  plain"><table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td class="gutter"><div class="line number1 index0 alt2">1</div></td><td class="code"><div class="container"><div class="line number1 index0 alt2"><code class="plain plain">find / -name .git -print 2&gt;/dev/null</code></div></div></td></tr></tbody></table></div></div>
  </pre>
* ignore spaces in diff – add “-w” switch
* the same on github – add “?w=1” to URL of unified diff
* the same in local git gui – switch on “ignore space change” in diff window
* reset local changes (example for master branch):

  <pre><div><div id="highlighter_279862" class="syntaxhighlighter  plain"><table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td class="gutter"><div class="line number1 index0 alt2">1</div></td><td class="code"><div class="container"><div class="line number1 index0 alt2"><code class="plain plain">git reset --hard origin/master</code></div></div></td></tr></tbody></table></div></div>
  </pre>
* reset one file only:

  | 1 | `git checkout HEAD -- filename` |
  | - | --------------------------------- |
* checkout local branch tracking remote branch (create it if does not exist):

  <pre><div><div id="highlighter_239749" class="syntaxhighlighter  plain"><table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td class="gutter"><div class="line number1 index0 alt2">1</div></td><td class="code"><div class="container"><div class="line number1 index0 alt2"><code class="plain plain">git checkout -t -b develop origin/develop</code></div></div></td></tr></tbody></table></div></div>
  </pre>
* show git branches based on pattern:

  <pre><div><div id="highlighter_199901" class="syntaxhighlighter  plain"><table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td class="gutter"><div class="line number1 index0 alt2">1</div></td><td class="code"><div class="container"><div class="line number1 index0 alt2"><code class="plain plain">git show-branch -a | grep pattern</code></div></div></td></tr></tbody></table></div></div>
  </pre>
* check differences between branches in meld file by file:

  <pre><div><div id="highlighter_676841" class="syntaxhighlighter  plain"><table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td class="gutter"><div class="line number1 index0 alt2">1</div><div class="line number2 index1 alt1">2</div></td><td class="code"><div class="container"><div class="line number1 index0 alt2"><code class="plain plain">git config --global diff.tool meld</code></div><div class="line number2 index1 alt1"><code class="plain plain">git difftool master..develop</code></div></div></td></tr></tbody></table></div></div>
  </pre>
* see all differences between current and other branch in meld:

  <pre><div><div id="highlighter_350216" class="syntaxhighlighter  plain"><table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td class="gutter"><div class="line number1 index0 alt2">1</div></td><td class="code"><div class="container"><div class="line number1 index0 alt2"><code class="plain plain">git difftool -d develop</code></div></div></td></tr></tbody></table></div></div>
  </pre>
* the same between two branches regardless on branch you are now:

  <pre><div><div id="highlighter_616683" class="syntaxhighlighter  plain"><table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td class="gutter"><div class="line number1 index0 alt2">1</div></td><td class="code"><div class="container"><div class="line number1 index0 alt2"><code class="plain plain">git difftool -d master..develop</code></div></div></td></tr></tbody></table></div></div>
  </pre>
* add branch name to the promtp – see here [https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt](https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt)
  you have to add into .bashrc (or other .*rc according to your shell):

  <pre><div><div id="highlighter_777250" class="syntaxhighlighter  plain"><table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td class="gutter"><div class="line number1 index0 alt2">1</div><div class="line number2 index1 alt1">2</div><div class="line number3 index2 alt2">3</div><div class="line number4 index3 alt1">4</div></td><td class="code"><div class="container"><div class="line number1 index0 alt2"><code class="plain plain">parse_git_branch() {</code></div><div class="line number2 index1 alt1"><code class="plain spaces">     </code><code class="plain plain">git branch 2&gt;/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'</code></div><div class="line number3 index2 alt2"><code class="plain plain">}</code></div><div class="line number4 index3 alt1"><code class="plain plain">export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "</code></div></div></td></tr></tbody></table></div></div>
  <p>or other version:</p>
  <pre><div><div id="highlighter_585938" class="syntaxhighlighter  plain"><table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td class="gutter"><div class="line number1 index0 alt2">1</div><div class="line number2 index1 alt1">2</div><div class="line number3 index2 alt2">3</div><div class="line number4 index3 alt1">4</div><div class="line number5 index4 alt2">5</div><div class="line number6 index5 alt1">6</div><div class="line number7 index6 alt2">7</div><div class="line number8 index7 alt1">8</div><div class="line number9 index8 alt2">9</div><div class="line number10 index9 alt1">10</div><div class="line number11 index10 alt2">11</div><div class="line number12 index11 alt1">12</div><div class="line number13 index12 alt2">13</div><div class="line number14 index13 alt1">14</div><div class="line number15 index14 alt2">15</div><div class="line number16 index15 alt1">16</div><div class="line number17 index16 alt2">17</div><div class="line number18 index17 alt1">18</div><div class="line number19 index18 alt2">19</div><div class="line number20 index19 alt1">20</div><div class="line number21 index20 alt2">21</div><div class="line number22 index21 alt1">22</div></td><td class="code"><div class="container"><div class="line number1 index0 alt2"><code class="plain plain"># Show git branch in prompt</code></div><div class="line number2 index1 alt1"><code class="plain plain">function parse_git_branch () {</code></div><div class="line number3 index2 alt2"><code class="plain spaces">  </code><code class="plain plain">git branch 2&gt; /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'</code></div><div class="line number4 index3 alt1"><code class="plain plain">}</code></div><div class="line number5 index4 alt2"> </div><div class="line number6 index5 alt1"><code class="plain plain">NO_COLOR="\[\033[0m\]"</code></div><div class="line number7 index6 alt2"><code class="plain plain">RED="\[\033[0;31m\]"</code></div><div class="line number8 index7 alt1"><code class="plain plain">YELLOW="\[\033[0;33m\]"</code></div><div class="line number9 index8 alt2"><code class="plain plain">GREEN="\[\033[0;32m\]"</code></div><div class="line number10 index9 alt1"><code class="plain plain">BLUE="\[\033[1;34m\]"</code></div><div class="line number11 index10 alt2"><code class="plain plain">LIGHT_RED="\[\033[1;31m\]"</code></div><div class="line number12 index11 alt1"><code class="plain plain">LIGHT_GREEN="\[\033[1;32m\]"</code></div><div class="line number13 index12 alt2"><code class="plain plain">CYAN="\[\033[0;36m\]"</code></div><div class="line number14 index13 alt1"><code class="plain plain">LIGHT_CYAN="\[\033[1;36m\]"</code></div><div class="line number15 index14 alt2"><code class="plain plain">WHITE="\[\033[1;37m\]"</code></div><div class="line number16 index15 alt1"><code class="plain plain">LIGHT_GRAY="\[\033[0;37m\]"</code></div><div class="line number17 index16 alt2"><code class="plain plain">PURPLE="\[\033[0;35m\]"</code></div><div class="line number18 index17 alt1"><code class="plain plain">LIGHT_PURPLE="\[\033[1;35m\]"</code></div><div class="line number19 index18 alt2"><code class="plain plain">BLACK="\[\033[0;30m\]"</code></div><div class="line number20 index19 alt1"> </div><div class="line number21 index20 alt2"><code class="plain plain">#PS1="$LIGHT_GREEN\u@$LIGHT_PURPLE\h$BLUE:\w$LIGHT_CYAN\$(parse_git_branch)$WHITE\$ "</code></div><div class="line number22 index21 alt1"><code class="plain plain">PS1="$LIGHT_GREEN\u$BLUE:\w$LIGHT_CYAN\$(parse_git_branch)$WHITE\$ "</code></div></div></td></tr></tbody></table></div></div>
  </pre></pre>
* see history of a file (even deleted one) – you can use wild cards in the name, shows only commit headers:

  <pre><div><div id="highlighter_229999" class="syntaxhighlighter  plain"><table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td class="gutter"><div class="line number1 index0 alt2">1</div></td><td class="code"><div class="container"><div class="line number1 index0 alt2"><code class="plain plain">git log -- filename.txt</code></div></div></td></tr></tbody></table></div></div>
  </pre>
* search history of the repository for specific string in files (like by mistake commited password) – based on this [stackoverflow page](https://stackoverflow.com/questions/4468361/search-all-of-git-history-for-a-string):

  * <pre><div><div id="highlighter_287434" class="syntaxhighlighter  plain"><table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td class="gutter"><div class="line number1 index0 alt2">1</div></td><td class="code"><div class="container"><div class="line number1 index0 alt2"><code class="plain plain">git log -Spassword</code></div></div></td></tr></tbody></table></div></div>
    </pre>
* use specific ssh key for git clone/ pull command (based on [this](https://stackoverflow.com/questions/4565700/specify-private-ssh-key-to-use-when-executing-shell-command-with-or-without-ruby))

  * add section for github.com into your ~/.ssh/config file (must point at private key – not a public one):
    <pre><div><div id="highlighter_324271" class="syntaxhighlighter  plain"><table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td class="gutter"><div class="line number1 index0 alt2">1</div><div class="line number2 index1 alt1">2</div><div class="line number3 index2 alt2">3</div></td><td class="code"><div class="container"><div class="line number1 index0 alt2"><code class="plain plain">Host github.com</code></div><div class="line number2 index1 alt1"><code class="plain plain">IdentityFile ~/.ssh/yourspecific_id_rsa</code></div><div class="line number3 index2 alt2"><code class="plain plain">IdentitiesOnly yes</code></div></div></td></tr></tbody></table></div></div>
    </pre>
* check difference between local repo and origin (based on [this](https://stackoverflow.com/questions/21101572/git-diff-between-file-in-local-repo-and-origin/21101689))

  * git diff @{upstream}
