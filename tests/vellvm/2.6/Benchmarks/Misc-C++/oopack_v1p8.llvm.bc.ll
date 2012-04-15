; ModuleID = 'oopack_v1p8.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { i32, void ()* }
%struct.Benchmark = type { i32 (...)** }
%struct.Complex = type { double, double }
%struct.ComplexBenchmark = type { %struct.Benchmark }
%struct.__class_type_info_pseudo = type { %struct.__type_info_pseudo }
%struct.__si_class_type_info_pseudo = type { %struct.__type_info_pseudo, %"struct.std::type_info"* }
%struct.__type_info_pseudo = type { i8*, i8* }
%struct.anon = type { void (%struct.Benchmark*)*, i32 }
%"struct.std::type_info" = type opaque

@_ZTI9Benchmark = internal constant %struct.__class_type_info_pseudo { %struct.__type_info_pseudo { i8* inttoptr (i32 add (i32 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv117__class_type_infoE to i32), i32 8) to i8*), i8* getelementptr ([11 x i8]* @_ZTS9Benchmark, i32 0, i32 0) } } ; <%struct.__class_type_info_pseudo*> [#uses=1]
@_ZTVN10__cxxabiv117__class_type_infoE = external constant [0 x i32 (...)*] ; <[0 x i32 (...)*]*> [#uses=1]
@_ZTS9Benchmark = internal constant [11 x i8] c"9Benchmark\00" ; <[11 x i8]*> [#uses=1]
@_ZN9Benchmark4listE = internal constant [4 x %struct.Benchmark*] [%struct.Benchmark* getelementptr (%struct.ComplexBenchmark* @TheMaxBenchmark, i32 0, i32 0), %struct.Benchmark* getelementptr (%struct.ComplexBenchmark* @TheMatrixBenchmark, i32 0, i32 0), %struct.Benchmark* getelementptr (%struct.ComplexBenchmark* @TheIteratorBenchmark, i32 0, i32 0), %struct.Benchmark* getelementptr (%struct.ComplexBenchmark* @TheComplexBenchmark, i32 0, i32 0)] ; <[4 x %struct.Benchmark*]*> [#uses=1]
@.str = private constant [4 x i8] c"Max\00", align 1 ; <[4 x i8]*> [#uses=1]
@U = internal global [1000 x double] zeroinitializer, align 32 ; <[1000 x double]*> [#uses=4]
@MaxResult = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@.str1 = private constant [7 x i8] c"Matrix\00", align 1 ; <[7 x i8]*> [#uses=1]
@C = internal global [2500 x double] zeroinitializer, align 32 ; <[2500 x double]*> [#uses=3]
@D = internal global [2500 x double] zeroinitializer, align 32 ; <[2500 x double]*> [#uses=3]
@E = internal global [2500 x double] zeroinitializer, align 32 ; <[2500 x double]*> [#uses=3]
@.str2 = private constant [9 x i8] c"Iterator\00", align 1 ; <[9 x i8]*> [#uses=1]
@A = internal global [1000 x double] zeroinitializer, align 32 ; <[1000 x double]*> [#uses=3]
@B = internal global [1000 x double] zeroinitializer, align 32 ; <[1000 x double]*> [#uses=3]
@IteratorResult = internal global double 0.000000e+00, align 8 ; <double*> [#uses=3]
@.str3 = private constant [8 x i8] c"Complex\00", align 1 ; <[8 x i8]*> [#uses=1]
@Y = internal global [1000 x %struct.Complex] zeroinitializer, align 32 ; <[1000 x %struct.Complex]*> [#uses=8]
@X = internal global [1000 x %struct.Complex] zeroinitializer, align 32 ; <[1000 x %struct.Complex]*> [#uses=6]
@_ZTV12MaxBenchmark = internal constant [7 x i32 (...)*] [i32 (...)* null, i32 (...)* bitcast (%struct.__si_class_type_info_pseudo* @_ZTI12MaxBenchmark to i32 (...)*), i32 (...)* bitcast (i8* (%struct.ComplexBenchmark*)* @_ZNK12MaxBenchmark4nameEv to i32 (...)*), i32 (...)* bitcast (void (%struct.ComplexBenchmark*)* @_ZNK12MaxBenchmark4initEv to i32 (...)*), i32 (...)* bitcast (void (%struct.ComplexBenchmark*)* @_ZNK12MaxBenchmark7c_styleEv to i32 (...)*), i32 (...)* bitcast (void (%struct.ComplexBenchmark*)* @_ZNK12MaxBenchmark9oop_styleEv to i32 (...)*), i32 (...)* bitcast (void (%struct.ComplexBenchmark*, i32, double*, double*)* @_ZNK12MaxBenchmark5checkEiRdS0_ to i32 (...)*)], align 8 ; <[7 x i32 (...)*]*> [#uses=1]
@_ZTI12MaxBenchmark = internal constant %struct.__si_class_type_info_pseudo { %struct.__type_info_pseudo { i8* inttoptr (i32 add (i32 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv120__si_class_type_infoE to i32), i32 8) to i8*), i8* getelementptr ([15 x i8]* @_ZTS12MaxBenchmark, i32 0, i32 0) }, %"struct.std::type_info"* bitcast (%struct.__class_type_info_pseudo* @_ZTI9Benchmark to %"struct.std::type_info"*) } ; <%struct.__si_class_type_info_pseudo*> [#uses=1]
@_ZTVN10__cxxabiv120__si_class_type_infoE = external constant [0 x i32 (...)*] ; <[0 x i32 (...)*]*> [#uses=1]
@_ZTS12MaxBenchmark = internal constant [15 x i8] c"12MaxBenchmark\00" ; <[15 x i8]*> [#uses=1]
@_ZTV15MatrixBenchmark = internal constant [7 x i32 (...)*] [i32 (...)* null, i32 (...)* bitcast (%struct.__si_class_type_info_pseudo* @_ZTI15MatrixBenchmark to i32 (...)*), i32 (...)* bitcast (i8* (%struct.ComplexBenchmark*)* @_ZNK15MatrixBenchmark4nameEv to i32 (...)*), i32 (...)* bitcast (void (%struct.ComplexBenchmark*)* @_ZNK15MatrixBenchmark4initEv to i32 (...)*), i32 (...)* bitcast (void (%struct.ComplexBenchmark*)* @_ZNK15MatrixBenchmark7c_styleEv to i32 (...)*), i32 (...)* bitcast (void (%struct.ComplexBenchmark*)* @_ZNK15MatrixBenchmark9oop_styleEv to i32 (...)*), i32 (...)* bitcast (void (%struct.ComplexBenchmark*, i32, double*, double*)* @_ZNK15MatrixBenchmark5checkEiRdS0_ to i32 (...)*)], align 8 ; <[7 x i32 (...)*]*> [#uses=1]
@_ZTI15MatrixBenchmark = internal constant %struct.__si_class_type_info_pseudo { %struct.__type_info_pseudo { i8* inttoptr (i32 add (i32 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv120__si_class_type_infoE to i32), i32 8) to i8*), i8* getelementptr ([18 x i8]* @_ZTS15MatrixBenchmark, i32 0, i32 0) }, %"struct.std::type_info"* bitcast (%struct.__class_type_info_pseudo* @_ZTI9Benchmark to %"struct.std::type_info"*) } ; <%struct.__si_class_type_info_pseudo*> [#uses=1]
@_ZTS15MatrixBenchmark = internal constant [18 x i8] c"15MatrixBenchmark\00" ; <[18 x i8]*> [#uses=1]
@_ZTV17IteratorBenchmark = internal constant [7 x i32 (...)*] [i32 (...)* null, i32 (...)* bitcast (%struct.__si_class_type_info_pseudo* @_ZTI17IteratorBenchmark to i32 (...)*), i32 (...)* bitcast (i8* (%struct.ComplexBenchmark*)* @_ZNK17IteratorBenchmark4nameEv to i32 (...)*), i32 (...)* bitcast (void (%struct.ComplexBenchmark*)* @_ZNK17IteratorBenchmark4initEv to i32 (...)*), i32 (...)* bitcast (void (%struct.ComplexBenchmark*)* @_ZNK17IteratorBenchmark7c_styleEv to i32 (...)*), i32 (...)* bitcast (void (%struct.ComplexBenchmark*)* @_ZNK17IteratorBenchmark9oop_styleEv to i32 (...)*), i32 (...)* bitcast (void (%struct.ComplexBenchmark*, i32, double*, double*)* @_ZNK17IteratorBenchmark5checkEiRdS0_ to i32 (...)*)], align 8 ; <[7 x i32 (...)*]*> [#uses=1]
@_ZTI17IteratorBenchmark = internal constant %struct.__si_class_type_info_pseudo { %struct.__type_info_pseudo { i8* inttoptr (i32 add (i32 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv120__si_class_type_infoE to i32), i32 8) to i8*), i8* getelementptr ([20 x i8]* @_ZTS17IteratorBenchmark, i32 0, i32 0) }, %"struct.std::type_info"* bitcast (%struct.__class_type_info_pseudo* @_ZTI9Benchmark to %"struct.std::type_info"*) } ; <%struct.__si_class_type_info_pseudo*> [#uses=1]
@_ZTS17IteratorBenchmark = internal constant [20 x i8] c"17IteratorBenchmark\00" ; <[20 x i8]*> [#uses=1]
@_ZTV16ComplexBenchmark = internal constant [7 x i32 (...)*] [i32 (...)* null, i32 (...)* bitcast (%struct.__si_class_type_info_pseudo* @_ZTI16ComplexBenchmark to i32 (...)*), i32 (...)* bitcast (i8* (%struct.ComplexBenchmark*)* @_ZNK16ComplexBenchmark4nameEv to i32 (...)*), i32 (...)* bitcast (void (%struct.ComplexBenchmark*)* @_ZNK16ComplexBenchmark4initEv to i32 (...)*), i32 (...)* bitcast (void (%struct.ComplexBenchmark*)* @_ZNK16ComplexBenchmark7c_styleEv to i32 (...)*), i32 (...)* bitcast (void (%struct.ComplexBenchmark*)* @_ZNK16ComplexBenchmark9oop_styleEv to i32 (...)*), i32 (...)* bitcast (void (%struct.ComplexBenchmark*, i32, double*, double*)* @_ZNK16ComplexBenchmark5checkEiRdS0_ to i32 (...)*)], align 8 ; <[7 x i32 (...)*]*> [#uses=1]
@_ZTI16ComplexBenchmark = internal constant %struct.__si_class_type_info_pseudo { %struct.__type_info_pseudo { i8* inttoptr (i32 add (i32 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv120__si_class_type_infoE to i32), i32 8) to i8*), i8* getelementptr ([19 x i8]* @_ZTS16ComplexBenchmark, i32 0, i32 0) }, %"struct.std::type_info"* bitcast (%struct.__class_type_info_pseudo* @_ZTI9Benchmark to %"struct.std::type_info"*) } ; <%struct.__si_class_type_info_pseudo*> [#uses=1]
@_ZTS16ComplexBenchmark = internal constant [19 x i8] c"16ComplexBenchmark\00" ; <[19 x i8]*> [#uses=1]
@TheMaxBenchmark = internal global %struct.ComplexBenchmark { %struct.Benchmark { i32 (...)** getelementptr ([7 x i32 (...)*]* @_ZTV12MaxBenchmark, i32 0, i32 2) } } ; <%struct.ComplexBenchmark*> [#uses=1]
@TheMatrixBenchmark = internal global %struct.ComplexBenchmark { %struct.Benchmark { i32 (...)** getelementptr ([7 x i32 (...)*]* @_ZTV15MatrixBenchmark, i32 0, i32 2) } } ; <%struct.ComplexBenchmark*> [#uses=1]
@TheIteratorBenchmark = internal global %struct.ComplexBenchmark { %struct.Benchmark { i32 (...)** getelementptr ([7 x i32 (...)*]* @_ZTV17IteratorBenchmark, i32 0, i32 2) } } ; <%struct.ComplexBenchmark*> [#uses=1]
@TheComplexBenchmark = internal global %struct.ComplexBenchmark { %struct.Benchmark { i32 (...)** getelementptr ([7 x i32 (...)*]* @_ZTV16ComplexBenchmark, i32 0, i32 2) } } ; <%struct.ComplexBenchmark*> [#uses=1]
@.str4 = private constant [51 x i8] c"Usage:\09%s test1=iterations1 test2=iterations2 ...\0A\00", align 1 ; <[51 x i8]*> [#uses=1]
@.str5 = private constant [60 x i8] c"E.g.:\09a.out  Max=5000 Matrix=50 Complex=2000  Iterator=5000\00", align 1 ; <[60 x i8]*> [#uses=1]
@.str6 = private constant [75 x i8] c"%-10s: warning: relative checksum error of %g between C (%g) and oop (%g)\0A\00", align 1 ; <[75 x i8]*> [#uses=1]
@.str7 = private constant [12 x i8] c"%-10s %10d\0A\00", align 1 ; <[12 x i8]*> [#uses=1]
@.str9 = private constant [10 x i8] c"Max=15000\00", align 1 ; <[10 x i8]*> [#uses=1]
@.str10 = private constant [11 x i8] c"Matrix=200\00", align 1 ; <[11 x i8]*> [#uses=1]
@.str11 = private constant [13 x i8] c"Complex=2000\00", align 1 ; <[13 x i8]*> [#uses=1]
@.str12 = private constant [15 x i8] c"Iterator=20000\00", align 1 ; <[15 x i8]*> [#uses=1]
@.str13 = private constant [29 x i8] c"%-10s %10s  %11s  %11s  %5s\0A\00", align 1 ; <[29 x i8]*> [#uses=1]
@.str14 = private constant [1 x i8] zeroinitializer, align 1 ; <[1 x i8]*> [#uses=1]
@.str15 = private constant [10 x i8] c"Seconds  \00", align 1 ; <[10 x i8]*> [#uses=1]
@.str16 = private constant [9 x i8] c"Mflops  \00", align 1 ; <[9 x i8]*> [#uses=1]
@.str17 = private constant [35 x i8] c"%-10s %10s  %5s %5s  %5s %5s  %5s\0A\00", align 1 ; <[35 x i8]*> [#uses=1]
@.str18 = private constant [5 x i8] c"Test\00", align 1 ; <[5 x i8]*> [#uses=1]
@.str19 = private constant [11 x i8] c"Iterations\00", align 1 ; <[11 x i8]*> [#uses=1]
@.str20 = private constant [4 x i8] c" C \00", align 1 ; <[4 x i8]*> [#uses=1]
@.str21 = private constant [4 x i8] c"OOP\00", align 1 ; <[4 x i8]*> [#uses=1]
@.str22 = private constant [6 x i8] c"Ratio\00", align 1 ; <[6 x i8]*> [#uses=1]
@.str23 = private constant [5 x i8] c"----\00", align 1 ; <[5 x i8]*> [#uses=1]
@.str24 = private constant [11 x i8] c"----------\00", align 1 ; <[11 x i8]*> [#uses=1]
@.str25 = private constant [12 x i8] c"-----------\00", align 1 ; <[12 x i8]*> [#uses=1]
@.str26 = private constant [6 x i8] c"-----\00", align 1 ; <[6 x i8]*> [#uses=1]
@.str27 = private constant [2 x i8] c"=\00", align 1 ; <[2 x i8]*> [#uses=1]
@.str28 = private constant [39 x i8] c"missing iteration count for test '%s'\0A\00", align 1 ; <[39 x i8]*> [#uses=1]
@.str29 = private constant [35 x i8] c"skipping non-existent test = '%s'\0A\00", align 1 ; <[35 x i8]*> [#uses=1]
@.str30 = private constant [7 x i8] c"\0ADONE!\00", align 1 ; <[7 x i8]*> [#uses=1]
@llvm.global_ctors = appending global [0 x %0] zeroinitializer ; <[0 x %0]*> [#uses=0]

define internal i8* @_ZNK12MaxBenchmark4nameEv(%struct.ComplexBenchmark* nocapture %this) nounwind readnone {
entry:
  ret i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0)
}

define internal void @_ZNK12MaxBenchmark7c_styleEv(%struct.ComplexBenchmark* nocapture %this) nounwind {
entry:
  %0 = load double* getelementptr inbounds ([1000 x double]* @U, i32 0, i32 0), align 32 ; <double> [#uses=1]
  br label %bb

bb:                                               ; preds = %bb, %entry
  %indvar = phi i32 [ 0, %entry ], [ %tmp, %bb ]  ; <i32> [#uses=1]
  %max.12 = phi double [ %0, %entry ], [ %max.0, %bb ] ; <double> [#uses=2]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=3]
  %scevgep = getelementptr [1000 x double]* @U, i32 0, i32 %tmp ; <double*> [#uses=1]
  %1 = load double* %scevgep, align 8             ; <double> [#uses=2]
  %2 = fcmp ogt double %1, %max.12                ; <i1> [#uses=1]
  %max.0 = select i1 %2, double %1, double %max.12 ; <double> [#uses=2]
  %exitcond = icmp eq i32 %tmp, 999               ; <i1> [#uses=1]
  br i1 %exitcond, label %bb4, label %bb

bb4:                                              ; preds = %bb
  store double %max.0, double* @MaxResult, align 8
  ret void
}

define internal void @_ZNK12MaxBenchmark9oop_styleEv(%struct.ComplexBenchmark* nocapture %this) nounwind {
entry:
  %0 = load double* getelementptr inbounds ([1000 x double]* @U, i32 0, i32 0), align 32 ; <double> [#uses=1]
  br label %bb

bb:                                               ; preds = %bb, %entry
  %indvar = phi i32 [ 0, %entry ], [ %tmp, %bb ]  ; <i32> [#uses=1]
  %max.12 = phi double [ %0, %entry ], [ %max.0, %bb ] ; <double> [#uses=2]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=3]
  %scevgep = getelementptr [1000 x double]* @U, i32 0, i32 %tmp ; <double*> [#uses=1]
  %1 = load double* %scevgep, align 8             ; <double> [#uses=2]
  %2 = fcmp ogt double %1, %max.12                ; <i1> [#uses=1]
  %max.0 = select i1 %2, double %1, double %max.12 ; <double> [#uses=2]
  %exitcond = icmp eq i32 %tmp, 999               ; <i1> [#uses=1]
  br i1 %exitcond, label %bb4, label %bb

bb4:                                              ; preds = %bb
  store double %max.0, double* @MaxResult, align 8
  ret void
}

define internal void @_ZNK12MaxBenchmark4initEv(%struct.ComplexBenchmark* nocapture %this) nounwind {
entry:
  br label %bb

bb:                                               ; preds = %bb, %entry
  %0 = phi i32 [ 0, %entry ], [ %2, %bb ]         ; <i32> [#uses=5]
  %scevgep = getelementptr [1000 x double]* @U, i32 0, i32 %0 ; <double*> [#uses=1]
  %tmp = sub i32 0, %0                            ; <i32> [#uses=1]
  %1 = and i32 %0, 1                              ; <i32> [#uses=1]
  %toBool = icmp eq i32 %1, 0                     ; <i1> [#uses=1]
  %iftmp.7.0.in = select i1 %toBool, i32 %0, i32 %tmp ; <i32> [#uses=1]
  %iftmp.7.0 = sitofp i32 %iftmp.7.0.in to double ; <double> [#uses=1]
  store double %iftmp.7.0, double* %scevgep, align 8
  %2 = add nsw i32 %0, 1                          ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %2, 1000                ; <i1> [#uses=1]
  br i1 %exitcond, label %return, label %bb

return:                                           ; preds = %bb
  ret void
}

define internal void @_ZNK12MaxBenchmark5checkEiRdS0_(%struct.ComplexBenchmark* nocapture %this, i32 %iterations, double* nocapture %flops, double* nocapture %checksum) nounwind {
entry:
  %0 = sitofp i32 %iterations to double           ; <double> [#uses=1]
  %1 = fmul double %0, 1.000000e+03               ; <double> [#uses=1]
  store double %1, double* %flops, align 8
  %2 = load double* @MaxResult, align 8           ; <double> [#uses=1]
  store double %2, double* %checksum, align 8
  ret void
}

define internal i8* @_ZNK15MatrixBenchmark4nameEv(%struct.ComplexBenchmark* nocapture %this) nounwind readnone {
entry:
  ret i8* getelementptr inbounds ([7 x i8]* @.str1, i32 0, i32 0)
}

define internal void @_ZNK15MatrixBenchmark7c_styleEv(%struct.ComplexBenchmark* nocapture %this) nounwind {
entry:
  br label %bb5.preheader

bb2:                                              ; preds = %bb3.preheader, %bb2
  %k.02 = phi i32 [ 0, %bb3.preheader ], [ %5, %bb2 ] ; <i32> [#uses=3]
  %sum.01 = phi double [ 0.000000e+00, %bb3.preheader ], [ %4, %bb2 ] ; <double> [#uses=1]
  %tmp12 = mul i32 %k.02, 50                      ; <i32> [#uses=1]
  %tmp13 = add i32 %8, %tmp12                     ; <i32> [#uses=1]
  %scevgep = getelementptr [2500 x double]* @D, i32 0, i32 %tmp13 ; <double*> [#uses=1]
  %tmp = add i32 %tmp17, %k.02                    ; <i32> [#uses=1]
  %0 = getelementptr inbounds [2500 x double]* @C, i32 0, i32 %tmp ; <double*> [#uses=1]
  %1 = load double* %0, align 8                   ; <double> [#uses=1]
  %2 = load double* %scevgep, align 8             ; <double> [#uses=1]
  %3 = fmul double %1, %2                         ; <double> [#uses=1]
  %4 = fadd double %3, %sum.01                    ; <double> [#uses=2]
  %5 = add nsw i32 %k.02, 1                       ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %5, 50                  ; <i1> [#uses=1]
  br i1 %exitcond, label %bb4, label %bb2

bb4:                                              ; preds = %bb2
  %tmp15 = add i32 %tmp17, %8                     ; <i32> [#uses=1]
  %6 = getelementptr inbounds [2500 x double]* @E, i32 0, i32 %tmp15 ; <double*> [#uses=1]
  store double %4, double* %6, align 8
  %7 = add i32 %8, 1                              ; <i32> [#uses=2]
  %exitcond14 = icmp eq i32 %7, 50                ; <i1> [#uses=1]
  br i1 %exitcond14, label %bb6, label %bb3.preheader

bb3.preheader:                                    ; preds = %bb5.preheader, %bb4
  %8 = phi i32 [ 0, %bb5.preheader ], [ %7, %bb4 ] ; <i32> [#uses=3]
  br label %bb2

bb6:                                              ; preds = %bb4
  %9 = add i32 %i.07, 1                           ; <i32> [#uses=2]
  %exitcond16 = icmp eq i32 %9, 50                ; <i1> [#uses=1]
  br i1 %exitcond16, label %return, label %bb5.preheader

bb5.preheader:                                    ; preds = %bb6, %entry
  %i.07 = phi i32 [ 0, %entry ], [ %9, %bb6 ]     ; <i32> [#uses=2]
  %tmp17 = mul i32 %i.07, 50                      ; <i32> [#uses=2]
  br label %bb3.preheader

return:                                           ; preds = %bb6
  ret void
}

define internal void @_ZNK15MatrixBenchmark9oop_styleEv(%struct.ComplexBenchmark* nocapture %this) nounwind {
entry:
  br label %bb5.preheader

bb3.preheader.us:                                 ; preds = %bb5.preheader, %bb3.bb4_crit_edge.us
  %0 = phi i32 [ 0, %bb5.preheader ], [ %8, %bb3.bb4_crit_edge.us ] ; <i32> [#uses=3]
  br label %bb2.us

bb2.us:                                           ; preds = %bb2.us, %bb3.preheader.us
  %k.02.us = phi i32 [ 0, %bb3.preheader.us ], [ %6, %bb2.us ] ; <i32> [#uses=3]
  %sum.01.us = phi double [ 0.000000e+00, %bb3.preheader.us ], [ %5, %bb2.us ] ; <double> [#uses=1]
  %tmp11 = mul i32 %k.02.us, 50                   ; <i32> [#uses=1]
  %tmp12 = add i32 %0, %tmp11                     ; <i32> [#uses=1]
  %scevgep = getelementptr [2500 x double]* @D, i32 0, i32 %tmp12 ; <double*> [#uses=1]
  %tmp = add i32 %tmp16, %k.02.us                 ; <i32> [#uses=1]
  %1 = getelementptr inbounds [2500 x double]* @C, i32 0, i32 %tmp ; <double*> [#uses=1]
  %2 = load double* %1, align 8                   ; <double> [#uses=1]
  %3 = load double* %scevgep, align 8             ; <double> [#uses=1]
  %4 = fmul double %2, %3                         ; <double> [#uses=1]
  %5 = fadd double %4, %sum.01.us                 ; <double> [#uses=2]
  %6 = add nsw i32 %k.02.us, 1                    ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %6, 50                  ; <i1> [#uses=1]
  br i1 %exitcond, label %bb3.bb4_crit_edge.us, label %bb2.us

bb3.bb4_crit_edge.us:                             ; preds = %bb2.us
  %tmp14 = add i32 %tmp16, %0                     ; <i32> [#uses=1]
  %7 = getelementptr inbounds [2500 x double]* @E, i32 0, i32 %tmp14 ; <double*> [#uses=1]
  store double %5, double* %7, align 8
  %8 = add nsw i32 %0, 1                          ; <i32> [#uses=2]
  %exitcond13 = icmp eq i32 %8, 50                ; <i1> [#uses=1]
  br i1 %exitcond13, label %bb6, label %bb3.preheader.us

bb6:                                              ; preds = %bb3.bb4_crit_edge.us
  %9 = add i32 %i.07, 1                           ; <i32> [#uses=2]
  %exitcond15 = icmp eq i32 %9, 50                ; <i1> [#uses=1]
  br i1 %exitcond15, label %return, label %bb5.preheader

bb5.preheader:                                    ; preds = %bb6, %entry
  %i.07 = phi i32 [ 0, %entry ], [ %9, %bb6 ]     ; <i32> [#uses=2]
  %tmp16 = mul i32 %i.07, 50                      ; <i32> [#uses=2]
  br label %bb3.preheader.us

return:                                           ; preds = %bb6
  ret void
}

define internal void @_ZNK15MatrixBenchmark4initEv(%struct.ComplexBenchmark* nocapture %this) nounwind {
entry:
  br label %bb

bb:                                               ; preds = %bb, %entry
  %j.01 = phi i32 [ 0, %entry ], [ %tmp, %bb ]    ; <i32> [#uses=3]
  %scevgep = getelementptr [2500 x double]* @C, i32 0, i32 %j.01 ; <double*> [#uses=1]
  %scevgep2 = getelementptr [2500 x double]* @D, i32 0, i32 %j.01 ; <double*> [#uses=1]
  %tmp = add i32 %j.01, 1                         ; <i32> [#uses=3]
  %0 = sitofp i32 %tmp to double                  ; <double> [#uses=2]
  store double %0, double* %scevgep, align 8
  %1 = fdiv double 1.000000e+00, %0               ; <double> [#uses=1]
  store double %1, double* %scevgep2, align 8
  %exitcond = icmp eq i32 %tmp, 2500              ; <i1> [#uses=1]
  br i1 %exitcond, label %return, label %bb

return:                                           ; preds = %bb
  ret void
}

define internal void @_ZNK15MatrixBenchmark5checkEiRdS0_(%struct.ComplexBenchmark* nocapture %this, i32 %iterations, double* nocapture %flops, double* nocapture %checksum) nounwind {
entry:
  br label %bb

bb:                                               ; preds = %bb, %entry
  %sum.02 = phi double [ 0.000000e+00, %entry ], [ %1, %bb ] ; <double> [#uses=1]
  %k.01 = phi i32 [ 0, %entry ], [ %2, %bb ]      ; <i32> [#uses=2]
  %scevgep = getelementptr [2500 x double]* @E, i32 0, i32 %k.01 ; <double*> [#uses=1]
  %0 = load double* %scevgep, align 8             ; <double> [#uses=1]
  %1 = fadd double %0, %sum.02                    ; <double> [#uses=2]
  %2 = add nsw i32 %k.01, 1                       ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %2, 2500                ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb

bb2:                                              ; preds = %bb
  store double %1, double* %checksum, align 8
  %3 = sitofp i32 %iterations to double           ; <double> [#uses=1]
  %4 = fmul double %3, 2.500000e+05               ; <double> [#uses=1]
  store double %4, double* %flops, align 8
  ret void
}

define internal i8* @_ZNK17IteratorBenchmark4nameEv(%struct.ComplexBenchmark* nocapture %this) nounwind readnone {
entry:
  ret i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0)
}

define internal void @_ZNK17IteratorBenchmark7c_styleEv(%struct.ComplexBenchmark* nocapture %this) nounwind {
entry:
  br label %bb

bb:                                               ; preds = %bb, %entry
  %sum.02 = phi double [ 0.000000e+00, %entry ], [ %3, %bb ] ; <double> [#uses=1]
  %i.01 = phi i32 [ 0, %entry ], [ %4, %bb ]      ; <i32> [#uses=3]
  %scevgep = getelementptr [1000 x double]* @A, i32 0, i32 %i.01 ; <double*> [#uses=1]
  %scevgep4 = getelementptr [1000 x double]* @B, i32 0, i32 %i.01 ; <double*> [#uses=1]
  %0 = load double* %scevgep, align 8             ; <double> [#uses=1]
  %1 = load double* %scevgep4, align 8            ; <double> [#uses=1]
  %2 = fmul double %0, %1                         ; <double> [#uses=1]
  %3 = fadd double %2, %sum.02                    ; <double> [#uses=2]
  %4 = add nsw i32 %i.01, 1                       ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %4, 1000                ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb

bb2:                                              ; preds = %bb
  store double %3, double* @IteratorResult, align 8
  ret void
}

define internal void @_ZNK17IteratorBenchmark9oop_styleEv(%struct.ComplexBenchmark* nocapture %this) nounwind {
entry:
  br label %bb

bb:                                               ; preds = %bb, %entry
  %sum.03 = phi double [ 0.000000e+00, %entry ], [ %3, %bb ] ; <double> [#uses=1]
  %bi.0.02 = phi i32 [ 0, %entry ], [ %4, %bb ]   ; <i32> [#uses=3]
  %scevgep = getelementptr [1000 x double]* @B, i32 0, i32 %bi.0.02 ; <double*> [#uses=1]
  %scevgep5 = getelementptr [1000 x double]* @A, i32 0, i32 %bi.0.02 ; <double*> [#uses=1]
  %0 = load double* %scevgep5, align 8            ; <double> [#uses=1]
  %1 = load double* %scevgep, align 8             ; <double> [#uses=1]
  %2 = fmul double %0, %1                         ; <double> [#uses=1]
  %3 = fadd double %2, %sum.03                    ; <double> [#uses=2]
  %4 = add nsw i32 %bi.0.02, 1                    ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %4, 1000                ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb

bb2:                                              ; preds = %bb
  store double %3, double* @IteratorResult, align 8
  ret void
}

define internal void @_ZNK17IteratorBenchmark4initEv(%struct.ComplexBenchmark* nocapture %this) nounwind {
entry:
  br label %bb

bb:                                               ; preds = %bb, %entry
  %i.01 = phi i32 [ 0, %entry ], [ %tmp, %bb ]    ; <i32> [#uses=3]
  %scevgep = getelementptr [1000 x double]* @A, i32 0, i32 %i.01 ; <double*> [#uses=1]
  %scevgep2 = getelementptr [1000 x double]* @B, i32 0, i32 %i.01 ; <double*> [#uses=1]
  %tmp = add i32 %i.01, 1                         ; <i32> [#uses=3]
  %0 = sitofp i32 %tmp to double                  ; <double> [#uses=2]
  store double %0, double* %scevgep, align 8
  %1 = fdiv double 1.000000e+00, %0               ; <double> [#uses=1]
  store double %1, double* %scevgep2, align 8
  %exitcond = icmp eq i32 %tmp, 1000              ; <i1> [#uses=1]
  br i1 %exitcond, label %return, label %bb

return:                                           ; preds = %bb
  ret void
}

define internal void @_ZNK17IteratorBenchmark5checkEiRdS0_(%struct.ComplexBenchmark* nocapture %this, i32 %iterations, double* nocapture %flops, double* nocapture %checksum) nounwind {
entry:
  %0 = mul i32 %iterations, 2000                  ; <i32> [#uses=1]
  %1 = sitofp i32 %0 to double                    ; <double> [#uses=1]
  store double %1, double* %flops, align 8
  %2 = load double* @IteratorResult, align 8      ; <double> [#uses=1]
  store double %2, double* %checksum, align 8
  ret void
}

define internal i8* @_ZNK16ComplexBenchmark4nameEv(%struct.ComplexBenchmark* nocapture %this) nounwind readnone {
entry:
  ret i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0)
}

define internal void @_ZNK16ComplexBenchmark7c_styleEv(%struct.ComplexBenchmark* nocapture %this) nounwind {
entry:
  br label %bb

bb:                                               ; preds = %bb, %entry
  %k.01 = phi i32 [ 0, %entry ], [ %12, %bb ]     ; <i32> [#uses=5]
  %scevgep = getelementptr [1000 x %struct.Complex]* @Y, i32 0, i32 %k.01, i32 1 ; <double*> [#uses=2]
  %scevgep23 = getelementptr [1000 x %struct.Complex]* @X, i32 0, i32 %k.01, i32 0 ; <double*> [#uses=1]
  %scevgep4 = getelementptr [1000 x %struct.Complex]* @X, i32 0, i32 %k.01, i32 1 ; <double*> [#uses=1]
  %scevgep56 = getelementptr [1000 x %struct.Complex]* @Y, i32 0, i32 %k.01, i32 0 ; <double*> [#uses=2]
  %0 = load double* %scevgep56, align 16          ; <double> [#uses=1]
  %1 = load double* %scevgep23, align 16          ; <double> [#uses=2]
  %2 = fmul double %1, 5.000000e-01               ; <double> [#uses=1]
  %3 = fadd double %0, %2                         ; <double> [#uses=1]
  %4 = load double* %scevgep4, align 8            ; <double> [#uses=2]
  %5 = fmul double %4, 0x3FEBB67AE8584CAA         ; <double> [#uses=1]
  %6 = fsub double %3, %5                         ; <double> [#uses=1]
  store double %6, double* %scevgep56, align 16
  %7 = load double* %scevgep, align 8             ; <double> [#uses=1]
  %8 = fmul double %4, 5.000000e-01               ; <double> [#uses=1]
  %9 = fadd double %7, %8                         ; <double> [#uses=1]
  %10 = fmul double %1, 0x3FEBB67AE8584CAA        ; <double> [#uses=1]
  %11 = fadd double %9, %10                       ; <double> [#uses=1]
  store double %11, double* %scevgep, align 8
  %12 = add nsw i32 %k.01, 1                      ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %12, 1000               ; <i1> [#uses=1]
  br i1 %exitcond, label %return, label %bb

return:                                           ; preds = %bb
  ret void
}

define internal void @_ZNK16ComplexBenchmark9oop_styleEv(%struct.ComplexBenchmark* nocapture %this) nounwind {
entry:
  br label %bb

bb:                                               ; preds = %bb, %entry
  %k.01 = phi i32 [ 0, %entry ], [ %8, %bb ]      ; <i32> [#uses=5]
  %elt9 = getelementptr [1000 x %struct.Complex]* @Y, i32 0, i32 %k.01, i32 1 ; <double*> [#uses=2]
  %elt7 = getelementptr [1000 x %struct.Complex]* @Y, i32 0, i32 %k.01, i32 0 ; <double*> [#uses=2]
  %elt5 = getelementptr [1000 x %struct.Complex]* @X, i32 0, i32 %k.01, i32 1 ; <double*> [#uses=1]
  %elt3 = getelementptr [1000 x %struct.Complex]* @X, i32 0, i32 %k.01, i32 0 ; <double*> [#uses=1]
  %val4 = load double* %elt3, align 16            ; <double> [#uses=2]
  %val6 = load double* %elt5, align 8             ; <double> [#uses=2]
  %0 = fmul double %val6, 5.000000e-01            ; <double> [#uses=1]
  %1 = fmul double %val4, 0x3FEBB67AE8584CAA      ; <double> [#uses=1]
  %2 = fadd double %0, %1                         ; <double> [#uses=1]
  %3 = fmul double %val4, 5.000000e-01            ; <double> [#uses=1]
  %4 = fmul double %val6, 0x3FEBB67AE8584CAA      ; <double> [#uses=1]
  %5 = fsub double %3, %4                         ; <double> [#uses=1]
  %val8 = load double* %elt7, align 16            ; <double> [#uses=1]
  %val10 = load double* %elt9, align 8            ; <double> [#uses=1]
  %6 = fadd double %val10, %2                     ; <double> [#uses=1]
  %7 = fadd double %val8, %5                      ; <double> [#uses=1]
  store double %7, double* %elt7, align 16
  store double %6, double* %elt9, align 8
  %8 = add nsw i32 %k.01, 1                       ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %8, 1000                ; <i1> [#uses=1]
  br i1 %exitcond, label %return, label %bb

return:                                           ; preds = %bb
  ret void
}

define internal void @_ZNK16ComplexBenchmark4initEv(%struct.ComplexBenchmark* nocapture %this) nounwind {
entry:
  br label %bb

bb:                                               ; preds = %bb, %entry
  %k.03 = phi i32 [ 0, %entry ], [ %tmp, %bb ]    ; <i32> [#uses=5]
  %scevgep = getelementptr [1000 x %struct.Complex]* @Y, i32 0, i32 %k.03, i32 1 ; <double*> [#uses=1]
  %scevgep45 = getelementptr [1000 x %struct.Complex]* @Y, i32 0, i32 %k.03, i32 0 ; <double*> [#uses=1]
  %scevgep6 = getelementptr [1000 x %struct.Complex]* @X, i32 0, i32 %k.03, i32 1 ; <double*> [#uses=1]
  %scevgep78 = getelementptr [1000 x %struct.Complex]* @X, i32 0, i32 %k.03, i32 0 ; <double*> [#uses=1]
  %tmp = add i32 %k.03, 1                         ; <i32> [#uses=3]
  %0 = sitofp i32 %tmp to double                  ; <double> [#uses=2]
  %1 = fdiv double 1.000000e+00, %0               ; <double> [#uses=1]
  store double %0, double* %scevgep78, align 16
  store double %1, double* %scevgep6, align 8
  store double 0.000000e+00, double* %scevgep45, align 16
  store double 0.000000e+00, double* %scevgep, align 8
  %exitcond = icmp eq i32 %tmp, 1000              ; <i1> [#uses=1]
  br i1 %exitcond, label %return, label %bb

return:                                           ; preds = %bb
  ret void
}

define internal void @_ZNK16ComplexBenchmark5checkEiRdS0_(%struct.ComplexBenchmark* nocapture %this, i32 %iterations, double* nocapture %flops, double* nocapture %checksum) nounwind {
entry:
  br label %bb

bb:                                               ; preds = %bb, %entry
  %sum.02 = phi double [ 0.000000e+00, %entry ], [ %3, %bb ] ; <double> [#uses=1]
  %k.01 = phi i32 [ 0, %entry ], [ %4, %bb ]      ; <i32> [#uses=3]
  %scevgep = getelementptr [1000 x %struct.Complex]* @Y, i32 0, i32 %k.01, i32 1 ; <double*> [#uses=1]
  %scevgep45 = getelementptr [1000 x %struct.Complex]* @Y, i32 0, i32 %k.01, i32 0 ; <double*> [#uses=1]
  %0 = load double* %scevgep45, align 16          ; <double> [#uses=1]
  %1 = load double* %scevgep, align 8             ; <double> [#uses=1]
  %2 = fadd double %0, %1                         ; <double> [#uses=1]
  %3 = fadd double %2, %sum.02                    ; <double> [#uses=2]
  %4 = add nsw i32 %k.01, 1                       ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %4, 1000                ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb

bb2:                                              ; preds = %bb
  store double %3, double* %checksum, align 8
  %5 = mul i32 %iterations, 8000                  ; <i32> [#uses=1]
  %6 = sitofp i32 %5 to double                    ; <double> [#uses=1]
  store double %6, double* %flops, align 8
  ret void
}

declare i32 @printf(i8* noalias nocapture, ...) nounwind

declare i32 @puts(i8* nocapture) nounwind

declare void @exit(i32) noreturn nounwind

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly

declare i32 @clock() nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) {
entry:
  %flops.i1.i = alloca double, align 8            ; <double*> [#uses=1]
  %flops.i.i = alloca double, align 8             ; <double*> [#uses=1]
  %oop_checksum.i = alloca double, align 8        ; <double*> [#uses=2]
  %c_checksum.i = alloca double, align 8          ; <double*> [#uses=2]
  %ActualArgs = alloca [6 x i8*], align 4         ; <[6 x i8*]*> [#uses=8]
  %str5 = alloca [15 x i8], align 1               ; <[15 x i8]*> [#uses=1]
  %str4 = alloca [13 x i8], align 1               ; <[13 x i8]*> [#uses=1]
  %str3 = alloca [11 x i8], align 1               ; <[11 x i8]*> [#uses=1]
  %str2 = alloca [10 x i8], align 1               ; <[10 x i8]*> [#uses=1]
  %str1 = alloca [6 x i8], align 1                ; <[6 x i8]*> [#uses=6]
  %0 = getelementptr inbounds [6 x i8]* %str1, i32 0, i32 0 ; <i8*> [#uses=3]
  store i8 97, i8* %0, align 1
  %1 = getelementptr inbounds [6 x i8]* %str1, i32 0, i32 1 ; <i8*> [#uses=1]
  store i8 46, i8* %1, align 1
  %2 = getelementptr inbounds [6 x i8]* %str1, i32 0, i32 2 ; <i8*> [#uses=1]
  store i8 111, i8* %2, align 1
  %3 = getelementptr inbounds [6 x i8]* %str1, i32 0, i32 3 ; <i8*> [#uses=1]
  store i8 117, i8* %3, align 1
  %4 = getelementptr inbounds [6 x i8]* %str1, i32 0, i32 4 ; <i8*> [#uses=1]
  store i8 116, i8* %4, align 1
  %5 = getelementptr inbounds [6 x i8]* %str1, i32 0, i32 5 ; <i8*> [#uses=1]
  store i8 0, i8* %5, align 1
  %str21 = getelementptr inbounds [10 x i8]* %str2, i32 0, i32 0 ; <i8*> [#uses=2]
  call void @llvm.memcpy.i32(i8* %str21, i8* getelementptr inbounds ([10 x i8]* @.str9, i32 0, i32 0), i32 10, i32 1)
  %str32 = getelementptr inbounds [11 x i8]* %str3, i32 0, i32 0 ; <i8*> [#uses=2]
  call void @llvm.memcpy.i32(i8* %str32, i8* getelementptr inbounds ([11 x i8]* @.str10, i32 0, i32 0), i32 11, i32 1)
  %str43 = getelementptr inbounds [13 x i8]* %str4, i32 0, i32 0 ; <i8*> [#uses=2]
  call void @llvm.memcpy.i32(i8* %str43, i8* getelementptr inbounds ([13 x i8]* @.str11, i32 0, i32 0), i32 13, i32 1)
  %str54 = getelementptr inbounds [15 x i8]* %str5, i32 0, i32 0 ; <i8*> [#uses=2]
  call void @llvm.memcpy.i32(i8* %str54, i8* getelementptr inbounds ([15 x i8]* @.str12, i32 0, i32 0), i32 15, i32 1)
  %6 = getelementptr inbounds [6 x i8*]* %ActualArgs, i32 0, i32 0 ; <i8**> [#uses=1]
  %7 = getelementptr inbounds [6 x i8*]* %ActualArgs, i32 0, i32 1 ; <i8**> [#uses=1]
  %8 = getelementptr inbounds [6 x i8*]* %ActualArgs, i32 0, i32 2 ; <i8**> [#uses=1]
  %9 = getelementptr inbounds [6 x i8*]* %ActualArgs, i32 0, i32 3 ; <i8**> [#uses=1]
  %10 = getelementptr inbounds [6 x i8*]* %ActualArgs, i32 0, i32 4 ; <i8**> [#uses=1]
  %11 = getelementptr inbounds [6 x i8*]* %ActualArgs, i32 0, i32 5 ; <i8**> [#uses=1]
  store i8* null, i8** %11, align 4
  store i8* %0, i8** %6, align 4
  store i8* %str21, i8** %7, align 4
  store i8* %str32, i8** %8, align 4
  store i8* %str43, i8** %9, align 4
  store i8* %str54, i8** %10, align 4
  br label %bb10

bb7:                                              ; preds = %bb10
  %scevgep10 = getelementptr [6 x i8*]* %ActualArgs, i32 0, i32 %indvar8 ; <i8**> [#uses=1]
  %12 = load i8** %scevgep10                      ; <i8*> [#uses=1]
  %13 = load i8* %12                              ; <i8> [#uses=1]
  %14 = sext i8 %13 to i32                        ; <i32> [#uses=1]
  %15 = call i32 @isalpha(i32 %14) nounwind readonly ; <i32> [#uses=1]
  %16 = icmp eq i32 %15, 0                        ; <i1> [#uses=1]
  br i1 %16, label %bb8, label %bb9

bb8:                                              ; preds = %bb7
  %17 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([51 x i8]* @.str4, i32 0, i32 0), i8* %0) nounwind ; <i32> [#uses=0]
  %18 = call i32 @puts(i8* getelementptr inbounds ([60 x i8]* @.str5, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  call void @exit(i32 1) noreturn nounwind
  unreachable

bb9:                                              ; preds = %bb7
  %phitmp11 = add i32 %indvar8, 1                 ; <i32> [#uses=1]
  br label %bb10

bb10:                                             ; preds = %bb9, %entry
  %indvar8 = phi i32 [ 1, %entry ], [ %phitmp11, %bb9 ] ; <i32> [#uses=3]
  %19 = icmp slt i32 %indvar8, 5                  ; <i1> [#uses=1]
  br i1 %19, label %bb7, label %bb11

bb11:                                             ; preds = %bb10
  %20 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([29 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str14, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str14, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @.str15, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str16, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str14, i32 0, i32 0)) ; <i32> [#uses=0]
  %21 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([35 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str18, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str19, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str20, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str21, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str20, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str21, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str22, i32 0, i32 0)) ; <i32> [#uses=0]
  %22 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([29 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str23, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str24, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str25, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str25, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str26, i32 0, i32 0)) ; <i32> [#uses=0]
  br label %bb18

bb12:                                             ; preds = %bb18
  %scevgep = getelementptr [6 x i8*]* %ActualArgs, i32 0, i32 %indvar ; <i8**> [#uses=1]
  %23 = load i8** %scevgep                        ; <i8*> [#uses=1]
  %24 = call i8* @strtok(i8* noalias %23, i8* noalias getelementptr inbounds ([2 x i8]* @.str27, i32 0, i32 0)) nounwind ; <i8*> [#uses=3]
  %25 = call i8* @strtok(i8* noalias null, i8* noalias getelementptr inbounds ([1 x i8]* @.str14, i32 0, i32 0)) nounwind ; <i8*> [#uses=2]
  %26 = icmp eq i8* %25, null                     ; <i1> [#uses=1]
  br i1 %26, label %bb13, label %bb14

bb13:                                             ; preds = %bb12
  %27 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([39 x i8]* @.str28, i32 0, i32 0), i8* %24) ; <i32> [#uses=0]
  br label %bb17

bb14:                                             ; preds = %bb12
  %28 = call i32 @strtol(i8* noalias nocapture %25, i8** noalias null, i32 0) nounwind readonly ; <i32> [#uses=6]
  br label %bb3.i

bb.i:                                             ; preds = %bb3.i
  %scevgep.i = getelementptr [4 x %struct.Benchmark*]* @_ZN9Benchmark4listE, i32 0, i32 %38 ; <%struct.Benchmark**> [#uses=1]
  %29 = load %struct.Benchmark** %scevgep.i, align 4 ; <%struct.Benchmark*> [#uses=15]
  %30 = getelementptr inbounds %struct.Benchmark* %29, i32 0, i32 0 ; <i32 (...)***> [#uses=13]
  %31 = load i32 (...)*** %30, align 4            ; <i32 (...)**> [#uses=1]
  %32 = load i32 (...)** %31, align 4             ; <i32 (...)*> [#uses=1]
  %33 = bitcast i32 (...)* %32 to i8* (%struct.Benchmark*)* ; <i8* (%struct.Benchmark*)*> [#uses=1]
  %34 = call i8* %33(%struct.Benchmark* %29)      ; <i8*> [#uses=1]
  %35 = call i32 @strcmp(i8* %24, i8* %34) nounwind readonly ; <i32> [#uses=1]
  %36 = icmp eq i32 %35, 0                        ; <i1> [#uses=1]
  br i1 %36, label %_ZN9Benchmark4findEPKc.exit, label %bb2.i

bb2.i:                                            ; preds = %bb.i
  %37 = add i32 %38, 1                            ; <i32> [#uses=1]
  br label %bb3.i

bb3.i:                                            ; preds = %bb2.i, %bb14
  %38 = phi i32 [ 0, %bb14 ], [ %37, %bb2.i ]     ; <i32> [#uses=3]
  %39 = icmp slt i32 %38, 4                       ; <i1> [#uses=1]
  br i1 %39, label %bb.i, label %bb15

_ZN9Benchmark4findEPKc.exit:                      ; preds = %bb.i
  %40 = icmp eq %struct.Benchmark* %29, null      ; <i1> [#uses=1]
  br i1 %40, label %bb15, label %bb2.i.i

bb15:                                             ; preds = %_ZN9Benchmark4findEPKc.exit, %bb3.i
  %41 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([35 x i8]* @.str29, i32 0, i32 0), i8* %24) ; <i32> [#uses=0]
  call void @abort() noreturn nounwind
  unreachable

bb2.i.i:                                          ; preds = %_ZN9Benchmark4findEPKc.exit
  %42 = load i32 (...)*** %30, align 4            ; <i32 (...)**> [#uses=1]
  %43 = getelementptr inbounds i32 (...)** %42, i32 1 ; <i32 (...)**> [#uses=1]
  %44 = load i32 (...)** %43, align 4             ; <i32 (...)*> [#uses=1]
  %45 = bitcast i32 (...)* %44 to void (%struct.Benchmark*)* ; <void (%struct.Benchmark*)*> [#uses=1]
  call void %45(%struct.Benchmark* %29)
  %46 = load i32 (...)*** %30, align 4            ; <i32 (...)**> [#uses=1]
  %47 = ptrtoint i32 (...)** %46 to i32           ; <i32> [#uses=1]
  %48 = add i32 %47, 8                            ; <i32> [#uses=1]
  %49 = inttoptr i32 %48 to i32 (...)**           ; <i32 (...)**> [#uses=1]
  %50 = load i32 (...)** %49                      ; <i32 (...)*> [#uses=1]
  %51 = bitcast i32 (...)* %50 to void (%struct.Benchmark*)* ; <void (%struct.Benchmark*)*> [#uses=1]
  call void %51(%struct.Benchmark* %29)
  %52 = load i32 (...)*** %30, align 4            ; <i32 (...)**> [#uses=1]
  %53 = getelementptr inbounds i32 (...)** %52, i32 1 ; <i32 (...)**> [#uses=1]
  %54 = load i32 (...)** %53, align 4             ; <i32 (...)*> [#uses=1]
  %55 = bitcast i32 (...)* %54 to void (%struct.Benchmark*)* ; <void (%struct.Benchmark*)*> [#uses=1]
  call void %55(%struct.Benchmark* %29)
  %56 = call i32 @clock() nounwind                ; <i32> [#uses=0]
  %57 = icmp sgt i32 %28, 0                       ; <i1> [#uses=2]
  br i1 %57, label %bb3.i.i, label %bb2.i3.i

bb3.i.i:                                          ; preds = %bb3.i.i, %bb2.i.i
  %k.01.i.i = phi i32 [ %64, %bb3.i.i ], [ 0, %bb2.i.i ] ; <i32> [#uses=1]
  %58 = load i32 (...)*** %30, align 4            ; <i32 (...)**> [#uses=1]
  %59 = ptrtoint i32 (...)** %58 to i32           ; <i32> [#uses=1]
  %60 = add i32 %59, 8                            ; <i32> [#uses=1]
  %61 = inttoptr i32 %60 to i32 (...)**           ; <i32 (...)**> [#uses=1]
  %62 = load i32 (...)** %61                      ; <i32 (...)*> [#uses=1]
  %63 = bitcast i32 (...)* %62 to void (%struct.Benchmark*)* ; <void (%struct.Benchmark*)*> [#uses=1]
  call void %63(%struct.Benchmark* %29)
  %64 = add nsw i32 %k.01.i.i, 1                  ; <i32> [#uses=2]
  %exitcond2.i.i = icmp eq i32 %64, %28           ; <i1> [#uses=1]
  br i1 %exitcond2.i.i, label %bb2.i3.i, label %bb3.i.i

bb2.i3.i:                                         ; preds = %bb3.i.i, %bb2.i.i
  %65 = call i32 @clock() nounwind                ; <i32> [#uses=0]
  %66 = load i32 (...)*** %30, align 4            ; <i32 (...)**> [#uses=1]
  %67 = getelementptr inbounds i32 (...)** %66, i32 4 ; <i32 (...)**> [#uses=1]
  %68 = load i32 (...)** %67, align 4             ; <i32 (...)*> [#uses=1]
  %69 = bitcast i32 (...)* %68 to void (%struct.Benchmark*, i32, double*, double*)* ; <void (%struct.Benchmark*, i32, double*, double*)*> [#uses=1]
  call void %69(%struct.Benchmark* %29, i32 %28, double* %flops.i.i, double* %c_checksum.i)
  %70 = load i32 (...)*** %30, align 4            ; <i32 (...)**> [#uses=1]
  %71 = getelementptr inbounds i32 (...)** %70, i32 1 ; <i32 (...)**> [#uses=1]
  %72 = load i32 (...)** %71, align 4             ; <i32 (...)*> [#uses=1]
  %73 = bitcast i32 (...)* %72 to void (%struct.Benchmark*)* ; <void (%struct.Benchmark*)*> [#uses=1]
  call void %73(%struct.Benchmark* %29)
  %74 = load i32 (...)*** %30, align 4            ; <i32 (...)**> [#uses=1]
  %75 = ptrtoint i32 (...)** %74 to i32           ; <i32> [#uses=1]
  %76 = add i32 %75, 12                           ; <i32> [#uses=1]
  %77 = inttoptr i32 %76 to i32 (...)**           ; <i32 (...)**> [#uses=1]
  %78 = load i32 (...)** %77                      ; <i32 (...)*> [#uses=1]
  %79 = bitcast i32 (...)* %78 to void (%struct.Benchmark*)* ; <void (%struct.Benchmark*)*> [#uses=1]
  call void %79(%struct.Benchmark* %29)
  %80 = load i32 (...)*** %30, align 4            ; <i32 (...)**> [#uses=1]
  %81 = getelementptr inbounds i32 (...)** %80, i32 1 ; <i32 (...)**> [#uses=1]
  %82 = load i32 (...)** %81, align 4             ; <i32 (...)*> [#uses=1]
  %83 = bitcast i32 (...)* %82 to void (%struct.Benchmark*)* ; <void (%struct.Benchmark*)*> [#uses=1]
  call void %83(%struct.Benchmark* %29)
  %84 = call i32 @clock() nounwind                ; <i32> [#uses=0]
  br i1 %57, label %bb3.i7.i, label %_ZNK9Benchmark8time_oneEMS_KFvvEiRdS2_S2_.exit8.i

bb3.i7.i:                                         ; preds = %bb3.i7.i, %bb2.i3.i
  %k.01.i5.i = phi i32 [ %91, %bb3.i7.i ], [ 0, %bb2.i3.i ] ; <i32> [#uses=1]
  %85 = load i32 (...)*** %30, align 4            ; <i32 (...)**> [#uses=1]
  %86 = ptrtoint i32 (...)** %85 to i32           ; <i32> [#uses=1]
  %87 = add i32 %86, 12                           ; <i32> [#uses=1]
  %88 = inttoptr i32 %87 to i32 (...)**           ; <i32 (...)**> [#uses=1]
  %89 = load i32 (...)** %88                      ; <i32 (...)*> [#uses=1]
  %90 = bitcast i32 (...)* %89 to void (%struct.Benchmark*)* ; <void (%struct.Benchmark*)*> [#uses=1]
  call void %90(%struct.Benchmark* %29)
  %91 = add nsw i32 %k.01.i5.i, 1                 ; <i32> [#uses=2]
  %exitcond2.i6.i = icmp eq i32 %91, %28          ; <i1> [#uses=1]
  br i1 %exitcond2.i6.i, label %_ZNK9Benchmark8time_oneEMS_KFvvEiRdS2_S2_.exit8.i, label %bb3.i7.i

_ZNK9Benchmark8time_oneEMS_KFvvEiRdS2_S2_.exit8.i: ; preds = %bb3.i7.i, %bb2.i3.i
  %92 = call i32 @clock() nounwind                ; <i32> [#uses=0]
  %93 = load i32 (...)*** %30, align 4            ; <i32 (...)**> [#uses=1]
  %94 = getelementptr inbounds i32 (...)** %93, i32 4 ; <i32 (...)**> [#uses=1]
  %95 = load i32 (...)** %94, align 4             ; <i32 (...)*> [#uses=1]
  %96 = bitcast i32 (...)* %95 to void (%struct.Benchmark*, i32, double*, double*)* ; <void (%struct.Benchmark*, i32, double*, double*)*> [#uses=1]
  call void %96(%struct.Benchmark* %29, i32 %28, double* %flops.i1.i, double* %oop_checksum.i)
  %97 = load double* %c_checksum.i, align 8       ; <double> [#uses=4]
  %98 = load double* %oop_checksum.i, align 8     ; <double> [#uses=4]
  %99 = fsub double %97, %98                      ; <double> [#uses=1]
  %100 = fcmp olt double %97, %98                 ; <i1> [#uses=1]
  %iftmp.48.0.i = select i1 %100, double %97, double %98 ; <double> [#uses=1]
  %101 = fdiv double %99, %iftmp.48.0.i           ; <double> [#uses=3]
  %102 = fcmp ogt double %101, 0x3D10000000000000 ; <i1> [#uses=1]
  %103 = fcmp olt double %101, 0xBD10000000000000 ; <i1> [#uses=1]
  %or.cond.i = or i1 %102, %103                   ; <i1> [#uses=1]
  br i1 %or.cond.i, label %bb10.i, label %_ZNK9Benchmark9time_bothEi.exit

bb10.i:                                           ; preds = %_ZNK9Benchmark8time_oneEMS_KFvvEiRdS2_S2_.exit8.i
  %104 = load i32 (...)*** %30, align 4           ; <i32 (...)**> [#uses=1]
  %105 = load i32 (...)** %104, align 4           ; <i32 (...)*> [#uses=1]
  %106 = bitcast i32 (...)* %105 to i8* (%struct.Benchmark*)* ; <i8* (%struct.Benchmark*)*> [#uses=1]
  %107 = call i8* %106(%struct.Benchmark* %29)    ; <i8*> [#uses=1]
  %108 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([75 x i8]* @.str6, i32 0, i32 0), i8* %107, double %101, double %97, double %98) ; <i32> [#uses=0]
  br label %_ZNK9Benchmark9time_bothEi.exit

_ZNK9Benchmark9time_bothEi.exit:                  ; preds = %bb10.i, %_ZNK9Benchmark8time_oneEMS_KFvvEiRdS2_S2_.exit8.i
  %109 = load i32 (...)*** %30, align 4           ; <i32 (...)**> [#uses=1]
  %110 = load i32 (...)** %109, align 4           ; <i32 (...)*> [#uses=1]
  %111 = bitcast i32 (...)* %110 to i8* (%struct.Benchmark*)* ; <i8* (%struct.Benchmark*)*> [#uses=1]
  %112 = call i8* %111(%struct.Benchmark* %29)    ; <i8*> [#uses=1]
  %113 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([12 x i8]* @.str7, i32 0, i32 0), i8* %112, i32 %28) ; <i32> [#uses=0]
  br label %bb17

bb17:                                             ; preds = %_ZNK9Benchmark9time_bothEi.exit, %bb13
  %phitmp = add i32 %indvar, 1                    ; <i32> [#uses=1]
  br label %bb18

bb18:                                             ; preds = %bb17, %bb11
  %indvar = phi i32 [ 1, %bb11 ], [ %phitmp, %bb17 ] ; <i32> [#uses=3]
  %114 = icmp slt i32 %indvar, 5                  ; <i1> [#uses=1]
  br i1 %114, label %bb12, label %bb19

bb19:                                             ; preds = %bb18
  %115 = call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @.str30, i32 0, i32 0)) ; <i32> [#uses=0]
  ret i32 0
}

declare void @llvm.memcpy.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind

declare i32 @isalpha(i32) nounwind readonly

declare i8* @strtok(i8* noalias, i8* noalias nocapture) nounwind

declare i32 @strtol(i8* noalias, i8** noalias nocapture, i32) nounwind

declare void @abort() noreturn nounwind
