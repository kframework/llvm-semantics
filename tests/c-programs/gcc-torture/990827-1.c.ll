; ModuleID = './990827-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @test(i32 %one, i32 %bit) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %val = alloca i32, align 4
  %zero = alloca i32, align 4
  store i32 %one, i32* %1, align 4
  store i32 %bit, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = and i32 %3, 1
  store i32 %4, i32* %val, align 4
  %5 = load i32, i32* %1, align 4
  %6 = lshr i32 %5, 1
  store i32 %6, i32* %zero, align 4
  %7 = load i32, i32* %val, align 4
  %8 = add i32 %7, 1
  store i32 %8, i32* %val, align 4
  %9 = load i32, i32* %zero, align 4
  %10 = load i32, i32* %val, align 4
  %11 = lshr i32 %10, 1
  %12 = add i32 %9, %11
  ret i32 %12
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @test(i32 1, i32 0)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  %6 = call i32 @test(i32 1, i32 1)
  %7 = icmp ne i32 %6, 1
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %5
  %10 = call i32 @test(i32 1, i32 65535)
  %11 = icmp ne i32 %10, 1
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %9
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
