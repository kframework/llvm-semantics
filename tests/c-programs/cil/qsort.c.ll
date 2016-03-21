; ModuleID = './qsort.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@size = global i32 8, align 4
@selected_sort = global void (i32, i32)* @seq_sort, align 8
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [35 x i8] c"Usage: qsort -sSEED -nSIZE -[123]\0A\00", align 1
@optarg = external global i8*, align 8
@.str.1 = private unnamed_addr constant [9 x i8] c"s:n:1234\00", align 1
@from = common global i32* null, align 8
@to = common global i32* null, align 8
@.str.2 = private unnamed_addr constant [11 x i8] c"missorted\0A\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"starting sort...\0A\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @seq_sort(i32 %base, i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %end_low = alloca i32, align 4
  %start_high = alloca i32, align 4
  %pivot = alloca i32, align 4
  store i32 %base, i32* %1, align 4
  store i32 %n, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp sle i32 %3, 1
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %167

; <label>:6                                       ; preds = %0
  %7 = load i32, i32* %1, align 4
  %8 = sext i32 %7 to i64
  %9 = load i32*, i32** @from, align 8
  %10 = getelementptr inbounds i32, i32* %9, i64 %8
  %11 = load i32, i32* %10, align 4
  store i32 %11, i32* %pivot, align 4
  %12 = load i32, i32* %1, align 4
  store i32 %12, i32* %j, align 4
  %13 = load i32, i32* %1, align 4
  store i32 %13, i32* %i, align 4
  br label %14

; <label>:14                                      ; preds = %40, %6
  %15 = load i32, i32* %i, align 4
  %16 = load i32, i32* %1, align 4
  %17 = load i32, i32* %2, align 4
  %18 = add nsw i32 %16, %17
  %19 = icmp slt i32 %15, %18
  br i1 %19, label %20, label %43

; <label>:20                                      ; preds = %14
  %21 = load i32, i32* %i, align 4
  %22 = sext i32 %21 to i64
  %23 = load i32*, i32** @from, align 8
  %24 = getelementptr inbounds i32, i32* %23, i64 %22
  %25 = load i32, i32* %24, align 4
  %26 = load i32, i32* %pivot, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %39

; <label>:28                                      ; preds = %20
  %29 = load i32, i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = load i32*, i32** @from, align 8
  %32 = getelementptr inbounds i32, i32* %31, i64 %30
  %33 = load i32, i32* %32, align 4
  %34 = load i32, i32* %j, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %j, align 4
  %36 = sext i32 %34 to i64
  %37 = load i32*, i32** @to, align 8
  %38 = getelementptr inbounds i32, i32* %37, i64 %36
  store i32 %33, i32* %38, align 4
  br label %39

; <label>:39                                      ; preds = %28, %20
  br label %40

; <label>:40                                      ; preds = %39
  %41 = load i32, i32* %i, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %i, align 4
  br label %14

; <label>:43                                      ; preds = %14
  %44 = load i32, i32* %j, align 4
  store i32 %44, i32* %end_low, align 4
  %45 = load i32, i32* %1, align 4
  store i32 %45, i32* %i, align 4
  br label %46

; <label>:46                                      ; preds = %72, %43
  %47 = load i32, i32* %i, align 4
  %48 = load i32, i32* %1, align 4
  %49 = load i32, i32* %2, align 4
  %50 = add nsw i32 %48, %49
  %51 = icmp slt i32 %47, %50
  br i1 %51, label %52, label %75

; <label>:52                                      ; preds = %46
  %53 = load i32, i32* %i, align 4
  %54 = sext i32 %53 to i64
  %55 = load i32*, i32** @from, align 8
  %56 = getelementptr inbounds i32, i32* %55, i64 %54
  %57 = load i32, i32* %56, align 4
  %58 = load i32, i32* %pivot, align 4
  %59 = icmp eq i32 %57, %58
  br i1 %59, label %60, label %71

; <label>:60                                      ; preds = %52
  %61 = load i32, i32* %i, align 4
  %62 = sext i32 %61 to i64
  %63 = load i32*, i32** @from, align 8
  %64 = getelementptr inbounds i32, i32* %63, i64 %62
  %65 = load i32, i32* %64, align 4
  %66 = load i32, i32* %j, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %j, align 4
  %68 = sext i32 %66 to i64
  %69 = load i32*, i32** @to, align 8
  %70 = getelementptr inbounds i32, i32* %69, i64 %68
  store i32 %65, i32* %70, align 4
  br label %71

; <label>:71                                      ; preds = %60, %52
  br label %72

; <label>:72                                      ; preds = %71
  %73 = load i32, i32* %i, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %i, align 4
  br label %46

; <label>:75                                      ; preds = %46
  %76 = load i32, i32* %j, align 4
  store i32 %76, i32* %start_high, align 4
  %77 = load i32, i32* %1, align 4
  store i32 %77, i32* %i, align 4
  br label %78

; <label>:78                                      ; preds = %104, %75
  %79 = load i32, i32* %i, align 4
  %80 = load i32, i32* %1, align 4
  %81 = load i32, i32* %2, align 4
  %82 = add nsw i32 %80, %81
  %83 = icmp slt i32 %79, %82
  br i1 %83, label %84, label %107

; <label>:84                                      ; preds = %78
  %85 = load i32, i32* %i, align 4
  %86 = sext i32 %85 to i64
  %87 = load i32*, i32** @from, align 8
  %88 = getelementptr inbounds i32, i32* %87, i64 %86
  %89 = load i32, i32* %88, align 4
  %90 = load i32, i32* %pivot, align 4
  %91 = icmp sgt i32 %89, %90
  br i1 %91, label %92, label %103

; <label>:92                                      ; preds = %84
  %93 = load i32, i32* %i, align 4
  %94 = sext i32 %93 to i64
  %95 = load i32*, i32** @from, align 8
  %96 = getelementptr inbounds i32, i32* %95, i64 %94
  %97 = load i32, i32* %96, align 4
  %98 = load i32, i32* %j, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, i32* %j, align 4
  %100 = sext i32 %98 to i64
  %101 = load i32*, i32** @to, align 8
  %102 = getelementptr inbounds i32, i32* %101, i64 %100
  store i32 %97, i32* %102, align 4
  br label %103

; <label>:103                                     ; preds = %92, %84
  br label %104

; <label>:104                                     ; preds = %103
  %105 = load i32, i32* %i, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, i32* %i, align 4
  br label %78

; <label>:107                                     ; preds = %78
  %108 = load i32, i32* %1, align 4
  store i32 %108, i32* %i, align 4
  br label %109

; <label>:109                                     ; preds = %125, %107
  %110 = load i32, i32* %i, align 4
  %111 = load i32, i32* %1, align 4
  %112 = load i32, i32* %2, align 4
  %113 = add nsw i32 %111, %112
  %114 = icmp slt i32 %110, %113
  br i1 %114, label %115, label %128

; <label>:115                                     ; preds = %109
  %116 = load i32, i32* %i, align 4
  %117 = sext i32 %116 to i64
  %118 = load i32*, i32** @to, align 8
  %119 = getelementptr inbounds i32, i32* %118, i64 %117
  %120 = load i32, i32* %119, align 4
  %121 = load i32, i32* %i, align 4
  %122 = sext i32 %121 to i64
  %123 = load i32*, i32** @from, align 8
  %124 = getelementptr inbounds i32, i32* %123, i64 %122
  store i32 %120, i32* %124, align 4
  br label %125

; <label>:125                                     ; preds = %115
  %126 = load i32, i32* %i, align 4
  %127 = add nsw i32 %126, 1
  store i32 %127, i32* %i, align 4
  br label %109

; <label>:128                                     ; preds = %109
  %129 = load i32, i32* %1, align 4
  %130 = load i32, i32* %end_low, align 4
  %131 = load i32, i32* %1, align 4
  %132 = sub nsw i32 %130, %131
  call void @seq_sort(i32 %129, i32 %132)
  %133 = load i32, i32* %start_high, align 4
  %134 = load i32, i32* %2, align 4
  %135 = load i32, i32* %start_high, align 4
  %136 = load i32, i32* %1, align 4
  %137 = sub nsw i32 %135, %136
  %138 = sub nsw i32 %134, %137
  call void @seq_sort(i32 %133, i32 %138)
  %139 = load i32, i32* %1, align 4
  %140 = add nsw i32 %139, 1
  store i32 %140, i32* %i, align 4
  br label %141

; <label>:141                                     ; preds = %164, %128
  %142 = load i32, i32* %i, align 4
  %143 = load i32, i32* %1, align 4
  %144 = load i32, i32* %2, align 4
  %145 = add nsw i32 %143, %144
  %146 = icmp slt i32 %142, %145
  br i1 %146, label %147, label %167

; <label>:147                                     ; preds = %141
  %148 = load i32, i32* %i, align 4
  %149 = sext i32 %148 to i64
  %150 = load i32*, i32** @from, align 8
  %151 = getelementptr inbounds i32, i32* %150, i64 %149
  %152 = load i32, i32* %151, align 4
  %153 = load i32, i32* %i, align 4
  %154 = sub nsw i32 %153, 1
  %155 = sext i32 %154 to i64
  %156 = load i32*, i32** @from, align 8
  %157 = getelementptr inbounds i32, i32* %156, i64 %155
  %158 = load i32, i32* %157, align 4
  %159 = icmp slt i32 %152, %158
  br i1 %159, label %160, label %163

; <label>:160                                     ; preds = %147
  %161 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %162 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %161, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0))
  call void @exit(i32 2) #5
  unreachable

