; ModuleID = './general-test.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.MyStruct = type { %struct.MyStruct*, i8, i16, i32, i64 }

@.str = private unnamed_addr constant [24 x i8] c"sizeof(MyStruct) == %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"sizeof(My17BitInt) == %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"sizeof(j) == %d\0A\00", align 1
@Data1 = common global %struct.MyStruct zeroinitializer, align 8
@Data2 = common global %struct.MyStruct zeroinitializer, align 8
@.str.3 = private unnamed_addr constant [8 x i8] c"j = %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"size sum is %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"rand = %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [11 x i8] c"argc = %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"num  = %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [11 x i8] c"val  = %d\0A\00", align 1
@.str.9 = private unnamed_addr constant [20 x i8] c"that.i4Field  = %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [20 x i8] c"that.i12Field = %d\0A\00", align 1
@.str.11 = private unnamed_addr constant [20 x i8] c"that.i17Field = %d\0A\00", align 1
@.str.12 = private unnamed_addr constant [20 x i8] c"that.i37Field = %d\0A\00", align 1
@.str.13 = private unnamed_addr constant [20 x i8] c"next.i4Field  = %d\0A\00", align 1
@.str.14 = private unnamed_addr constant [20 x i8] c"next.i12Field = %d\0A\00", align 1
@.str.15 = private unnamed_addr constant [20 x i8] c"next.i17Field = %d\0A\00", align 1
@.str.16 = private unnamed_addr constant [20 x i8] c"next.i37Field = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define %struct.MyStruct* @getSizes(i16 signext %num, i64* %result) #0 {
  %1 = alloca i16, align 2
  %2 = alloca i64*, align 8
  %i = alloca i32, align 4
  %j = alloca i16, align 2
  store i16 %num, i16* %1, align 2
  store i64* %result, i64** %2, align 8
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i32 0, i32 0), i64 24)
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.1, i32 0, i32 0), i64 4)
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i32 0, i32 0), i64 2)
  %6 = load i64*, i64** %2, align 8
  store i64 30, i64* %6, align 8
  %7 = load i16, i16* %1, align 2
  %8 = trunc i16 %7 to i8
  store i8 %8, i8* getelementptr inbounds (%struct.MyStruct, %struct.MyStruct* @Data1, i32 0, i32 1), align 1
  %9 = load i16, i16* %1, align 2
  %10 = sext i16 %9 to i32
  %11 = add nsw i32 %10, 1
  %12 = trunc i32 %11 to i16
  store i16 %12, i16* getelementptr inbounds (%struct.MyStruct, %struct.MyStruct* @Data1, i32 0, i32 2), align 2
  %13 = load i16, i16* %1, align 2
  %14 = sext i16 %13 to i32
  %15 = add nsw i32 %14, 2
  store i32 %15, i32* getelementptr inbounds (%struct.MyStruct, %struct.MyStruct* @Data1, i32 0, i32 3), align 4
  %16 = load i16, i16* %1, align 2
  %17 = sext i16 %16 to i32
  %18 = add nsw i32 %17, 3
  %19 = sext i32 %18 to i64
  store i64 %19, i64* getelementptr inbounds (%struct.MyStruct, %struct.MyStruct* @Data1, i32 0, i32 4), align 8
  store %struct.MyStruct* null, %struct.MyStruct** getelementptr inbounds (%struct.MyStruct, %struct.MyStruct* @Data1, i32 0, i32 0), align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.MyStruct* @Data2 to i8*), i8* bitcast (%struct.MyStruct* @Data1 to i8*), i64 24, i32 8, i1 false)
  %20 = load i8, i8* getelementptr inbounds (%struct.MyStruct, %struct.MyStruct* @Data2, i32 0, i32 1), align 1
  %21 = zext i8 %20 to i32
  %22 = mul nsw i32 %21, 7
  %23 = trunc i32 %22 to i8
  store i8 %23, i8* getelementptr inbounds (%struct.MyStruct, %struct.MyStruct* @Data2, i32 0, i32 1), align 1
  %24 = load i16, i16* getelementptr inbounds (%struct.MyStruct, %struct.MyStruct* @Data2, i32 0, i32 2), align 2
  %25 = zext i16 %24 to i32
  %26 = mul nsw i32 %25, 7
  %27 = trunc i32 %26 to i16
  store i16 %27, i16* getelementptr inbounds (%struct.MyStruct, %struct.MyStruct* @Data2, i32 0, i32 2), align 2
  %28 = load i32, i32* getelementptr inbounds (%struct.MyStruct, %struct.MyStruct* @Data2, i32 0, i32 3), align 4
  %29 = mul i32 %28, 7
  store i32 %29, i32* getelementptr inbounds (%struct.MyStruct, %struct.MyStruct* @Data2, i32 0, i32 3), align 4
  %30 = load i64, i64* getelementptr inbounds (%struct.MyStruct, %struct.MyStruct* @Data2, i32 0, i32 4), align 8
  %31 = mul i64 %30, 7
  store i64 %31, i64* getelementptr inbounds (%struct.MyStruct, %struct.MyStruct* @Data2, i32 0, i32 4), align 8
  store %struct.MyStruct* @Data1, %struct.MyStruct** getelementptr inbounds (%struct.MyStruct, %struct.MyStruct* @Data2, i32 0, i32 0), align 8
  %32 = load i16, i16* %1, align 2
  %33 = sext i16 %32 to i32
  %34 = mul nsw i32 %33, 2
  %35 = trunc i32 %34 to i16
  store i16 %35, i16* %j, align 2
  %36 = load i16, i16* %j, align 2
  %37 = sext i16 %36 to i32
  %38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0), i32 %37)
  %39 = load i64*, i64** %2, align 8
  %40 = load i64, i64* %39, align 8
  %41 = trunc i64 %40 to i32
  %42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i32 0, i32 0), i32 %41)
  ret %struct.MyStruct* @Data2
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %strct = alloca %struct.MyStruct*, align 8
  %r = alloca i32, align 4
  %num = alloca i32, align 4
  %val = alloca i32, align 4
  %sizes = alloca i64, align 8
  %that = alloca %struct.MyStruct*, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  call void @srand(i32 0) #2
  %4 = call noalias i8* @malloc(i64 24) #2
  %5 = bitcast i8* %4 to %struct.MyStruct*
  store %struct.MyStruct* %5, %struct.MyStruct** %strct, align 8
  %6 = call i32 @rand() #2
  store i32 %6, i32* %r, align 4
  store i32 0, i32* %num, align 4
  store i32 0, i32* %val, align 4
  store i64 0, i64* %sizes, align 8
  %7 = load i32, i32* %r, align 4
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 %7)
  %9 = load i32, i32* %2, align 4
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.6, i32 0, i32 0), i32 %9)
  %11 = load i32, i32* %2, align 4
  %12 = icmp sgt i32 %11, 1
  br i1 %12, label %13, label %18

