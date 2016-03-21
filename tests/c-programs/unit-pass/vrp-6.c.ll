; ModuleID = './vrp-6.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @test01(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = icmp ult i32 %3, 5
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  %7 = load i32, i32* %2, align 4
  %8 = icmp ult i32 %7, 5
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %6
  call void @abort() #2
  unreachable

; <label>:10                                      ; preds = %6
  %11 = load i32, i32* %1, align 4
  %12 = load i32, i32* %2, align 4
  %13 = sub i32 %11, %12
  %14 = icmp ne i32 %13, 5
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %10
  call void @abort() #2
  unreachable

; <label>:16                                      ; preds = %10
  ret void
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @test02(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = icmp uge i32 %3, 12
  br i1 %4, label %5, label %16

; <label>:5                                       ; preds = %0
  %6 = load i32, i32* %2, align 4
  %7 = icmp ugt i32 %6, 15
  br i1 %7, label %8, label %15

; <label>:8                                       ; preds = %5
  %9 = load i32, i32* %1, align 4
  %10 = load i32, i32* %2, align 4
  %11 = sub i32 %9, %10
  %12 = icmp ult i32 %11, -16
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %8
  call void @abort() #2
  unreachable

; <label>:14                                      ; preds = %8
  br label %15

; <label>:15                                      ; preds = %14, %5
  br label %16

; <label>:16                                      ; preds = %15, %0
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %x = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32 -2147483648, i32* %x, align 4
  %4 = load i32, i32* %x, align 4
  %5 = add i32 %4, 5
  %6 = load i32, i32* %x, align 4
  call void @test01(i32 %5, i32 %6)
  call void @test02(i32 14, i32 16)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %8 = load i32, i32* %1
  ret i32 %8
}

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