; <label>:163                                     ; preds = %147
  br label %164

; <label>:164                                     ; preds = %163
  %165 = load i32, i32* %i, align 4
  %166 = add nsw i32 %165, 1
  store i32 %166, i32* %i, align 4
  br label %141

; <label>:167                                     ; preds = %5, %141
  ret void
}

; Function Attrs: nounwind uwtable
define void @usage() #0 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 2) #5
  unreachable
                                                  ; No predecessors!
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind uwtable
define i32 @intopt(i32 %min) #0 {
  %1 = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %min, i32* %1, align 4
  %2 = load i8*, i8** @optarg, align 8
  %3 = call i32 @atoi(i8* %2) #6
  store i32 %3, i32* %n, align 4
  %4 = load i32, i32* %n, align 4
  %5 = load i32, i32* %1, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @usage()
  br label %8

; <label>:8                                       ; preds = %7, %0
  %9 = load i32, i32* %n, align 4
  ret i32 %9
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #3

; Function Attrs: nounwind uwtable
define void @setup(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  %opt = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %argc, i32* %1, align 4
  store i8** %argv, i8*** %2, align 8
  call void @srand48(i64 42) #7
  br label %3

; <label>:3                                       ; preds = %17, %0
  %4 = load i32, i32* %1, align 4
  %5 = load i8**, i8*** %2, align 8
  %6 = call i32 @getopt(i32 %4, i8** %5, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0)) #7
  store i32 %6, i32* %opt, align 4
  %7 = icmp ne i32 %6, -1
  br i1 %7, label %8, label %18

