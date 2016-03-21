; ModuleID = './20030928-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"a1111\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"a1112\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"a1113\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"a1114\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"a1115\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"a1116\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"a1117\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"a1118\00", align 1

; Function Attrs: nounwind uwtable
define void @get_addrs(i8** %x, i32* %y) #0 {
  %1 = alloca i8**, align 8
  %2 = alloca i32*, align 8
  store i8** %x, i8*** %1, align 8
  store i32* %y, i32** %2, align 8
  %3 = load i32*, i32** %2, align 8
  %4 = getelementptr inbounds i32, i32* %3, i64 0
  %5 = load i32, i32* %4, align 4
  %6 = sub nsw i32 %5, 65536
  %7 = mul nsw i32 %6, 2
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i64 %8
  %10 = load i8**, i8*** %1, align 8
  %11 = getelementptr inbounds i8*, i8** %10, i64 0
  store i8* %9, i8** %11, align 8
  %12 = load i32*, i32** %2, align 8
  %13 = getelementptr inbounds i32, i32* %12, i64 1
  %14 = load i32, i32* %13, align 4
  %15 = sub nsw i32 %14, 131072
  %16 = mul nsw i32 %15, 2
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i64 %17
  %19 = load i8**, i8*** %1, align 8
  %20 = getelementptr inbounds i8*, i8** %19, i64 1
  store i8* %18, i8** %20, align 8
  %21 = load i32*, i32** %2, align 8
  %22 = getelementptr inbounds i32, i32* %21, i64 2
  %23 = load i32, i32* %22, align 4
  %24 = sub nsw i32 %23, 196608
  %25 = mul nsw i32 %24, 2
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), i64 %26
  %28 = load i8**, i8*** %1, align 8
  %29 = getelementptr inbounds i8*, i8** %28, i64 2
  store i8* %27, i8** %29, align 8
  %30 = load i32*, i32** %2, align 8
  %31 = getelementptr inbounds i32, i32* %30, i64 3
  %32 = load i32, i32* %31, align 4
  %33 = sub nsw i32 %32, 262144
  %34 = mul nsw i32 %33, 2
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0), i64 %35
  %37 = load i8**, i8*** %1, align 8
  %38 = getelementptr inbounds i8*, i8** %37, i64 3
  store i8* %36, i8** %38, align 8
  %39 = load i32*, i32** %2, align 8
  %40 = getelementptr inbounds i32, i32* %39, i64 4
  %41 = load i32, i32* %40, align 4
  %42 = sub nsw i32 %41, 327680
  %43 = mul nsw i32 %42, 2
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i32 0, i32 0), i64 %44
  %46 = load i8**, i8*** %1, align 8
  %47 = getelementptr inbounds i8*, i8** %46, i64 4
  store i8* %45, i8** %47, align 8
  %48 = load i32*, i32** %2, align 8
  %49 = getelementptr inbounds i32, i32* %48, i64 5
  %50 = load i32, i32* %49, align 4
  %51 = sub nsw i32 %50, 393216
  %52 = mul nsw i32 %51, 2
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i32 0, i32 0), i64 %53
  %55 = load i8**, i8*** %1, align 8
  %56 = getelementptr inbounds i8*, i8** %55, i64 5
  store i8* %54, i8** %56, align 8
  %57 = load i32*, i32** %2, align 8
  %58 = getelementptr inbounds i32, i32* %57, i64 6
  %59 = load i32, i32* %58, align 4
  %60 = sub nsw i32 %59, 458752
  %61 = mul nsw i32 %60, 2
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0), i64 %62
  %64 = load i8**, i8*** %1, align 8
  %65 = getelementptr inbounds i8*, i8** %64, i64 6
  store i8* %63, i8** %65, align 8
  %66 = load i32*, i32** %2, align 8
  %67 = getelementptr inbounds i32, i32* %66, i64 7
  %68 = load i32, i32* %67, align 4
  %69 = sub nsw i32 %68, 524288
  %70 = mul nsw i32 %69, 2
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0), i64 %71
  %73 = load i8**, i8*** %1, align 8
  %74 = getelementptr inbounds i8*, i8** %73, i64 7
  store i8* %72, i8** %74, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca [8 x i8*], align 16
  %y = alloca [8 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %12, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %15

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = add nsw i32 %6, 1
  %8 = mul nsw i32 65536, %7
  %9 = load i32, i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [8 x i32], [8 x i32]* %y, i32 0, i64 %10
  store i32 %8, i32* %11, align 4
  br label %12

; <label>:12                                      ; preds = %5
  %13 = load i32, i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %2

; <label>:15                                      ; preds = %2
  %16 = getelementptr inbounds [8 x i8*], [8 x i8*]* %x, i32 0, i32 0
  %17 = getelementptr inbounds [8 x i32], [8 x i32]* %y, i32 0, i32 0
  call void @get_addrs(i8** %16, i32* %17)
  store i32 0, i32* %i, align 4
  br label %18

; <label>:18                                      ; preds = %31, %15
  %19 = load i32, i32* %i, align 4
  %20 = icmp slt i32 %19, 8
  br i1 %20, label %21, label %34

; <label>:21                                      ; preds = %18
  %22 = load i32, i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [8 x i8*], [8 x i8*]* %x, i32 0, i64 %23
  %25 = load i8*, i8** %24, align 8
  %26 = load i8, i8* %25, align 1
  %27 = sext i8 %26 to i32
  %28 = icmp ne i32 %27, 97
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %21
  call void @abort() #2
  unreachable

; <label>:30                                      ; preds = %21
  br label %31

; <label>:31                                      ; preds = %30
  %32 = load i32, i32* %i, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %i, align 4
  br label %18

; <label>:34                                      ; preds = %18
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %36 = load i32, i32* %1
  ret i32 %36
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
