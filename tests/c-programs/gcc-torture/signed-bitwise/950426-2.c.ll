; ModuleID = './950426-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i64, align 8
  %ca = alloca i8, align 1
  store i32 0, i32* %1
  store i64 -2147483648, i64* %i, align 8
  store i8 1, i8* %ca, align 1
  %2 = load i64, i64* %i, align 8
  %3 = load i8, i8* %ca, align 1
  %4 = sext i8 %3 to i32
  %5 = zext i32 %4 to i64
  %6 = ashr i64 %2, %5
  %7 = icmp ne i64 %6, -1073741824
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %0
  %10 = load i64, i64* %i, align 8
  %11 = load i64, i64* %i, align 8
  %12 = sdiv i64 %11, -2000000000
  %13 = ashr i64 %10, %12
  %14 = icmp ne i64 %13, -1073741824
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %9
  call void @abort() #2
  unreachable

; <label>:16                                      ; preds = %9
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %18 = load i32, i32* %1
  ret i32 %18
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
