; ModuleID = './950929-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @f(i8* %p) #0 {
  %1 = alloca i8*, align 8
  store i8* %p, i8** %1, align 8
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %c = alloca i8, align 1
  %c2 = alloca i8, align 1
  %i = alloca i32, align 4
  %pc = alloca i8*, align 8
  %pc2 = alloca i8*, align 8
  %pi = alloca i32*, align 8
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  store i8* %c, i8** %pc, align 8
  store i8* %c2, i8** %pc2, align 8
  store i32* %i, i32** %pi, align 8
  %2 = load i8*, i8** %pc2, align 8
  store i8 1, i8* %2, align 1
  %3 = load i32*, i32** %pi, align 8
  store i32 1, i32* %3, align 4
  %4 = load i32*, i32** %pi, align 8
  %5 = load i32, i32* %4, align 4
  %6 = load i8*, i8** %pc2, align 8
  %7 = load i8, i8* %6, align 1
  %8 = sext i8 %7 to i32
  %9 = and i32 %8, %5
  %10 = trunc i32 %9 to i8
  store i8 %10, i8* %6, align 1
  %11 = load i8*, i8** %pc2, align 8
  %12 = call i32 @f(i8* %11)
  %13 = load i8*, i8** %pc2, align 8
  store i8 1, i8* %13, align 1
  %14 = load i32*, i32** %pi, align 8
  %15 = load i32, i32* %14, align 4
  %16 = load i8*, i8** %pc2, align 8
  %17 = load i8, i8* %16, align 1
  %18 = sext i8 %17 to i32
  %19 = and i32 %18, %15
  %20 = trunc i32 %19 to i8
  store i8 %20, i8* %16, align 1
  %21 = load i8*, i8** %pc2, align 8
  %22 = load i8, i8* %21, align 1
  %23 = sext i8 %22 to i32
  %24 = icmp ne i32 %23, 1
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:26                                      ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %28 = load i32, i32* %1
  ret i32 %28
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
