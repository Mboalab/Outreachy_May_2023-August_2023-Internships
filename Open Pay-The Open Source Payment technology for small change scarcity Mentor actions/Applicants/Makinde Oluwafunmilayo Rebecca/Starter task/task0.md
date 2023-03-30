# Main Activities to Complete

## Create a github account (if you don't have one)
- I have one already [here](https://github.com/Beccamak)

## Go through documentation on basic knowledge on how to use, write and contribute on GitHub.
* I have gone through the required documentation to acquire basic knowledge of how to use and contribute on githhub. Here are my take aways:
  1. What a good pull request should include as found [here](https://www.pullrequest.com/blog/writing-a-great-pull-request-description/).
     -   What
     -   Why
     -   How
     -   Testing
     -   Screenshot (optional)
     -   Additional Details (optional)

  2. Writing good commit messages; There are two types of commit messages
     - Atomic commit
     - Convetional commit
       - Angular commit (they have their rules too)

     Generally, commit messages should 
     - state exactly what the changes are for
     - be in the active voice (present tense)
     - understandable and unambiguous
     - not include capital or period at the end
     - be separated into several commits when the commit message gets long
     - include a subject (< 50 characters), description (up to 72 characters) and a ticket number
     - be simple, readable and consistent



## Use acquired knowledge to contribute to a selected task.
With respect to what I have learned, here are the steps I took to acheive this and how I applied the knowledge I gained.

- After forking the repository, to clone the repository, I used the "`git clone` https://github.com/Beccamak/mboalab-2023"
- `git remote add origin https://github.com/Mboalab/Outreachy_May_2023-August_2023-Internships.git`
- Created a branch using "`git branch` branch_name`"
- Switched to the branch using "`git checkout` branch_name"
- Created the necessary folders and a task0.md file
- I plan to use these steps and commands as I have learnt to push and submit a pull request
  - `git status` to see my untracked files in the staging area 
  - `git add .` to add all files to the staging area 
  - `git commit -m "submit task 0"` to commit my changes
  - `git push origin current-branch`
  - submit a pull request
  
To ensure my repository doesn't have any merge conflict in the future, I will
- `git checkout main` to switch to the main branch
- `git remote add upstream https://github.com/Mboalab/Outreachy_May_2023-August_2023-Internships.git` to set Mboalab repository as the upstream
- `git fetch upstream` to get the current files
- `git merge upstream/main` to merge my main branch and the upstream
- `git push origin main` 
