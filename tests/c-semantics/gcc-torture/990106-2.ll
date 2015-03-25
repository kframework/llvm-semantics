; ModuleID = './990106-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @calc_mp(i32 %mod) #0 {
  %1 = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %mod, i32* %1, align 4
  store i32 -1, i32* %c, align 4
  %2 = load i32* %c, align 4
  %3 = load i32* %1, align 4
  %4 = udiv i32 %2, %3
  store i32 %4, i32* %a, align 4
  %5 = load i32* %a, align 4
  %6 = load i32* %1, align 4
  %7 = mul i32 %5, %6
  %8 = sub i32 0, %7
  store i32 %8, i32* %b, align 4
  %9 = load i32* %b, align 4
  %10 = load i32* %1, align 4
  %11 = icmp ugt i32 %9, %10
  br i1 %11, label %12, label %18

; <label>:12                                      ; preds = %0
  %13 = load i32* %a, align 4
  %14 = add i32 %13, 1
  store i32 %14, i32* %a, align 4
  %15 = load i32* %1, align 4
  %16 = load i32* %b, align 4
  %17 = sub i32 %16, %15
  store i32 %17, i32* %b, align 4
  br label %18

; <label>:18                                      ; preds = %12, %0
  %19 = load i32* %b, align 4
  ret i32 %19
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32 1234, i32* %x, align 4
  %4 = load i32* %x, align 4
  %5 = call i32 @calc_mp(i32 %4)
  store i32 %5, i32* %y, align 4
  %6 = load i32* %y, align 4
  %7 = icmp ne i32 %6, 680
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %11 = load i32* %1
  ret i32 %11
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
