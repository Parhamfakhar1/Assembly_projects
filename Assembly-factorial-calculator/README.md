# Assembly-factorial-calculator
# README.md

## پروژه: محاسبه فاکتوریل (Factorial Calculator) — اسمبلی x86_64 (NASM)

این پروژه یک برنامهٔ سادهٔ خط فرمانی در اسمبلی (NASM) برای لینوکس x86_64 است که فاکتوریل یک عدد صحیح مثبت (ثابت یا ورودی ساده) را محاسبه و چاپ می‌کند.

ویژگی‌ها:
- محاسبه فاکتوریل اعداد 0 تا 20 (تا overflow عدد 64 بیتی)
- نمایش عدد ورودی و فاکتوریل
- استفاده از syscalls برای چاپ و خروجی

### فایل‌های داخل مخزن:
- `factorial.asm` — کد اسمبلی
- `Makefile` — برای ساخت و لینک کردن
- `README.md` — همین فایل دوزبانه

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
./factorial
```

---

## Project: Factorial Calculator — Assembly x86_64 (NASM)

This is a simple command-line NASM program for Linux x86_64 that calculates the factorial of a positive integer (hardcoded or simple input) and prints it.

Features:
- Calculates factorial for numbers 0 to 20 (up to 64-bit overflow)
- Displays input number and factorial
- Uses syscalls for printing and exit

### Files included:
- `factorial.asm` — assembly source
- `Makefile` — build & link
- `README.md` — bilingual README

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
./factorial
```