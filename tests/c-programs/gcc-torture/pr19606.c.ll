; ModuleID = './pr19606.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = global i8 -4, align 1

; Function Attrs: nounwind uwtable
define i32 @foo() #0 {
  %1 = load i8, i8* @a, align 1
  %2 = sext i8 %1 to i32
  %3 = zext i32 %2 to i64
  %4 = sdiv i64 %3, 2
  %5 = trunc i64 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @bar() #0 {
  %1 = load i8, i8* @a, align 1
  %2 = sext i8 %1 to i32
  %3 = zext i32 %2 to i64
  %4 = srem i64 %3, 5
  %5 = trunc i64 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo()
  store i32 %2, i32* %r, align 4
  %3 = load i32, i32* %r, align 4
  %4 = sext i32 %3 to i64
  %5 = icmp ne i64 %4, 2147483646
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:7                                       ; preds = %0
  %8 = call i32 @bar()
  store i32 %8, i32* %r, align 4
  %9 = load i32, i32* %r, align 4
  %10 = sext i32 %9 to i64
  %11 = icmp ne i64 %10, 2
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %7
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %7
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %15 = load i32, i32* %1
  ret i32 %15
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
