; ModuleID = './20080408-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %ssi = alloca i16, align 2
  %usi = alloca i16, align 2
  %fail = alloca i32, align 4
  store i32 0, i32* %1
  store i16 126, i16* %ssi, align 2
  store i16 -256, i16* %usi, align 2
  %2 = load i16, i16* %ssi, align 2
  %3 = sext i16 %2 to i32
  %4 = load i16, i16* %usi, align 2
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  %7 = xor i1 %6, true
  %8 = zext i1 %7 to i32
  store i32 %8, i32* %fail, align 4
  %9 = load i32, i32* %fail, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:12                                      ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
