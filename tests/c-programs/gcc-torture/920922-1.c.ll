; ModuleID = './920922-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i64* @f(i64* %p) #0 {
  %1 = alloca i64*, align 8
  %a = alloca i64, align 8
  store i64* %p, i64** %1, align 8
  %2 = load i64*, i64** %1, align 8
  %3 = getelementptr inbounds i64, i64* %2, i32 1
  store i64* %3, i64** %1, align 8
  %4 = load i64, i64* %2, align 8
  %5 = lshr i64 %4, 24
  store i64 %5, i64* %a, align 8
  %6 = load i64*, i64** %1, align 8
  %7 = load i64, i64* %a, align 8
  %8 = getelementptr inbounds i64, i64* %6, i64 %7
  ret i64* %8
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i64, align 8
  store i32 0, i32* %1
  store i64 2147483648, i64* %x, align 8
  %2 = call i64* @f(i64* %x)
  %3 = getelementptr inbounds i64, i64* %x, i64 129
  %4 = icmp ne i64* %2, %3
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %8 = load i32, i32* %1
  ret i32 %8
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
