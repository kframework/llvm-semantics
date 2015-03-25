; ModuleID = './2009-12-07-StructReturn.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.barstruct = type { %struct.foostruct, float }
%struct.foostruct = type { [3 x float] }

@bar_ary = common global [4 x %struct.barstruct] zeroinitializer, align 16
@foobify.my_static_foo = internal global %struct.barstruct { %struct.foostruct { [3 x float] [float 4.200000e+01, float 4.200000e+01, float 4.200000e+01] }, float 4.200000e+01 }, align 4
@.str = private unnamed_addr constant [51 x i8] c"error: store clobbered memory outside destination\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define float* @spooky(i32 %i) #0 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [4 x %struct.barstruct]* @bar_ary, i32 0, i64 %3
  %5 = getelementptr inbounds %struct.barstruct* %4, i32 0, i32 1
  store float 1.420000e+02, float* %5, align 4
  %6 = load i32* %1, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [4 x %struct.barstruct]* @bar_ary, i32 0, i64 %7
  %9 = getelementptr inbounds %struct.barstruct* %8, i32 0, i32 1
  ret float* %9
}

; Function Attrs: noinline nounwind uwtable
define { <2 x float>, float } @foobify() #0 {
  %1 = alloca %struct.foostruct, align 4
  %2 = alloca { <2 x float>, float }
  %3 = bitcast %struct.foostruct* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast (%struct.barstruct* @foobify.my_static_foo to i8*), i64 12, i32 4, i1 false)
  %4 = getelementptr %struct.foostruct* %1, i32 0, i32 0
  %5 = bitcast { <2 x float>, float }* %2 to i8*
  %6 = bitcast [3 x float]* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 12, i32 1, i1 false)
  %7 = load { <2 x float>, float }* %2
  ret { <2 x float>, float } %7
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #2 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %pf = alloca float*, align 8
  %4 = alloca %struct.foostruct, align 4
  %5 = alloca { <2 x float>, float }
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %6 = call float* @spooky(i32 0)
  store float* %6, float** %pf, align 8
  %7 = call { <2 x float>, float } @foobify()
  %8 = getelementptr %struct.foostruct* %4, i32 0, i32 0
  store { <2 x float>, float } %7, { <2 x float>, float }* %5
  %9 = bitcast { <2 x float>, float }* %5 to i8*
  %10 = bitcast [3 x float]* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %9, i64 12, i32 1, i1 false)
  %11 = bitcast %struct.foostruct* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([4 x %struct.barstruct]* @bar_ary to i8*), i8* %11, i64 12, i32 4, i1 false)
  %12 = load float** %pf, align 8
  %13 = load float* %12, align 4
  %14 = fpext float %13 to double
  %15 = fcmp une double %14, 1.420000e+02
  br i1 %15, label %16, label %18

; <label>:16                                      ; preds = %0
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([51 x i8]* @.str, i32 0, i32 0))
  call void @abort() #5
  unreachable

; <label>:18                                      ; preds = %0
  ret i32 0
}

declare i32 @printf(i8*, ...) #3

; Function Attrs: noreturn
declare void @abort() #4

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
