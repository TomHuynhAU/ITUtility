$pythonScript = @'
import tkinter as tk
from tkinter import messagebox


def say_hello():
    name = name_input.get().strip()
    if not name:
        messagebox.showwarning("Thong bao", "Vui long nhap ten.")
        return
    output_label.config(text=f"Xin chao, {name}! App dang chay tot.")


def show_about():
    messagebox.showinfo(
        "About",
        "Day la app Python tkinter mau. Ban co the chay no bang 1 lenh IRM|IEX."
    )


root = tk.Tk()
root.title("Demo Python UI App")
root.geometry("560x320")
root.resizable(False, False)

title = tk.Label(
    root,
    text="Xin chao, day la app Python UI chay bang 1 lenh",
    font=("Segoe UI", 12, "bold")
)
title.pack(anchor="w", padx=20, pady=(20, 10))

input_label = tk.Label(root, text="Nhap ten cua ban:")
input_label.pack(anchor="w", padx=20)

name_input = tk.Entry(root, width=42)
name_input.pack(anchor="w", padx=20, pady=(4, 12))
name_input.focus()

button_frame = tk.Frame(root)
button_frame.pack(anchor="w", padx=20)

hello_button = tk.Button(button_frame, text="Chao", width=12, command=say_hello)
hello_button.pack(side="left", padx=(0, 10))

about_button = tk.Button(button_frame, text="Thong tin", width=12, command=show_about)
about_button.pack(side="left", padx=(0, 10))

exit_button = tk.Button(button_frame, text="Thoat", width=12, command=root.destroy)
exit_button.pack(side="left")

output_label = tk.Label(root, text="", font=("Segoe UI", 10))
output_label.pack(anchor="w", padx=20, pady=(24, 0))

root.mainloop()
'@

function Get-PythonCommand {
    if (Get-Command py -ErrorAction SilentlyContinue) {
        return @("py", "-3")
    }

    if (Get-Command python -ErrorAction SilentlyContinue) {
        return @("python")
    }

    throw "Khong tim thay Python. Hay cai Python 3 roi chay lai."
}

try {
    $pythonCmd = Get-PythonCommand
    $tempFile = Join-Path $env:TEMP "python-ui-app.py"
    Set-Content -Path $tempFile -Value $pythonScript -Encoding UTF8

    if ($pythonCmd.Length -gt 1) {
        $pythonArgs = $pythonCmd[1..($pythonCmd.Length - 1)] + @($tempFile)
    }
    else {
        $pythonArgs = @($tempFile)
    }

    & $pythonCmd[0] @pythonArgs
}
catch {
    Write-Error $_
    exit 1
}
