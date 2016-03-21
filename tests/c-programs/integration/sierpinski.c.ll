; ModuleID = './sierpinski.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i8* @apply_rules(i8* %new_sl, i8* %sl, i64 %width) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %i = alloca i32, align 4
  %t1 = alloca i8, align 1
  %t2 = alloca i8, align 1
  store i8* %new_sl, i8** %1, align 8
  store i8* %sl, i8** %2, align 8
  store i64 %width, i64* %3, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = getelementptr inbounds i8, i8* %4, i64 0
  %6 = load i8, i8* %5, align 1
  %7 = sext i8 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %15, label %9

; <label>:9                                       ; preds = %0
  %10 = load i8*, i8** %2, align 8
  %11 = getelementptr inbounds i8, i8* %10, i64 1
  %12 = load i8, i8* %11, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp ne i32 %13, 0
  br label %15

; <label>:15                                      ; preds = %9, %0
  %16 = phi i1 [ true, %0 ], [ %14, %9 ]
  %17 = zext i1 %16 to i32
  %18 = trunc i32 %17 to i8
  %19 = load i8*, i8** %1, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 0
  store i8 %18, i8* %20, align 1
  %21 = load i64, i64* %3, align 8
  %22 = sub i64 %21, 2
  %23 = load i8*, i8** %2, align 8
  %24 = getelementptr inbounds i8, i8* %23, i64 %22
  %25 = load i8, i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %36, label %28

; <label>:28                                      ; preds = %15
  %29 = load i64, i64* %3, align 8
  %30 = sub i64 %29, 1
  %31 = load i8*, i8** %2, align 8
  %32 = getelementptr inbounds i8, i8* %31, i64 %30
  %33 = load i8, i8* %32, align 1
  %34 = sext i8 %33 to i32
  %35 = icmp ne i32 %34, 0
  br label %36

; <label>:36                                      ; preds = %28, %15
  %37 = phi i1 [ true, %15 ], [ %35, %28 ]
  %38 = zext i1 %37 to i32
  %39 = trunc i32 %38 to i8
  %40 = load i64, i64* %3, align 8
  %41 = sub i64 %40, 1
  %42 = load i8*, i8** %1, align 8
  %43 = getelementptr inbounds i8, i8* %42, i64 %41
  store i8 %39, i8* %43, align 1
  store i32 1, i32* %i, align 4
  br label %44

; <label>:44                                      ; preds = %123, %36
  %45 = load i32, i32* %i, align 4
  %46 = sext i32 %45 to i64
  %47 = load i64, i64* %3, align 8
  %48 = sub i64 %47, 1
  %49 = icmp ult i64 %46, %48
  br i1 %49, label %50, label %126

; <label>:50                                      ; preds = %44
  %51 = load i32, i32* %i, align 4
  %52 = sub nsw i32 %51, 1
  %53 = sext i32 %52 to i64
  %54 = load i8*, i8** %2, align 8
  %55 = getelementptr inbounds i8, i8* %54, i64 %53
  %56 = load i8, i8* %55, align 1
  %57 = sext i8 %56 to i32
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %59, label %76

; <label>:59                                      ; preds = %50
  %60 = load i32, i32* %i, align 4
  %61 = sext i32 %60 to i64
  %62 = load i8*, i8** %2, align 8
  %63 = getelementptr inbounds i8, i8* %62, i64 %61
  %64 = load i8, i8* %63, align 1
  %65 = sext i8 %64 to i32
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %76

; <label>:67                                      ; preds = %59
  %68 = load i32, i32* %i, align 4
  %69 = add nsw i32 %68, 1
  %70 = sext i32 %69 to i64
  %71 = load i8*, i8** %2, align 8
  %72 = getelementptr inbounds i8, i8* %71, i64 %70
  %73 = load i8, i8* %72, align 1
  %74 = sext i8 %73 to i32
  %75 = icmp ne i32 %74, 0
  br label %76

; <label>:76                                      ; preds = %67, %59, %50
  %77 = phi i1 [ false, %59 ], [ false, %50 ], [ %75, %67 ]
  %78 = zext i1 %77 to i32
  %79 = trunc i32 %78 to i8
  store i8 %79, i8* %t1, align 1
  %80 = load i32, i32* %i, align 4
  %81 = sub nsw i32 %80, 1
  %82 = sext i32 %81 to i64
  %83 = load i8*, i8** %2, align 8
  %84 = getelementptr inbounds i8, i8* %83, i64 %82
  %85 = load i8, i8* %84, align 1
  %86 = icmp ne i8 %85, 0
  br i1 %86, label %103, label %87

; <label>:87                                      ; preds = %76
  %88 = load i32, i32* %i, align 4
  %89 = sext i32 %88 to i64
  %90 = load i8*, i8** %2, align 8
  %91 = getelementptr inbounds i8, i8* %90, i64 %89
  %92 = load i8, i8* %91, align 1
  %93 = icmp ne i8 %92, 0
  br i1 %93, label %103, label %94

