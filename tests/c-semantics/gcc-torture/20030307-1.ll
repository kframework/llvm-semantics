; ModuleID = './20030307-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @vfswrap_lock(i8* %fsp, i32 %fd, i32 %op, i64 %offset, i64 %count, i32 %type) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  store i8* %fsp, i8** %1, align 8
  store i32 %fd, i32* %2, align 4
  store i32 %op, i32* %3, align 4
  store i64 %offset, i64* %4, align 8
  store i64 %count, i64* %5, align 8
  store i32 %type, i32* %6, align 4
  %7 = load i32* %2, align 4
  %8 = load i32* %3, align 4
  %9 = load i64* %4, align 8
  %10 = load i64* %5, align 8
  %11 = load i32* %6, align 4
  %12 = call i32 @fcntl_lock(i32 %7, i32 %8, i64 %9, i64 %10, i32 %11)
  ret i32 %12
}

; Function Attrs: nounwind uwtable
define i32 @fcntl_lock(i32 %fd, i32 %op, i64 %offset, i64 %count, i32 %type) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  store i32 %fd, i32* %1, align 4
  store i32 %op, i32* %2, align 4
  store i64 %offset, i64* %3, align 8
  store i64 %count, i64* %4, align 8
  store i32 %type, i32* %5, align 4
  %6 = load i32* %5, align 4
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @vfswrap_lock(i8* null, i32 1, i32 2, i64 3, i64 4, i32 5)
  %3 = icmp ne i32 %2, 5
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
