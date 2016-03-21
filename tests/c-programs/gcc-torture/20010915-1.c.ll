; ModuleID = './20010915-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@check = global i32 0, align 4
@o = global i32 0, align 4
@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"e\00", align 1
@h = common global i8* null, align 8
@u = common global i8* null, align 8
@r.c = internal global [2 x i8] c"b\00", align 1
@r.cnt = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %args = alloca [5 x i8*], align 16
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = bitcast [5 x i8*]* %args to i8*
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 40, i32 16, i1 false)
  %5 = bitcast i8* %4 to [5 x i8*]*
  %6 = getelementptr [5 x i8*], [5 x i8*]* %5, i32 0, i32 0
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0), i8** %6
  %7 = getelementptr [5 x i8*], [5 x i8*]* %5, i32 0, i32 1
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0), i8** %7
  %8 = getelementptr [5 x i8*], [5 x i8*]* %5, i32 0, i32 2
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i8** %8
  %9 = getelementptr [5 x i8*], [5 x i8*]* %5, i32 0, i32 3
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0), i8** %9
  %10 = getelementptr [5 x i8*], [5 x i8*]* %5, i32 0, i32 4
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0), i8** %10
  %11 = getelementptr inbounds [5 x i8*], [5 x i8*]* %args, i32 0, i32 0
  %12 = call i32 @x(i32 5, i8** %11)
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %20, label %14

; <label>:14                                      ; preds = %0
  %15 = load i32, i32* @check, align 4
  %16 = icmp ne i32 %15, 2
  br i1 %16, label %20, label %17

; <label>:17                                      ; preds = %14
  %18 = load i32, i32* @o, align 4
  %19 = icmp ne i32 %18, 5
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17, %14, %0
  call void @abort() #4
  unreachable

; <label>:21                                      ; preds = %17
  call void @exit(i32 0) #4
  unreachable
                                                  ; No predecessors!
  %23 = load i32, i32* %1
  ret i32 %23
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @x(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %opt = alloca i32, align 4
  %g = alloca i8*, align 8
  %p = alloca i8*, align 8
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32 0, i32* %opt, align 4
  store i8* null, i8** %g, align 8
  store i8* null, i8** %p, align 8
  %4 = load i32, i32* %2, align 4
  %5 = load i32, i32* @o, align 4
  %6 = icmp sgt i32 %4, %5
  br i1 %6, label %7, label %60

; <label>:7                                       ; preds = %0
  %8 = load i32, i32* %2, align 4
  %9 = icmp sgt i32 %8, 2
  br i1 %9, label %10, label %60

; <label>:10                                      ; preds = %7
  %11 = load i32, i32* @o, align 4
  %12 = sext i32 %11 to i64
  %13 = load i8**, i8*** %3, align 8
  %14 = getelementptr inbounds i8*, i8** %13, i64 %12
  %15 = load i8*, i8** %14, align 8
  %16 = icmp ne i8* %15, null
  br i1 %16, label %17, label %60

; <label>:17                                      ; preds = %10
  %18 = load i32, i32* @o, align 4
  %19 = sext i32 %18 to i64
  %20 = load i8**, i8*** %3, align 8
  %21 = getelementptr inbounds i8*, i8** %20, i64 %19
  %22 = load i8*, i8** %21, align 8
  %23 = call i8* @s(i8* %22, i8** %p)
  store i8* %23, i8** %g, align 8
  %24 = load i8*, i8** %g, align 8
  %25 = icmp ne i8* %24, null
  br i1 %25, label %26, label %38

; <label>:26                                      ; preds = %17
  %27 = load i8*, i8** %g, align 8
  %28 = getelementptr inbounds i8, i8* %27, i32 1
  store i8* %28, i8** %g, align 8
  store i8 0, i8* %27, align 1
  %29 = load i8*, i8** %g, align 8
  %30 = call i8* @s(i8* %29, i8** %p)
  store i8* %30, i8** @h, align 8
  %31 = load i8*, i8** %g, align 8
  %32 = load i8*, i8** %p, align 8
  %33 = icmp eq i8* %31, %32
  br i1 %33, label %34, label %37

; <label>:34                                      ; preds = %26
  %35 = load i8*, i8** %g, align 8
  %36 = call i8* @m(i8* %35)
  store i8* %36, i8** @h, align 8
  br label %37

; <label>:37                                      ; preds = %34, %26
  br label %38

; <label>:38                                      ; preds = %37, %17
  %39 = load i32, i32* @o, align 4
  %40 = sext i32 %39 to i64
  %41 = load i8**, i8*** %3, align 8
  %42 = getelementptr inbounds i8*, i8** %41, i64 %40
  %43 = load i8*, i8** %42, align 8
  %44 = call i8* @s(i8* %43, i8** %p)
  store i8* %44, i8** @u, align 8
  %45 = load i32, i32* @o, align 4
  %46 = sext i32 %45 to i64
  %47 = load i8**, i8*** %3, align 8
  %48 = getelementptr inbounds i8*, i8** %47, i64 %46
  %49 = load i8*, i8** %48, align 8
  %50 = load i8*, i8** %p, align 8
  %51 = icmp eq i8* %49, %50
  br i1 %51, label %52, label %59

; <label>:52                                      ; preds = %38
  %53 = load i32, i32* @o, align 4
  %54 = sext i32 %53 to i64
  %55 = load i8**, i8*** %3, align 8
  %56 = getelementptr inbounds i8*, i8** %55, i64 %54
  %57 = load i8*, i8** %56, align 8
  %58 = call i8* @m(i8* %57)
  store i8* %58, i8** @u, align 8
  br label %59

; <label>:59                                      ; preds = %52, %38
  br label %61

; <label>:60                                      ; preds = %10, %7, %0
  call void @abort() #4
  unreachable

; <label>:61                                      ; preds = %59
  br label %62

; <label>:62                                      ; preds = %76, %61
  %63 = load i32, i32* @o, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* @o, align 4
  %65 = load i32, i32* %2, align 4
  %66 = icmp slt i32 %64, %65
  br i1 %66, label %67, label %77

; <label>:67                                      ; preds = %62
  %68 = load i32, i32* @o, align 4
  %69 = sext i32 %68 to i64
  %70 = load i8**, i8*** %3, align 8
  %71 = getelementptr inbounds i8*, i8** %70, i64 %69
  %72 = load i8*, i8** %71, align 8
  %73 = call i32 @r(i8* %72)
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %75, label %76

; <label>:75                                      ; preds = %67
  store i32 1, i32* %1
  br label %78

; <label>:76                                      ; preds = %67
  br label %62

; <label>:77                                      ; preds = %62
  store i32 0, i32* %1
  br label %78

; <label>:78                                      ; preds = %77, %75
  %79 = load i32, i32* %1
  ret i32 %79
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind uwtable
define i8* @s(i8* %v, i8** %pp) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8**, align 8
  store i8* %v, i8** %1, align 8
  store i8** %pp, i8*** %2, align 8
  %3 = load i8*, i8** %1, align 8
  %4 = call i32 @strcmp(i8* %3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0)) #5
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %10, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32, i32* @check, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, i32* @check, align 4
  %9 = icmp sgt i32 %7, 1
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6, %0
  call void @abort() #4
  unreachable

