#!/bin/bash
set -x
set -o errexit
# TARGET_LOCALE

apt update && apt -y install tar git
git submodule update --init
mkdir dist replay

ARCHIVE_FILES=(ygopro.exe LICENSE README.md lflist.conf strings.conf system.conf cards.cdb script textures deck single pics replay sound bot.conf Bot.exe WindBot locales fonts)

if [[ "$TARGET_LOCALE" == "zh-CN" ]]; then
	ARCHIVE_FILES=("${ARCHIVE_FILES[@]}" update-koishipro)
fi

7z a -mx9 -xr!.git* dist/KoishiPro-$CI_COMMIT_REF_NAME-win32-$TARGET_LOCALE.7z "${ARCHIVE_FILES[@]}"
