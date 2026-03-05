# Python UI App (Run bằng 1 lệnh)

App này là ví dụ UI trên Windows viết bằng Python (`tkinter`), có thể chạy theo kiểu:

```powershell
irm "https://<your-raw-url>/win-ui-app.ps1" | iex
```

`win-ui-app.ps1` đóng vai trò bootstrap: kiểm tra Python rồi chạy app Python.

## Chạy local bằng Python

```powershell
python .\python-ui-app.py
```

Hoặc:

```powershell
py -3 .\python-ui-app.py
```

## Chạy local theo kiểu `irm | iex`

```powershell
powershell -ExecutionPolicy Bypass -File .\win-ui-app.ps1
```

## Deploy để dùng `irm | iex`

1. Đẩy repo này lên GitHub.
2. Mở file `win-ui-app.ps1` trên GitHub và lấy **Raw URL**.
3. Chạy lệnh:

```powershell
irm "RAW_URL_CUA_BAN" | iex
```

Ví dụ với branch `main`:

```powershell
irm "https://raw.githubusercontent.com/<username>/<repo>/main/win-ui-app.ps1" | iex
```

## Lưu ý bảo mật

- Chỉ chạy `irm | iex` với URL bạn tin tưởng.
- Nên review nội dung script trước khi chạy trong môi trường production.
- Máy cần có Python 3 (bootstrap sẽ báo lỗi nếu chưa cài).
