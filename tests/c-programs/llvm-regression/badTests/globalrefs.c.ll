; ModuleID = './globalrefs.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.test = type { i32, %struct.anon, i32, %struct.test* }
%struct.anon = type { i32, i32 }

@TestArray = common global [10 x %struct.test] zeroinitializer, align 16
@TestArrayPtr = global %struct.test* bitcast (i8* getelementptr (i8, i8* bitcast ([10 x %struct.test]* @TestArray to i8*), i64 72) to %struct.test*), align 8
@Test1 = common global %struct.test zeroinitializer, align 8
@Aptr = global i64* bitcast (%struct.test* @Test1 to i64*), align 8
@Yptr = global i32* bitcast (i8* getelementptr (i8, i8* bitcast (%struct.test* @Test1 to i8*), i64 8) to i32*), align 8
@NextPtr = global %struct.test** bitcast (i8* getelementptr (i8, i8* bitcast (%struct.test* @Test1 to i8*), i64 16) to %struct.test**), align 8
@.str = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [35 x i8] c"&TestArray[3] - TestArray = 0x%lx\0A\00", align 1
@.str.3 = private unnamed_addr constant [30 x i8] c"Xptr - Aptr          = 0x%lx\0A\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"NextPtr - Xptr       = 0x%lx\0A\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @printdiff(i8* %p1, i8* %p2) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  store i8* %p1, i8** %1, align 8
  store i8* %p2, i8** %2, align 8
  %3 = load i8*, i8** %1, align 8
  %4 = ptrtoint i8* %3 to i64
  %5 = load i8*, i8** %2, align 8
  %6 = ptrtoint i8* %5 to i64
  %7 = sub i64 %4, %6
  %8 = trunc i64 %7 to i32
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %8)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %diff1 = alloca i64, align 8
  %diff2 = alloca i64, align 8
  %diff3 = alloca i64, align 8
  %diff4 = alloca i64, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  call void @printdiff(i8* bitcast (i32* getelementptr inbounds (%struct.test, %struct.test* @Test1, i32 0, i32 1, i32 1) to i8*), i8* bitcast (%struct.test* @Test1 to i8*))
  call void @printdiff(i8* bitcast (%struct.test** getelementptr inbounds (%struct.test, %struct.test* @Test1, i32 0, i32 3) to i8*), i8* bitcast (i32* getelementptr inbounds (%struct.test, %struct.test* @Test1, i32 0, i32 1, i32 1) to i8*))
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  store i64 sub (i64 ptrtoint (%struct.test* getelementptr inbounds ([10 x %struct.test], [10 x %struct.test]* @TestArray, i32 0, i64 3) to i64), i64 ptrtoint ([10 x %struct.test]* @TestArray to i64)), i64* %diff1, align 8
  store i64 sub (i64 ptrtoint (i32* getelementptr inbounds (%struct.test, %struct.test* @Test1, i32 0, i32 1, i32 1) to i64), i64 ptrtoint (%struct.test* @Test1 to i64)), i64* %diff3, align 8
  store i64 sub (i64 ptrtoint (%struct.test** getelementptr inbounds (%struct.test, %struct.test* @Test1, i32 0, i32 3) to i64), i64 ptrtoint (i32* getelementptr inbounds (%struct.test, %struct.test* @Test1, i32 0, i32 1, i32 1) to i64)), i64* %diff4, align 8
  %5 = load i64, i64* %diff1, align 8
  %6 = load i64, i64* %diff1, align 8
  %7 = udiv i64 %6, 24
  %8 = mul i64 %7, 24
  %9 = icmp ne i64 %5, %8
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  store i32 1, i32* %1
  br label %46

; <label>:11                                      ; preds = %0
  %12 = load i64, i64* %diff1, align 8
  %13 = udiv i64 %12, 24
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.2, i32 0, i32 0), i64 %13)
  %15 = load i64, i64* %diff3, align 8
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.3, i32 0, i32 0), i64 %15)
  %17 = load i64, i64* %diff4, align 8
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i32 0, i32 0), i64 %17)
  %19 = load %struct.test*, %struct.test** @TestArrayPtr, align 8
  %20 = ptrtoint %struct.test* %19 to i64
  %21 = sub i64 %20, ptrtoint ([10 x %struct.test]* @TestArray to i64)
  store i64 %21, i64* %diff1, align 8
  %22 = load i32*, i32** @Yptr, align 8
  %23 = ptrtoint i32* %22 to i64
  %24 = load i64*, i64** @Aptr, align 8
  %25 = ptrtoint i64* %24 to i64
  %26 = sub i64 %23, %25
  store i64 %26, i64* %diff3, align 8
  %27 = load %struct.test**, %struct.test*** @NextPtr, align 8
  %28 = ptrtoint %struct.test** %27 to i64
  %29 = load i32*, i32** @Yptr, align 8
  %30 = ptrtoint i32* %29 to i64
  %31 = sub i64 %28, %30
  store i64 %31, i64* %diff4, align 8
  %32 = load i64, i64* %diff1, align 8
  %33 = load i64, i64* %diff1, align 8
  %34 = udiv i64 %33, 24
  %35 = mul i64 %34, 24
  %36 = icmp ne i64 %32, %35
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %11
  store i32 1, i32* %1
  br label %46

; <label>:38                                      ; preds = %11
  %39 = load i64, i64* %diff1, align 8
  %40 = udiv i64 %39, 24
  %41 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.2, i32 0, i32 0), i64 %40)
  %42 = load i64, i64* %diff3, align 8
  %43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.3, i32 0, i32 0), i64 %42)
  %44 = load i64, i64* %diff4, align 8
  %45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i32 0, i32 0), i64 %44)
  store i32 0, i32* %1
  br label %46

; <label>:46                                      ; preds = %38, %37, %10
  %47 = load i32, i32* %1
  ret i32 %47
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
