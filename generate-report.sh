#!/bin/bash

main() {
  try generate $1
  catch $?
}

try() {
  "$@"
  return $?
}

catch() {
  local exit_status=$1
  if [ ${exit_status} -ne 1 ]; then
    echo "Error: command failed with exit status ${exit_status}"
  fi
}

generate() {
  file_name=${1}.md
  work_dir="`pwd`"
  file_path=${work_dir}/${file_name}
  cat <<EOF > ${file_path}
## 取り組んだ課題一覧

## わかったこと

## 次にやること

## 感じたこと

## 学習時間

- 今日；h
- 累計；h
EOF
  exit 1
}

if [ $# -ne 1 ]; then
  echo "fine name please."
  exit 0
fi

main $1
