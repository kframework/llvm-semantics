; ModuleID = './field.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.myStruct = type { i32, [3 x i8], i8 }
%struct.myStruct2 = type { i32, i32, i32, i32 }

@.str = private unnamed_addr constant [20 x i8] c"error:  offset1=%x\0A\00", align 1
@.str.1 = private unnamed_addr constant [27 x i8] c"error: x.c = %x, y.c = %x\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca %struct.myStruct, align 4
  %y = alloca %struct.myStruct2, align 4
  %ptr = alloca i8*, align 8
  %ptr1 = alloca i8*, align 8
  %ptr2 = alloca i8*, align 8
  %ptr3 = alloca i8*, align 8
  %offset = alloca i32, align 4
  %offset1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.myStruct2, %struct.myStruct2* %y, i32 0, i32 0
  %3 = bitcast i32* %2 to i8*
  store i8* %3, i8** %ptr2, align 8
  %4 = getelementptr inbounds %struct.myStruct2, %struct.myStruct2* %y, i32 0, i32 3
  %5 = bitcast i32* %4 to i8*
  store i8* %5, i8** %ptr3, align 8
  %6 = load i8*, i8** %ptr3, align 8
  %7 = load i8*, i8** %ptr2, align 8
  %8 = ptrtoint i8* %6 to i64
  %9 = ptrtoint i8* %7 to i64
  %10 = sub i64 %8, %9
  %11 = trunc i64 %10 to i32
  store i32 %11, i32* %offset1, align 4
  %12 = load i32, i32* %offset1, align 4
  %13 = zext i32 %12 to i64
  %14 = icmp ne i64 %13, 9
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %0
  %16 = load i32, i32* %offset1, align 4
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i32 0, i32 0), i32 %16)
  br label %18

; <label>:18                                      ; preds = %15, %0
  %19 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %x, i32 0, i32 1
  %20 = bitcast [3 x i8]* %19 to i24*
  %21 = load i24, i24* %20, align 4
  %22 = and i24 %21, -128
  %23 = or i24 %22, 127
  store i24 %23, i24* %20, align 4
  %24 = getelementptr inbounds %struct.myStruct2, %struct.myStruct2* %y, i32 0, i32 2
  store i32 -1, i32* %24, align 4
  %25 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %x, i32 0, i32 1
  %26 = bitcast [3 x i8]* %25 to i24*
  %27 = load i24, i24* %26, align 4
  %28 = shl i24 %27, 17
  %29 = ashr i24 %28, 17
  %30 = trunc i24 %29 to i8
  %31 = sext i8 %30 to i32
  %32 = getelementptr inbounds %struct.myStruct2, %struct.myStruct2* %y, i32 0, i32 2
  %33 = load i32, i32* %32, align 4
  %34 = icmp ne i32 %31, %33
  br i1 %34, label %35, label %46

; <label>:35                                      ; preds = %18
  %36 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %x, i32 0, i32 1
  %37 = bitcast [3 x i8]* %36 to i24*
  %38 = load i24, i24* %37, align 4
  %39 = shl i24 %38, 17
  %40 = ashr i24 %39, 17
  %41 = trunc i24 %40 to i8
  %42 = sext i8 %41 to i32
  %43 = getelementptr inbounds %struct.myStruct2, %struct.myStruct2* %y, i32 0, i32 2
  %44 = load i32, i32* %43, align 4
  %45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.1, i32 0, i32 0), i32 %42, i32 %44)
  br label %46

; <label>:46                                      ; preds = %35, %18
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
