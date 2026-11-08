@echo off
rem claude-remote: what `remote` on the Mac runs over SSH (ssh -t desktop claude-remote).
rem Opens Claude Code in the Derailed workspace on this Windows PC and resumes the
rem latest session there. Install: copy to a folder on PATH (e.g. %USERPROFILE%\.local\bin).
rem Default folder is D:\dev (where the Derailed sessions live, with the checkout at
rem D:\dev\derailed); override with a user env var: setx CLAUDE_REMOTE_DIR D:\dev\derailed
setlocal
if not defined CLAUDE_REMOTE_DIR set "CLAUDE_REMOTE_DIR=D:\dev"
cd /d "%CLAUDE_REMOTE_DIR%" || exit /b 1
claude --continue --dangerously-skip-permissions %*
