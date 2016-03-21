; ModuleID = './pr42721.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = internal global i32 0, align 4
@b = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %c = alloca i64, align 8
  store i32 0, i32* %1
  store i64 1, i64* %c, align 8
  %2 = load i64, i64* %c, align 8
  %3 = icmp ne i64 %2, 0
  br i1 %3, label %4, label %9

; <label>:4                                       ; preds = %0
  %5 = load i32, i32* @a, align 4
  %6 = sext i32 %5 to i64
  %7 = call i64 @foo(i64 %6, i64 -1)
  %8 = icmp ne i64 %7, 1
  br label %9

; <label>:9                                       ; preds = %4, %0
  %10 = phi i1 [ false, %0 ], [ %8, %4 ]
  %11 = zext i1 %10 to i32
  %12 = load i32, i32* @b, align 4
  %13 = xor i32 %12, %11
  store i32 %13, i32* @b, align 4
  %14 = load i32, i32* @b, align 4
  %15 = icmp ne i32 %14, 1
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %9
  call void @abort() #2
  unreachable

; <label>:17                                      ; preds = %9
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal i64 @foo(i64 %x, i64 %y) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %x, i64* %1, align 8
  store i64 %y, i64* %2, align 8
  %3 = load i64, i64* %1, align 8
  %4 = load i64, i64* %2, align 8
  %5 = udiv i64 %3, %4
  ret i64 %5
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
