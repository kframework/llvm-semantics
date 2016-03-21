; ModuleID = './pr20601-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.T = type { i8*, [4096 x i8], i8** }

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"-u\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@g = global [4 x i8*] [i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0)], align 16
@c = common global i8** null, align 8
@b = common global i32 0, align 4
@.str.4 = private unnamed_addr constant [8 x i8] c"/bin/sh\00", align 1
@t = common global %struct.T zeroinitializer, align 8
@a = common global [5 x i32] zeroinitializer, align 16
@d = common global i32 0, align 4
@e = common global i8** null, align 8
@f = common global [16 x i8*] zeroinitializer, align 16

; Function Attrs: noreturn nounwind uwtable
define void @foo() #0 {
  br label %1

; <label>:1                                       ; preds = %0, %1
  br label %1
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i8* @bar(i8* %x, i32 %y) #1 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  store i8* %x, i8** %1, align 8
  store i32 %y, i32* %2, align 4
  ret i8* null
}

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %1
  store i8** getelementptr inbounds ([4 x i8*], [4 x i8*]* @g, i32 0, i32 0), i8*** @c, align 8
  store i32 4, i32* @b, align 4
  %2 = call i32 @setup2()
  store i32 %2, i32* %x, align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0), i8** getelementptr inbounds (%struct.T, %struct.T* @t, i32 0, i32 0), align 8
  %3 = load i32, i32* %x, align 4
  %4 = call i32 @setup1(i32 %3)
  %5 = load i32, i32* %x, align 4
  %6 = and i32 %5, 1024
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %12

; <label>:8                                       ; preds = %0
  %9 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @a, i32 0, i64 4), align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %12, label %11

; <label>:11                                      ; preds = %8
  call void @abort() #5
  unreachable

; <label>:12                                      ; preds = %8, %0
  call void @exit(i32 0) #5
  unreachable
                                                  ; No predecessors!
  %14 = load i32, i32* %1
  ret i32 %14
}

; Function Attrs: inlinehint nounwind uwtable
define internal i32 @setup2() #3 {
  %1 = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 1, i32* %j, align 4
  %2 = load i8**, i8*** @c, align 8
  %3 = getelementptr inbounds i8*, i8** %2, i64 1
  store i8** %3, i8*** @e, align 8
  %4 = load i32, i32* @b, align 4
  %5 = sub nsw i32 %4, 1
  store i32 %5, i32* @d, align 4
  br label %6

; <label>:6                                       ; preds = %71, %0
  %7 = load i32, i32* @d, align 4
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %9, label %17

; <label>:9                                       ; preds = %6
  %10 = load i8**, i8*** @e, align 8
  %11 = getelementptr inbounds i8*, i8** %10, i64 0
  %12 = load i8*, i8** %11, align 8
  %13 = getelementptr inbounds i8, i8* %12, i64 0
  %14 = load i8, i8* %13, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp eq i32 %15, 45
  br label %17

; <label>:17                                      ; preds = %9, %6
  %18 = phi i1 [ false, %6 ], [ %16, %9 ]
  br i1 %18, label %19, label %76

; <label>:19                                      ; preds = %17
  %20 = load i8**, i8*** @e, align 8
  %21 = getelementptr inbounds i8*, i8** %20, i64 0
  %22 = load i8*, i8** %21, align 8
  %23 = getelementptr inbounds i8, i8* %22, i64 1
  %24 = load i8, i8* %23, align 1
  %25 = sext i8 %24 to i32
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %36

; <label>:27                                      ; preds = %19
  %28 = load i8**, i8*** @e, align 8
  %29 = getelementptr inbounds i8*, i8** %28, i64 0
  %30 = load i8*, i8** %29, align 8
  %31 = getelementptr inbounds i8, i8* %30, i64 2
  %32 = load i8, i8* %31, align 1
  %33 = sext i8 %32 to i32
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %27
  call void @abort() #5
  unreachable

; <label>:36                                      ; preds = %27, %19
  %37 = load i8**, i8*** @e, align 8
  %38 = getelementptr inbounds i8*, i8** %37, i64 0
  %39 = load i8*, i8** %38, align 8
  %40 = getelementptr inbounds i8, i8* %39, i64 1
  %41 = load i8, i8* %40, align 1
  %42 = sext i8 %41 to i32
  switch i32 %42, label %71 [
    i32 117, label %43
    i32 80, label %56
    i32 45, label %59
  ]

; <label>:43                                      ; preds = %36
  %44 = load i8**, i8*** @e, align 8
  %45 = getelementptr inbounds i8*, i8** %44, i64 1
  %46 = load i8*, i8** %45, align 8
  %47 = icmp ne i8* %46, null
  br i1 %47, label %49, label %48

; <label>:48                                      ; preds = %43
  call void @abort() #5
  unreachable

; <label>:49                                      ; preds = %43
  %50 = load i8**, i8*** @e, align 8
  %51 = getelementptr inbounds i8*, i8** %50, i64 1
  store i8** %51, i8*** getelementptr inbounds (%struct.T, %struct.T* @t, i32 0, i32 2), align 8
  %52 = load i32, i32* @d, align 4
  %53 = add nsw i32 %52, -1
  store i32 %53, i32* @d, align 4
  %54 = load i8**, i8*** @e, align 8
  %55 = getelementptr inbounds i8*, i8** %54, i32 1
  store i8** %55, i8*** @e, align 8
  br label %71

; <label>:56                                      ; preds = %36
  %57 = load i32, i32* %j, align 4
  %58 = or i32 %57, 4096
  store i32 %58, i32* %j, align 4
  br label %71

