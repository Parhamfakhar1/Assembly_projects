# Assembly-base-converter
# README.md

## پروژه: مبدل عددی (Decimal to Binary & Hex) — اسمبلی x86_64 (NASM)

این پروژه یک برنامهٔ ساده به زبان اسمبلی (NASM) برای لینوکس x86_64 است که یک عدد دسیمال (ثابت در کد یا ورودی ساده) را به دو فرمت **باینری** و **هگزادسیمال** تبدیل و چاپ می‌کند.

### فایل‌های داخل مخزن:
- `baseconv.asm` — کد اسمبلی
- `Makefile` — برای ساخت و لینکش کردن
- `README.md` — همین فایل

### پیش‌نیازها
- `nasm` (برای اسمبل)
- `gcc` (برای لینک کردن و تولید باینری)

نصب در اوبونتو/دبیان:

```bash
sudo apt update
sudo apt install nasm gcc -y
```

### نحوه ساخت و اجرا

```bash
make
./baseconv
```

---

## Project: Number Base Converter (Decimal to Binary & Hex) — Assembly x86_64 (NASM)

This project is a simple assembly (NASM) program for Linux x86_64 that converts a decimal number (hardcoded or basic input) into **binary** and **hexadecimal** formats and prints them.

### Files included:
- `baseconv.asm` — assembly source code
- `Makefile` — build & link
- `README.md` — this file

### Requirements
- `nasm` (assembler)
- `gcc` (linker)

On Ubuntu/Debian:

```bash
sudo apt update
sudo apt install nasm gcc -y
```

### Build & Run

```bash
make
./baseconv
```