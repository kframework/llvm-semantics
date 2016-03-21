; ModuleID = './20000819-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = global [2 x i32] [i32 2, i32 0], align 4

; Function Attrs: nounwind uwtable
define void @foo(i32* %sp, i32 %cnt) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %p = alloca i32*, align 8
  %top = alloca i32*, align 8
  store i32* %sp, i32** %1, align 8
  store i32 %cnt, i32* %2, align 4
  %3 = load i32*, i32** %1, align 8
  store i32* %3, i32** %top, align 8
  %4 = load i32, i32* %2, align 4
  %5 = load i32*, i32** %1, align 8
  %6 = sext i32 %4 to i64
  %7 = sub i64 0, %6
  %8 = getelementptr inbounds i32, i32* %5, i64 %7
  store i32* %8, i32** %1, align 8
  %9 = load i32*, i32** %1, align 8
  store i32* %9, i32** %p, align 8
  br label %10

; <label>:10                                      ; preds = %20, %0
  %11 = load i32*, i32** %p, align 8
  %12 = load i32*, i32** %top, align 8
  %13 = icmp ule i32* %11, %12
  br i1 %13, label %14, label %23

; <label>:14                                      ; preds = %10
  %15 = load i32*, i32** %p, align 8
  %16 = load i32, i32* %15, align 4
  %17 = icmp slt i32 %16, 2
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %14
  call void @exit(i32 0) #2
  unreachable

; <label>:19                                      ; preds = %14
  br label %20

; <label>:20                                      ; preds = %19
  %21 = load i32*, i32** %p, align 8
  %22 = getelementptr inbounds i32, i32* %21, i32 1
  store i32* %22, i32** %p, align 8
  br label %10

; <label>:23                                      ; preds = %10
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @foo(i32* getelementptr inbounds ([2 x i32], [2 x i32]* @a, i32 0, i64 1), i32 1)
  call void @abort() #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
