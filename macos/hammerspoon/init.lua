-- Hammerspoon 설정
-- Claude Code 알림 + tmux 세션 전환

-- IPC 모듈 로드 (CLI에서 hs 명령어 사용 가능하게)
require("hs.ipc")

-- Claude Code 알림 함수
function claudeNotify(title, message)
    local n = hs.notify.new(function(notification)
        -- 알림 클릭 시 실행
        local script = os.getenv("HOME") .. "/.dotfiles/macos/claude-notification/switch-tmux.sh"
        hs.execute(script)
    end, {
        title = title or "Claude Code",
        informativeText = message or "작업이 완료되었습니다",
        withdrawAfter = 0,  -- 자동으로 안 사라짐
        hasActionButton = true,
        actionButtonTitle = "이동",
    })
    n:send()
end

-- 입력 필요 알림 (다른 사운드)
function claudeNotifyInput(message)
    hs.sound.getByFile("/System/Library/Sounds/Blow.aiff"):play()
    claudeNotify("Claude Code - 입력 필요", message or "입력이 필요합니다")
end

-- 작업 완료 알림
function claudeNotifyDone(message)
    hs.sound.getByFile("/System/Library/Sounds/Glass.aiff"):play()
    claudeNotify("Claude Code", message or "작업이 완료되었습니다")
end

-- CLI에서 호출 가능하도록 전역 등록
-- 사용법: hs -c 'claudeNotifyDone("완료 메시지")'
-- 사용법: hs -c 'claudeNotifyInput("입력 필요 메시지")'

-- 설정 리로드 단축키 (Cmd+Ctrl+R)
hs.hotkey.bind({"cmd", "ctrl"}, "r", function()
    hs.reload()
end)

hs.alert.show("Hammerspoon 로드됨")
