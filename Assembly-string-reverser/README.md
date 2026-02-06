# Assembly-string-reverser
# README.md

## پروژه: معکوس‌سازی رشته (String Reverser) — اسمبلی x86_64 (NASM)

این پروژه یک برنامهٔ سادهٔ خط فرمانی در اسمبلی (NASM) برای لینوکس x86_64 است که از ورودی استاندارد (`stdin`) یک رشته می‌خواند، آن را معکوس می‌کند و خروجی می‌دهد.

ویژگی‌ها:
- خواندن تا 128 بایت از stdin
- حذف newline در انتها هنگام معکوس‌سازی (اگر وجود داشته باشد) و سپس چاپ newline مجدد بعد از رشته معکوس
- مناسب برای نمایش مهارت در کار با syscalls و مدیریت بافرها

### فایل‌های داخل مخزن:
- `revstr.asm` — کد اسمبلی
- `Makefile` — برای ساخت و لینک کردن
- `README.md` — همین فایل (دوزبانه)

### پیش‌نیازها
- `nasm` و `gcc`

در اوبونتو/دبیان:

```bash
sudo apt update
sudo apt install nasm gcc -y
```

### ساخت و اجرا

```bash
make
# سپس متن را تایپ کن و Enter بزنی، یا از فایل بخوانی:
./revstr
# یا
echo "hello world" | ./revstr
```

---

## Project: String Reverser — Assembly x86_64 (NASM)

This is a small command-line program written in NASM for Linux x86_64. It reads a string from standard input (stdin), reverses it and prints the reversed string to stdout.

Features:
- Reads up to 128 bytes from stdin
- If the input ends with a newline, it is excluded from reversal and printed after the reversed content
- Demonstrates syscalls usage and buffer manipulation in assembly

### Files included:
- `revstr.asm` — assembly source
- `Makefile` — build & link
- `README.md` — this bilingual readme

### Requirements
- `nasm` and `gcc`

On Ubuntu/Debian:

```bash
sudo apt update
sudo apt install nasm gcc -y
```

### Build & Run

```bash
make
# type input and press Enter, or pipe from a file:
./revstr
# or
echo "hello world" | ./revstr
```
