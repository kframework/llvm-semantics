; ModuleID = './20010604-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @f(i32 %a, i32 %b, i32 %c, i1 zeroext %d, i1 zeroext %e, i1 zeroext %f, i8 signext %g) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  store i32 %c, i32* %3, align 4
  %8 = zext i1 %d to i8
  store i8 %8, i8* %4, align 1
  %9 = zext i1 %e to i8
  store i8 %9, i8* %5, align 1
  %10 = zext i1 %f to i8
  store i8 %10, i8* %6, align 1
  store i8 %g, i8* %7, align 1
  %11 = load i8* %7, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp ne i32 %12, 1
  br i1 %13, label %29, label %14

; <label>:14                                      ; preds = %0
  %15 = load i8* %4, align 1
  %16 = trunc i8 %15 to i1
  %17 = zext i1 %16 to i32
  %18 = icmp ne i32 %17, 1
  br i1 %18, label %29, label %19

; <label>:19                                      ; preds = %14
  %20 = load i8* %5, align 1
  %21 = trunc i8 %20 to i1
  %22 = zext i1 %21 to i32
  %23 = icmp ne i32 %22, 1
  br i1 %23, label %29, label %24

; <label>:24                                      ; preds = %19
  %25 = load i8* %6, align 1
  %26 = trunc i8 %25 to i1
  %27 = zext i1 %26 to i32
  %28 = icmp ne i32 %27, 1
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %24, %19, %14, %0
  call void @abort() #2
  unreachable

; <label>:30                                      ; preds = %24
  %31 = load i32* %1, align 4
  %32 = load i32* %2, align 4
  %33 = add nsw i32 %31, %32
  %34 = load i32* %3, align 4
  %35 = add nsw i32 %33, %34
  ret i32 %35
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @f(i32 1, i32 2, i32 -3, i1 zeroext true, i1 zeroext true, i1 zeroext true, i8 signext 1)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %7 = load i32* %1
  ret i32 %7
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