; <label>:94                                      ; preds = %87
  %95 = load i32, i32* %i, align 4
  %96 = add nsw i32 %95, 1
  %97 = sext i32 %96 to i64
  %98 = load i8*, i8** %2, align 8
  %99 = getelementptr inbounds i8, i8* %98, i64 %97
  %100 = load i8, i8* %99, align 1
  %101 = icmp ne i8 %100, 0
  %102 = xor i1 %101, true
  br label %103

; <label>:103                                     ; preds = %94, %87, %76
  %104 = phi i1 [ false, %87 ], [ false, %76 ], [ %102, %94 ]
  %105 = zext i1 %104 to i32
  %106 = trunc i32 %105 to i8
  store i8 %106, i8* %t2, align 1
  %107 = load i8, i8* %t1, align 1
  %108 = sext i8 %107 to i32
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %114, label %110

; <label>:110                                     ; preds = %103
  %111 = load i8, i8* %t2, align 1
  %112 = sext i8 %111 to i32
  %113 = icmp ne i32 %112, 0
  br label %114

; <label>:114                                     ; preds = %110, %103
  %115 = phi i1 [ true, %103 ], [ %113, %110 ]
  %116 = xor i1 %115, true
  %117 = zext i1 %116 to i32
  %118 = trunc i32 %117 to i8
  %119 = load i32, i32* %i, align 4
  %120 = sext i32 %119 to i64
  %121 = load i8*, i8** %1, align 8
  %122 = getelementptr inbounds i8, i8* %121, i64 %120
  store i8 %118, i8* %122, align 1
  br label %123

; <label>:123                                     ; preds = %114
  %124 = load i32, i32* %i, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, i32* %i, align 4
  br label %44

; <label>:126                                     ; preds = %44
  %127 = load i8*, i8** %1, align 8
  ret i8* %127
}

; Function Attrs: nounwind uwtable
define void @print_statelist(i8* %sl, i64 %width) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %i = alloca i32, align 4
  store i8* %sl, i8** %1, align 8
  store i64 %width, i64* %2, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %18, %0
  %4 = load i32, i32* %i, align 4
  %5 = sext i32 %4 to i64
  %6 = load i64, i64* %2, align 8
  %7 = icmp ult i64 %5, %6
  br i1 %7, label %8, label %21

; <label>:8                                       ; preds = %3
  %9 = load i32, i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = load i8*, i8** %1, align 8
  %12 = getelementptr inbounds i8, i8* %11, i64 %10
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp ne i32 %14, 0
  %16 = select i1 %15, i32 64, i32 32
  %17 = call i32 @putchar(i32 %16)
  br label %18

; <label>:18                                      ; preds = %8
  %19 = load i32, i32* %i, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %i, align 4
  br label %3

; <label>:21                                      ; preds = %3
  %22 = call i32 @putchar(i32 10)
  ret void
}

declare i32 @putchar(i32) #1

; Function Attrs: nounwind uwtable
define void @run_and_display(i64 %niters) #0 {
  %1 = alloca i64, align 8
  %statelist1 = alloca [80 x i8], align 16
  %statelist2 = alloca [80 x i8], align 16
  %statelist = alloca i8*, align 8
  %new_statelist = alloca i8*, align 8
  %i = alloca i32, align 4
  store i64 %niters, i64* %1, align 8
  %2 = bitcast [80 x i8]* %statelist1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 80, i32 16, i1 false)
  %3 = getelementptr inbounds [80 x i8], [80 x i8]* %statelist1, i32 0, i64 40
  store i8 1, i8* %3, align 1
  %4 = getelementptr inbounds [80 x i8], [80 x i8]* %statelist1, i32 0, i32 0
  store i8* %4, i8** %statelist, align 8
  %5 = getelementptr inbounds [80 x i8], [80 x i8]* %statelist2, i32 0, i32 0
  store i8* %5, i8** %new_statelist, align 8
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %23, %0
  %7 = load i32, i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = load i64, i64* %1, align 8
  %10 = icmp ult i64 %8, %9
  br i1 %10, label %11, label %26

; <label>:11                                      ; preds = %6
  %12 = load i8*, i8** %statelist, align 8
  call void @print_statelist(i8* %12, i64 80)
  %13 = load i8*, i8** %new_statelist, align 8
  %14 = load i8*, i8** %statelist, align 8
  %15 = call i8* @apply_rules(i8* %13, i8* %14, i64 80)
  store i8* %15, i8** %statelist, align 8
  %16 = getelementptr inbounds [80 x i8], [80 x i8]* %statelist1, i32 0, i32 0
  %17 = icmp eq i8* %15, %16
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %11
  %19 = getelementptr inbounds [80 x i8], [80 x i8]* %statelist2, i32 0, i32 0
  store i8* %19, i8** %new_statelist, align 8
  br label %22

; <label>:20                                      ; preds = %11
  %21 = getelementptr inbounds [80 x i8], [80 x i8]* %statelist1, i32 0, i32 0
  store i8* %21, i8** %new_statelist, align 8
  br label %22

; <label>:22                                      ; preds = %20, %18
  br label %23

; <label>:23                                      ; preds = %22
  %24 = load i32, i32* %i, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %i, align 4
  br label %6

; <label>:26                                      ; preds = %6
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @run_and_display(i64 2)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
