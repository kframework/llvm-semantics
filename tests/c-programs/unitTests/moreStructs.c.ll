; ModuleID = './moreStructs.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.B = type { i32, i32 }
%struct.A = type { i32, %struct.B }

@.str = private unnamed_addr constant [12 x i8] c"in main():\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@f.b = private unnamed_addr constant %struct.B { i32 0, i32 1 }, align 4
@.str.2 = private unnamed_addr constant [9 x i8] c"in f():\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"b.x = %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"b.y = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.A, align 4
  %2 = alloca { i64, i32 }, align 4
  %test1 = alloca i32, align 4
  %test2 = alloca i32, align 4
  %test3 = alloca i32, align 4
  store i32 0, i32* %1
  %3 = call { i64, i32 } @f()
  store { i64, i32 } %3, { i64, i32 }* %2, align 4
  %4 = bitcast { i64, i32 }* %2 to i8*
  %5 = bitcast %struct.A* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %4, i64 12, i32 4, i1 false)
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0))
  %7 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 0
  %8 = load i32, i32* %7, align 4
  store i32 %8, i32* %test1, align 4
  %9 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 1
  %10 = getelementptr inbounds %struct.B, %struct.B* %9, i32 0, i32 0
  %11 = load i32, i32* %10, align 4
  store i32 %11, i32* %test2, align 4
  %12 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 1
  %13 = getelementptr inbounds %struct.B, %struct.B* %12, i32 0, i32 1
  %14 = load i32, i32* %13, align 4
  store i32 %14, i32* %test3, align 4
  %15 = load i32, i32* %test1, align 4
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %15)
  %17 = load i32, i32* %test2, align 4
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %17)
  %19 = load i32, i32* %test3, align 4
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %19)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define internal { i64, i32 } @f() #0 {
  %1 = alloca %struct.A, align 4
  %b = alloca %struct.B, align 4
  %a = alloca %struct.A, align 4
  %test1 = alloca i32, align 4
  %test2 = alloca i32, align 4
  %test3 = alloca i32, align 4
  %2 = alloca { i64, i32 }, align 4
  %3 = bitcast %struct.B* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast (%struct.B* @f.b to i8*), i64 8, i32 4, i1 false)
  %4 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 0
  store i32 2, i32* %4, align 4
  %5 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 1
  %6 = bitcast %struct.B* %5 to i8*
  %7 = bitcast %struct.B* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 8, i32 4, i1 false)
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0))
  %9 = getelementptr inbounds %struct.B, %struct.B* %b, i32 0, i32 0
  %10 = load i32, i32* %9, align 4
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i32 0, i32 0), i32 %10)
  %12 = getelementptr inbounds %struct.B, %struct.B* %b, i32 0, i32 1
  %13 = load i32, i32* %12, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0), i32 %13)
  %15 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 0
  %16 = load i32, i32* %15, align 4
  store i32 %16, i32* %test1, align 4
  %17 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 1
  %18 = getelementptr inbounds %struct.B, %struct.B* %17, i32 0, i32 0
  %19 = load i32, i32* %18, align 4
  store i32 %19, i32* %test2, align 4
  %20 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 1
  %21 = getelementptr inbounds %struct.B, %struct.B* %20, i32 0, i32 1
  %22 = load i32, i32* %21, align 4
  store i32 %22, i32* %test3, align 4
  %23 = load i32, i32* %test1, align 4
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %23)
  %25 = load i32, i32* %test2, align 4
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %25)
  %27 = load i32, i32* %test3, align 4
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i32 %27)
  %29 = bitcast %struct.A* %1 to i8*
  %30 = bitcast %struct.A* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %29, i8* %30, i64 12, i32 4, i1 false)
  %31 = bitcast { i64, i32 }* %2 to i8*
  %32 = bitcast %struct.A* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %31, i8* %32, i64 12, i32 4, i1 false)
  %33 = load { i64, i32 }, { i64, i32 }* %2, align 4
  ret { i64, i32 } %33
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
