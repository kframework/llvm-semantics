; ModuleID = './divides.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.SV = type { <4 x i32> }
%union.UV = type { <4 x i32> }

@.str = private unnamed_addr constant [22 x i8] c"U3.V = <%u %u %u %u>\0A\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"S3.V = <%u %u %u %u>\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @testuvec(<4 x i32>* %A, <4 x i32>* %B, <4 x i32>* %R) #0 {
  %1 = alloca <4 x i32>*, align 8
  %2 = alloca <4 x i32>*, align 8
  %3 = alloca <4 x i32>*, align 8
  store <4 x i32>* %A, <4 x i32>** %1, align 8
  store <4 x i32>* %B, <4 x i32>** %2, align 8
  store <4 x i32>* %R, <4 x i32>** %3, align 8
  %4 = load <4 x i32>*, <4 x i32>** %1, align 8
  %5 = load <4 x i32>, <4 x i32>* %4, align 16
  %6 = load <4 x i32>*, <4 x i32>** %2, align 8
  %7 = load <4 x i32>, <4 x i32>* %6, align 16
  %8 = udiv <4 x i32> %5, %7
  %9 = load <4 x i32>*, <4 x i32>** %3, align 8
  store <4 x i32> %8, <4 x i32>* %9, align 16
  ret void
}

