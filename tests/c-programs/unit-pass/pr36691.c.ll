; ModuleID = './pr36691.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g_5 = common global i8 0, align 1

; Function Attrs: nounwind uwtable
define void @func_1() #0 {
  store i8 9, i8* @g_5, align 1
  br label %1

; <label>:1                                       ; preds = %6, %0
  %2 = load i8, i8* @g_5, align 1
  %3 = zext i8 %2 to i32
  %4 = icmp sge i32 %3, 4
  br i1 %4, label %5, label %11

; <label>:5                                       ; preds = %1
  br label %6

; <label>:6                                       ; preds = %5
  %7 = load i8, i8* @g_5, align 1
  %8 = zext i8 %7 to i32
  %9 = sub nsw i32 %8, 5
  %10 = trunc i32 %9 to i8
  store i8 %10, i8* @g_5, align 1
  br label %1

; <label>:11                                      ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @func_1()
  %2 = load i8, i8* @g_5, align 1
  %3 = zext i8 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