; <label>:11                                      ; preds = %6
  %12 = load i8*, i8** %1, align 8
  %13 = getelementptr inbounds i8, i8* %12, i64 1
  %14 = load i8**, i8*** %2, align 8
  store i8* %13, i8** %14, align 8
  ret i8* null
}

; Function Attrs: nounwind uwtable
define i8* @m(i8* %x) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  store i8* %x, i8** %2, align 8
  call void @abort() #4
  unreachable
                                                  ; No predecessors!
  %4 = load i8*, i8** %1
  ret i8* %4
}

; Function Attrs: nounwind uwtable
define i32 @r(i8* %f) #0 {
  %1 = alloca i8*, align 8
  store i8* %f, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = load i8, i8* %2, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @r.c, i32 0, i32 0), align 1
  %6 = sext i8 %5 to i32
  %7 = icmp ne i32 %4, %6
  br i1 %7, label %19, label %8

; <label>:8                                       ; preds = %0
  %9 = load i8*, i8** %1, align 8
  %10 = getelementptr inbounds i8, i8* %9, i64 1
  %11 = load i8, i8* %10, align 1
  %12 = sext i8 %11 to i32
  %13 = load i8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @r.c, i32 0, i64 1), align 1
  %14 = sext i8 %13 to i32
  %15 = icmp ne i32 %12, %14
  br i1 %15, label %19, label %16

; <label>:16                                      ; preds = %8
  %17 = load i32, i32* @r.cnt, align 4
  %18 = icmp sgt i32 %17, 3
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %16, %8, %0
  call void @abort() #4
  unreachable

; <label>:20                                      ; preds = %16
  %21 = load i8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @r.c, i32 0, i64 0), align 1
  %22 = add i8 %21, 1
  store i8 %22, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @r.c, i32 0, i64 0), align 1
  %23 = load i32, i32* @r.cnt, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* @r.cnt, align 4
  ret i32 1
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
