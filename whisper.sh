#!/bin/sh
set -e
#  --task: X->X speech recognition ('transcribe') or  or X->English translation ('translate')
#  [--model {tiny.en,tiny,base.en,base,small.en,small,medium.en,medium,large-v1,large-v2,large}]
# --device cuda

filePath=$1
# get file name
fileNmae=${filePath%.*}

# get current directory
BASE_PATH=$(cd "$(dirname "$0")"; pwd)

# Use initial_prompt to guide
# Use initial_prompt to guide the model to translate from Chinese to English, ex: https://github.com/openai/whisper/discussions/277
initPrompt="以下是使用台灣繁體中文進行的UnrealEngine遊戲專案會議，跟Character角色設計有關，在討論有關的分工"
# initPrompt="以下是使用台灣繁體中文進行的UnrealEngine影片教學，裡面有些術語會使用英文，例如ThirdPersonCharacter"
common_param="--model large --output_format all --verbose True --initial_prompt '${initPrompt}' \
             --word_timestamps True --language Chinese  "

method="translate"
cmd="${BASE_PATH}/.venv/Scripts/whisper.exe --task ${method} ${common_param} --output_dir ${method} ${filePath}"
echo $cmd
eval $cmd

method="transcribe"
cmd="${BASE_PATH}/.venv/Scripts/whisper.exe --task ${method} ${common_param} --output_dir ${method} ${filePath}"
echo $cmd
eval $cmd