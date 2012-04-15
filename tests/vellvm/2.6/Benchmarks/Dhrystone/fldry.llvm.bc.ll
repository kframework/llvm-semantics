; ModuleID = 'fldry.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.RecordType = type { %struct.RecordType*, i32, i32, double, [31 x i8] }

@.str = private constant [31 x i8] c"DHRYSTONE PROGRAM, SOME STRING\00", align 1 ; <[31 x i8]*> [#uses=1]
@Array2Glob = internal global [51 x [51 x double]] zeroinitializer, align 32 ; <[51 x [51 x double]]*> [#uses=3]
@.str3 = private constant [53 x i8] c"calculate floating dhrystones using doubles size %d\0A\00", align 1 ; <[53 x i8]*> [#uses=1]

declare i32 @clock(...)

declare void @llvm.memcpy.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([53 x i8]* @.str3, i32 0, i32 0), i32 8) nounwind ; <i32> [#uses=0]
  %1 = call i32 (...)* @clock() nounwind          ; <i32> [#uses=0]
  %2 = call i32 (...)* @clock() nounwind          ; <i32> [#uses=0]
  %3 = malloc %struct.RecordType                  ; <%struct.RecordType*> [#uses=1]
  %4 = malloc %struct.RecordType                  ; <%struct.RecordType*> [#uses=5]
  %5 = getelementptr inbounds %struct.RecordType* %4, i32 0, i32 0 ; <%struct.RecordType**> [#uses=3]
  store %struct.RecordType* %3, %struct.RecordType** %5, align 4
  %6 = getelementptr inbounds %struct.RecordType* %4, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 0, i32* %6, align 4
  %7 = getelementptr inbounds %struct.RecordType* %4, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 10001, i32* %7, align 4
  %8 = getelementptr inbounds %struct.RecordType* %4, i32 0, i32 3 ; <double*> [#uses=2]
  store double 4.000000e+01, double* %8, align 4
  %9 = getelementptr inbounds %struct.RecordType* %4, i32 0, i32 4, i32 0 ; <i8*> [#uses=1]
  call void @llvm.memcpy.i32(i8* %9, i8* getelementptr inbounds ([31 x i8]* @.str, i32 0, i32 0), i32 31, i32 1) nounwind
  store double 1.000000e+01, double* getelementptr inbounds ([51 x [51 x double]]* @Array2Glob, i32 0, i32 8, i32 7), align 8
  %10 = call i32 (...)* @clock() nounwind         ; <i32> [#uses=0]
  br label %Func2.exit.i

Func2.exit.i:                                     ; preds = %bb15.i, %entry
  %i.113.i = phi i32 [ 0, %entry ], [ %22, %bb15.i ] ; <i32> [#uses=1]
  br label %bb.i.i

bb.i.i:                                           ; preds = %bb.i.i, %Func2.exit.i
  %IntIndex.01.i.i = phi double [ 8.000000e+00, %Func2.exit.i ], [ %13, %bb.i.i ] ; <double> [#uses=2]
  %11 = fptosi double %IntIndex.01.i.i to i32     ; <i32> [#uses=1]
  %12 = getelementptr inbounds [51 x [51 x double]]* @Array2Glob, i32 0, i32 8, i32 %11 ; <double*> [#uses=1]
  store double 8.000000e+00, double* %12, align 8
  %13 = fadd double %IntIndex.01.i.i, 1.000000e+00 ; <double> [#uses=2]
  %14 = fcmp ugt double %13, 9.000000e+00         ; <i1> [#uses=1]
  br i1 %14, label %Proc8.exit.i, label %bb.i.i

Proc8.exit.i:                                     ; preds = %bb.i.i
  %15 = load double* getelementptr inbounds ([51 x [51 x double]]* @Array2Glob, i32 0, i32 8, i32 7), align 8 ; <double> [#uses=1]
  %16 = fadd double %15, 1.000000e+00             ; <double> [#uses=1]
  store double %16, double* getelementptr inbounds ([51 x [51 x double]]* @Array2Glob, i32 0, i32 8, i32 7), align 8
  store double 7.000000e+00, double* getelementptr inbounds ([51 x [51 x double]]* @Array2Glob, i32 0, i32 28, i32 8), align 32
  store double 5.000000e+00, double* %8, align 4
  %17 = load %struct.RecordType** %5, align 4     ; <%struct.RecordType*> [#uses=1]
  %18 = getelementptr inbounds %struct.RecordType* %17, i32 0, i32 3 ; <double*> [#uses=1]
  store double 5.000000e+00, double* %18, align 4
  %19 = load %struct.RecordType** %5, align 4     ; <%struct.RecordType*> [#uses=2]
  %20 = getelementptr inbounds %struct.RecordType* %19, i32 0, i32 0 ; <%struct.RecordType**> [#uses=1]
  store %struct.RecordType* %19, %struct.RecordType** %20, align 4
  br label %bb11.i

bb11.i:                                           ; preds = %bb11.i, %Proc8.exit.i
  %indvar23.i = phi i8 [ 0, %Proc8.exit.i ], [ %indvar.next24.i, %bb11.i ] ; <i8> [#uses=2]
  %tmp26.i = add i8 %indvar23.i, 66               ; <i8> [#uses=1]
  %21 = icmp sgt i8 %tmp26.i, 66                  ; <i1> [#uses=1]
  %indvar.next24.i = add i8 %indvar23.i, 1        ; <i8> [#uses=1]
  br i1 %21, label %bb15.i, label %bb11.i

bb15.i:                                           ; preds = %bb11.i
  %22 = add i32 %i.113.i, 1                       ; <i32> [#uses=2]
  %exitcond27.i = icmp eq i32 %22, 100000000      ; <i1> [#uses=1]
  br i1 %exitcond27.i, label %Proc0.exit, label %Func2.exit.i

Proc0.exit:                                       ; preds = %bb15.i
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
