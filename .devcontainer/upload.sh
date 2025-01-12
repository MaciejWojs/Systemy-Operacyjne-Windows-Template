
output=$(curl -sS -X POST -F "file=@dokument.pdf" https://store1.gofile.io/contents/uploadfile)


code=$(echo $output | jq -r '.data.parentFolder')
guestToken=$(echo $output | jq -r '.data.guestToken')
curl -sS -X POST -H "Authorization: Bearer $guestToken" -F "file=@dokument-compressed.pdf" -F "folderId=$code" https://store1.gofile.io/contents/uploadfile &> /dev/null

echo Download URL: $output | jq -r '.data.downloadPage'