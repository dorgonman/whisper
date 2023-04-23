#!/bin/bash
set -e

pip install virtualenv

python -m virtualenv .venv


VENV_PYTHON_PATH=$(pwd)/.venv/Scripts/python
VENV_PIP_PATH=$(pwd)/.venv/Scripts/pip

# Show python version
$VENV_PYTHON_PATH --version
$VENV_PYTHON_PATH -m pip install --upgrade pip
$VENV_PIP_PATH install --upgrade pip
$VENV_PIP_PATH install setuptools-rust
$VENV_PIP_PATH install -r requirements.txt
# need install https://rustup.rs/
# $VENV_PYTHON_PATH setup.py build
$VENV_PYTHON_PATH setup.py install
# For GPU
# https://pytorch.org/get-started/previous-versions/
# $VENV_PIP_PATH install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117
# $VENV_PIP_PATH install torch==2.2.2 torchvision==0.17.2 torchaudio==2.2.2 --index-url https://download.pytorch.org/whl/cu121
$VENV_PIP_PATH install torch==2.3.0 torchvision==0.18.0 torchaudio==2.3.0 --index-url https://download.pytorch.org/whl/cu121

$VENV_PIP_PATH list

# Append to environment Path, so system can find whisper.exe
# export PATH=$PATH:"$(pwd)/.venv/Scripts/"