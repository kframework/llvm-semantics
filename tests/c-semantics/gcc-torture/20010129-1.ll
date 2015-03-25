; ModuleID = './20010129-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@baz1.l = internal global i64 0, align 8
@bar = common global i8** null, align 8

; Function Attrs: nounwind uwtable
define i64 @baz1(i8* %a) #0 {
  %1 = alloca i8*, align 8
  store i8* %a, i8** %1, align 8
  %2 = load i64* @baz1.l, align 8
  %3 = add nsw i64 %2, 1
  store i64 %3, i64* @baz1.l, align 8
  ret i64 %2
}

; Function Attrs: nounwind uwtable
define i32 @baz2(i8* %a) #0 {
  %1 = alloca i8*, align 8
  store i8* %a, i8** %1, align 8
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @baz3(i32 %i) #0 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %5, label %4

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 1
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @foo(i8* %a, i64 %b, i32 %c) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  %i = alloca i32, align 4
  %g = alloca [256 x i8], align 16
  %h = alloca i8**, align 8
  store i8* %a, i8** %1, align 8
  store i64 %b, i64* %2, align 8
  store i32 %c, i32* %3, align 4
  store i32 0, i32* %d, align 4
  store i32 0, i32* %f, align 4
  %4 = getelementptr inbounds [256 x i8]* %g, i32 0, i64 0
  store i8 10, i8* %4, align 1
  %5 = getelementptr inbounds [256 x i8]* %g, i32 0, i64 1
  store i8 0, i8* %5, align 1
  br label %6

; <label>:6                                       ; preds = %100, %76, %67, %58, %49, %32, %0
  %7 = load i8** %1, align 8
  %8 = call i64 @baz1(i8* %7)
  %9 = load i64* %2, align 8
  %10 = icmp slt i64 %8, %9
  br i1 %10, label %11, label %101

; <label>:11                                      ; preds = %6
  %12 = getelementptr inbounds [256 x i8]* %g, i32 0, i64 0
  %13 = load i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp ne i32 %14, 32
  br i1 %15, label %16, label %100

; <label>:16                                      ; preds = %11
  %17 = getelementptr inbounds [256 x i8]* %g, i32 0, i64 0
  %18 = load i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = icmp ne i32 %19, 9
  br i1 %20, label %21, label %100

; <label>:21                                      ; preds = %16
  store i32 1, i32* %f, align 4
  store i32 0, i32* %e, align 4
  %22 = load i32* %d, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %34, label %24

; <label>:24                                      ; preds = %21
  %25 = getelementptr inbounds [256 x i8]* %g, i32 0, i32 0
  %26 = call i32 @baz2(i8* %25)
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %34

; <label>:28                                      ; preds = %24
  %29 = load i32* %3, align 4
  %30 = and i32 %29, 16
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %28
  br label %6

; <label>:33                                      ; preds = %28
  store i32 1, i32* %d, align 4
  store i32 1, i32* %e, align 4
  br label %34

; <label>:34                                      ; preds = %33, %24, %21
  %35 = load i32* %3, align 4
  %36 = and i32 %35, 16
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %45

; <label>:38                                      ; preds = %34
  %39 = load i32* %3, align 4
  %40 = and i32 %39, 16384
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %45

; <label>:42                                      ; preds = %38
  %43 = load i32* %e, align 4
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %50, label %45

; <label>:45                                      ; preds = %42, %38, %34
  %46 = load i32* %3, align 4
  %47 = and i32 %46, 2
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %50

; <label>:49                                      ; preds = %45
  br label %6

; <label>:50                                      ; preds = %45, %42
  %51 = load i32* %3, align 4
  %52 = and i32 %51, 8192
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %54, label %59

; <label>:54                                      ; preds = %50
  %55 = getelementptr inbounds [256 x i8]* %g, i32 0, i32 0
  %56 = call i32 @baz2(i8* %55)
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %58, label %59

; <label>:58                                      ; preds = %54
  br label %6

; <label>:59                                      ; preds = %54, %50
  %60 = load i32* %3, align 4
  %61 = and i32 %60, 5128
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %63, label %68

; <label>:63                                      ; preds = %59
  %64 = getelementptr inbounds [256 x i8]* %g, i32 0, i32 0
  %65 = call i32 @baz2(i8* %64)
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %67, label %68

; <label>:67                                      ; preds = %63
  br label %6

; <label>:68                                      ; preds = %63, %59
  %69 = load i32* %3, align 4
  %70 = and i32 %69, 512
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %77

; <label>:72                                      ; preds = %68
  %73 = getelementptr inbounds [256 x i8]* %g, i32 0, i32 0
  %74 = call i32 @baz2(i8* %73)
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %72
  br label %6

; <label>:77                                      ; preds = %72, %68
  %78 = load i32* %3, align 4
  %79 = and i32 %78, 128
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %81, label %99

; <label>:81                                      ; preds = %77
  %82 = load i8*** @bar, align 8
  store i8** %82, i8*** %h, align 8
  store i32 0, i32* %i, align 4
  br label %83

; <label>:83                                      ; preds = %92, %81
  %84 = load i8*** %h, align 8
  %85 = icmp ne i8** %84, null
  br i1 %85, label %86, label %98

; <label>:86                                      ; preds = %83
  %87 = load i32* %i, align 4
  %88 = call i32 @baz3(i32 %87)
  %89 = icmp ne i32 %88, 0
  br i1 %89, label %90, label %91

; <label>:90                                      ; preds = %86
  br label %98

; <label>:91                                      ; preds = %86
  br label %92

; <label>:92                                      ; preds = %91
  %93 = load i8*** %h, align 8
  %94 = load i8** %93, align 8
  %95 = bitcast i8* %94 to i8**
  store i8** %95, i8*** %h, align 8
  %96 = load i32* %i, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %i, align 4
  br label %83

; <label>:98                                      ; preds = %90, %83
  br label %99

; <label>:99                                      ; preds = %98, %77
  store i32 0, i32* %f, align 4
  br label %100

; <label>:100                                     ; preds = %99, %16, %11
  br label %6

; <label>:101                                     ; preds = %6
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %n = alloca i8*, align 8
  store i32 0, i32* %1
  store i8* null, i8** %n, align 8
  store i8** %n, i8*** @bar, align 8
  %2 = bitcast i8** %n to i8*
  %3 = call i32 @foo(i8* %2, i64 1, i32 51217)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %5 = load i32* %1
  ret i32 %5
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
