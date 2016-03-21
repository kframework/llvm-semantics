; ModuleID = './pr28778.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @find(i32* %alistp) #0 {
  %1 = alloca i32*, align 8
  %blist = alloca i32*, align 8
  %list = alloca [32 x i32], align 16
  store i32* %alistp, i32** %1, align 8
  %2 = load i32*, i32** %1, align 8
  %3 = icmp ne i32* %2, null
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = load i32*, i32** %1, align 8
  store i32* %5, i32** %blist, align 8
  br label %9

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds [32 x i32], [32 x i32]* %list, i32 0, i64 3
  store i32 42, i32* %7, align 4
  %8 = getelementptr inbounds [32 x i32], [32 x i32]* %list, i32 0, i32 0
  store i32* %8, i32** %blist, align 8
  br label %9

; <label>:9                                       ; preds = %6, %4
  %10 = load i32*, i32** %blist, align 8
  %11 = bitcast i32* %10 to i64*
  call void @aglChoosePixelFormat(i64* %11)
  ret void
}

; Function Attrs: nounwind uwtable
define void @aglChoosePixelFormat(i64* %a) #0 {
  %1 = alloca i64*, align 8
  %b = alloca i32*, align 8
  store i64* %a, i64** %1, align 8
  %2 = load i64*, i64** %1, align 8
  %3 = bitcast i64* %2 to i32*
  store i32* %3, i32** %b, align 8
  %4 = load i32*, i32** %b, align 8
  %5 = getelementptr inbounds i32, i32* %4, i64 3
  %6 = load i32, i32* %5, align 4
  %7 = icmp ne i32 %6, 42
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @find(i32* null)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