; Function Attrs: nounwind uwtable
define void @testsvec(<4 x i32>* %A, <4 x i32>* %B, <4 x i32>* %R) #0 {
  %1 = alloca <4 x i32>*, align 8
  %2 = alloca <4 x i32>*, align 8
  %3 = alloca <4 x i32>*, align 8
  store <4 x i32>* %A, <4 x i32>** %1, align 8
  store <4 x i32>* %B, <4 x i32>** %2, align 8
  store <4 x i32>* %R, <4 x i32>** %3, align 8
  %4 = load <4 x i32>*, <4 x i32>** %1, align 8
  %5 = load <4 x i32>, <4 x i32>* %4, align 16
  %6 = load <4 x i32>*, <4 x i32>** %2, align 8
  %7 = load <4 x i32>, <4 x i32>* %6, align 16
  %8 = sdiv <4 x i32> %5, %7
  %9 = load <4 x i32>*, <4 x i32>** %3, align 8
  store <4 x i32> %8, <4 x i32>* %9, align 16
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %S1 = alloca %union.SV, align 16
  %S2 = alloca %union.SV, align 16
  %S3 = alloca %union.SV, align 16
  %U1 = alloca %union.UV, align 16
  %U2 = alloca %union.UV, align 16
  %U3 = alloca %union.UV, align 16
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = bitcast %union.SV* %S2 to [4 x i32]*
  %5 = getelementptr inbounds [4 x i32], [4 x i32]* %4, i32 0, i64 0
  store i32 2, i32* %5, align 4
  %6 = bitcast %union.SV* %S1 to [4 x i32]*
  %7 = getelementptr inbounds [4 x i32], [4 x i32]* %6, i32 0, i64 0
  store i32 2, i32* %7, align 4
  %8 = bitcast %union.SV* %S2 to [4 x i32]*
  %9 = getelementptr inbounds [4 x i32], [4 x i32]* %8, i32 0, i64 1
  store i32 -3, i32* %9, align 4
  %10 = bitcast %union.SV* %S1 to [4 x i32]*
  %11 = getelementptr inbounds [4 x i32], [4 x i32]* %10, i32 0, i64 1
  store i32 -3, i32* %11, align 4
  %12 = bitcast %union.SV* %S2 to [4 x i32]*
  %13 = getelementptr inbounds [4 x i32], [4 x i32]* %12, i32 0, i64 2
  store i32 5, i32* %13, align 4
  %14 = bitcast %union.SV* %S1 to [4 x i32]*
  %15 = getelementptr inbounds [4 x i32], [4 x i32]* %14, i32 0, i64 2
  store i32 5, i32* %15, align 4
  %16 = bitcast %union.SV* %S2 to [4 x i32]*
  %17 = getelementptr inbounds [4 x i32], [4 x i32]* %16, i32 0, i64 3
  store i32 -8, i32* %17, align 4
  %18 = bitcast %union.SV* %S1 to [4 x i32]*
  %19 = getelementptr inbounds [4 x i32], [4 x i32]* %18, i32 0, i64 3
  store i32 -8, i32* %19, align 4
  %20 = bitcast %union.UV* %U2 to [4 x i32]*
  %21 = getelementptr inbounds [4 x i32], [4 x i32]* %20, i32 0, i64 0
  store i32 2, i32* %21, align 4
  %22 = bitcast %union.UV* %U1 to [4 x i32]*
  %23 = getelementptr inbounds [4 x i32], [4 x i32]* %22, i32 0, i64 0
  store i32 2, i32* %23, align 4
  %24 = bitcast %union.UV* %U2 to [4 x i32]*
  %25 = getelementptr inbounds [4 x i32], [4 x i32]* %24, i32 0, i64 1
  store i32 3, i32* %25, align 4
  %26 = bitcast %union.UV* %U1 to [4 x i32]*
  %27 = getelementptr inbounds [4 x i32], [4 x i32]* %26, i32 0, i64 1
  store i32 3, i32* %27, align 4
  %28 = bitcast %union.UV* %U2 to [4 x i32]*
  %29 = getelementptr inbounds [4 x i32], [4 x i32]* %28, i32 0, i64 2
  store i32 5, i32* %29, align 4
  %30 = bitcast %union.UV* %U1 to [4 x i32]*
  %31 = getelementptr inbounds [4 x i32], [4 x i32]* %30, i32 0, i64 2
  store i32 5, i32* %31, align 4
  %32 = bitcast %union.UV* %U2 to [4 x i32]*
  %33 = getelementptr inbounds [4 x i32], [4 x i32]* %32, i32 0, i64 3
  store i32 8, i32* %33, align 4
  %34 = bitcast %union.UV* %U1 to [4 x i32]*
  %35 = getelementptr inbounds [4 x i32], [4 x i32]* %34, i32 0, i64 3
  store i32 8, i32* %35, align 4
  %36 = bitcast %union.UV* %U1 to <4 x i32>*
  %37 = bitcast %union.UV* %U2 to <4 x i32>*
  %38 = bitcast %union.UV* %U3 to <4 x i32>*
  call void @testuvec(<4 x i32>* %36, <4 x i32>* %37, <4 x i32>* %38)
  %39 = bitcast %union.SV* %S1 to <4 x i32>*
  %40 = bitcast %union.SV* %S2 to <4 x i32>*
  %41 = bitcast %union.SV* %S3 to <4 x i32>*
  call void @testsvec(<4 x i32>* %39, <4 x i32>* %40, <4 x i32>* %41)
  %42 = bitcast %union.UV* %U3 to [4 x i32]*
  %43 = getelementptr inbounds [4 x i32], [4 x i32]* %42, i32 0, i64 0
  %44 = load i32, i32* %43, align 4
  %45 = bitcast %union.UV* %U3 to [4 x i32]*
  %46 = getelementptr inbounds [4 x i32], [4 x i32]* %45, i32 0, i64 1
  %47 = load i32, i32* %46, align 4
  %48 = bitcast %union.UV* %U3 to [4 x i32]*
  %49 = getelementptr inbounds [4 x i32], [4 x i32]* %48, i32 0, i64 2
  %50 = load i32, i32* %49, align 4
  %51 = bitcast %union.UV* %U3 to [4 x i32]*
  %52 = getelementptr inbounds [4 x i32], [4 x i32]* %51, i32 0, i64 3
  %53 = load i32, i32* %52, align 4
  %54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i32 0, i32 0), i32 %44, i32 %47, i32 %50, i32 %53)
  %55 = bitcast %union.SV* %S3 to [4 x i32]*
  %56 = getelementptr inbounds [4 x i32], [4 x i32]* %55, i32 0, i64 0
  %57 = load i32, i32* %56, align 4
  %58 = bitcast %union.SV* %S3 to [4 x i32]*
  %59 = getelementptr inbounds [4 x i32], [4 x i32]* %58, i32 0, i64 1
  %60 = load i32, i32* %59, align 4
  %61 = bitcast %union.SV* %S3 to [4 x i32]*
  %62 = getelementptr inbounds [4 x i32], [4 x i32]* %61, i32 0, i64 2
  %63 = load i32, i32* %62, align 4
  %64 = bitcast %union.SV* %S3 to [4 x i32]*
  %65 = getelementptr inbounds [4 x i32], [4 x i32]* %64, i32 0, i64 3
  %66 = load i32, i32* %65, align 4
  %67 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 %57, i32 %60, i32 %63, i32 %66)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
