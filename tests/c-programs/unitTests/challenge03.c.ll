; ModuleID = './challenge03.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.anon = type { [2 x %struct.s] }
%struct.s = type { [2 x i8] }

@u = global %union.anon { [2 x %struct.s] [%struct.s { [2 x i8] c"\01\02" }, %struct.s { [2 x i8] c"\03\04" }] }, align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %p = alloca i8*, align 8
  store i32 0, i32* %1
  store i8* getelementptr inbounds (%union.anon, %union.anon* @u, i32 0, i32 0, i32 0, i32 0, i32 0), i8** %p, align 8
  %2 = load i8*, i8** %p, align 8
  %3 = getelementptr inbounds i8, i8* %2, i64 0
  %4 = load i8, i8* %3, align 1
  %5 = sext i8 %4 to i32
  %6 = load i8*, i8** %p, align 8
  %7 = getelementptr inbounds i8, i8* %6, i64 1
  %8 = load i8, i8* %7, align 1
  %9 = sext i8 %8 to i32
  %10 = add nsw i32 %5, %9
  %11 = load i8*, i8** %p, align 8
  %12 = getelementptr inbounds i8, i8* %11, i64 2
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = add nsw i32 %10, %14
  %16 = load i8*, i8** %p, align 8
  %17 = getelementptr inbounds i8, i8* %16, i64 3
  %18 = load i8, i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = add nsw i32 %15, %19
  ret i32 %20
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
