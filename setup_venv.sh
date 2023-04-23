#!/bin/bash

pip install virtualenv

python -m virtualenv .venv


VENV_PYTHON_PATH=$(pwd)/.venv/Scripts/python
VENV_PIP_PATH=$(pwd)/.venv/Scripts/pip

# Show python version
$VENV_PYTHON_PATH --version
$VENV_PYTHON_PATH -m pip install --upgrade pip
$VENV_PIP_PATH install -r requirements.txt
$VENV_PYTHON_PATH setup.py install
$VENV_PIP_PATH install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117
# $VENV_PIP_PATH  install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

$VENV_PIP_PATH list

# Append to environment Path, so system can find whisper.exe
export PATH=$PATH:"$(pwd)/.venv/Scripts/"