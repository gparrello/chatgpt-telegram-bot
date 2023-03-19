curl -m 90 -sLf -H "Authorization: Bearer ${OPENAI_API_KEY}" "https://api.openai.com/v1/models"
curl -m 90 -sLf "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/getMe"