; ModuleID = 'moments.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct..0._10 = type { i32 }
%struct..1__pthread_mutex_s = type { i32, i32, i32, i32, i32, %struct..0._10 }
%"struct.moments<double>" = type { double, double, double, double, double, double, double }
%struct.pthread_attr_t = type { i32, [32 x i8] }
%struct.pthread_mutex_t = type { %struct..1__pthread_mutex_s }
%"struct.std::_Vector_base<double,std::allocator<double> >" = type { %"struct.std::_Vector_base<double,std::allocator<double> >::_Vector_impl" }
%"struct.std::_Vector_base<double,std::allocator<double> >::_Vector_impl" = type { double*, double*, double* }
%"struct.std::vector<double,std::allocator<double> >" = type { %"struct.std::_Vector_base<double,std::allocator<double> >" }

@.str = private constant [22 x i8] c"vector::_M_insert_aux\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str1 = private constant [24 x i8] c"n:                  %d\0A\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str2 = private constant [24 x i8] c"median:             %f\0A\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str3 = private constant [24 x i8] c"mean:               %f\0A\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str4 = private constant [24 x i8] c"average_deviation:  %f\0A\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str5 = private constant [24 x i8] c"standard_deviation: %f\0A\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str6 = private constant [24 x i8] c"variance:           %f\0A\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str7 = private constant [24 x i8] c"skew:               %f\0A\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str8 = private constant [24 x i8] c"kurtosis:           %f\0A\00", align 1 ; <[24 x i8]*> [#uses=1]

@_ZL20__gthrw_pthread_oncePiPFvvE = alias weak i32 (i32*, void ()*)* @pthread_once ; <i32 (i32*, void ()*)*> [#uses=0]
@_ZL27__gthrw_pthread_getspecificj = alias weak i8* (i32)* @pthread_getspecific ; <i8* (i32)*> [#uses=0]
@_ZL27__gthrw_pthread_setspecificjPKv = alias weak i32 (i32, i8*)* @pthread_setspecific ; <i32 (i32, i8*)*> [#uses=0]
@_ZL22__gthrw_pthread_createPmPK14pthread_attr_tPFPvS3_ES3_ = alias weak i32 (i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)* @pthread_create ; <i32 (i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)*> [#uses=0]
@_ZL22__gthrw_pthread_cancelm = alias weak i32 (i32)* @pthread_cancel ; <i32 (i32)*> [#uses=0]
@_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_lock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL29__gthrw_pthread_mutex_trylockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_trylock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_unlock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL26__gthrw_pthread_mutex_initP15pthread_mutex_tPK19pthread_mutexattr_t = alias weak i32 (%struct.pthread_mutex_t*, %struct..0._10*)* @pthread_mutex_init ; <i32 (%struct.pthread_mutex_t*, %struct..0._10*)*> [#uses=0]
@_ZL26__gthrw_pthread_key_createPjPFvPvE = alias weak i32 (i32*, void (i8*)*)* @pthread_key_create ; <i32 (i32*, void (i8*)*)*> [#uses=0]
@_ZL26__gthrw_pthread_key_deletej = alias weak i32 (i32)* @pthread_key_delete ; <i32 (i32)*> [#uses=0]
@_ZL30__gthrw_pthread_mutexattr_initP19pthread_mutexattr_t = alias weak i32 (%struct..0._10*)* @pthread_mutexattr_init ; <i32 (%struct..0._10*)*> [#uses=0]
@_ZL33__gthrw_pthread_mutexattr_settypeP19pthread_mutexattr_ti = alias weak i32 (%struct..0._10*, i32)* @pthread_mutexattr_settype ; <i32 (%struct..0._10*, i32)*> [#uses=0]
@_ZL33__gthrw_pthread_mutexattr_destroyP19pthread_mutexattr_t = alias weak i32 (%struct..0._10*)* @pthread_mutexattr_destroy ; <i32 (%struct..0._10*)*> [#uses=0]

define i32 @main(i32 %argc, i8** nocapture %argv) {
entry:
  %0 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb2

bb:                                               ; preds = %entry
  %1 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %2 = load i8** %1, align 4                      ; <i8*> [#uses=1]
  %3 = call i32 @atoi(i8* %2) nounwind readonly   ; <i32> [#uses=1]
  br label %bb2

bb2:                                              ; preds = %bb, %entry
  %iftmp.98.0 = phi i32 [ %3, %bb ], [ 5000000, %entry ] ; <i32> [#uses=1]
  br label %bb4

bb3:                                              ; preds = %bb4
  %4 = uitofp i32 %26 to double                   ; <double> [#uses=2]
  %5 = icmp eq double* %v.0.0.1.2, %v.0.0.2.2     ; <i1> [#uses=1]
  br i1 %5, label %bb1.i5, label %bb.i

bb.i:                                             ; preds = %bb3
  %6 = icmp eq double* %v.0.0.1.2, null           ; <i1> [#uses=1]
  br i1 %6, label %_ZN9__gnu_cxx13new_allocatorIdE9constructEPdRKd.exit.i, label %bb.i.i

bb.i.i:                                           ; preds = %bb.i
  store double %4, double* %v.0.0.1.2, align 8
  br label %_ZN9__gnu_cxx13new_allocatorIdE9constructEPdRKd.exit.i

_ZN9__gnu_cxx13new_allocatorIdE9constructEPdRKd.exit.i: ; preds = %bb.i.i, %bb.i
  %7 = getelementptr inbounds double* %v.0.0.1.2, i32 1 ; <double*> [#uses=1]
  br label %invcont

bb1.i5:                                           ; preds = %bb3
  %8 = ptrtoint double* %v.0.0.1.2 to i32         ; <i32> [#uses=1]
  %9 = ptrtoint double* %v.0.0.0.2 to i32         ; <i32> [#uses=1]
  %10 = sub i32 %8, %9                            ; <i32> [#uses=3]
  %11 = ashr i32 %10, 3                           ; <i32> [#uses=4]
  switch i32 %11, label %bb4.i [
    i32 536870911, label %bb2.i
    i32 0, label %bb6.i
  ]

bb2.i:                                            ; preds = %bb1.i5
  invoke void @_ZSt20__throw_length_errorPKc(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0)) noreturn
          to label %.noexc unwind label %lpad

.noexc:                                           ; preds = %bb2.i
  unreachable

bb4.i:                                            ; preds = %bb1.i5
  %12 = ashr i32 %10, 2                           ; <i32> [#uses=1]
  %13 = and i32 %12, -2                           ; <i32> [#uses=1]
  br label %bb6.i

bb6.i:                                            ; preds = %bb4.i, %bb1.i5
  %iftmp.111.0.i = phi i32 [ %13, %bb4.i ], [ 1, %bb1.i5 ] ; <i32> [#uses=3]
  %14 = icmp ult i32 %iftmp.111.0.i, %11          ; <i1> [#uses=1]
  br i1 %14, label %invcont.i, label %bb8.i

bb8.i:                                            ; preds = %bb6.i
  %15 = icmp ugt i32 %iftmp.111.0.i, 536870911    ; <i1> [#uses=1]
  br i1 %15, label %bb.i.i.i6, label %invcont.i

bb.i.i.i6:                                        ; preds = %bb8.i
  invoke void @_ZSt17__throw_bad_allocv() noreturn
          to label %.noexc7 unwind label %lpad

.noexc7:                                          ; preds = %bb.i.i.i6
  unreachable

invcont.i:                                        ; preds = %bb8.i, %bb6.i
  %__len.0.reg2mem.0.i = phi i32 [ 536870911, %bb6.i ], [ %iftmp.111.0.i, %bb8.i ] ; <i32> [#uses=2]
  %16 = shl i32 %__len.0.reg2mem.0.i, 3           ; <i32> [#uses=1]
  %17 = invoke i8* @_Znwj(i32 %16)
          to label %.noexc8 unwind label %lpad    ; <i8*> [#uses=2]

.noexc8:                                          ; preds = %invcont.i
  %18 = bitcast i8* %17 to double*                ; <double*> [#uses=4]
  %19 = bitcast double* %v.0.0.0.2 to i8*         ; <i8*> [#uses=2]
  call void @llvm.memmove.i32(i8* %17, i8* %19, i32 %10, i32 8) nounwind
  %20 = getelementptr inbounds double* %18, i32 %11 ; <double*> [#uses=2]
  %21 = icmp eq double* %20, null                 ; <i1> [#uses=1]
  br i1 %21, label %bb33.i, label %bb.i5.i

bb.i5.i:                                          ; preds = %.noexc8
  store double %4, double* %20, align 8
  br label %bb33.i

bb33.i:                                           ; preds = %bb.i5.i, %.noexc8
  %.sum8.i = add i32 %11, 1                       ; <i32> [#uses=1]
  %22 = getelementptr inbounds double* %18, i32 %.sum8.i ; <double*> [#uses=1]
  %23 = icmp eq double* %v.0.0.0.2, null          ; <i1> [#uses=1]
  br i1 %23, label %_ZNSt6vectorIdSaIdEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPdS1_EERKd.exit, label %bb.i1.i

bb.i1.i:                                          ; preds = %bb33.i
  call void @_ZdlPv(i8* %19) nounwind
  br label %_ZNSt6vectorIdSaIdEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPdS1_EERKd.exit

_ZNSt6vectorIdSaIdEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPdS1_EERKd.exit: ; preds = %bb.i1.i, %bb33.i
  %24 = getelementptr inbounds double* %18, i32 %__len.0.reg2mem.0.i ; <double*> [#uses=1]
  br label %invcont

invcont:                                          ; preds = %_ZNSt6vectorIdSaIdEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPdS1_EERKd.exit, %_ZN9__gnu_cxx13new_allocatorIdE9constructEPdRKd.exit.i
  %v.0.0.2.1 = phi double* [ %24, %_ZNSt6vectorIdSaIdEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPdS1_EERKd.exit ], [ %v.0.0.2.2, %_ZN9__gnu_cxx13new_allocatorIdE9constructEPdRKd.exit.i ] ; <double*> [#uses=1]
  %v.0.0.1.1 = phi double* [ %22, %_ZNSt6vectorIdSaIdEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPdS1_EERKd.exit ], [ %7, %_ZN9__gnu_cxx13new_allocatorIdE9constructEPdRKd.exit.i ] ; <double*> [#uses=1]
  %v.0.0.0.1 = phi double* [ %18, %_ZNSt6vectorIdSaIdEE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPdS1_EERKd.exit ], [ %v.0.0.0.2, %_ZN9__gnu_cxx13new_allocatorIdE9constructEPdRKd.exit.i ] ; <double*> [#uses=1]
  %25 = add i32 %26, 1                            ; <i32> [#uses=1]
  br label %bb4

bb4:                                              ; preds = %invcont, %bb2
  %v.0.0.2.2 = phi double* [ null, %bb2 ], [ %v.0.0.2.1, %invcont ] ; <double*> [#uses=2]
  %v.0.0.1.2 = phi double* [ null, %bb2 ], [ %v.0.0.1.1, %invcont ] ; <double*> [#uses=13]
  %v.0.0.0.2 = phi double* [ null, %bb2 ], [ %v.0.0.0.1, %invcont ] ; <double*> [#uses=24]
  %26 = phi i32 [ 0, %bb2 ], [ %25, %invcont ]    ; <i32> [#uses=3]
  %27 = icmp eq i32 %iftmp.98.0, %26              ; <i1> [#uses=1]
  br i1 %27, label %invcont21, label %bb3

invcont21:                                        ; preds = %bb4
  %28 = icmp eq double* %v.0.0.0.2, %v.0.0.1.2    ; <i1> [#uses=3]
  br i1 %28, label %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i.thread, label %bb.i.i9

_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i.thread: ; preds = %invcont21
  %29 = ptrtoint double* %v.0.0.1.2 to i32        ; <i32> [#uses=1]
  %30 = ptrtoint double* %v.0.0.0.2 to i32        ; <i32> [#uses=1]
  %31 = sub i32 %29, %30                          ; <i32> [#uses=2]
  %32 = ashr i32 %31, 3                           ; <i32> [#uses=2]
  %33 = uitofp i32 %32 to double                  ; <double> [#uses=2]
  %34 = fdiv double 0.000000e+00, %33             ; <double> [#uses=1]
  br label %bb4.i11

bb.i.i9:                                          ; preds = %bb.i.i9, %invcont21
  %indvar.i.i = phi i32 [ %tmp.i, %bb.i.i9 ], [ 0, %invcont21 ] ; <i32> [#uses=2]
  %__init_addr.02.i.i = phi double [ %36, %bb.i.i9 ], [ 0.000000e+00, %invcont21 ] ; <double> [#uses=1]
  %tmp.i = add i32 %indvar.i.i, 1                 ; <i32> [#uses=2]
  %scevgep.i.i = getelementptr double* %v.0.0.0.2, i32 %tmp.i ; <double*> [#uses=1]
  %__first_addr.0.01.i.i = getelementptr double* %v.0.0.0.2, i32 %indvar.i.i ; <double*> [#uses=1]
  %35 = load double* %__first_addr.0.01.i.i, align 8 ; <double> [#uses=1]
  %36 = fadd double %35, %__init_addr.02.i.i      ; <double> [#uses=2]
  %37 = icmp eq double* %scevgep.i.i, %v.0.0.1.2  ; <i1> [#uses=1]
  br i1 %37, label %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i, label %bb.i.i9

_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i: ; preds = %bb.i.i9
  %38 = ptrtoint double* %v.0.0.1.2 to i32        ; <i32> [#uses=1]
  %39 = ptrtoint double* %v.0.0.0.2 to i32        ; <i32> [#uses=1]
  %40 = sub i32 %38, %39                          ; <i32> [#uses=3]
  %41 = ashr i32 %40, 3                           ; <i32> [#uses=3]
  %42 = uitofp i32 %41 to double                  ; <double> [#uses=3]
  %43 = fdiv double %36, %42                      ; <double> [#uses=3]
  br i1 %28, label %bb4.i11, label %bb.i10

bb.i10:                                           ; preds = %bb.i10, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i
  %44 = phi double [ %57, %bb.i10 ], [ 0.000000e+00, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i ] ; <double> [#uses=1]
  %45 = phi double [ %55, %bb.i10 ], [ 0.000000e+00, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i ] ; <double> [#uses=1]
  %46 = phi double [ %53, %bb.i10 ], [ 0.000000e+00, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i ] ; <double> [#uses=1]
  %47 = phi double [ %51, %bb.i10 ], [ 0.000000e+00, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i ] ; <double> [#uses=1]
  %indvar.i = phi i32 [ %tmp9.i, %bb.i10 ], [ 0, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i ] ; <i32> [#uses=2]
  %i.0.06.i = getelementptr double* %v.0.0.0.2, i32 %indvar.i ; <double*> [#uses=1]
  %48 = load double* %i.0.06.i, align 8           ; <double> [#uses=1]
  %49 = fsub double %48, %43                      ; <double> [#uses=5]
  %50 = call double @fabs(double %49) nounwind readnone ; <double> [#uses=1]
  %51 = fadd double %47, %50                      ; <double> [#uses=2]
  %52 = fmul double %49, %49                      ; <double> [#uses=2]
  %53 = fadd double %46, %52                      ; <double> [#uses=2]
  %54 = fmul double %52, %49                      ; <double> [#uses=2]
  %55 = fadd double %45, %54                      ; <double> [#uses=3]
  %56 = fmul double %54, %49                      ; <double> [#uses=1]
  %57 = fadd double %44, %56                      ; <double> [#uses=3]
  %tmp9.i = add i32 %indvar.i, 1                  ; <i32> [#uses=2]
  %scevgep.i = getelementptr double* %v.0.0.0.2, i32 %tmp9.i ; <double*> [#uses=1]
  %58 = icmp eq double* %scevgep.i, %v.0.0.1.2    ; <i1> [#uses=1]
  br i1 %58, label %bb4.i11, label %bb.i10

bb4.i11:                                          ; preds = %bb.i10, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i.thread
  %.reg2mem.0 = phi i32 [ %31, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i.thread ], [ %40, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i ], [ %40, %bb.i10 ] ; <i32> [#uses=1]
  %.reg2mem20.0 = phi i32 [ %32, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i.thread ], [ %41, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i ], [ %41, %bb.i10 ] ; <i32> [#uses=5]
  %.reg2mem27.0 = phi double [ %33, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i.thread ], [ %42, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i ], [ %42, %bb.i10 ] ; <double> [#uses=2]
  %.reg2mem31.0 = phi double [ %34, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i.thread ], [ %43, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i ], [ %43, %bb.i10 ] ; <double> [#uses=1]
  %m.6.1 = phi double [ 0.000000e+00, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i ], [ 0.000000e+00, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i.thread ], [ %57, %bb.i10 ] ; <double> [#uses=1]
  %m.5.1 = phi double [ 0.000000e+00, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i ], [ 0.000000e+00, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i.thread ], [ %55, %bb.i10 ] ; <double> [#uses=1]
  %59 = phi double [ 0.000000e+00, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i ], [ 0.000000e+00, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i.thread ], [ %57, %bb.i10 ] ; <double> [#uses=1]
  %60 = phi double [ 0.000000e+00, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i ], [ 0.000000e+00, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i.thread ], [ %55, %bb.i10 ] ; <double> [#uses=1]
  %61 = phi double [ 0.000000e+00, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i ], [ 0.000000e+00, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i.thread ], [ %53, %bb.i10 ] ; <double> [#uses=1]
  %62 = phi double [ 0.000000e+00, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i ], [ 0.000000e+00, %_ZSt10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET0_T_S8_S7_.exit.i.thread ], [ %51, %bb.i10 ] ; <double> [#uses=1]
  %63 = fdiv double %62, %.reg2mem27.0            ; <double> [#uses=1]
  %64 = add i32 %.reg2mem20.0, -1                 ; <i32> [#uses=1]
  %65 = uitofp i32 %64 to double                  ; <double> [#uses=1]
  %66 = fdiv double %61, %65                      ; <double> [#uses=5]
  %67 = call double @llvm.sqrt.f64(double %66) nounwind ; <double> [#uses=2]
  %68 = fcmp une double %66, 0.000000e+00         ; <i1> [#uses=1]
  br i1 %68, label %bb5.i, label %bb6.i12

bb5.i:                                            ; preds = %bb4.i11
  %69 = fmul double %.reg2mem27.0, %66            ; <double> [#uses=2]
  %70 = fmul double %69, %67                      ; <double> [#uses=1]
  %71 = fdiv double %60, %70                      ; <double> [#uses=1]
  %72 = fmul double %69, %66                      ; <double> [#uses=1]
  %73 = fdiv double %59, %72                      ; <double> [#uses=1]
  %74 = fadd double %73, -3.000000e+00            ; <double> [#uses=1]
  br label %bb6.i12

bb6.i12:                                          ; preds = %bb5.i, %bb4.i11
  %m.6.0 = phi double [ %74, %bb5.i ], [ %m.6.1, %bb4.i11 ] ; <double> [#uses=1]
  %m.5.0 = phi double [ %71, %bb5.i ], [ %m.5.1, %bb4.i11 ] ; <double> [#uses=1]
  %75 = ashr i32 %.reg2mem.0, 4                   ; <i32> [#uses=1]
  %76 = and i32 %75, 2147483647                   ; <i32> [#uses=3]
  %77 = getelementptr inbounds double* %v.0.0.0.2, i32 %76 ; <double*> [#uses=7]
  %78 = icmp eq double* %77, %v.0.0.1.2           ; <i1> [#uses=1]
  %or.cond.i.i = or i1 %78, %28                   ; <i1> [#uses=1]
  br i1 %or.cond.i.i, label %_ZSt11nth_elementIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_S7_.exit.i, label %bb6.critedge.i.i

bb6.critedge.i.i:                                 ; preds = %bb6.i12
  %79 = icmp eq i32 %.reg2mem20.0, 1              ; <i1> [#uses=1]
  br i1 %79, label %bb17.outer.i.i, label %bb.i.i.i13

bb.i.i.i13:                                       ; preds = %bb.i.i.i13, %bb6.critedge.i.i
  %__n_addr.02.i.i.i = phi i32 [ %82, %bb.i.i.i13 ], [ %.reg2mem20.0, %bb6.critedge.i.i ] ; <i32> [#uses=1]
  %80 = phi i32 [ %81, %bb.i.i.i13 ], [ 0, %bb6.critedge.i.i ] ; <i32> [#uses=2]
  %81 = add i32 %80, 1                            ; <i32> [#uses=1]
  %82 = ashr i32 %__n_addr.02.i.i.i, 1            ; <i32> [#uses=2]
  %phitmp.i.i.i = icmp eq i32 %82, 1              ; <i1> [#uses=1]
  br i1 %phitmp.i.i.i, label %_ZSt4__lgIiET_S0_.exit.loopexit.i.i, label %bb.i.i.i13

_ZSt4__lgIiET_S0_.exit.loopexit.i.i:              ; preds = %bb.i.i.i13
  %tmp.i.i.i = shl i32 %80, 1                     ; <i32> [#uses=1]
  %phitmp.i.i = add i32 %tmp.i.i.i, 2             ; <i32> [#uses=1]
  br label %bb17.outer.i.i

bb.i1.i14:                                        ; preds = %bb17.i.i
  %83 = icmp eq i32 %__depth_limit_addr.0.ph.i.i, %indvar.i5.i ; <i1> [#uses=1]
  br i1 %83, label %bb1.i.i, label %bb10.i.i

bb1.i.i:                                          ; preds = %bb.i1.i14
  %.sum = add i32 %76, 1                          ; <i32> [#uses=3]
  %84 = getelementptr inbounds double* %v.0.0.0.2, i32 %.sum ; <double*> [#uses=2]
  %85 = ptrtoint double* %84 to i32               ; <i32> [#uses=1]
  %86 = sub i32 %85, %167                         ; <i32> [#uses=1]
  %87 = ashr i32 %86, 3                           ; <i32> [#uses=8]
  %88 = icmp slt i32 %87, 2                       ; <i1> [#uses=1]
  br i1 %88, label %_ZSt9make_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i.i.i, label %bb.i.i1.i.i

bb.i.i1.i.i:                                      ; preds = %bb1.i.i
  %89 = add i32 %87, -2                           ; <i32> [#uses=1]
  %90 = sdiv i32 %89, 2                           ; <i32> [#uses=3]
  %tmp3.i.i.i.i = shl i32 %90, 1                  ; <i32> [#uses=2]
  %tmp5.i.i.i.i = add i32 %tmp3.i.i.i.i, 2        ; <i32> [#uses=1]
  br label %bb1.i.i.i.i

bb1.i.i.i.i:                                      ; preds = %bb2.i.i.i.i, %bb.i.i1.i.i
  %indvar.i.i2.i.i = phi i32 [ 0, %bb.i.i1.i.i ], [ %indvar.next.i.i3.i.i, %bb2.i.i.i.i ] ; <i32> [#uses=4]
  %storemerge.i.i.i.i = sub i32 %90, %indvar.i.i2.i.i ; <i32> [#uses=4]
  %tmp2.i.i.i.i = mul i32 %indvar.i.i2.i.i, -2    ; <i32> [#uses=2]
  %storemerge.in4.i.i.i.i.i = add i32 %tmp2.i.i.i.i, %tmp3.i.i.i.i ; <i32> [#uses=2]
  %storemerge6.i.i.i.i.i = add i32 %tmp2.i.i.i.i, %tmp5.i.i.i.i ; <i32> [#uses=3]
  %scevgep.i.i.i.i = getelementptr double* %__first_addr.0.0.i.i, i32 %storemerge.i.i.i.i ; <double*> [#uses=1]
  %91 = load double* %scevgep.i.i.i.i, align 8    ; <double> [#uses=2]
  %92 = icmp slt i32 %storemerge6.i.i.i.i.i, %87  ; <i1> [#uses=1]
  br i1 %92, label %bb.i.i7.i.i.i, label %bb4.i.i11.i.i.i

bb.i.i7.i.i.i:                                    ; preds = %bb.i.i7.i.i.i, %bb1.i.i.i.i
  %storemerge7.i.i1.i.i.i = phi i32 [ %storemerge.i.i6.i.i.i, %bb.i.i7.i.i.i ], [ %storemerge6.i.i.i.i.i, %bb1.i.i.i.i ] ; <i32> [#uses=2]
  %storemerge.in5.i.i2.i.i.i = phi i32 [ %phitmp.i.i5.i.i.i, %bb.i.i7.i.i.i ], [ %storemerge.in4.i.i.i.i.i, %bb1.i.i.i.i ] ; <i32> [#uses=1]
  %storemerge12.i.i3.i.i.i = phi i32 [ %__secondChild.0.i.i4.i.i.i, %bb.i.i7.i.i.i ], [ %storemerge.i.i.i.i, %bb1.i.i.i.i ] ; <i32> [#uses=1]
  %93 = getelementptr inbounds double* %__first_addr.0.0.i.i, i32 %storemerge7.i.i1.i.i.i ; <double*> [#uses=1]
  %94 = load double* %93, align 8                 ; <double> [#uses=1]
  %95 = or i32 %storemerge.in5.i.i2.i.i.i, 1      ; <i32> [#uses=2]
  %96 = getelementptr inbounds double* %__first_addr.0.0.i.i, i32 %95 ; <double*> [#uses=1]
  %97 = load double* %96, align 8                 ; <double> [#uses=1]
  %98 = fcmp olt double %94, %97                  ; <i1> [#uses=1]
  %__secondChild.0.i.i4.i.i.i = select i1 %98, i32 %95, i32 %storemerge7.i.i1.i.i.i ; <i32> [#uses=4]
  %99 = getelementptr inbounds double* %__first_addr.0.0.i.i, i32 %storemerge12.i.i3.i.i.i ; <double*> [#uses=1]
  %100 = getelementptr inbounds double* %__first_addr.0.0.i.i, i32 %__secondChild.0.i.i4.i.i.i ; <double*> [#uses=1]
  %101 = load double* %100, align 8               ; <double> [#uses=1]
  store double %101, double* %99, align 8
  %phitmp.i.i5.i.i.i = shl i32 %__secondChild.0.i.i4.i.i.i, 1 ; <i32> [#uses=3]
  %storemerge.i.i6.i.i.i = add i32 %phitmp.i.i5.i.i.i, 2 ; <i32> [#uses=3]
  %102 = icmp slt i32 %storemerge.i.i6.i.i.i, %87 ; <i1> [#uses=1]
  br i1 %102, label %bb.i.i7.i.i.i, label %bb4.i.i11.i.i.i

bb4.i.i11.i.i.i:                                  ; preds = %bb.i.i7.i.i.i, %bb1.i.i.i.i
  %storemerge.lcssa.i.i8.i.i.i = phi i32 [ %storemerge6.i.i.i.i.i, %bb1.i.i.i.i ], [ %storemerge.i.i6.i.i.i, %bb.i.i7.i.i.i ] ; <i32> [#uses=1]
  %storemerge.in.lcssa.i.i9.i.i.i = phi i32 [ %storemerge.in4.i.i.i.i.i, %bb1.i.i.i.i ], [ %phitmp.i.i5.i.i.i, %bb.i.i7.i.i.i ] ; <i32> [#uses=1]
  %storemerge1.lcssa.i.i10.i.i.i = phi i32 [ %storemerge.i.i.i.i, %bb1.i.i.i.i ], [ %__secondChild.0.i.i4.i.i.i, %bb.i.i7.i.i.i ] ; <i32> [#uses=3]
  %103 = icmp eq i32 %storemerge.lcssa.i.i8.i.i.i, %87 ; <i1> [#uses=1]
  br i1 %103, label %bb5.i.i12.i.i.i, label %bb1.i.i.i18.i.i.i

bb5.i.i12.i.i.i:                                  ; preds = %bb4.i.i11.i.i.i
  %104 = getelementptr inbounds double* %__first_addr.0.0.i.i, i32 %storemerge1.lcssa.i.i10.i.i.i ; <double*> [#uses=1]
  %105 = or i32 %storemerge.in.lcssa.i.i9.i.i.i, 1 ; <i32> [#uses=3]
  %106 = getelementptr inbounds double* %__first_addr.0.0.i.i, i32 %105 ; <double*> [#uses=1]
  %107 = load double* %106, align 8               ; <double> [#uses=1]
  store double %107, double* %104, align 8
  br label %bb1.i.i.i18.i.i.i

bb.i.i.i13.i.i.i:                                 ; preds = %bb2.i.i.i19.i.i.i
  %108 = getelementptr inbounds double* %__first_addr.0.0.i.i, i32 %storemerge1.i.i.i14.i.i.i ; <double*> [#uses=1]
  store double %111, double* %108, align 8
  br label %bb1.i.i.i18.i.i.i

bb1.i.i.i18.i.i.i:                                ; preds = %bb.i.i.i13.i.i.i, %bb5.i.i12.i.i.i, %bb4.i.i11.i.i.i
  %storemerge1.i.i.i14.i.i.i = phi i32 [ %storemerge.i.i.i17.i.i.i, %bb.i.i.i13.i.i.i ], [ %105, %bb5.i.i12.i.i.i ], [ %storemerge1.lcssa.i.i10.i.i.i, %bb4.i.i11.i.i.i ] ; <i32> [#uses=3]
  %storemerge.in.in.i.i.i15.i.i.i = phi i32 [ %storemerge.i.i.i17.i.i.i, %bb.i.i.i13.i.i.i ], [ %105, %bb5.i.i12.i.i.i ], [ %storemerge1.lcssa.i.i10.i.i.i, %bb4.i.i11.i.i.i ] ; <i32> [#uses=1]
  %storemerge.in.i.i.i16.i.i.i = add i32 %storemerge.in.in.i.i.i15.i.i.i, -1 ; <i32> [#uses=1]
  %storemerge.i.i.i17.i.i.i = sdiv i32 %storemerge.in.i.i.i16.i.i.i, 2 ; <i32> [#uses=3]
  %109 = icmp sgt i32 %storemerge1.i.i.i14.i.i.i, %storemerge.i.i.i.i ; <i1> [#uses=1]
  br i1 %109, label %bb2.i.i.i19.i.i.i, label %_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEidEvT_T0_S8_T1_.exit.i.i.i.i

bb2.i.i.i19.i.i.i:                                ; preds = %bb1.i.i.i18.i.i.i
  %110 = getelementptr inbounds double* %__first_addr.0.0.i.i, i32 %storemerge.i.i.i17.i.i.i ; <double*> [#uses=1]
  %111 = load double* %110, align 8               ; <double> [#uses=2]
  %112 = fcmp uge double %111, %91                ; <i1> [#uses=1]
  br i1 %112, label %_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEidEvT_T0_S8_T1_.exit.i.i.i.i, label %bb.i.i.i13.i.i.i

_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEidEvT_T0_S8_T1_.exit.i.i.i.i: ; preds = %bb2.i.i.i19.i.i.i, %bb1.i.i.i18.i.i.i
  %113 = getelementptr inbounds double* %__first_addr.0.0.i.i, i32 %storemerge1.i.i.i14.i.i.i ; <double*> [#uses=1]
  store double %91, double* %113, align 8
  %114 = icmp eq i32 %90, %indvar.i.i2.i.i        ; <i1> [#uses=1]
  br i1 %114, label %_ZSt9make_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i.i.i, label %bb2.i.i.i.i

bb2.i.i.i.i:                                      ; preds = %_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEidEvT_T0_S8_T1_.exit.i.i.i.i
  %indvar.next.i.i3.i.i = add i32 %indvar.i.i2.i.i, 1 ; <i32> [#uses=1]
  br label %bb1.i.i.i.i

_ZSt9make_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i.i.i: ; preds = %_ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEidEvT_T0_S8_T1_.exit.i.i.i.i, %bb1.i.i
  %115 = icmp ult double* %84, %__last_addr.0.0.ph.i.i ; <i1> [#uses=1]
  br i1 %115, label %bb.nph.i4.i.i, label %_ZSt13__heap_selectIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_S7_.exit.i.i

bb.nph.i4.i.i:                                    ; preds = %_ZSt9make_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i.i.i
  %116 = icmp sgt i32 %87, 2                      ; <i1> [#uses=1]
  br label %bb.i7.i.i

bb.i7.i.i:                                        ; preds = %bb10.i.i.i, %bb.nph.i4.i.i
  %indvar.i5.i.i = phi i32 [ 0, %bb.nph.i4.i.i ], [ %tmp.i.i2.i, %bb10.i.i.i ] ; <i32> [#uses=2]
  %.sum15 = add i32 %.sum, %indvar.i5.i.i         ; <i32> [#uses=1]
  %__i.0.01.i.i.i = getelementptr double* %v.0.0.0.2, i32 %.sum15 ; <double*> [#uses=2]
  %tmp.i.i2.i = add i32 %indvar.i5.i.i, 1         ; <i32> [#uses=2]
  %.sum16 = add i32 %.sum, %tmp.i.i2.i            ; <i32> [#uses=1]
  %scevgep.i6.i.i = getelementptr double* %v.0.0.0.2, i32 %.sum16 ; <double*> [#uses=1]
  %117 = load double* %__i.0.01.i.i.i, align 8    ; <double> [#uses=3]
  %118 = load double* %__first_addr.0.0.i.i, align 8 ; <double> [#uses=2]
  %119 = fcmp olt double %117, %118               ; <i1> [#uses=1]
  br i1 %119, label %bb3.i8.i.i, label %bb10.i.i.i

bb3.i8.i.i:                                       ; preds = %bb.i7.i.i
  store double %118, double* %__i.0.01.i.i.i, align 8
  br i1 %116, label %bb.i.i.i.i.i, label %bb4.i.i.i.i.i

bb.i.i.i.i.i:                                     ; preds = %bb.i.i.i.i.i, %bb3.i8.i.i
  %storemerge7.i.i.i.i.i = phi i32 [ %storemerge.i.i.i.i.i, %bb.i.i.i.i.i ], [ 2, %bb3.i8.i.i ] ; <i32> [#uses=2]
  %storemerge.in5.i.i.i.i.i = phi i32 [ %phitmp.i.i.i.i.i, %bb.i.i.i.i.i ], [ 0, %bb3.i8.i.i ] ; <i32> [#uses=1]
  %storemerge12.i.i.i.i.i = phi i32 [ %__secondChild.0.i.i.i.i.i, %bb.i.i.i.i.i ], [ 0, %bb3.i8.i.i ] ; <i32> [#uses=1]
  %120 = getelementptr inbounds double* %__first_addr.0.0.i.i, i32 %storemerge7.i.i.i.i.i ; <double*> [#uses=1]
  %121 = load double* %120, align 8               ; <double> [#uses=1]
  %122 = or i32 %storemerge.in5.i.i.i.i.i, 1      ; <i32> [#uses=2]
  %123 = getelementptr inbounds double* %__first_addr.0.0.i.i, i32 %122 ; <double*> [#uses=1]
  %124 = load double* %123, align 8               ; <double> [#uses=1]
  %125 = fcmp olt double %121, %124               ; <i1> [#uses=1]
  %__secondChild.0.i.i.i.i.i = select i1 %125, i32 %122, i32 %storemerge7.i.i.i.i.i ; <i32> [#uses=4]
  %126 = getelementptr inbounds double* %__first_addr.0.0.i.i, i32 %storemerge12.i.i.i.i.i ; <double*> [#uses=1]
  %127 = getelementptr inbounds double* %__first_addr.0.0.i.i, i32 %__secondChild.0.i.i.i.i.i ; <double*> [#uses=1]
  %128 = load double* %127, align 8               ; <double> [#uses=1]
  store double %128, double* %126, align 8
  %phitmp.i.i.i.i.i = shl i32 %__secondChild.0.i.i.i.i.i, 1 ; <i32> [#uses=3]
  %storemerge.i.i.i.i.i = add i32 %phitmp.i.i.i.i.i, 2 ; <i32> [#uses=3]
  %129 = icmp slt i32 %storemerge.i.i.i.i.i, %87  ; <i1> [#uses=1]
  br i1 %129, label %bb.i.i.i.i.i, label %bb4.i.loopexit.i.i.i.i

bb4.i.loopexit.i.i.i.i:                           ; preds = %bb.i.i.i.i.i
  %phitmp.i.i.i.i = or i32 %phitmp.i.i.i.i.i, 1   ; <i32> [#uses=1]
  br label %bb4.i.i.i.i.i

bb4.i.i.i.i.i:                                    ; preds = %bb4.i.loopexit.i.i.i.i, %bb3.i8.i.i
  %storemerge.lcssa.i.i.i.i.i = phi i32 [ %storemerge.i.i.i.i.i, %bb4.i.loopexit.i.i.i.i ], [ 2, %bb3.i8.i.i ] ; <i32> [#uses=1]
  %storemerge.in.lcssa.i.i.i.i.i = phi i32 [ %phitmp.i.i.i.i, %bb4.i.loopexit.i.i.i.i ], [ 1, %bb3.i8.i.i ] ; <i32> [#uses=3]
  %storemerge1.lcssa.i.i.i.i.i = phi i32 [ %__secondChild.0.i.i.i.i.i, %bb4.i.loopexit.i.i.i.i ], [ 0, %bb3.i8.i.i ] ; <i32> [#uses=3]
  %130 = icmp eq i32 %storemerge.lcssa.i.i.i.i.i, %87 ; <i1> [#uses=1]
  br i1 %130, label %bb5.i.i.i.i.i, label %bb1.i.i.i.i.i.i

bb5.i.i.i.i.i:                                    ; preds = %bb4.i.i.i.i.i
  %131 = getelementptr inbounds double* %__first_addr.0.0.i.i, i32 %storemerge1.lcssa.i.i.i.i.i ; <double*> [#uses=1]
  %132 = getelementptr inbounds double* %__first_addr.0.0.i.i, i32 %storemerge.in.lcssa.i.i.i.i.i ; <double*> [#uses=1]
  %133 = load double* %132, align 8               ; <double> [#uses=1]
  store double %133, double* %131, align 8
  br label %bb1.i.i.i.i.i.i

bb.i.i.i.i.i.i:                                   ; preds = %bb2.i.i.i.i.i.i
  %134 = getelementptr inbounds double* %__first_addr.0.0.i.i, i32 %storemerge1.i.i.i.i.i.i ; <double*> [#uses=1]
  store double %137, double* %134, align 8
  br label %bb1.i.i.i.i.i.i

bb1.i.i.i.i.i.i:                                  ; preds = %bb.i.i.i.i.i.i, %bb5.i.i.i.i.i, %bb4.i.i.i.i.i
  %storemerge1.i.i.i.i.i.i = phi i32 [ %storemerge.i.i.i.i.i.i, %bb.i.i.i.i.i.i ], [ %storemerge.in.lcssa.i.i.i.i.i, %bb5.i.i.i.i.i ], [ %storemerge1.lcssa.i.i.i.i.i, %bb4.i.i.i.i.i ] ; <i32> [#uses=3]
  %storemerge.in.in.i.i.i.i.i.i = phi i32 [ %storemerge.i.i.i.i.i.i, %bb.i.i.i.i.i.i ], [ %storemerge.in.lcssa.i.i.i.i.i, %bb5.i.i.i.i.i ], [ %storemerge1.lcssa.i.i.i.i.i, %bb4.i.i.i.i.i ] ; <i32> [#uses=1]
  %storemerge.in.i.i.i.i.i.i = add i32 %storemerge.in.in.i.i.i.i.i.i, -1 ; <i32> [#uses=1]
  %storemerge.i.i.i.i.i.i = sdiv i32 %storemerge.in.i.i.i.i.i.i, 2 ; <i32> [#uses=3]
  %135 = icmp sgt i32 %storemerge1.i.i.i.i.i.i, 0 ; <i1> [#uses=1]
  br i1 %135, label %bb2.i.i.i.i.i.i, label %_ZSt10__pop_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_S7_S7_T0_.exit.i.i.i

bb2.i.i.i.i.i.i:                                  ; preds = %bb1.i.i.i.i.i.i
  %136 = getelementptr inbounds double* %__first_addr.0.0.i.i, i32 %storemerge.i.i.i.i.i.i ; <double*> [#uses=1]
  %137 = load double* %136, align 8               ; <double> [#uses=2]
  %138 = fcmp uge double %137, %117               ; <i1> [#uses=1]
  br i1 %138, label %_ZSt10__pop_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_S7_S7_T0_.exit.i.i.i, label %bb.i.i.i.i.i.i

_ZSt10__pop_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_S7_S7_T0_.exit.i.i.i: ; preds = %bb2.i.i.i.i.i.i, %bb1.i.i.i.i.i.i
  %139 = getelementptr inbounds double* %__first_addr.0.0.i.i, i32 %storemerge1.i.i.i.i.i.i ; <double*> [#uses=1]
  store double %117, double* %139, align 8
  br label %bb10.i.i.i

bb10.i.i.i:                                       ; preds = %_ZSt10__pop_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_S7_S7_T0_.exit.i.i.i, %bb.i7.i.i
  %140 = icmp ult double* %scevgep.i6.i.i, %__last_addr.0.0.ph.i.i ; <i1> [#uses=1]
  br i1 %140, label %bb.i7.i.i, label %_ZSt13__heap_selectIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_S7_.exit.i.i

_ZSt13__heap_selectIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_S7_.exit.i.i: ; preds = %bb10.i.i.i, %_ZSt9make_heapIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i.i.i
  %141 = load double* %__first_addr.0.0.i.i, align 8 ; <double> [#uses=1]
  %142 = load double* %77, align 8                ; <double> [#uses=1]
  store double %142, double* %__first_addr.0.0.i.i, align 8
  store double %141, double* %77, align 8
  br label %_ZSt11nth_elementIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_S7_.exit.i

bb10.i.i:                                         ; preds = %bb.i1.i14
  %143 = sdiv i32 %169, 2                         ; <i32> [#uses=1]
  %144 = getelementptr inbounds double* %__first_addr.0.0.i.i, i32 %143 ; <double*> [#uses=3]
  %145 = load double* %__first_addr.0.0.i.i, align 8 ; <double> [#uses=4]
  %146 = load double* %144, align 8               ; <double> [#uses=3]
  %147 = fcmp olt double %145, %146               ; <i1> [#uses=1]
  %148 = load double* %166, align 8               ; <double> [#uses=4]
  br i1 %147, label %bb.i.i3.i, label %bb5.i3.i.i

bb.i.i3.i:                                        ; preds = %bb10.i.i
  %149 = fcmp olt double %146, %148               ; <i1> [#uses=1]
  br i1 %149, label %_ZSt8__medianIdERKT_S2_S2_S2_.exit.i.i, label %bb2.i.i.i

bb2.i.i.i:                                        ; preds = %bb.i.i3.i
  %150 = fcmp olt double %145, %148               ; <i1> [#uses=1]
  %retval.i.i.i = select i1 %150, double* %166, double* %__first_addr.0.0.i.i ; <double*> [#uses=1]
  br label %_ZSt8__medianIdERKT_S2_S2_S2_.exit.i.i

bb5.i3.i.i:                                       ; preds = %bb10.i.i
  %151 = fcmp olt double %145, %148               ; <i1> [#uses=1]
  br i1 %151, label %_ZSt8__medianIdERKT_S2_S2_S2_.exit.i.i, label %bb7.i4.i.i

bb7.i4.i.i:                                       ; preds = %bb5.i3.i.i
  %152 = fcmp olt double %146, %148               ; <i1> [#uses=1]
  %retval1.i.i.i = select i1 %152, double* %166, double* %144 ; <double*> [#uses=1]
  br label %_ZSt8__medianIdERKT_S2_S2_S2_.exit.i.i

_ZSt8__medianIdERKT_S2_S2_S2_.exit.i.i:           ; preds = %bb7.i4.i.i, %bb5.i3.i.i, %bb2.i.i.i, %bb.i.i3.i
  %153 = phi double* [ %retval1.i.i.i, %bb7.i4.i.i ], [ %retval.i.i.i, %bb2.i.i.i ], [ %144, %bb.i.i3.i ], [ %__first_addr.0.0.i.i, %bb5.i3.i.i ] ; <double*> [#uses=1]
  %154 = load double* %153, align 8               ; <double> [#uses=3]
  br label %bb2.outer.i.i.i

bb2.outer.i.i.i:                                  ; preds = %bb12.i.i.i, %_ZSt8__medianIdERKT_S2_S2_S2_.exit.i.i
  %155 = phi double [ %.pre.i.i, %bb12.i.i.i ], [ %145, %_ZSt8__medianIdERKT_S2_S2_S2_.exit.i.i ] ; <double> [#uses=2]
  %__last_addr.0.0.ph.i.i.i = phi double* [ %__last_addr.0.0.ph.i.i, %_ZSt8__medianIdERKT_S2_S2_S2_.exit.i.i ], [ %__last_addr.0.1.i.i.i, %bb12.i.i.i ] ; <double*> [#uses=1]
  %__first_addr.0.0.ph.i.i.i = phi double* [ %__first_addr.0.0.i.i, %_ZSt8__medianIdERKT_S2_S2_S2_.exit.i.i ], [ %163, %bb12.i.i.i ] ; <double*> [#uses=2]
  %156 = fcmp olt double %155, %154               ; <i1> [#uses=1]
  br i1 %156, label %bb1.i2.i.i, label %bb5.preheader.i.i.i

bb1.i2.i.i:                                       ; preds = %bb1.i2.i.i, %bb2.outer.i.i.i
  %indvar4.i.i.i = phi i32 [ %tmp20.i.i, %bb1.i2.i.i ], [ 0, %bb2.outer.i.i.i ] ; <i32> [#uses=1]
  %tmp20.i.i = add i32 %indvar4.i.i.i, 1          ; <i32> [#uses=2]
  %scevgep.i1.i.i = getelementptr double* %__first_addr.0.0.ph.i.i.i, i32 %tmp20.i.i ; <double*> [#uses=2]
  %157 = load double* %scevgep.i1.i.i, align 8    ; <double> [#uses=2]
  %158 = fcmp olt double %157, %154               ; <i1> [#uses=1]
  br i1 %158, label %bb1.i2.i.i, label %bb5.preheader.i.i.i

bb5.preheader.i.i.i:                              ; preds = %bb1.i2.i.i, %bb2.outer.i.i.i
  %159 = phi double [ %155, %bb2.outer.i.i.i ], [ %157, %bb1.i2.i.i ] ; <double> [#uses=1]
  %__first_addr.0.0.lcssa.i.i.i = phi double* [ %__first_addr.0.0.ph.i.i.i, %bb2.outer.i.i.i ], [ %scevgep.i1.i.i, %bb1.i2.i.i ] ; <double*> [#uses=6]
  br label %bb5.i.i.i

bb5.i.i.i:                                        ; preds = %bb5.i.i.i, %bb5.preheader.i.i.i
  %indvar.i.i.i = phi i32 [ 0, %bb5.preheader.i.i.i ], [ %indvar.next.i.i.i, %bb5.i.i.i ] ; <i32> [#uses=2]
  %tmp23.i.i = xor i32 %indvar.i.i.i, -1          ; <i32> [#uses=1]
  %__last_addr.0.1.i.i.i = getelementptr double* %__last_addr.0.0.ph.i.i.i, i32 %tmp23.i.i ; <double*> [#uses=4]
  %160 = load double* %__last_addr.0.1.i.i.i, align 8 ; <double> [#uses=2]
  %161 = fcmp ogt double %160, %154               ; <i1> [#uses=1]
  %indvar.next.i.i.i = add i32 %indvar.i.i.i, 1   ; <i32> [#uses=1]
  br i1 %161, label %bb5.i.i.i, label %bb7.i.i.i

bb7.i.i.i:                                        ; preds = %bb5.i.i.i
  %162 = icmp ult double* %__first_addr.0.0.lcssa.i.i.i, %__last_addr.0.1.i.i.i ; <i1> [#uses=1]
  br i1 %162, label %bb12.i.i.i, label %_ZSt21__unguarded_partitionIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET_S7_S7_T0_.exit.i.i

bb12.i.i.i:                                       ; preds = %bb7.i.i.i
  store double %160, double* %__first_addr.0.0.lcssa.i.i.i, align 8
  store double %159, double* %__last_addr.0.1.i.i.i, align 8
  %163 = getelementptr inbounds double* %__first_addr.0.0.lcssa.i.i.i, i32 1 ; <double*> [#uses=2]
  %.pre.i.i = load double* %163, align 8          ; <double> [#uses=1]
  br label %bb2.outer.i.i.i

_ZSt21__unguarded_partitionIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET_S7_S7_T0_.exit.i.i: ; preds = %bb7.i.i.i
  %164 = icmp ugt double* %__first_addr.0.0.lcssa.i.i.i, %77 ; <i1> [#uses=1]
  %indvar.next.i.i = add i32 %indvar.i5.i, 1      ; <i32> [#uses=1]
  br i1 %164, label %bb17.outer.i.i.loopexit, label %bb17.i.i

bb17.outer.i.i.loopexit:                          ; preds = %_ZSt21__unguarded_partitionIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET_S7_S7_T0_.exit.i.i
  %tmp29.i.i.le = sub i32 %tmp28.i.i, %indvar.i5.i ; <i32> [#uses=1]
  br label %bb17.outer.i.i

bb17.outer.i.i:                                   ; preds = %bb17.outer.i.i.loopexit, %_ZSt4__lgIiET_S0_.exit.loopexit.i.i, %bb6.critedge.i.i
  %__last_addr.0.0.ph.i.i = phi double* [ %__first_addr.0.0.lcssa.i.i.i, %bb17.outer.i.i.loopexit ], [ %v.0.0.1.2, %_ZSt4__lgIiET_S0_.exit.loopexit.i.i ], [ %v.0.0.1.2, %bb6.critedge.i.i ] ; <double*> [#uses=8]
  %__first_addr.0.0.ph.i4.i = phi double* [ %__first_addr.0.0.i.i, %bb17.outer.i.i.loopexit ], [ %v.0.0.0.2, %_ZSt4__lgIiET_S0_.exit.loopexit.i.i ], [ %v.0.0.0.2, %bb6.critedge.i.i ] ; <double*> [#uses=1]
  %__depth_limit_addr.0.ph.i.i = phi i32 [ %tmp29.i.i.le, %bb17.outer.i.i.loopexit ], [ %phitmp.i.i, %_ZSt4__lgIiET_S0_.exit.loopexit.i.i ], [ 0, %bb6.critedge.i.i ] ; <i32> [#uses=2]
  %165 = ptrtoint double* %__last_addr.0.0.ph.i.i to i32 ; <i32> [#uses=1]
  %166 = getelementptr inbounds double* %__last_addr.0.0.ph.i.i, i32 -1 ; <double*> [#uses=3]
  %tmp28.i.i = add i32 %__depth_limit_addr.0.ph.i.i, -1 ; <i32> [#uses=1]
  br label %bb17.i.i

bb17.i.i:                                         ; preds = %bb17.outer.i.i, %_ZSt21__unguarded_partitionIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET_S7_S7_T0_.exit.i.i
  %indvar.i5.i = phi i32 [ 0, %bb17.outer.i.i ], [ %indvar.next.i.i, %_ZSt21__unguarded_partitionIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET_S7_S7_T0_.exit.i.i ] ; <i32> [#uses=3]
  %__first_addr.0.0.i.i = phi double* [ %__first_addr.0.0.ph.i4.i, %bb17.outer.i.i ], [ %__first_addr.0.0.lcssa.i.i.i, %_ZSt21__unguarded_partitionIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdET_S7_S7_T0_.exit.i.i ] ; <double*> [#uses=41]
  %167 = ptrtoint double* %__first_addr.0.0.i.i to i32 ; <i32> [#uses=3]
  %168 = sub i32 %165, %167                       ; <i32> [#uses=1]
  %169 = ashr i32 %168, 3                         ; <i32> [#uses=2]
  %170 = icmp sgt i32 %169, 3                     ; <i1> [#uses=1]
  br i1 %170, label %bb.i1.i14, label %bb19.i.i

bb19.i.i:                                         ; preds = %bb17.i.i
  %171 = icmp eq double* %__first_addr.0.0.i.i, %__last_addr.0.0.ph.i.i ; <i1> [#uses=1]
  br i1 %171, label %_ZSt11nth_elementIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_S7_.exit.i, label %bb12.preheader.i.i.i

bb12.preheader.i.i.i:                             ; preds = %bb19.i.i
  %__i.0.06.i.i.i = getelementptr inbounds double* %__first_addr.0.0.i.i, i32 1 ; <double*> [#uses=1]
  %172 = icmp eq double* %__i.0.06.i.i.i, %__last_addr.0.0.ph.i.i ; <i1> [#uses=1]
  br i1 %172, label %_ZSt11nth_elementIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_S7_.exit.i, label %bb.nph.i.i.i

bb.nph.i.i.i:                                     ; preds = %bb12.preheader.i.i.i
  %173 = bitcast double* %__first_addr.0.0.i.i to i8* ; <i8*> [#uses=1]
  br label %bb1.i.i.i

bb1.i.i.i:                                        ; preds = %bb12.backedge.i.i.i, %bb.nph.i.i.i
  %174 = phi i32 [ 0, %bb.nph.i.i.i ], [ %tmp12.i.i, %bb12.backedge.i.i.i ] ; <i32> [#uses=5]
  %tmp12.i.i = add i32 %174, 1                    ; <i32> [#uses=3]
  %tmp10.i.i = add i32 %174, -1                   ; <i32> [#uses=1]
  %tmp17.i.i = add i32 %174, 2                    ; <i32> [#uses=2]
  %__i.0.0.i.i.i = getelementptr double* %__first_addr.0.0.i.i, i32 %tmp17.i.i ; <double*> [#uses=1]
  %__i.0.07.i.i.i = getelementptr double* %__first_addr.0.0.i.i, i32 %tmp12.i.i ; <double*> [#uses=3]
  %175 = load double* %__i.0.07.i.i.i, align 8    ; <double> [#uses=5]
  %176 = load double* %__first_addr.0.0.i.i, align 8 ; <double> [#uses=1]
  %177 = fcmp ogt double %176, %175               ; <i1> [#uses=1]
  br i1 %177, label %bb3.i.i.i, label %bb8.i.i.i

bb3.i.i.i:                                        ; preds = %bb1.i.i.i
  %178 = ptrtoint double* %__i.0.07.i.i.i to i32  ; <i32> [#uses=1]
  %179 = sub i32 %178, %167                       ; <i32> [#uses=2]
  %180 = ashr i32 %179, 3                         ; <i32> [#uses=1]
  %181 = and i32 %179, -8                         ; <i32> [#uses=1]
  %__i.0.0.sum.i.i.i = sub i32 %tmp17.i.i, %180   ; <i32> [#uses=1]
  %scevgep.i.i.i = getelementptr double* %__first_addr.0.0.i.i, i32 %__i.0.0.sum.i.i.i ; <double*> [#uses=1]
  %scevgep17.i.i.i = bitcast double* %scevgep.i.i.i to i8* ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %scevgep17.i.i.i, i8* %173, i32 %181, i32 8) nounwind
  store double %175, double* %__first_addr.0.0.i.i, align 8
  br label %bb12.backedge.i.i.i

bb8.i.i.i:                                        ; preds = %bb1.i.i.i
  %__first.0.pn5.i.i.i = getelementptr double* %__first_addr.0.0.i.i, i32 %174 ; <double*> [#uses=1]
  %182 = load double* %__first.0.pn5.i.i.i, align 8 ; <double> [#uses=1]
  %183 = fcmp ogt double %182, %175               ; <i1> [#uses=1]
  br i1 %183, label %bb.i.i.i.i, label %_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_T0_.exit.i.i.i

bb.i.i.i.i:                                       ; preds = %bb.i.i.i.i, %bb8.i.i.i
  %indvar.i.i.i.i = phi i32 [ %indvar.next.i.i.i.i, %bb.i.i.i.i ], [ 0, %bb8.i.i.i ] ; <i32> [#uses=4]
  %tmp11.i.i = sub i32 %tmp10.i.i, %indvar.i.i.i.i ; <i32> [#uses=1]
  %__next.0.0.i.i.i.i = getelementptr double* %__first_addr.0.0.i.i, i32 %tmp11.i.i ; <double*> [#uses=1]
  %tmp13.i.i = sub i32 %tmp12.i.i, %indvar.i.i.i.i ; <i32> [#uses=1]
  %__last_addr.0.02.i.i.i.i = getelementptr double* %__first_addr.0.0.i.i, i32 %tmp13.i.i ; <double*> [#uses=1]
  %tmp14.i.i = sub i32 %174, %indvar.i.i.i.i      ; <i32> [#uses=1]
  %__next.0.04.i.i.i.i = getelementptr double* %__first_addr.0.0.i.i, i32 %tmp14.i.i ; <double*> [#uses=2]
  %184 = load double* %__next.0.04.i.i.i.i, align 8 ; <double> [#uses=1]
  store double %184, double* %__last_addr.0.02.i.i.i.i, align 8
  %185 = load double* %__next.0.0.i.i.i.i, align 8 ; <double> [#uses=1]
  %186 = fcmp ogt double %185, %175               ; <i1> [#uses=1]
  %indvar.next.i.i.i.i = add i32 %indvar.i.i.i.i, 1 ; <i32> [#uses=1]
  br i1 %186, label %bb.i.i.i.i, label %_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_T0_.exit.i.i.i

_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_T0_.exit.i.i.i: ; preds = %bb.i.i.i.i, %bb8.i.i.i
  %__last_addr.0.0.lcssa.i.i.i.i = phi double* [ %__i.0.07.i.i.i, %bb8.i.i.i ], [ %__next.0.04.i.i.i.i, %bb.i.i.i.i ] ; <double*> [#uses=1]
  store double %175, double* %__last_addr.0.0.lcssa.i.i.i.i, align 8
  br label %bb12.backedge.i.i.i

bb12.backedge.i.i.i:                              ; preds = %_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEvT_T0_.exit.i.i.i, %bb3.i.i.i
  %187 = icmp eq double* %__i.0.0.i.i.i, %__last_addr.0.0.ph.i.i ; <i1> [#uses=1]
  br i1 %187, label %_ZSt11nth_elementIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_S7_.exit.i, label %bb1.i.i.i

_ZSt11nth_elementIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_S7_.exit.i: ; preds = %bb12.backedge.i.i.i, %bb12.preheader.i.i.i, %bb19.i.i, %_ZSt13__heap_selectIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_S7_.exit.i.i, %bb6.i12
  %188 = and i32 %.reg2mem20.0, 1                 ; <i32> [#uses=1]
  %189 = icmp eq i32 %188, 0                      ; <i1> [#uses=1]
  br i1 %189, label %bb13.i, label %bb18.i

bb13.i:                                           ; preds = %_ZSt11nth_elementIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_S7_.exit.i
  %190 = icmp eq i32 %76, 0                       ; <i1> [#uses=1]
  br i1 %190, label %_ZSt11max_elementIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEET_S7_S7_.exit.i, label %bb5.outer.i.i

bb2.i.i:                                          ; preds = %bb5.i.i
  %191 = load double* %__result.0.0.ph.i.i, align 8 ; <double> [#uses=1]
  %192 = load double* %scevgep.i4.i, align 8      ; <double> [#uses=1]
  %193 = fcmp olt double %191, %192               ; <i1> [#uses=1]
  br i1 %193, label %bb5.outer.i.i, label %bb5.i.i

bb5.outer.i.i:                                    ; preds = %bb2.i.i, %bb13.i
  %__result.0.0.ph.i.i = phi double* [ %v.0.0.0.2, %bb13.i ], [ %scevgep.i4.i, %bb2.i.i ] ; <double*> [#uses=2]
  %__first_addr.0.0.ph.i.i = phi double* [ %v.0.0.0.2, %bb13.i ], [ %scevgep.i4.i, %bb2.i.i ] ; <double*> [#uses=1]
  br label %bb5.i.i

bb5.i.i:                                          ; preds = %bb5.outer.i.i, %bb2.i.i
  %indvar.i2.i = phi i32 [ 0, %bb5.outer.i.i ], [ %tmp8.i, %bb2.i.i ] ; <i32> [#uses=1]
  %tmp8.i = add i32 %indvar.i2.i, 1               ; <i32> [#uses=2]
  %scevgep.i4.i = getelementptr double* %__first_addr.0.0.ph.i.i, i32 %tmp8.i ; <double*> [#uses=4]
  %194 = icmp eq double* %scevgep.i4.i, %77       ; <i1> [#uses=1]
  br i1 %194, label %_ZSt11max_elementIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEET_S7_S7_.exit.i, label %bb2.i.i

_ZSt11max_elementIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEET_S7_S7_.exit.i: ; preds = %bb5.i.i, %bb13.i
  %next_biggest.0.0.i = phi double* [ %v.0.0.0.2, %bb13.i ], [ %__result.0.0.ph.i.i, %bb5.i.i ] ; <double*> [#uses=1]
  %195 = load double* %77, align 8                ; <double> [#uses=1]
  %196 = load double* %next_biggest.0.0.i, align 8 ; <double> [#uses=1]
  %197 = fadd double %195, %196                   ; <double> [#uses=1]
  %198 = fmul double %197, 5.000000e-01           ; <double> [#uses=1]
  br label %_ZN7momentsIdEC2IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEET_S9_.exit

bb18.i:                                           ; preds = %_ZSt11nth_elementIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_S7_.exit.i
  %199 = load double* %77, align 8                ; <double> [#uses=1]
  br label %_ZN7momentsIdEC2IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEET_S9_.exit

_ZN7momentsIdEC2IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEET_S9_.exit: ; preds = %bb18.i, %_ZSt11max_elementIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEET_S7_S7_.exit.i
  %storemerge = phi double [ %198, %_ZSt11max_elementIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEET_S7_S7_.exit.i ], [ %199, %bb18.i ] ; <double> [#uses=1]
  %200 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([24 x i8]* @.str1, i32 0, i32 0), i32 %.reg2mem20.0) ; <i32> [#uses=0]
  %201 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([24 x i8]* @.str2, i32 0, i32 0), double %storemerge) ; <i32> [#uses=0]
  %202 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([24 x i8]* @.str3, i32 0, i32 0), double %.reg2mem31.0) ; <i32> [#uses=0]
  %203 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([24 x i8]* @.str4, i32 0, i32 0), double %63) ; <i32> [#uses=0]
  %204 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([24 x i8]* @.str5, i32 0, i32 0), double %67) ; <i32> [#uses=0]
  %205 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([24 x i8]* @.str6, i32 0, i32 0), double %66) ; <i32> [#uses=0]
  %206 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([24 x i8]* @.str7, i32 0, i32 0), double %m.5.0) ; <i32> [#uses=0]
  %207 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([24 x i8]* @.str8, i32 0, i32 0), double %m.6.0) ; <i32> [#uses=0]
  %208 = icmp eq double* %v.0.0.0.2, null         ; <i1> [#uses=1]
  br i1 %208, label %_ZNSt6vectorIdSaIdEED1Ev.exit3, label %bb.i.i.i1

bb.i.i.i1:                                        ; preds = %_ZN7momentsIdEC2IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEET_S9_.exit
  %209 = bitcast double* %v.0.0.0.2 to i8*        ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %209) nounwind
  ret i32 0

_ZNSt6vectorIdSaIdEED1Ev.exit3:                   ; preds = %_ZN7momentsIdEC2IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEET_S9_.exit
  ret i32 0

invcont23:                                        ; preds = %bb.i.i.i, %lpad
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr)
  unreachable

lpad:                                             ; preds = %invcont.i, %bb.i.i.i6, %bb2.i
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=2]
  %eh_select27 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %210 = icmp eq double* %v.0.0.0.2, null         ; <i1> [#uses=1]
  br i1 %210, label %invcont23, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %lpad
  %211 = bitcast double* %v.0.0.0.2 to i8*        ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %211) nounwind
  br label %invcont23
}

declare void @llvm.memmove.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind

declare void @_ZSt17__throw_bad_allocv() noreturn

declare i8* @_Znwj(i32)

declare void @_ZdlPv(i8*) nounwind

declare void @_ZSt20__throw_length_errorPKc(i8*) noreturn

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_Unwind_Resume_or_Rethrow(i8*)

declare double @fabs(double)

declare double @llvm.sqrt.f64(double) nounwind readonly

declare i32 @atoi(i8* nocapture) nounwind readonly

declare i32 @printf(i8* noalias nocapture, ...) nounwind

declare extern_weak i32 @pthread_once(i32*, void ()*)

declare extern_weak i8* @pthread_getspecific(i32)

declare extern_weak i32 @pthread_setspecific(i32, i8*)

declare extern_weak i32 @pthread_create(i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)

declare extern_weak i32 @pthread_cancel(i32)

declare extern_weak i32 @pthread_mutex_lock(%struct.pthread_mutex_t*)

declare extern_weak i32 @pthread_mutex_trylock(%struct.pthread_mutex_t*)

declare extern_weak i32 @pthread_mutex_unlock(%struct.pthread_mutex_t*)

declare extern_weak i32 @pthread_mutex_init(%struct.pthread_mutex_t*, %struct..0._10*)

declare extern_weak i32 @pthread_key_create(i32*, void (i8*)*)

declare extern_weak i32 @pthread_key_delete(i32)

declare extern_weak i32 @pthread_mutexattr_init(%struct..0._10*)

declare extern_weak i32 @pthread_mutexattr_settype(%struct..0._10*, i32)

declare extern_weak i32 @pthread_mutexattr_destroy(%struct..0._10*)