; <label>:59                                      ; preds = %36
  %60 = load i32, i32* @d, align 4
  %61 = add nsw i32 %60, -1
  store i32 %61, i32* @d, align 4
  %62 = load i8**, i8*** @e, align 8
  %63 = getelementptr inbounds i8*, i8** %62, i32 1
  store i8** %63, i8*** @e, align 8
  %64 = load i32, i32* %j, align 4
  %65 = icmp eq i32 %64, 1
  br i1 %65, label %66, label %69

; <label>:66                                      ; preds = %59
  %67 = load i32, i32* %j, align 4
  %68 = or i32 %67, 1536
  store i32 %68, i32* %j, align 4
  br label %69

; <label>:69                                      ; preds = %66, %59
  %70 = load i32, i32* %j, align 4
  store i32 %70, i32* %1
  br label %86

; <label>:71                                      ; preds = %36, %56, %49
  %72 = load i32, i32* @d, align 4
  %73 = add nsw i32 %72, -1
  store i32 %73, i32* @d, align 4
  %74 = load i8**, i8*** @e, align 8
  %75 = getelementptr inbounds i8*, i8** %74, i32 1
  store i8** %75, i8*** @e, align 8
  br label %6

; <label>:76                                      ; preds = %17
  %77 = load i32, i32* @d, align 4
  %78 = icmp sgt i32 %77, 0
  br i1 %78, label %79, label %84

; <label>:79                                      ; preds = %76
  %80 = load i32, i32* %j, align 4
  %81 = and i32 %80, 1
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %84, label %83

; <label>:83                                      ; preds = %79
  call void @abort() #5
  unreachable

; <label>:84                                      ; preds = %79, %76
  %85 = load i32, i32* %j, align 4
  store i32 %85, i32* %1
  br label %86

; <label>:86                                      ; preds = %84, %69
  %87 = load i32, i32* %1
  ret i32 %87
}

; Function Attrs: inlinehint nounwind uwtable
define internal i32 @setup1(i32 %x) #3 {
  %1 = alloca i32, align 4
  %p = alloca i8*, align 8
  %rval = alloca i32, align 4
  %h = alloca i8**, align 8
  %i = alloca i8**, align 8
  store i32 %x, i32* %1, align 4
  %2 = call i8* @baz(i8* getelementptr inbounds (%struct.T, %struct.T* @t, i32 0, i32 1, i32 0), i32 4096)
  %3 = icmp ne i8* %2, null
  br i1 %3, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = call i8* @baz(i8* getelementptr inbounds (%struct.T, %struct.T* @t, i32 0, i32 1, i32 0), i32 4096)
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = load i32, i32* %1, align 4
  %8 = and i32 %7, 512
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %41

; <label>:10                                      ; preds = %6
  %11 = load i8**, i8*** @e, align 8
  store i8** %11, i8*** %i, align 8
  %12 = load i32, i32* @d, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* @d, align 4
  store i8** getelementptr inbounds ([16 x i8*], [16 x i8*]* @f, i32 0, i32 0), i8*** @e, align 8
  %14 = load i8*, i8** getelementptr inbounds (%struct.T, %struct.T* @t, i32 0, i32 0), align 8
  %15 = icmp ne i8* %14, null
  br i1 %15, label %16, label %25

; <label>:16                                      ; preds = %10
  %17 = load i8*, i8** getelementptr inbounds (%struct.T, %struct.T* @t, i32 0, i32 0), align 8
  %18 = load i8, i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %25

; <label>:21                                      ; preds = %16
  %22 = load i8*, i8** getelementptr inbounds (%struct.T, %struct.T* @t, i32 0, i32 0), align 8
  %23 = load i8**, i8*** @e, align 8
  %24 = getelementptr inbounds i8*, i8** %23, i64 0
  store i8* %22, i8** %24, align 8
  br label %26

; <label>:25                                      ; preds = %16, %10
  call void @abort() #5
  unreachable

; <label>:26                                      ; preds = %21
  %27 = load i8**, i8*** @e, align 8
  %28 = getelementptr inbounds i8*, i8** %27, i64 1
  store i8** %28, i8*** %h, align 8
  br label %29

; <label>:29                                      ; preds = %35, %26
  %30 = load i8**, i8*** %i, align 8
  %31 = load i8*, i8** %30, align 8
  %32 = load i8**, i8*** %h, align 8
  store i8* %31, i8** %32, align 8
  %33 = icmp ne i8* %31, null
  br i1 %33, label %34, label %40

; <label>:34                                      ; preds = %29
  br label %35

; <label>:35                                      ; preds = %34
  %36 = load i8**, i8*** %i, align 8
  %37 = getelementptr inbounds i8*, i8** %36, i32 1
  store i8** %37, i8*** %i, align 8
  %38 = load i8**, i8*** %h, align 8
  %39 = getelementptr inbounds i8*, i8** %38, i32 1
  store i8** %39, i8*** %h, align 8
  br label %29

; <label>:40                                      ; preds = %29
  br label %41

; <label>:41                                      ; preds = %40, %6
  ret i32 1
}

; Function Attrs: noreturn
declare void @abort() #4

; Function Attrs: noreturn
declare void @exit(i32) #4

; Function Attrs: inlinehint nounwind uwtable
define internal i8* @baz(i8* %x, i32 %y) #3 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  store i8* %x, i8** %1, align 8
  store i32 %y, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = icmp ugt i64 %4, 4096
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @foo() #5
  unreachable

; <label>:7                                       ; preds = %0
  %8 = load i8*, i8** %1, align 8
  %9 = load i32, i32* %2, align 4
  %10 = call i8* @bar(i8* %8, i32 %9)
  ret i8* %10
}

attributes #0 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { inlinehint nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
