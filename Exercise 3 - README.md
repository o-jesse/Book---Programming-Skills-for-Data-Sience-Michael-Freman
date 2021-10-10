# git status

Command:
```
~\filepath>git status
```
Feedback:
```
On branch master
Your bran is up to date with 'origin/master'.

nothing to commit, working tree clean
```
This git command can be used in the git command or in the windows command prompt as well as within R Studio itself in the "Terminal" tab in the bottom left corner. The example above assumes all commits and pushes are up to date. This can be used to check the status of the files in the github repo comparing them against the files saved in the local machine. It shows some of the following things (_Programming Skills for Data Science, p.31_):
- That you're actually in a repo (otherwise you weill get an error);
- That you're on the master branch (think: line of development);
- That you're at the initial commit (your haven't committed anything yet);
- That currently there are no changes to files that you need to commit (save) to the database.