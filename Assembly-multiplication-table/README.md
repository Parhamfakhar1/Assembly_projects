# Assembly-multiplication-table
# README.md

## پروژه: چاپ جدول ضرب (Multiplication Table) — اسمبلی x86_64 (NASM)

این پروژه یک برنامهٔ ساده به زبان اسمبلی (NASM) برای لینوکس x86_64 است که جدول ضرب 1 تا 10 را چاپ می‌کند. هر سطر به شکل زیر چاپ می‌شود:

```
1 x 1 = 1
1 x 2 = 2
...
10 x 10 = 100
```

### فایل‌های داخل مخزن:
- `multtable.asm` — کد اسمبلی
- `Makefile` — برای ساخت و لینکش کردن
- `README.md` — همین فایل

### پیش‌نیازها
- `nasm` (برای اسمبل)
- `gcc` (برای لینک کردن و تولید باینری)

در اوبونتو/دبیان می‌توانید نصب کنید:

```bash
sudo apt update
sudo apt install nasm gcc -y
```

### نحوه ساخت و اجرا

در پوشهٔ پروژه:

```bash
make
./multtable
```

---

## Project: Multiplication Table — Assembly x86_64 (NASM)

This project is a simple assembly (NASM) program for Linux x86_64 that prints the multiplication table from 1 to 10. Each line looks like:

```
1 x 1 = 1
1 x 2 = 2
...
10 x 10 = 100
```

### Files in repository:
- `multtable.asm` — assembly source
- `Makefile` — build and link
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
./multtable
```
