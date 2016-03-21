; ModuleID = './990513-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @foo(i32* %BM_tab, i32 %j) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %BM_tab_base = alloca i32*, align 8
  store i32* %BM_tab, i32** %1, align 8
  store i32 %j, i32* %2, align 4
  %3 = load i32*, i32** %1, align 8
  store i32* %3, i32** %BM_tab_base, align 8
  %4 = load i32*, i32** %1, align 8
  %5 = getelementptr inbounds i32, i32* %4, i64 256
  store i32* %5, i32** %1, align 8
  br label %6

; <label>:6                                       ; preds = %10, %0
  %7 = load i32*, i32** %BM_tab_base, align 8
  %8 = load i32*, i32** %1, align 8
  %9 = icmp ne i32* %7, %8
  br i1 %9, label %10, label %23

; <label>:10                                      ; preds = %6
  %11 = load i32, i32* %2, align 4
  %12 = load i32*, i32** %1, align 8
  %13 = getelementptr inbounds i32, i32* %12, i32 -1
  store i32* %13, i32** %1, align 8
  store i32 %11, i32* %13, align 4
  %14 = load i32, i32* %2, align 4
  %15 = load i32*, i32** %1, align 8
  %16 = getelementptr inbounds i32, i32* %15, i32 -1
  store i32* %16, i32** %1, align 8
  store i32 %14, i32* %16, align 4
  %17 = load i32, i32* %2, align 4
  %18 = load i32*, i32** %1, align 8
  %19 = getelementptr inbounds i32, i32* %18, i32 -1
  store i32* %19, i32** %1, align 8
  store i32 %17, i32* %19, align 4
  %20 = load i32, i32* %2, align 4
  %21 = load i32*, i32** %1, align 8
  %22 = getelementptr inbounds i32, i32* %21, i32 -1
  store i32* %22, i32** %1, align 8
  store i32 %20, i32* %22, align 4
  br label %6

; <label>:23                                      ; preds = %6
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %BM_tab = alloca [256 x i32], align 16
  store i32 0, i32* %1
  %2 = bitcast [256 x i32]* %BM_tab to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 1024, i32 16, i1 false)
  %3 = getelementptr inbounds [256 x i32], [256 x i32]* %BM_tab, i32 0, i32 0
  call void @foo(i32* %3, i32 6)
  %4 = getelementptr inbounds [256 x i32], [256 x i32]* %BM_tab, i32 0, i64 0
  %5 = load i32, i32* %4, align 4
  %6 = icmp ne i32 %5, 6
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:8                                       ; preds = %0
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: noreturn
declare void @abort() #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