; <label>:8                                       ; preds = %3
  %9 = load i32, i32* %opt, align 4
  switch i32 %9, label %16 [
    i32 115, label %10
    i32 110, label %13
    i32 49, label %15
  ]

; <label>:10                                      ; preds = %8
  %11 = call i32 @intopt(i32 1)
  %12 = sext i32 %11 to i64
  call void @srand48(i64 %12) #7
  br label %17

; <label>:13                                      ; preds = %8
  %14 = call i32 @intopt(i32 2)
  store i32 %14, i32* @size, align 4
  br label %17

; <label>:15                                      ; preds = %8
  store void (i32, i32)* @seq_sort, void (i32, i32)** @selected_sort, align 8
  br label %17

; <label>:16                                      ; preds = %8
  call void @usage()
  br label %17

; <label>:17                                      ; preds = %16, %15, %13, %10
  br label %3

; <label>:18                                      ; preds = %3
  %19 = load i32, i32* @size, align 4
  %20 = sext i32 %19 to i64
  %21 = mul i64 %20, 4
  %22 = call noalias i8* @malloc(i64 %21) #7
  %23 = bitcast i8* %22 to i32*
  store i32* %23, i32** @from, align 8
  %24 = load i32, i32* @size, align 4
  %25 = sext i32 %24 to i64
  %26 = mul i64 %25, 4
  %27 = call noalias i8* @malloc(i64 %26) #7
  %28 = bitcast i8* %27 to i32*
  store i32* %28, i32** @to, align 8
  store i32 0, i32* %i, align 4
  br label %29

; <label>:29                                      ; preds = %40, %18
  %30 = load i32, i32* %i, align 4
  %31 = load i32, i32* @size, align 4
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %43

; <label>:33                                      ; preds = %29
  %34 = call i64 @lrand48() #7
  %35 = trunc i64 %34 to i32
  %36 = load i32, i32* %i, align 4
  %37 = sext i32 %36 to i64
  %38 = load i32*, i32** @from, align 8
  %39 = getelementptr inbounds i32, i32* %38, i64 %37
  store i32 %35, i32* %39, align 4
  br label %40

; <label>:40                                      ; preds = %33
  %41 = load i32, i32* %i, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %i, align 4
  br label %29

; <label>:43                                      ; preds = %29
  ret void
}

; Function Attrs: nounwind
declare void @srand48(i64) #4

; Function Attrs: nounwind
declare i32 @getopt(i32, i8**, i8*) #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

; Function Attrs: nounwind
declare i64 @lrand48() #4

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32, i32* %2, align 4
  %5 = load i8**, i8*** %3, align 8
  call void @setup(i32 %4, i8** %5)
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i32 0, i32 0))
  %7 = load void (i32, i32)*, void (i32, i32)** @selected_sort, align 8
  %8 = load i32, i32* @size, align 4
  call void %7(i32 0, i32 %8)
  store i32 0, i32* %i, align 4
  br label %9

; <label>:9                                       ; preds = %20, %0
  %10 = load i32, i32* %i, align 4
  %11 = load i32, i32* @size, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %23

; <label>:13                                      ; preds = %9
  %14 = load i32, i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = load i32*, i32** @from, align 8
  %17 = getelementptr inbounds i32, i32* %16, i64 %15
  %18 = load i32, i32* %17, align 4
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i32 %18)
  br label %20

; <label>:20                                      ; preds = %13
  %21 = load i32, i32* %i, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %i, align 4
  br label %9

; <label>:23                                      ; preds = %9
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind readonly }
attributes #7 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
