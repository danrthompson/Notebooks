echo 'make sure you are in the root where you want the notebook dir'
echo 'hit y to continue, n to exit'
read -n 1 -r

git clone git@github.com:danrthompson/Notebooks.git
cd Notebooks

brew update
brew install pyenv
brew install pyenv-virtualenv
pyenv install 3.11.6

pyenv virtualenv 3.11.6 course-langchain-app-dev
cd LangchainForLLMAppDev
pyenv local course-langchain-app-dev

pip install -r requirements.txt
touch .env

echo '
Add the following to your bashrc:

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:${PATH}"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
'

echo '
Add the following to your .env file:
OPENAI_API_KEY=your_openai_api_key
'

echo '
make sure the following extensions are installed:
REQUIRED:
ms-python.python
ms-python.vscode-pylance
ms-toolsai.jupyter

RECOMMENDED:
mikestead.dotenv
GitHub.copilot
ms-python.pylint
ms-python.black-formatter

OPTIONAL:
GitHub.copilot-chat
ms-python.debugpy
ms-vsliveshare.vsliveshare
ms-toolsai.vscode-jupyter-cell-tags
ms-toolsai.jupyter-keymap
'
