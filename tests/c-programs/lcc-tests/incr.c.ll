; ModuleID = './incr.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  ret i32 0
}

; Function Attrs: nounwind uwtable
define void @memchar() #0 {
  %x = alloca i8, align 1
  %p = alloca i8*, align 8
  %1 = load i8*, i8** %p, align 8
  %2 = getelementptr inbounds i8, i8* %1, i32 1
  store i8* %2, i8** %p, align 8
  %3 = load i8, i8* %1, align 1
  store i8 %3, i8* %x, align 1
  %4 = load i8*, i8** %p, align 8
  %5 = getelementptr inbounds i8, i8* %4, i32 1
  store i8* %5, i8** %p, align 8
  %6 = load i8, i8* %5, align 1
  store i8 %6, i8* %x, align 1
  %7 = load i8*, i8** %p, align 8
  %8 = getelementptr inbounds i8, i8* %7, i32 -1
  store i8* %8, i8** %p, align 8
  %9 = load i8, i8* %7, align 1
  store i8 %9, i8* %x, align 1
  %10 = load i8*, i8** %p, align 8
  %11 = getelementptr inbounds i8, i8* %10, i32 -1
  store i8* %11, i8** %p, align 8
  %12 = load i8, i8* %11, align 1
  store i8 %12, i8* %x, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define void @memint() #0 {
  %x = alloca i32, align 4
  %p = alloca i32*, align 8
  %1 = load i32*, i32** %p, align 8
  %2 = getelementptr inbounds i32, i32* %1, i32 1
  store i32* %2, i32** %p, align 8
  %3 = load i32, i32* %1, align 4
  store i32 %3, i32* %x, align 4
  %4 = load i32*, i32** %p, align 8
  %5 = getelementptr inbounds i32, i32* %4, i32 1
  store i32* %5, i32** %p, align 8
  %6 = load i32, i32* %5, align 4
  store i32 %6, i32* %x, align 4
  %7 = load i32*, i32** %p, align 8
  %8 = getelementptr inbounds i32, i32* %7, i32 -1
  store i32* %8, i32** %p, align 8
  %9 = load i32, i32* %7, align 4
  store i32 %9, i32* %x, align 4
  %10 = load i32*, i32** %p, align 8
  %11 = getelementptr inbounds i32, i32* %10, i32 -1
  store i32* %11, i32** %p, align 8
  %12 = load i32, i32* %11, align 4
  store i32 %12, i32* %x, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @regchar() #0 {
  %x = alloca i8, align 1
  %p = alloca i8*, align 8
  %1 = load i8*, i8** %p, align 8
  %2 = getelementptr inbounds i8, i8* %1, i32 1
  store i8* %2, i8** %p, align 8
  %3 = load i8, i8* %1, align 1
  store i8 %3, i8* %x, align 1
  %4 = load i8*, i8** %p, align 8
  %5 = getelementptr inbounds i8, i8* %4, i32 1
  store i8* %5, i8** %p, align 8
  %6 = load i8, i8* %5, align 1
  store i8 %6, i8* %x, align 1
  %7 = load i8*, i8** %p, align 8
  %8 = getelementptr inbounds i8, i8* %7, i32 -1
  store i8* %8, i8** %p, align 8
  %9 = load i8, i8* %7, align 1
  store i8 %9, i8* %x, align 1
  %10 = load i8*, i8** %p, align 8
  %11 = getelementptr inbounds i8, i8* %10, i32 -1
  store i8* %11, i8** %p, align 8
  %12 = load i8, i8* %11, align 1
  store i8 %12, i8* %x, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define void @regint() #0 {
  %x = alloca i32, align 4
  %p = alloca i32*, align 8
  %1 = load i32*, i32** %p, align 8
  %2 = getelementptr inbounds i32, i32* %1, i32 1
  store i32* %2, i32** %p, align 8
  %3 = load i32, i32* %1, align 4
  store i32 %3, i32* %x, align 4
  %4 = load i32*, i32** %p, align 8
  %5 = getelementptr inbounds i32, i32* %4, i32 1
  store i32* %5, i32** %p, align 8
  %6 = load i32, i32* %5, align 4
  store i32 %6, i32* %x, align 4
  %7 = load i32*, i32** %p, align 8
  %8 = getelementptr inbounds i32, i32* %7, i32 -1
  store i32* %8, i32** %p, align 8
  %9 = load i32, i32* %7, align 4
  store i32 %9, i32* %x, align 4
  %10 = load i32*, i32** %p, align 8
  %11 = getelementptr inbounds i32, i32* %10, i32 -1
  store i32* %11, i32** %p, align 8
  %12 = load i32, i32* %11, align 4
  store i32 %12, i32* %x, align 4
  ret void
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
