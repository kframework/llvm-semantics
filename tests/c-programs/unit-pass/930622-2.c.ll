; ModuleID = './930622-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define x86_fp80 @ll_to_ld(i64 %n) #0 {
  %1 = alloca i64, align 8
  store i64 %n, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = sitofp i64 %2 to x86_fp80
  ret x86_fp80 %3
}

; Function Attrs: nounwind uwtable
define i64 @ld_to_ll(x86_fp80 %n) #0 {
  %1 = alloca x86_fp80, align 16
  store x86_fp80 %n, x86_fp80* %1, align 16
  %2 = load x86_fp80, x86_fp80* %1, align 16
  %3 = fptosi x86_fp80 %2 to i64
  ret i64 %3
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %n = alloca i64, align 8
  store i32 0, i32* %1
  %2 = call x86_fp80 @ll_to_ld(i64 10)
  %3 = fcmp une x86_fp80 %2, 0xK4002A000000000000000
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  %6 = call i64 @ld_to_ll(x86_fp80 0xK4002A000000000000000)
  %7 = icmp ne i64 %6, 10
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %5
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %11 = load i32, i32* %1
  ret i32 %11
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
