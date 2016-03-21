; ModuleID = './decls.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = global i32* null, align 8
@b = global i32 (i32*)* null, align 8
@c = global [5 x i32 (i32*)*] zeroinitializer, align 16
@d = global [5 x i32 (i32 (...)*)*] zeroinitializer, align 16
@e = global [5 x i32 (i32)* ([5 x i32]*)*] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define [0 x [5 x i8]*]* @f() #0 {
  ret [0 x [5 x i8]*]* null
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca [5 x i32 (i32)* ([5 x i32]*)*], align 16
  %tmp = alloca [0 x [5 x i8]*]*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds [5 x i32 (i32)* ([5 x i32]*)*], [5 x i32 (i32)* ([5 x i32]*)*]* %x, i32 0, i64 0
  store i32 (i32)* ([5 x i32]*)* null, i32 (i32)* ([5 x i32]*)** %2, align 8
  %3 = getelementptr inbounds [5 x i32 (i32)* ([5 x i32]*)*], [5 x i32 (i32)* ([5 x i32]*)*]* %x, i32 0, i64 1
  store i32 (i32)* ([5 x i32]*)* null, i32 (i32)* ([5 x i32]*)** %3, align 8
  %4 = getelementptr inbounds [5 x i32 (i32)* ([5 x i32]*)*], [5 x i32 (i32)* ([5 x i32]*)*]* %x, i32 0, i64 2
  store i32 (i32)* ([5 x i32]*)* null, i32 (i32)* ([5 x i32]*)** %4, align 8
  %5 = getelementptr inbounds [5 x i32 (i32)* ([5 x i32]*)*], [5 x i32 (i32)* ([5 x i32]*)*]* %x, i32 0, i64 3
  store i32 (i32)* ([5 x i32]*)* null, i32 (i32)* ([5 x i32]*)** %5, align 8
  %6 = getelementptr inbounds [5 x i32 (i32)* ([5 x i32]*)*], [5 x i32 (i32)* ([5 x i32]*)*]* %x, i32 0, i64 4
  store i32 (i32)* ([5 x i32]*)* null, i32 (i32)* ([5 x i32]*)** %6, align 8
  %7 = call [0 x [5 x i8]*]* @f()
  store [0 x [5 x i8]*]* %7, [0 x [5 x i8]*]** %tmp, align 8
  %8 = load [0 x [5 x i8]*]*, [0 x [5 x i8]*]** %tmp, align 8
  %9 = ptrtoint [0 x [5 x i8]*]* %8 to i32
  store i32 %9, i32* %a, align 4
  %10 = getelementptr inbounds [5 x i32 (i32)* ([5 x i32]*)*], [5 x i32 (i32)* ([5 x i32]*)*]* %x, i32 0, i64 4
  %11 = load i32 (i32)* ([5 x i32]*)*, i32 (i32)* ([5 x i32]*)** %10, align 8
  %12 = ptrtoint i32 (i32)* ([5 x i32]*)* %11 to i32
  store i32 %12, i32* %b, align 4
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
