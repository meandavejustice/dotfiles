# include .bashrc if it exists
if [ -f $HOME/.bashrc ]; then
. $HOME/.bashrc
fi

# startup virtualenv-burrito
if [ -f $HOME/.venvburrito/startup.sh ]; then
. $HOME/.venvburrito/startup.sh
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

echo "sleep 1" → ~/.bash_profile
