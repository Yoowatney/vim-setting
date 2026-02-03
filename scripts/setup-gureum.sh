#!/bin/bash
# 구름 입력기 설정 스크립트
# ABC 제거하고 구름만 남김

echo "구름 입력기 설정 중..."

# 구름 앱 실행 (시스템 등록)
if [[ -d "/Library/Input Methods/Gureum.app" ]]; then
    open "/Library/Input Methods/Gureum.app"
    sleep 2
fi

# 입력 소스 설정 (ABC 제거, 구름만)
defaults write com.apple.HIToolbox AppleEnabledInputSources -array \
  '{"Bundle ID"="org.youknowone.inputmethod.Gureum"; InputSourceKind="Keyboard Input Method";}' \
  '{"Bundle ID"="com.apple.CharacterPaletteIM"; InputSourceKind="Non Keyboard Input Method";}'

echo ""
echo "✅ 설정 완료!"
echo ""
echo "⚠️  로그아웃 후 다시 로그인해야 적용됩니다."
echo "   또는: 시스템 설정 > 키보드 > 입력 소스 확인"
echo ""
