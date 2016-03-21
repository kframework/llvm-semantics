; ModuleID = './union2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.myUnion = type { i32 }
%struct.myStruct = type { i32*, i16 }

@uu = internal global %union.myUnion zeroinitializer, align 4
@.str = private unnamed_addr constant [13 x i8] c"uu.i  = %hd\0A\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"uu.i9 = %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"uu.i31= %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"error: s.i=%x\0A\00", align 1

; Function Attrs: nounwind uwtable
define { i32*, i16 } @test(%union.myUnion* %u) #0 {
  %1 = alloca %struct.myStruct, align 8
  %2 = alloca %union.myUnion*, align 8
  %x = alloca %struct.myStruct, align 8
  %ptr = alloca i32*, align 8
  store %union.myUnion* %u, %union.myUnion** %2, align 8
  %3 = load %union.myUnion*, %union.myUnion** %2, align 8
  %4 = bitcast %union.myUnion* %3 to i32*
  store i32 -1, i32* %4, align 4
  %5 = load %union.myUnion*, %union.myUnion** %2, align 8
  %6 = bitcast %union.myUnion* %5 to i16*
  store i16 0, i16* %6, align 2
  %7 = load %union.myUnion*, %union.myUnion** %2, align 8
  %8 = bitcast %union.myUnion* %7 to i32*
  store i32* %8, i32** %ptr, align 8
  %9 = load i32*, i32** %ptr, align 8
  store i32 -1, i32* %9, align 4
  %10 = load i32*, i32** %ptr, align 8
  %11 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %x, i32 0, i32 0
  store i32* %10, i32** %11, align 8
  %12 = load %union.myUnion*, %union.myUnion** %2, align 8
  %13 = bitcast %union.myUnion* %12 to i16*
  %14 = load i16, i16* %13, align 2
  %15 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %x, i32 0, i32 1
  store i16 %14, i16* %15, align 2
  %16 = bitcast %struct.myStruct* %1 to i8*
  %17 = bitcast %struct.myStruct* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %16, i8* %17, i64 16, i32 8, i1 false)
  %18 = bitcast %struct.myStruct* %1 to { i32*, i16 }*
  %19 = load { i32*, i16 }, { i32*, i16 }* %18, align 8
  ret { i32*, i16 } %19
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca %struct.myStruct, align 8
  store i32 0, i32* %1
  %2 = call { i32*, i16 } @test(%union.myUnion* @uu)
  %3 = bitcast %struct.myStruct* %s to { i32*, i16 }*
  %4 = getelementptr { i32*, i16 }, { i32*, i16 }* %3, i32 0, i32 0
  %5 = extractvalue { i32*, i16 } %2, 0
  store i32* %5, i32** %4, align 8
  %6 = getelementptr { i32*, i16 }, { i32*, i16 }* %3, i32 0, i32 1
  %7 = extractvalue { i32*, i16 } %2, 1
  store i16 %7, i16* %6, align 8
  %8 = load i16, i16* bitcast (%union.myUnion* @uu to i16*), align 2
  %9 = sext i16 %8 to i32
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i32 %9)
  %11 = load i32, i32* getelementptr inbounds (%union.myUnion, %union.myUnion* @uu, i32 0, i32 0), align 4
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 %11)
  %13 = load i32, i32* getelementptr inbounds (%union.myUnion, %union.myUnion* @uu, i32 0, i32 0), align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0), i32 %13)
  %15 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %s, i32 0, i32 1
  %16 = load i16, i16* %15, align 2
  %17 = sext i16 %16 to i32
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %24

; <label>:19                                      ; preds = %0
  %20 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %s, i32 0, i32 1
  %21 = load i16, i16* %20, align 2
  %22 = sext i16 %21 to i32
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i32 0, i32 0), i32 %22)
  br label %24

; <label>:24                                      ; preds = %19, %0
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