; <label>:13                                      ; preds = %0
  %14 = load i8**, i8*** %3, align 8
  %15 = getelementptr inbounds i8*, i8** %14, i64 1
  %16 = load i8*, i8** %15, align 8
  %17 = call i32 @atoi(i8* %16) #5
  store i32 %17, i32* %num, align 4
  br label %18

; <label>:18                                      ; preds = %13, %0
  %19 = load i32, i32* %num, align 4
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i32 0, i32 0), i32 %19)
  %21 = load i32, i32* %r, align 4
  %22 = load i32, i32* %2, align 4
  %23 = add nsw i32 %21, %22
  %24 = load i32, i32* %num, align 4
  %25 = add nsw i32 %23, %24
  store i32 %25, i32* %val, align 4
  %26 = load i32, i32* %val, align 4
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.8, i32 0, i32 0), i32 %26)
  %28 = load i32, i32* %val, align 4
  %29 = trunc i32 %28 to i16
  %30 = call %struct.MyStruct* @getSizes(i16 signext %29, i64* %sizes)
  store %struct.MyStruct* %30, %struct.MyStruct** %that, align 8
  %31 = load %struct.MyStruct*, %struct.MyStruct** %that, align 8
  %32 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %31, i32 0, i32 1
  %33 = load i8, i8* %32, align 1
  %34 = zext i8 %33 to i32
  %35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.9, i32 0, i32 0), i32 %34)
  %36 = load %struct.MyStruct*, %struct.MyStruct** %that, align 8
  %37 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %36, i32 0, i32 2
  %38 = load i16, i16* %37, align 2
  %39 = zext i16 %38 to i32
  %40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.10, i32 0, i32 0), i32 %39)
  %41 = load %struct.MyStruct*, %struct.MyStruct** %that, align 8
  %42 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %41, i32 0, i32 3
  %43 = load i32, i32* %42, align 4
  %44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.11, i32 0, i32 0), i32 %43)
  %45 = load %struct.MyStruct*, %struct.MyStruct** %that, align 8
  %46 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %45, i32 0, i32 4
  %47 = load i64, i64* %46, align 8
  %48 = trunc i64 %47 to i32
  %49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.12, i32 0, i32 0), i32 %48)
  %50 = load %struct.MyStruct*, %struct.MyStruct** %that, align 8
  %51 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %50, i32 0, i32 0
  %52 = load %struct.MyStruct*, %struct.MyStruct** %51, align 8
  %53 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %52, i32 0, i32 1
  %54 = load i8, i8* %53, align 1
  %55 = zext i8 %54 to i32
  %56 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.13, i32 0, i32 0), i32 %55)
  %57 = load %struct.MyStruct*, %struct.MyStruct** %that, align 8
  %58 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %57, i32 0, i32 0
  %59 = load %struct.MyStruct*, %struct.MyStruct** %58, align 8
  %60 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %59, i32 0, i32 2
  %61 = load i16, i16* %60, align 2
  %62 = zext i16 %61 to i32
  %63 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.14, i32 0, i32 0), i32 %62)
  %64 = load %struct.MyStruct*, %struct.MyStruct** %that, align 8
  %65 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %64, i32 0, i32 0
  %66 = load %struct.MyStruct*, %struct.MyStruct** %65, align 8
  %67 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %66, i32 0, i32 3
  %68 = load i32, i32* %67, align 4
  %69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.15, i32 0, i32 0), i32 %68)
  %70 = load %struct.MyStruct*, %struct.MyStruct** %that, align 8
  %71 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %70, i32 0, i32 0
  %72 = load %struct.MyStruct*, %struct.MyStruct** %71, align 8
  %73 = getelementptr inbounds %struct.MyStruct, %struct.MyStruct* %72, i32 0, i32 4
  %74 = load i64, i64* %73, align 8
  %75 = trunc i64 %74 to i32
  %76 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.16, i32 0, i32 0), i32 %75)
  %77 = load i64, i64* %sizes, align 8
  %78 = trunc i64 %77 to i32
  %79 = and i32 %78, 1
  ret i32 %79
}

; Function Attrs: nounwind
declare void @srand(i32) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare i32 @rand() #3

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #4

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
