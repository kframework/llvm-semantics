; ModuleID = './va-arg-4.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.big = type { [32 x i8] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@main.x = internal global %struct.big { [32 x i8] c"abc\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00" }, align 8
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: nounwind uwtable
define void @f(%struct.big* byval align 8 %x, i8* %s, ...) #0 {
  %1 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %s, i8** %1, align 8
  %2 = getelementptr inbounds %struct.big* %x, i32 0, i32 0
  %3 = getelementptr inbounds [32 x i8]* %2, i32 0, i64 0
  %4 = load i8* %3, align 1
  %5 = sext i8 %4 to i32
  %6 = icmp ne i32 %5, 97
  br i1 %6, label %19, label %7

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %struct.big* %x, i32 0, i32 0
  %9 = getelementptr inbounds [32 x i8]* %8, i32 0, i64 1
  %10 = load i8* %9, align 1
  %11 = sext i8 %10 to i32
  %12 = icmp ne i32 %11, 98
  br i1 %12, label %19, label %13

; <label>:13                                      ; preds = %7
  %14 = getelementptr inbounds %struct.big* %x, i32 0, i32 0
  %15 = getelementptr inbounds [32 x i8]* %14, i32 0, i64 2
  %16 = load i8* %15, align 1
  %17 = sext i8 %16 to i32
  %18 = icmp ne i32 %17, 99
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %13, %7, %0
  call void @abort() #3
  unreachable

; <label>:20                                      ; preds = %13
  %21 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %22 = bitcast %struct.__va_list_tag* %21 to i8*
  call void @llvm.va_start(i8* %22)
  %23 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %24 = getelementptr inbounds %struct.__va_list_tag* %23, i32 0, i32 0
  %25 = load i32* %24
  %26 = icmp ule i32 %25, 40
  br i1 %26, label %27, label %33

; <label>:27                                      ; preds = %20
  %28 = getelementptr inbounds %struct.__va_list_tag* %23, i32 0, i32 3
  %29 = load i8** %28
  %30 = getelementptr i8* %29, i32 %25
  %31 = bitcast i8* %30 to i32*
  %32 = add i32 %25, 8
  store i32 %32, i32* %24
  br label %38

; <label>:33                                      ; preds = %20
  %34 = getelementptr inbounds %struct.__va_list_tag* %23, i32 0, i32 2
  %35 = load i8** %34
  %36 = bitcast i8* %35 to i32*
  %37 = getelementptr i8* %35, i32 8
  store i8* %37, i8** %34
  br label %38

; <label>:38                                      ; preds = %33, %27
  %39 = phi i32* [ %31, %27 ], [ %36, %33 ]
  %40 = load i32* %39
  %41 = icmp ne i32 %40, 42
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %38
  call void @abort() #3
  unreachable

; <label>:43                                      ; preds = %38
  %44 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %45 = getelementptr inbounds %struct.__va_list_tag* %44, i32 0, i32 0
  %46 = load i32* %45
  %47 = icmp ule i32 %46, 40
  br i1 %47, label %48, label %54

; <label>:48                                      ; preds = %43
  %49 = getelementptr inbounds %struct.__va_list_tag* %44, i32 0, i32 3
  %50 = load i8** %49
  %51 = getelementptr i8* %50, i32 %46
  %52 = bitcast i8* %51 to i32*
  %53 = add i32 %46, 8
  store i32 %53, i32* %45
  br label %59

; <label>:54                                      ; preds = %43
  %55 = getelementptr inbounds %struct.__va_list_tag* %44, i32 0, i32 2
  %56 = load i8** %55
  %57 = bitcast i8* %56 to i32*
  %58 = getelementptr i8* %56, i32 8
  store i8* %58, i8** %55
  br label %59

; <label>:59                                      ; preds = %54, %48
  %60 = phi i32* [ %52, %48 ], [ %57, %54 ]
  %61 = load i32* %60
  %62 = icmp ne i32 %61, 120
  br i1 %62, label %63, label %64

; <label>:63                                      ; preds = %59
  call void @abort() #3
  unreachable

; <label>:64                                      ; preds = %59
  %65 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %66 = getelementptr inbounds %struct.__va_list_tag* %65, i32 0, i32 0
  %67 = load i32* %66
  %68 = icmp ule i32 %67, 40
  br i1 %68, label %69, label %75

; <label>:69                                      ; preds = %64
  %70 = getelementptr inbounds %struct.__va_list_tag* %65, i32 0, i32 3
  %71 = load i8** %70
  %72 = getelementptr i8* %71, i32 %67
  %73 = bitcast i8* %72 to i32*
  %74 = add i32 %67, 8
  store i32 %74, i32* %66
  br label %80

; <label>:75                                      ; preds = %64
  %76 = getelementptr inbounds %struct.__va_list_tag* %65, i32 0, i32 2
  %77 = load i8** %76
  %78 = bitcast i8* %77 to i32*
  %79 = getelementptr i8* %77, i32 8
  store i8* %79, i8** %76
  br label %80

; <label>:80                                      ; preds = %75, %69
  %81 = phi i32* [ %73, %69 ], [ %78, %75 ]
  %82 = load i32* %81
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %84, label %85

; <label>:84                                      ; preds = %80
  call void @abort() #3
  unreachable

; <label>:85                                      ; preds = %80
  %86 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %87 = bitcast %struct.__va_list_tag* %86 to i8*
  call void @llvm.va_end(i8* %87)
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void (%struct.big*, i8*, ...)* @f(%struct.big* byval align 8 @main.x, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i32 42, i32 120, i32 0)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %3 = load i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
