; ModuleID = './930526-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @f(i32 7)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: inlinehint nounwind uwtable
define internal void @f(i32 %x) #1 {
  %1 = alloca i32, align 4
  %p = alloca [25 x i32*], align 16
  %m = alloca [175 x i32], align 16
  %i = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %15, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 25
  br i1 %4, label %5, label %18

; <label>:5                                       ; preds = %2
  %6 = getelementptr inbounds [175 x i32], [175 x i32]* %m, i32 0, i32 0
  %7 = load i32, i32* %1, align 4
  %8 = load i32, i32* %i, align 4
  %9 = mul nsw i32 %7, %8
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds i32, i32* %6, i64 %10
  %12 = load i32, i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [25 x i32*], [25 x i32*]* %p, i32 0, i64 %13
  store i32* %11, i32** %14, align 8
  br label %15

; <label>:15                                      ; preds = %5
  %16 = load i32, i32* %i, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %i, align 4
  br label %2

; <label>:18                                      ; preds = %2
  %19 = getelementptr inbounds [25 x i32*], [25 x i32*]* %p, i32 0, i64 1
  %20 = load i32*, i32** %19, align 8
  %21 = getelementptr inbounds i32, i32* %20, i64 0
  store i32 0, i32* %21, align 4
  ret void
}

; Function Attrs: noreturn
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
