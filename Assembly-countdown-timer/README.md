# README.md

## پروژه: شمارنده زمان (Countdown Timer) — اسمبلی x86_64 (NASM)

این پروژه یک برنامهٔ ساده به زبان اسمبلی (NASM) برای لینوکس x86_64 است که از 10 تا 0 شمارش معکوس می‌کند و بین هر عدد یک ثانیه تأخیر دارد (با استفاده از تابع sleep از libc).

### فایل‌های داخل مخزن:
- `countdown.asm` — کد اسمبلی
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

ترمینال را باز کنید و در پوشه پروژه:

```bash
make
./countdown
```

### توضیحات فنی کوتاه
- برنامه از `sleep(1)` از libc برای تأخیر یک ثانیه استفاده می‌کند (با Convention فراخوانی تابع C در x86_64: آرگومان در `rdi`).
- برای چاپ از syscall مستقیم `write` استفاده شده است تا وابستگی به printf نداشته باشیم.
- کد برای معماری x86_64 و لینوکس نوشته شده است.

---

## Project: Countdown Timer — Assembly x86_64 (NASM)

This project is a simple program written in assembly (NASM) for Linux x86_64. It performs a countdown from 10 to 0, pausing one second between each number (using the `sleep` function from libc).

### Files included in this repository:
- `countdown.asm` — assembly code
- `Makefile` — for building and linking
- `README.md` — this file

### Requirements
- `nasm` (for assembling)
- `gcc` (for linking and producing the binary)

On Ubuntu/Debian you can install them via:

```bash
sudo apt update
sudo apt install nasm gcc -y
```

### Build and Run

Open a terminal in the project folder:

```bash
make
./countdown
```

### Technical Notes
- The program uses `sleep(1)` from libc to introduce a one-second delay (using the C calling convention in x86_64: argument in `rdi`).
- It prints using the `write` syscall directly, avoiding dependencies on `printf`.
- Code is written for x86_64 Linux.