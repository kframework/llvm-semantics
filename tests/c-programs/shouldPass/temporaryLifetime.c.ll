; ModuleID = './temporaryLifetime.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S = type { i32, [2 x i32] }

@s = global %struct.S { i32 1, [2 x i32] [i32 2, i32 3] }, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.S, align 4
  %3 = alloca { i64, i32 }, align 4
  %4 = alloca %struct.S, align 4
  %5 = alloca { i64, i32 }, align 4
  %6 = alloca %struct.S, align 4
  %7 = alloca { i64, i32 }, align 4
  %8 = alloca %struct.S, align 4
  %9 = alloca { i64, i32 }, align 4
  store i32 0, i32* %1
  %10 = call { i64, i32 } @f()
  store { i64, i32 } %10, { i64, i32 }* %3, align 4
  %11 = bitcast { i64, i32 }* %3 to i8*
  %12 = bitcast %struct.S* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %11, i64 12, i32 4, i1 false)
  %13 = getelementptr inbounds %struct.S, %struct.S* %2, i32 0, i32 0
  %14 = load i32, i32* %13, align 4
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %14)
  %16 = call { i64, i32 } @f()
  store { i64, i32 } %16, { i64, i32 }* %5, align 4
  %17 = bitcast { i64, i32 }* %5 to i8*
  %18 = bitcast %struct.S* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %17, i64 12, i32 4, i1 false)
  %19 = getelementptr inbounds %struct.S, %struct.S* %4, i32 0, i32 1
  %20 = getelementptr inbounds [2 x i32], [2 x i32]* %19, i32 0, i64 0
  %21 = load i32, i32* %20, align 4
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %21)
  %23 = call { i64, i32 } @f()
  store { i64, i32 } %23, { i64, i32 }* %7, align 4
  %24 = bitcast { i64, i32 }* %7 to i8*
  %25 = bitcast %struct.S* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %25, i8* %24, i64 12, i32 4, i1 false)
  %26 = getelementptr inbounds %struct.S, %struct.S* %6, i32 0, i32 1
  %27 = getelementptr inbounds [2 x i32], [2 x i32]* %26, i32 0, i32 0
  %28 = getelementptr inbounds i32, i32* %27, i64 0
  %29 = load i32, i32* %28, align 4
  %30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %29)
  %31 = call { i64, i32 } @f()
  store { i64, i32 } %31, { i64, i32 }* %9, align 4
  %32 = bitcast { i64, i32 }* %9 to i8*
  %33 = bitcast %struct.S* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %33, i8* %32, i64 12, i32 4, i1 false)
  %34 = getelementptr inbounds %struct.S, %struct.S* %8, i32 0, i32 1
  %35 = getelementptr inbounds [2 x i32], [2 x i32]* %34, i32 0, i32 0
  %36 = load i32, i32* %35, align 4
  %37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %36)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define internal { i64, i32 } @f() #0 {
  %1 = alloca %struct.S, align 4
  %2 = alloca { i64, i32 }, align 4
  %3 = bitcast %struct.S* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast (%struct.S* @s to i8*), i64 12, i32 4, i1 false)
  %4 = bitcast { i64, i32 }* %2 to i8*
  %5 = bitcast %struct.S* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 12, i32 4, i1 false)
  %6 = load { i64, i32 }, { i64, i32 }* %2, align 4
  ret { i64, i32 } %6
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
