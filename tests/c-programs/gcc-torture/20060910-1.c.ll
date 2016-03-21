; ModuleID = './20060910-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.input_ty = type { i8*, i8* }

@b = common global [6 x i8] zeroinitializer, align 1
@s = common global %struct.input_ty zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define i32 @input_getc_complicated(%struct.input_ty* %x) #0 {
  %1 = alloca %struct.input_ty*, align 8
  store %struct.input_ty* %x, %struct.input_ty** %1, align 8
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @check_header(%struct.input_ty* %deeper) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.input_ty*, align 8
  %len = alloca i32, align 4
  store %struct.input_ty* %deeper, %struct.input_ty** %2, align 8
  store i32 0, i32* %len, align 4
  br label %3

; <label>:3                                       ; preds = %29, %0
  %4 = load i32, i32* %len, align 4
  %5 = icmp ult i32 %4, 6
  br i1 %5, label %6, label %32

; <label>:6                                       ; preds = %3
  %7 = load %struct.input_ty*, %struct.input_ty** %2, align 8
  %8 = getelementptr inbounds %struct.input_ty, %struct.input_ty* %7, i32 0, i32 0
  %9 = load i8*, i8** %8, align 8
  %10 = load %struct.input_ty*, %struct.input_ty** %2, align 8
  %11 = getelementptr inbounds %struct.input_ty, %struct.input_ty* %10, i32 0, i32 1
  %12 = load i8*, i8** %11, align 8
  %13 = icmp ult i8* %9, %12
  br i1 %13, label %14, label %21

; <label>:14                                      ; preds = %6
  %15 = load %struct.input_ty*, %struct.input_ty** %2, align 8
  %16 = getelementptr inbounds %struct.input_ty, %struct.input_ty* %15, i32 0, i32 0
  %17 = load i8*, i8** %16, align 8
  %18 = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %18, i8** %16, align 8
  %19 = load i8, i8* %17, align 1
  %20 = zext i8 %19 to i32
  br label %24

; <label>:21                                      ; preds = %6
  %22 = load %struct.input_ty*, %struct.input_ty** %2, align 8
  %23 = call i32 @input_getc_complicated(%struct.input_ty* %22)
  br label %24

; <label>:24                                      ; preds = %21, %14
  %25 = phi i32 [ %20, %14 ], [ %23, %21 ]
  %26 = icmp slt i32 %25, 0
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %24
  store i32 0, i32* %1
  br label %33

; <label>:28                                      ; preds = %24
  br label %29

; <label>:29                                      ; preds = %28
  %30 = load i32, i32* %len, align 4
  %31 = add i32 %30, 1
  store i32 %31, i32* %len, align 4
  br label %3

; <label>:32                                      ; preds = %3
  store i32 1, i32* %1
  br label %33

; <label>:33                                      ; preds = %32, %27
  %34 = load i32, i32* %1
  ret i32 %34
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @b, i32 0, i32 0), i8** getelementptr inbounds (%struct.input_ty, %struct.input_ty* @s, i32 0, i32 0), align 8
  store i8* getelementptr inbounds (i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @b, i32 0, i32 0), i64 6), i8** getelementptr inbounds (%struct.input_ty, %struct.input_ty* @s, i32 0, i32 1), align 8
  %2 = call i32 @check_header(%struct.input_ty* @s)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %5, label %4

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  %6 = load i8*, i8** getelementptr inbounds (%struct.input_ty, %struct.input_ty* @s, i32 0, i32 0), align 8
  %7 = load i8*, i8** getelementptr inbounds (%struct.input_ty, %struct.input_ty* @s, i32 0, i32 1), align 8
  %8 = icmp ne i8* %6, %7
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %5
  call void @abort() #2
  unreachable

; <label>:10                                      ; preds = %5
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
