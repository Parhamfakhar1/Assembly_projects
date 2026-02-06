# Assembly Projects Collection / مجموعه پروژه‌های اسمبلی  
**A curated collection of educational x86_64 Assembly (NASM) projects for Linux demonstrating core low-level programming concepts**  
**مجموعه‌ای آموزشی از پروژه‌های اسمبلی x86_64 (NASM) برای لینوکس که مفاهیم اساسی برنامه‌نویسی سطح پایین را به نمایش می‌گذارند**

---

## 📂 Project Directory / فهرست پروژه‌ها

### 🔢 [Assembly Base Converter](Assembly-base-converter)  
**English:** Converts decimal numbers to binary and hexadecimal representations using bitwise operations and manual digit extraction. Demonstrates number base conversion algorithms without standard library dependencies.  
**فارسی:** تبدیل اعداد ده‌دهی به نمایش‌های دودویی و هگزادسیمال با استفاده از عملیات بیتی و استخراج دستی ارقام. پیاده‌سازی الگوریتم تبدیل مبنا بدون وابستگی به کتابخانه‌های استاندارد را نمایش می‌دهد.

### ⏳ [Assembly Countdown Timer](Assembly-countdown-timer)  
**English:** Performs a countdown from 10 to 0 with one-second intervals using libc's `sleep()` function. Combines direct Linux syscalls (`write`) for output with C library integration, illustrating hybrid syscall/library approaches.  
**فارسی:** شمارش معکوس از ۱۰ تا ۰ با فواصل یک‌ثانیه‌ای با استفاده از تابع `sleep()` از libc. ترکیبی از فراخوانی‌های سیستمی مستقیم لینوکس (`write`) برای خروجی و ادغام کتابخانه C را نمایش می‌دهد و رویکرد ترکیبی syscall/کتابخانه را آموزش می‌دهد.

### ➗ [Assembly Factorial Calculator](Assembly-factorial-calculator)  
**English:** Calculates factorial values for integers 0–20 using iterative multiplication with 64-bit registers. Handles edge cases (0! = 1) and demonstrates arithmetic overflow boundaries in x86_64 architecture.  
**فارسی:** محاسبه فاکتوریل اعداد صحیح ۰ تا ۲۰ با ضرب تکراری در رجیسترهای ۶۴ بیتی. مدیریت حالات خاص (۰! = ۱) و نمایش مرزهای سرریز حسابی در معماری x86_64 را پیاده‌سازی می‌کند.

### 📊 [Assembly Multiplication Table](Assembly-multiplication-table)  
**English:** Generates and prints a complete 1–10 multiplication table with formatted output (`n x m = result`). Demonstrates nested loops, register manipulation, and decimal-to-ASCII conversion for numerical output.  
**فارسی:** تولید و چاپ جدول ضرب کامل ۱ تا ۱۰ با خروجی قالب‌بندی‌شده (`n x m = حاصل`). پیاده‌سازی حلقه‌های تودرتو، دستکاری رجیسترها و تبدیل ده‌دهی به ASCII برای نمایش اعداد را به نمایش می‌گذارد.

### 🔁 [Assembly String Reverser](Assembly-string-reverser)  
**English:** Reads strings from stdin (up to 128 bytes), reverses them in-place using pointer arithmetic, and handles newline characters intelligently. Showcases buffer management, memory addressing modes, and syscall-based I/O operations.  
**فارسی:** خواندن رشته از stdin (تا ۱۲۸ بایت)، معکوس‌سازی در محل با محاسبات اشاره‌گر، و مدیریت هوشمند کاراکتر newline. مدیریت بافر، حالت‌های آدرس‌دهی حافظه و عملیات ورودی/خروجی مبتنی بر syscall را نمایش می‌دهد.

---

## 🔧 Build & Execution / ساخت و اجرا  
**English:**  
All projects target **Linux x86_64 architecture** using **NASM syntax** with syscall-based I/O:  
1. Install dependencies:  
   ```bash
   sudo apt update && sudo apt install nasm gcc -y
   ```  
2. Navigate to any project directory:  
   ```bash
   cd Assembly-[project-name]
   ```  
3. Build with Makefile:  
   ```bash
   make
   ```  
4. Run the executable:  
   ```bash
   ./[executable-name]  # e.g., ./multtable, ./countdown
   ```  
*Note: Projects require a 64-bit Linux environment. Input/output uses standard stdin/stdout streams.*

**فارسی:**  
تمام پروژه‌ها برای **معماری x86_64 لینوکس** با سینتکس **NASM** و ورودی/خروجی مبتنی بر syscall طراحی شده‌اند:  
۱. نصب وابستگی‌ها:  
   ```bash
   sudo apt update && sudo apt install nasm gcc -y
   ```  
۲. انتقال به دایرکتوری هر پروژه:  
   ```bash
   cd Assembly-[project-name]
   ```  
۳. ساخت با Makefile:  
   ```bash
   make
   ```  
۴. اجرای فایل اجرایی:  
   ```bash
   ./[executable-name]  # مثال: ./multtable, ./countdown
   ```  
*نکته: پروژه‌ها به محیط ۶۴ بیتی لینوکس نیاز دارند. ورودی/خروجی از طریق جریان‌های استاندارد stdin/stdout انجام می‌شود.*

---

## 🌐 Repository Information / اطلاعات مخزن  
- **Main Repository**: [github.com/Parhamfakhar1/Assembly_projects](https://github.com/Parhamfakhar1/Assembly_projects)  
- **Architecture**: Linux x86_64 (System V ABI)  
- **Assembler**: NASM (Netwide Assembler)  
- **License**: [MIT License](LICENSE)  

---

## 💡 Educational Value / ارزش آموزشی  
These projects provide hands-on experience with:  
- Linux syscall interface (`read`, `write`, `exit`)  
- x86_64 register usage and calling conventions  
- Manual ASCII conversion and string manipulation  
- Algorithm implementation without high-level abstractions  
- Hybrid approaches (combining syscalls with libc functions)  

این پروژه‌ها تجربه عملی در موارد زیر ارائه می‌دهند:  
- رابط فراخوانی سیستم لینوکس (`read`, `write`, `exit`)  
- استفاده از رجیسترها و قراردادهای فراخوانی x86_64  
- تبدیل دستی ASCII و پردازش رشته‌ها  
- پیاده‌سازی الگوریتم‌ها بدون انتزاعات سطح بالا  
- رویکردهای ترکیبی (ترکیب syscall و توابع libc)  

---

> ✨ *"In Assembly, every instruction is a conversation with the machine — precise, intimate, and revealing."*  
> ✨ *"در اسمبلی، هر دستورالعمل گفت‌وگویی با ماشین است — دقیق، صمیمی و آشکارکننده."*  

⭐ Star this repository if you find these projects valuable for learning low-level programming!  
⭐ اگر این پروژه‌ها را برای یادگیری برنامه‌نویسی سطح پایین ارزشمند می‌دانید، مخزن را ستاره‌دار کنید!
