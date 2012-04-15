; ModuleID = 'functionobjects.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct..0._10 = type { i32 }
%struct..1__pthread_mutex_s = type { i32, i32, i32, i32, i32, %struct..0._10 }
%struct.FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct.FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct.FILE*, i32 }
%struct.inline_less_than_functor = type <{ i8 }>
%struct.one_result = type { double, i8* }
%struct.pthread_attr_t = type { i32, [32 x i8] }
%struct.pthread_mutex_t = type { %struct..1__pthread_mutex_s }

@.str = private constant [16 x i8] c"test %i failed\0A\00", align 1 ; <[16 x i8]*> [#uses=1]

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

define internal i32 @_Z19less_than_function1PKvS0_(i8* nocapture %lhs, i8* nocapture %rhs) nounwind readonly {
entry:
  %0 = bitcast i8* %lhs to double*                ; <double*> [#uses=1]
  %1 = load double* %0, align 8                   ; <double> [#uses=2]
  %2 = bitcast i8* %rhs to double*                ; <double*> [#uses=1]
  %3 = load double* %2, align 8                   ; <double> [#uses=2]
  %4 = fcmp olt double %1, %3                     ; <i1> [#uses=1]
  br i1 %4, label %bb4, label %bb1

bb1:                                              ; preds = %entry
  %5 = fcmp ogt double %1, %3                     ; <i1> [#uses=1]
  %retval = zext i1 %5 to i32                     ; <i32> [#uses=1]
  ret i32 %retval

bb4:                                              ; preds = %entry
  ret i32 -1
}

define internal fastcc void @_Z9quicksortIPdPFbddEEvT_S3_T0_(double* %begin, double* %end) nounwind {
entry:
  %0 = ptrtoint double* %end to i32               ; <i32> [#uses=2]
  br label %tailrecurse

tailrecurse:                                      ; preds = %bb8.i, %entry
  %begin.tr = phi double* [ %begin, %entry ], [ %right.0.i, %bb8.i ] ; <double*> [#uses=4]
  %1 = ptrtoint double* %begin.tr to i32          ; <i32> [#uses=1]
  %2 = sub i32 %0, %1                             ; <i32> [#uses=1]
  %3 = icmp sgt i32 %2, 15                        ; <i1> [#uses=1]
  br i1 %3, label %bb, label %return

bb:                                               ; preds = %tailrecurse
  %4 = load double* %begin.tr, align 8            ; <double> [#uses=5]
  br label %bb1.outer

bb1.outer:                                        ; preds = %bb7, %bb
  %.rle13 = phi double [ %6, %bb7 ], [ %4, %bb ]  ; <double> [#uses=1]
  %5 = phi double [ %6, %bb7 ], [ %4, %bb ]       ; <double> [#uses=1]
  %right.0.ph = phi double* [ %end, %bb ], [ %scevgep15, %bb7 ] ; <double*> [#uses=2]
  %left.1.ph = phi double* [ %begin.tr, %bb ], [ %left.0.lcssa, %bb7 ] ; <double*> [#uses=3]
  br label %bb1

bb1:                                              ; preds = %bb1, %bb1.outer
  %indvar10 = phi i32 [ 0, %bb1.outer ], [ %indvar.next11, %bb1 ] ; <i32> [#uses=3]
  %tmp14 = xor i32 %indvar10, -1                  ; <i32> [#uses=1]
  %scevgep15 = getelementptr double* %right.0.ph, i32 %tmp14 ; <double*> [#uses=5]
  %6 = load double* %scevgep15, align 8           ; <double> [#uses=4]
  %7 = fcmp olt double %4, %6                     ; <i1> [#uses=1]
  %indvar.next11 = add i32 %indvar10, 1           ; <i32> [#uses=1]
  br i1 %7, label %bb1, label %bb2

bb2:                                              ; preds = %bb1
  %8 = icmp ult double* %left.1.ph, %scevgep15    ; <i1> [#uses=1]
  br i1 %8, label %bb4.preheader, label %bb8

bb4.preheader:                                    ; preds = %bb2
  %9 = fcmp olt double %5, %4                     ; <i1> [#uses=1]
  br i1 %9, label %bb3, label %bb6

bb3:                                              ; preds = %bb3, %bb4.preheader
  %indvar = phi i32 [ %tmp, %bb3 ], [ 0, %bb4.preheader ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=2]
  %scevgep = getelementptr double* %left.1.ph, i32 %tmp ; <double*> [#uses=2]
  %10 = load double* %scevgep, align 8            ; <double> [#uses=2]
  %11 = fcmp olt double %10, %4                   ; <i1> [#uses=1]
  br i1 %11, label %bb3, label %bb6

bb6:                                              ; preds = %bb3, %bb4.preheader
  %12 = phi double [ %.rle13, %bb4.preheader ], [ %10, %bb3 ] ; <double> [#uses=1]
  %left.0.lcssa = phi double* [ %left.1.ph, %bb4.preheader ], [ %scevgep, %bb3 ] ; <double*> [#uses=3]
  %13 = icmp ult double* %left.0.lcssa, %scevgep15 ; <i1> [#uses=1]
  br i1 %13, label %bb7, label %bb8

bb7:                                              ; preds = %bb6
  store double %12, double* %scevgep15, align 8
  store double %6, double* %left.0.lcssa, align 8
  br label %bb1.outer

bb8:                                              ; preds = %bb6, %bb2
  %tmp12 = sub i32 0, %indvar10                   ; <i32> [#uses=1]
  %right.0 = getelementptr double* %right.0.ph, i32 %tmp12 ; <double*> [#uses=5]
  tail call fastcc void @_Z9quicksortIPdPFbddEEvT_S3_T0_(double* %begin.tr, double* %right.0)
  %14 = ptrtoint double* %right.0 to i32          ; <i32> [#uses=1]
  %15 = sub i32 %0, %14                           ; <i32> [#uses=1]
  %16 = icmp sgt i32 %15, 15                      ; <i1> [#uses=1]
  br i1 %16, label %bb.i, label %_Z9quicksortIPdPFbddEEvT_S3_T0_.exit

bb.i:                                             ; preds = %bb8
  %17 = load double* %right.0, align 8            ; <double> [#uses=5]
  br label %bb1.i.outer

bb1.i.outer:                                      ; preds = %bb7.i, %bb.i
  %.rle17 = phi double [ %19, %bb7.i ], [ %17, %bb.i ] ; <double> [#uses=1]
  %18 = phi double [ %19, %bb7.i ], [ %17, %bb.i ] ; <double> [#uses=1]
  %right.0.i.ph = phi double* [ %end, %bb.i ], [ %scevgep27, %bb7.i ] ; <double*> [#uses=2]
  %left.1.i.ph = phi double* [ %right.0, %bb.i ], [ %left.0.i.lcssa, %bb7.i ] ; <double*> [#uses=3]
  br label %bb1.i

bb1.i:                                            ; preds = %bb1.i, %bb1.i.outer
  %indvar22 = phi i32 [ 0, %bb1.i.outer ], [ %indvar.next23, %bb1.i ] ; <i32> [#uses=3]
  %tmp26 = xor i32 %indvar22, -1                  ; <i32> [#uses=1]
  %scevgep27 = getelementptr double* %right.0.i.ph, i32 %tmp26 ; <double*> [#uses=5]
  %19 = load double* %scevgep27, align 8          ; <double> [#uses=4]
  %20 = fcmp olt double %17, %19                  ; <i1> [#uses=1]
  %indvar.next23 = add i32 %indvar22, 1           ; <i32> [#uses=1]
  br i1 %20, label %bb1.i, label %bb2.i

bb2.i:                                            ; preds = %bb1.i
  %21 = icmp ult double* %left.1.i.ph, %scevgep27 ; <i1> [#uses=1]
  br i1 %21, label %bb4.i.preheader, label %bb8.i

bb4.i.preheader:                                  ; preds = %bb2.i
  %22 = fcmp olt double %18, %17                  ; <i1> [#uses=1]
  br i1 %22, label %bb3.i, label %bb6.i

bb3.i:                                            ; preds = %bb3.i, %bb4.i.preheader
  %indvar17 = phi i32 [ %tmp19, %bb3.i ], [ 0, %bb4.i.preheader ] ; <i32> [#uses=1]
  %tmp19 = add i32 %indvar17, 1                   ; <i32> [#uses=2]
  %scevgep20 = getelementptr double* %left.1.i.ph, i32 %tmp19 ; <double*> [#uses=2]
  %23 = load double* %scevgep20, align 8          ; <double> [#uses=2]
  %24 = fcmp olt double %23, %17                  ; <i1> [#uses=1]
  br i1 %24, label %bb3.i, label %bb6.i

bb6.i:                                            ; preds = %bb3.i, %bb4.i.preheader
  %25 = phi double [ %.rle17, %bb4.i.preheader ], [ %23, %bb3.i ] ; <double> [#uses=1]
  %left.0.i.lcssa = phi double* [ %left.1.i.ph, %bb4.i.preheader ], [ %scevgep20, %bb3.i ] ; <double*> [#uses=3]
  %26 = icmp ult double* %left.0.i.lcssa, %scevgep27 ; <i1> [#uses=1]
  br i1 %26, label %bb7.i, label %bb8.i

bb7.i:                                            ; preds = %bb6.i
  store double %25, double* %scevgep27, align 8
  store double %19, double* %left.0.i.lcssa, align 8
  br label %bb1.i.outer

bb8.i:                                            ; preds = %bb6.i, %bb2.i
  %tmp24 = sub i32 0, %indvar22                   ; <i32> [#uses=1]
  %right.0.i = getelementptr double* %right.0.i.ph, i32 %tmp24 ; <double*> [#uses=2]
  tail call fastcc void @_Z9quicksortIPdPFbddEEvT_S3_T0_(double* %right.0, double* %right.0.i)
  br label %tailrecurse

_Z9quicksortIPdPFbddEEvT_S3_T0_.exit:             ; preds = %bb8
  ret void

return:                                           ; preds = %tailrecurse
  ret void
}

define internal fastcc void @_Z9quicksortIPd17less_than_functorEvT_S2_T0_(double* %begin, double* %end) nounwind {
entry:
  %0 = ptrtoint double* %end to i32               ; <i32> [#uses=1]
  %1 = ptrtoint double* %begin to i32             ; <i32> [#uses=2]
  %2 = sub i32 %0, %1                             ; <i32> [#uses=1]
  %3 = icmp sgt i32 %2, 15                        ; <i1> [#uses=1]
  br i1 %3, label %bb, label %return

bb:                                               ; preds = %entry
  %4 = load double* %begin, align 8               ; <double> [#uses=5]
  br label %bb1.outer

bb1.outer:                                        ; preds = %bb7, %bb
  %.rle36 = phi double [ %6, %bb7 ], [ %4, %bb ]  ; <double> [#uses=1]
  %5 = phi double [ %6, %bb7 ], [ %4, %bb ]       ; <double> [#uses=1]
  %right.0.ph = phi double* [ %end, %bb ], [ %scevgep31, %bb7 ] ; <double*> [#uses=2]
  %left.1.ph = phi double* [ %begin, %bb ], [ %left.0.lcssa, %bb7 ] ; <double*> [#uses=3]
  br label %bb1

bb1:                                              ; preds = %bb1, %bb1.outer
  %indvar26 = phi i32 [ 0, %bb1.outer ], [ %indvar.next27, %bb1 ] ; <i32> [#uses=3]
  %tmp30 = xor i32 %indvar26, -1                  ; <i32> [#uses=1]
  %scevgep31 = getelementptr double* %right.0.ph, i32 %tmp30 ; <double*> [#uses=5]
  %6 = load double* %scevgep31, align 8           ; <double> [#uses=4]
  %7 = fcmp olt double %4, %6                     ; <i1> [#uses=1]
  %indvar.next27 = add i32 %indvar26, 1           ; <i32> [#uses=1]
  br i1 %7, label %bb1, label %bb2

bb2:                                              ; preds = %bb1
  %8 = icmp ult double* %left.1.ph, %scevgep31    ; <i1> [#uses=1]
  br i1 %8, label %bb4.preheader, label %bb8

bb4.preheader:                                    ; preds = %bb2
  %9 = fcmp olt double %5, %4                     ; <i1> [#uses=1]
  br i1 %9, label %bb3, label %bb6

bb3:                                              ; preds = %bb3, %bb4.preheader
  %indvar21 = phi i32 [ %tmp23, %bb3 ], [ 0, %bb4.preheader ] ; <i32> [#uses=1]
  %tmp23 = add i32 %indvar21, 1                   ; <i32> [#uses=2]
  %scevgep24 = getelementptr double* %left.1.ph, i32 %tmp23 ; <double*> [#uses=2]
  %10 = load double* %scevgep24, align 8          ; <double> [#uses=2]
  %11 = fcmp olt double %10, %4                   ; <i1> [#uses=1]
  br i1 %11, label %bb3, label %bb6

bb6:                                              ; preds = %bb3, %bb4.preheader
  %12 = phi double [ %.rle36, %bb4.preheader ], [ %10, %bb3 ] ; <double> [#uses=1]
  %left.0.lcssa = phi double* [ %left.1.ph, %bb4.preheader ], [ %scevgep24, %bb3 ] ; <double*> [#uses=3]
  %13 = icmp ult double* %left.0.lcssa, %scevgep31 ; <i1> [#uses=1]
  br i1 %13, label %bb7, label %bb8

bb7:                                              ; preds = %bb6
  store double %12, double* %scevgep31, align 8
  store double %6, double* %left.0.lcssa, align 8
  br label %bb1.outer

bb8:                                              ; preds = %bb6, %bb2
  %tmp28 = sub i32 0, %indvar26                   ; <i32> [#uses=1]
  %right.0 = getelementptr double* %right.0.ph, i32 %tmp28 ; <double*> [#uses=4]
  %14 = ptrtoint double* %right.0 to i32          ; <i32> [#uses=1]
  %15 = sub i32 %14, %1                           ; <i32> [#uses=1]
  %16 = icmp sgt i32 %15, 15                      ; <i1> [#uses=1]
  br i1 %16, label %bb.i, label %_Z9quicksortIPd17less_than_functorEvT_S2_T0_.exit

bb.i:                                             ; preds = %bb8
  %17 = load double* %begin, align 8              ; <double> [#uses=5]
  br label %bb1.i.outer

bb1.i.outer:                                      ; preds = %bb7.i, %bb.i
  %.rle8 = phi double [ %19, %bb7.i ], [ %17, %bb.i ] ; <double> [#uses=1]
  %18 = phi double [ %19, %bb7.i ], [ %17, %bb.i ] ; <double> [#uses=1]
  %right.0.i.ph = phi double* [ %right.0, %bb.i ], [ %scevgep19, %bb7.i ] ; <double*> [#uses=2]
  %left.1.i.ph = phi double* [ %begin, %bb.i ], [ %left.0.i.lcssa, %bb7.i ] ; <double*> [#uses=3]
  br label %bb1.i

bb1.i:                                            ; preds = %bb1.i, %bb1.i.outer
  %indvar14 = phi i32 [ 0, %bb1.i.outer ], [ %indvar.next15, %bb1.i ] ; <i32> [#uses=3]
  %tmp18 = xor i32 %indvar14, -1                  ; <i32> [#uses=1]
  %scevgep19 = getelementptr double* %right.0.i.ph, i32 %tmp18 ; <double*> [#uses=5]
  %19 = load double* %scevgep19, align 8          ; <double> [#uses=4]
  %20 = fcmp olt double %17, %19                  ; <i1> [#uses=1]
  %indvar.next15 = add i32 %indvar14, 1           ; <i32> [#uses=1]
  br i1 %20, label %bb1.i, label %bb2.i

bb2.i:                                            ; preds = %bb1.i
  %21 = icmp ult double* %left.1.i.ph, %scevgep19 ; <i1> [#uses=1]
  br i1 %21, label %bb4.i.preheader, label %bb8.i

bb4.i.preheader:                                  ; preds = %bb2.i
  %22 = fcmp olt double %18, %17                  ; <i1> [#uses=1]
  br i1 %22, label %bb3.i, label %bb6.i

bb3.i:                                            ; preds = %bb3.i, %bb4.i.preheader
  %indvar = phi i32 [ %tmp, %bb3.i ], [ 0, %bb4.i.preheader ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=2]
  %scevgep = getelementptr double* %left.1.i.ph, i32 %tmp ; <double*> [#uses=2]
  %23 = load double* %scevgep, align 8            ; <double> [#uses=2]
  %24 = fcmp olt double %23, %17                  ; <i1> [#uses=1]
  br i1 %24, label %bb3.i, label %bb6.i

bb6.i:                                            ; preds = %bb3.i, %bb4.i.preheader
  %25 = phi double [ %.rle8, %bb4.i.preheader ], [ %23, %bb3.i ] ; <double> [#uses=1]
  %left.0.i.lcssa = phi double* [ %left.1.i.ph, %bb4.i.preheader ], [ %scevgep, %bb3.i ] ; <double*> [#uses=3]
  %26 = icmp ult double* %left.0.i.lcssa, %scevgep19 ; <i1> [#uses=1]
  br i1 %26, label %bb7.i, label %bb8.i

bb7.i:                                            ; preds = %bb6.i
  store double %25, double* %scevgep19, align 8
  store double %19, double* %left.0.i.lcssa, align 8
  br label %bb1.i.outer

bb8.i:                                            ; preds = %bb6.i, %bb2.i
  %tmp16 = sub i32 0, %indvar14                   ; <i32> [#uses=1]
  %right.0.i = getelementptr double* %right.0.i.ph, i32 %tmp16 ; <double*> [#uses=2]
  call fastcc void @_Z9quicksortIPd17less_than_functorEvT_S2_T0_(double* %begin, double* %right.0.i) nounwind
  call fastcc void @_Z9quicksortIPd17less_than_functorEvT_S2_T0_(double* %right.0.i, double* %right.0) nounwind
  br label %_Z9quicksortIPd17less_than_functorEvT_S2_T0_.exit

_Z9quicksortIPd17less_than_functorEvT_S2_T0_.exit: ; preds = %bb8.i, %bb8
  call fastcc void @_Z9quicksortIPd17less_than_functorEvT_S2_T0_(double* %right.0, double* %end)
  ret void

return:                                           ; preds = %entry
  ret void
}

define internal fastcc void @_Z9quicksortIPd24inline_less_than_functorEvT_S2_T0_(double* %begin, double* %end) nounwind {
entry:
  %0 = ptrtoint double* %end to i32               ; <i32> [#uses=1]
  %1 = ptrtoint double* %begin to i32             ; <i32> [#uses=2]
  %2 = sub i32 %0, %1                             ; <i32> [#uses=1]
  %3 = icmp sgt i32 %2, 15                        ; <i1> [#uses=1]
  br i1 %3, label %bb, label %return

bb:                                               ; preds = %entry
  %4 = load double* %begin, align 8               ; <double> [#uses=5]
  br label %bb1.outer

bb1.outer:                                        ; preds = %bb7, %bb
  %.rle36 = phi double [ %6, %bb7 ], [ %4, %bb ]  ; <double> [#uses=1]
  %5 = phi double [ %6, %bb7 ], [ %4, %bb ]       ; <double> [#uses=1]
  %right.0.ph = phi double* [ %end, %bb ], [ %scevgep31, %bb7 ] ; <double*> [#uses=2]
  %left.1.ph = phi double* [ %begin, %bb ], [ %left.0.lcssa, %bb7 ] ; <double*> [#uses=3]
  br label %bb1

bb1:                                              ; preds = %bb1, %bb1.outer
  %indvar26 = phi i32 [ 0, %bb1.outer ], [ %indvar.next27, %bb1 ] ; <i32> [#uses=3]
  %tmp30 = xor i32 %indvar26, -1                  ; <i32> [#uses=1]
  %scevgep31 = getelementptr double* %right.0.ph, i32 %tmp30 ; <double*> [#uses=5]
  %6 = load double* %scevgep31, align 8           ; <double> [#uses=4]
  %7 = fcmp olt double %4, %6                     ; <i1> [#uses=1]
  %indvar.next27 = add i32 %indvar26, 1           ; <i32> [#uses=1]
  br i1 %7, label %bb1, label %bb2

bb2:                                              ; preds = %bb1
  %8 = icmp ult double* %left.1.ph, %scevgep31    ; <i1> [#uses=1]
  br i1 %8, label %bb4.preheader, label %bb8

bb4.preheader:                                    ; preds = %bb2
  %9 = fcmp olt double %5, %4                     ; <i1> [#uses=1]
  br i1 %9, label %bb3, label %bb6

bb3:                                              ; preds = %bb3, %bb4.preheader
  %indvar21 = phi i32 [ %tmp23, %bb3 ], [ 0, %bb4.preheader ] ; <i32> [#uses=1]
  %tmp23 = add i32 %indvar21, 1                   ; <i32> [#uses=2]
  %scevgep24 = getelementptr double* %left.1.ph, i32 %tmp23 ; <double*> [#uses=2]
  %10 = load double* %scevgep24, align 8          ; <double> [#uses=2]
  %11 = fcmp olt double %10, %4                   ; <i1> [#uses=1]
  br i1 %11, label %bb3, label %bb6

bb6:                                              ; preds = %bb3, %bb4.preheader
  %12 = phi double [ %.rle36, %bb4.preheader ], [ %10, %bb3 ] ; <double> [#uses=1]
  %left.0.lcssa = phi double* [ %left.1.ph, %bb4.preheader ], [ %scevgep24, %bb3 ] ; <double*> [#uses=3]
  %13 = icmp ult double* %left.0.lcssa, %scevgep31 ; <i1> [#uses=1]
  br i1 %13, label %bb7, label %bb8

bb7:                                              ; preds = %bb6
  store double %12, double* %scevgep31, align 8
  store double %6, double* %left.0.lcssa, align 8
  br label %bb1.outer

bb8:                                              ; preds = %bb6, %bb2
  %tmp28 = sub i32 0, %indvar26                   ; <i32> [#uses=1]
  %right.0 = getelementptr double* %right.0.ph, i32 %tmp28 ; <double*> [#uses=4]
  %14 = ptrtoint double* %right.0 to i32          ; <i32> [#uses=1]
  %15 = sub i32 %14, %1                           ; <i32> [#uses=1]
  %16 = icmp sgt i32 %15, 15                      ; <i1> [#uses=1]
  br i1 %16, label %bb.i, label %_Z9quicksortIPd24inline_less_than_functorEvT_S2_T0_.exit

bb.i:                                             ; preds = %bb8
  %17 = load double* %begin, align 8              ; <double> [#uses=5]
  br label %bb1.i.outer

bb1.i.outer:                                      ; preds = %bb7.i, %bb.i
  %.rle8 = phi double [ %19, %bb7.i ], [ %17, %bb.i ] ; <double> [#uses=1]
  %18 = phi double [ %19, %bb7.i ], [ %17, %bb.i ] ; <double> [#uses=1]
  %right.0.i.ph = phi double* [ %right.0, %bb.i ], [ %scevgep19, %bb7.i ] ; <double*> [#uses=2]
  %left.1.i.ph = phi double* [ %begin, %bb.i ], [ %left.0.i.lcssa, %bb7.i ] ; <double*> [#uses=3]
  br label %bb1.i

bb1.i:                                            ; preds = %bb1.i, %bb1.i.outer
  %indvar14 = phi i32 [ 0, %bb1.i.outer ], [ %indvar.next15, %bb1.i ] ; <i32> [#uses=3]
  %tmp18 = xor i32 %indvar14, -1                  ; <i32> [#uses=1]
  %scevgep19 = getelementptr double* %right.0.i.ph, i32 %tmp18 ; <double*> [#uses=5]
  %19 = load double* %scevgep19, align 8          ; <double> [#uses=4]
  %20 = fcmp olt double %17, %19                  ; <i1> [#uses=1]
  %indvar.next15 = add i32 %indvar14, 1           ; <i32> [#uses=1]
  br i1 %20, label %bb1.i, label %bb2.i

bb2.i:                                            ; preds = %bb1.i
  %21 = icmp ult double* %left.1.i.ph, %scevgep19 ; <i1> [#uses=1]
  br i1 %21, label %bb4.i.preheader, label %bb8.i

bb4.i.preheader:                                  ; preds = %bb2.i
  %22 = fcmp olt double %18, %17                  ; <i1> [#uses=1]
  br i1 %22, label %bb3.i, label %bb6.i

bb3.i:                                            ; preds = %bb3.i, %bb4.i.preheader
  %indvar = phi i32 [ %tmp, %bb3.i ], [ 0, %bb4.i.preheader ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=2]
  %scevgep = getelementptr double* %left.1.i.ph, i32 %tmp ; <double*> [#uses=2]
  %23 = load double* %scevgep, align 8            ; <double> [#uses=2]
  %24 = fcmp olt double %23, %17                  ; <i1> [#uses=1]
  br i1 %24, label %bb3.i, label %bb6.i

bb6.i:                                            ; preds = %bb3.i, %bb4.i.preheader
  %25 = phi double [ %.rle8, %bb4.i.preheader ], [ %23, %bb3.i ] ; <double> [#uses=1]
  %left.0.i.lcssa = phi double* [ %left.1.i.ph, %bb4.i.preheader ], [ %scevgep, %bb3.i ] ; <double*> [#uses=3]
  %26 = icmp ult double* %left.0.i.lcssa, %scevgep19 ; <i1> [#uses=1]
  br i1 %26, label %bb7.i, label %bb8.i

bb7.i:                                            ; preds = %bb6.i
  store double %25, double* %scevgep19, align 8
  store double %19, double* %left.0.i.lcssa, align 8
  br label %bb1.i.outer

bb8.i:                                            ; preds = %bb6.i, %bb2.i
  %tmp16 = sub i32 0, %indvar14                   ; <i32> [#uses=1]
  %right.0.i = getelementptr double* %right.0.i.ph, i32 %tmp16 ; <double*> [#uses=2]
  call fastcc void @_Z9quicksortIPd24inline_less_than_functorEvT_S2_T0_(double* %begin, double* %right.0.i) nounwind
  call fastcc void @_Z9quicksortIPd24inline_less_than_functorEvT_S2_T0_(double* %right.0.i, double* %right.0) nounwind
  br label %_Z9quicksortIPd24inline_less_than_functorEvT_S2_T0_.exit

_Z9quicksortIPd24inline_less_than_functorEvT_S2_T0_.exit: ; preds = %bb8.i, %bb8
  call fastcc void @_Z9quicksortIPd24inline_less_than_functorEvT_S2_T0_(double* %right.0, double* %end)
  ret void

return:                                           ; preds = %entry
  ret void
}

define internal fastcc void @_Z9quicksortIPdEvT_S1_(double* %begin, double* %end) nounwind {
entry:
  %0 = ptrtoint double* %end to i32               ; <i32> [#uses=2]
  br label %tailrecurse

tailrecurse:                                      ; preds = %bb7.i, %entry
  %begin.tr = phi double* [ %begin, %entry ], [ %right.0.i, %bb7.i ] ; <double*> [#uses=4]
  %1 = ptrtoint double* %begin.tr to i32          ; <i32> [#uses=1]
  %2 = sub i32 %0, %1                             ; <i32> [#uses=1]
  %3 = icmp sgt i32 %2, 15                        ; <i1> [#uses=1]
  br i1 %3, label %bb, label %return

bb:                                               ; preds = %tailrecurse
  %4 = load double* %begin.tr, align 8            ; <double> [#uses=5]
  br label %bb1.outer

bb1.outer:                                        ; preds = %bb6, %bb
  %.rle33 = phi double [ %6, %bb6 ], [ %4, %bb ]  ; <double> [#uses=1]
  %5 = phi double [ %6, %bb6 ], [ %4, %bb ]       ; <double> [#uses=1]
  %right.0.ph = phi double* [ %end, %bb ], [ %scevgep13, %bb6 ] ; <double*> [#uses=2]
  %left.1.ph = phi double* [ %begin.tr, %bb ], [ %left.0.lcssa, %bb6 ] ; <double*> [#uses=3]
  br label %bb1

bb1:                                              ; preds = %bb1, %bb1.outer
  %indvar8 = phi i32 [ 0, %bb1.outer ], [ %indvar.next9, %bb1 ] ; <i32> [#uses=3]
  %tmp12 = xor i32 %indvar8, -1                   ; <i32> [#uses=1]
  %scevgep13 = getelementptr double* %right.0.ph, i32 %tmp12 ; <double*> [#uses=5]
  %6 = load double* %scevgep13, align 8           ; <double> [#uses=4]
  %7 = fcmp ogt double %6, %4                     ; <i1> [#uses=1]
  %indvar.next9 = add i32 %indvar8, 1             ; <i32> [#uses=1]
  br i1 %7, label %bb1, label %bb2

bb2:                                              ; preds = %bb1
  %8 = icmp ult double* %left.1.ph, %scevgep13    ; <i1> [#uses=1]
  br i1 %8, label %bb4.preheader, label %bb7

bb4.preheader:                                    ; preds = %bb2
  %9 = fcmp olt double %5, %4                     ; <i1> [#uses=1]
  br i1 %9, label %bb3, label %bb5

bb3:                                              ; preds = %bb3, %bb4.preheader
  %indvar = phi i32 [ %tmp, %bb3 ], [ 0, %bb4.preheader ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=2]
  %scevgep = getelementptr double* %left.1.ph, i32 %tmp ; <double*> [#uses=2]
  %10 = load double* %scevgep, align 8            ; <double> [#uses=2]
  %11 = fcmp olt double %10, %4                   ; <i1> [#uses=1]
  br i1 %11, label %bb3, label %bb5

bb5:                                              ; preds = %bb3, %bb4.preheader
  %12 = phi double [ %.rle33, %bb4.preheader ], [ %10, %bb3 ] ; <double> [#uses=1]
  %left.0.lcssa = phi double* [ %left.1.ph, %bb4.preheader ], [ %scevgep, %bb3 ] ; <double*> [#uses=3]
  %13 = icmp ult double* %left.0.lcssa, %scevgep13 ; <i1> [#uses=1]
  br i1 %13, label %bb6, label %bb7

bb6:                                              ; preds = %bb5
  store double %12, double* %scevgep13, align 8
  store double %6, double* %left.0.lcssa, align 8
  br label %bb1.outer

bb7:                                              ; preds = %bb5, %bb2
  %tmp10 = sub i32 0, %indvar8                    ; <i32> [#uses=1]
  %right.0 = getelementptr double* %right.0.ph, i32 %tmp10 ; <double*> [#uses=5]
  tail call fastcc void @_Z9quicksortIPdEvT_S1_(double* %begin.tr, double* %right.0)
  %14 = ptrtoint double* %right.0 to i32          ; <i32> [#uses=1]
  %15 = sub i32 %0, %14                           ; <i32> [#uses=1]
  %16 = icmp sgt i32 %15, 15                      ; <i1> [#uses=1]
  br i1 %16, label %bb.i, label %_Z9quicksortIPdEvT_S1_.exit

bb.i:                                             ; preds = %bb7
  %17 = load double* %right.0, align 8            ; <double> [#uses=5]
  br label %bb1.i.outer

bb1.i.outer:                                      ; preds = %bb6.i, %bb.i
  %.rle29 = phi double [ %19, %bb6.i ], [ %17, %bb.i ] ; <double> [#uses=1]
  %18 = phi double [ %19, %bb6.i ], [ %17, %bb.i ] ; <double> [#uses=1]
  %right.0.i.ph = phi double* [ %end, %bb.i ], [ %scevgep25, %bb6.i ] ; <double*> [#uses=2]
  %left.1.i.ph = phi double* [ %right.0, %bb.i ], [ %left.0.i.lcssa, %bb6.i ] ; <double*> [#uses=3]
  br label %bb1.i

bb1.i:                                            ; preds = %bb1.i, %bb1.i.outer
  %indvar20 = phi i32 [ 0, %bb1.i.outer ], [ %indvar.next21, %bb1.i ] ; <i32> [#uses=3]
  %tmp24 = xor i32 %indvar20, -1                  ; <i32> [#uses=1]
  %scevgep25 = getelementptr double* %right.0.i.ph, i32 %tmp24 ; <double*> [#uses=5]
  %19 = load double* %scevgep25, align 8          ; <double> [#uses=4]
  %20 = fcmp ogt double %19, %17                  ; <i1> [#uses=1]
  %indvar.next21 = add i32 %indvar20, 1           ; <i32> [#uses=1]
  br i1 %20, label %bb1.i, label %bb2.i

bb2.i:                                            ; preds = %bb1.i
  %21 = icmp ult double* %left.1.i.ph, %scevgep25 ; <i1> [#uses=1]
  br i1 %21, label %bb4.i.preheader, label %bb7.i

bb4.i.preheader:                                  ; preds = %bb2.i
  %22 = fcmp olt double %18, %17                  ; <i1> [#uses=1]
  br i1 %22, label %bb3.i, label %bb5.i

bb3.i:                                            ; preds = %bb3.i, %bb4.i.preheader
  %indvar15 = phi i32 [ %tmp17, %bb3.i ], [ 0, %bb4.i.preheader ] ; <i32> [#uses=1]
  %tmp17 = add i32 %indvar15, 1                   ; <i32> [#uses=2]
  %scevgep18 = getelementptr double* %left.1.i.ph, i32 %tmp17 ; <double*> [#uses=2]
  %23 = load double* %scevgep18, align 8          ; <double> [#uses=2]
  %24 = fcmp olt double %23, %17                  ; <i1> [#uses=1]
  br i1 %24, label %bb3.i, label %bb5.i

bb5.i:                                            ; preds = %bb3.i, %bb4.i.preheader
  %25 = phi double [ %.rle29, %bb4.i.preheader ], [ %23, %bb3.i ] ; <double> [#uses=1]
  %left.0.i.lcssa = phi double* [ %left.1.i.ph, %bb4.i.preheader ], [ %scevgep18, %bb3.i ] ; <double*> [#uses=3]
  %26 = icmp ult double* %left.0.i.lcssa, %scevgep25 ; <i1> [#uses=1]
  br i1 %26, label %bb6.i, label %bb7.i

bb6.i:                                            ; preds = %bb5.i
  store double %25, double* %scevgep25, align 8
  store double %19, double* %left.0.i.lcssa, align 8
  br label %bb1.i.outer

bb7.i:                                            ; preds = %bb5.i, %bb2.i
  %tmp22 = sub i32 0, %indvar20                   ; <i32> [#uses=1]
  %right.0.i = getelementptr double* %right.0.i.ph, i32 %tmp22 ; <double*> [#uses=2]
  tail call fastcc void @_Z9quicksortIPdEvT_S1_(double* %right.0, double* %right.0.i) nounwind
  br label %tailrecurse

_Z9quicksortIPdEvT_S1_.exit:                      ; preds = %bb7
  ret void

return:                                           ; preds = %tailrecurse
  ret void
}

define internal fastcc void @_Z9quicksortIPdSt4lessIdEEvT_S3_T0_(double* %begin, double* %end) nounwind {
entry:
  %0 = ptrtoint double* %end to i32               ; <i32> [#uses=1]
  %1 = ptrtoint double* %begin to i32             ; <i32> [#uses=2]
  %2 = sub i32 %0, %1                             ; <i32> [#uses=1]
  %3 = icmp sgt i32 %2, 15                        ; <i1> [#uses=1]
  br i1 %3, label %bb, label %return

bb:                                               ; preds = %entry
  %4 = load double* %begin, align 8               ; <double> [#uses=5]
  br label %bb1.outer

bb1.outer:                                        ; preds = %bb7, %bb
  %.rle36 = phi double [ %6, %bb7 ], [ %4, %bb ]  ; <double> [#uses=1]
  %5 = phi double [ %6, %bb7 ], [ %4, %bb ]       ; <double> [#uses=1]
  %right.0.ph = phi double* [ %end, %bb ], [ %scevgep31, %bb7 ] ; <double*> [#uses=2]
  %left.1.ph = phi double* [ %begin, %bb ], [ %left.0.lcssa, %bb7 ] ; <double*> [#uses=3]
  br label %bb1

bb1:                                              ; preds = %bb1, %bb1.outer
  %indvar26 = phi i32 [ 0, %bb1.outer ], [ %indvar.next27, %bb1 ] ; <i32> [#uses=3]
  %tmp30 = xor i32 %indvar26, -1                  ; <i32> [#uses=1]
  %scevgep31 = getelementptr double* %right.0.ph, i32 %tmp30 ; <double*> [#uses=5]
  %6 = load double* %scevgep31, align 8           ; <double> [#uses=4]
  %7 = fcmp olt double %4, %6                     ; <i1> [#uses=1]
  %indvar.next27 = add i32 %indvar26, 1           ; <i32> [#uses=1]
  br i1 %7, label %bb1, label %bb2

bb2:                                              ; preds = %bb1
  %8 = icmp ult double* %left.1.ph, %scevgep31    ; <i1> [#uses=1]
  br i1 %8, label %bb4.preheader, label %bb8

bb4.preheader:                                    ; preds = %bb2
  %9 = fcmp olt double %5, %4                     ; <i1> [#uses=1]
  br i1 %9, label %bb3, label %bb6

bb3:                                              ; preds = %bb3, %bb4.preheader
  %indvar21 = phi i32 [ %tmp23, %bb3 ], [ 0, %bb4.preheader ] ; <i32> [#uses=1]
  %tmp23 = add i32 %indvar21, 1                   ; <i32> [#uses=2]
  %scevgep24 = getelementptr double* %left.1.ph, i32 %tmp23 ; <double*> [#uses=2]
  %10 = load double* %scevgep24, align 8          ; <double> [#uses=2]
  %11 = fcmp olt double %10, %4                   ; <i1> [#uses=1]
  br i1 %11, label %bb3, label %bb6

bb6:                                              ; preds = %bb3, %bb4.preheader
  %12 = phi double [ %.rle36, %bb4.preheader ], [ %10, %bb3 ] ; <double> [#uses=1]
  %left.0.lcssa = phi double* [ %left.1.ph, %bb4.preheader ], [ %scevgep24, %bb3 ] ; <double*> [#uses=3]
  %13 = icmp ult double* %left.0.lcssa, %scevgep31 ; <i1> [#uses=1]
  br i1 %13, label %bb7, label %bb8

bb7:                                              ; preds = %bb6
  store double %12, double* %scevgep31, align 8
  store double %6, double* %left.0.lcssa, align 8
  br label %bb1.outer

bb8:                                              ; preds = %bb6, %bb2
  %tmp28 = sub i32 0, %indvar26                   ; <i32> [#uses=1]
  %right.0 = getelementptr double* %right.0.ph, i32 %tmp28 ; <double*> [#uses=4]
  %14 = ptrtoint double* %right.0 to i32          ; <i32> [#uses=1]
  %15 = sub i32 %14, %1                           ; <i32> [#uses=1]
  %16 = icmp sgt i32 %15, 15                      ; <i1> [#uses=1]
  br i1 %16, label %bb.i, label %_Z9quicksortIPdSt4lessIdEEvT_S3_T0_.exit

bb.i:                                             ; preds = %bb8
  %17 = load double* %begin, align 8              ; <double> [#uses=5]
  br label %bb1.i.outer

bb1.i.outer:                                      ; preds = %bb7.i, %bb.i
  %.rle8 = phi double [ %19, %bb7.i ], [ %17, %bb.i ] ; <double> [#uses=1]
  %18 = phi double [ %19, %bb7.i ], [ %17, %bb.i ] ; <double> [#uses=1]
  %right.0.i.ph = phi double* [ %right.0, %bb.i ], [ %scevgep19, %bb7.i ] ; <double*> [#uses=2]
  %left.1.i.ph = phi double* [ %begin, %bb.i ], [ %left.0.i.lcssa, %bb7.i ] ; <double*> [#uses=3]
  br label %bb1.i

bb1.i:                                            ; preds = %bb1.i, %bb1.i.outer
  %indvar14 = phi i32 [ 0, %bb1.i.outer ], [ %indvar.next15, %bb1.i ] ; <i32> [#uses=3]
  %tmp18 = xor i32 %indvar14, -1                  ; <i32> [#uses=1]
  %scevgep19 = getelementptr double* %right.0.i.ph, i32 %tmp18 ; <double*> [#uses=5]
  %19 = load double* %scevgep19, align 8          ; <double> [#uses=4]
  %20 = fcmp olt double %17, %19                  ; <i1> [#uses=1]
  %indvar.next15 = add i32 %indvar14, 1           ; <i32> [#uses=1]
  br i1 %20, label %bb1.i, label %bb2.i

bb2.i:                                            ; preds = %bb1.i
  %21 = icmp ult double* %left.1.i.ph, %scevgep19 ; <i1> [#uses=1]
  br i1 %21, label %bb4.i.preheader, label %bb8.i

bb4.i.preheader:                                  ; preds = %bb2.i
  %22 = fcmp olt double %18, %17                  ; <i1> [#uses=1]
  br i1 %22, label %bb3.i, label %bb6.i

bb3.i:                                            ; preds = %bb3.i, %bb4.i.preheader
  %indvar = phi i32 [ %tmp, %bb3.i ], [ 0, %bb4.i.preheader ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=2]
  %scevgep = getelementptr double* %left.1.i.ph, i32 %tmp ; <double*> [#uses=2]
  %23 = load double* %scevgep, align 8            ; <double> [#uses=2]
  %24 = fcmp olt double %23, %17                  ; <i1> [#uses=1]
  br i1 %24, label %bb3.i, label %bb6.i

bb6.i:                                            ; preds = %bb3.i, %bb4.i.preheader
  %25 = phi double [ %.rle8, %bb4.i.preheader ], [ %23, %bb3.i ] ; <double> [#uses=1]
  %left.0.i.lcssa = phi double* [ %left.1.i.ph, %bb4.i.preheader ], [ %scevgep, %bb3.i ] ; <double*> [#uses=3]
  %26 = icmp ult double* %left.0.i.lcssa, %scevgep19 ; <i1> [#uses=1]
  br i1 %26, label %bb7.i, label %bb8.i

bb7.i:                                            ; preds = %bb6.i
  store double %25, double* %scevgep19, align 8
  store double %19, double* %left.0.i.lcssa, align 8
  br label %bb1.i.outer

bb8.i:                                            ; preds = %bb6.i, %bb2.i
  %tmp16 = sub i32 0, %indvar14                   ; <i32> [#uses=1]
  %right.0.i = getelementptr double* %right.0.i.ph, i32 %tmp16 ; <double*> [#uses=2]
  call fastcc void @_Z9quicksortIPdSt4lessIdEEvT_S3_T0_(double* %begin, double* %right.0.i) nounwind
  call fastcc void @_Z9quicksortIPdSt4lessIdEEvT_S3_T0_(double* %right.0.i, double* %right.0) nounwind
  br label %_Z9quicksortIPdSt4lessIdEEvT_S3_T0_.exit

_Z9quicksortIPdSt4lessIdEEvT_S3_T0_.exit:         ; preds = %bb8.i, %bb8
  call fastcc void @_Z9quicksortIPdSt4lessIdEEvT_S3_T0_(double* %right.0, double* %end)
  ret void

return:                                           ; preds = %entry
  ret void
}

define internal fastcc void @_ZSt13__heap_selectIPdPFbddEEvT_S3_S3_T0_(double* %__first, double* %__middle, double* %__last) nounwind {
entry:
  %0 = ptrtoint double* %__middle to i32          ; <i32> [#uses=1]
  %1 = ptrtoint double* %__first to i32           ; <i32> [#uses=1]
  %2 = sub i32 %0, %1                             ; <i32> [#uses=3]
  %3 = icmp sgt i32 %2, 15                        ; <i1> [#uses=1]
  br i1 %3, label %bb.i, label %_ZSt9make_heapIPdPFbddEEvT_S3_T0_.exit

bb.i:                                             ; preds = %entry
  %4 = ashr i32 %2, 3                             ; <i32> [#uses=4]
  %5 = add i32 %4, -2                             ; <i32> [#uses=1]
  %6 = sdiv i32 %5, 2                             ; <i32> [#uses=3]
  %tmp3.i = shl i32 %6, 1                         ; <i32> [#uses=2]
  %tmp5.i = add i32 %tmp3.i, 2                    ; <i32> [#uses=1]
  br label %bb1.i

bb1.i:                                            ; preds = %bb2.i, %bb.i
  %indvar.i = phi i32 [ 0, %bb.i ], [ %indvar.next.i, %bb2.i ] ; <i32> [#uses=4]
  %__parent.0.i = sub i32 %6, %indvar.i           ; <i32> [#uses=4]
  %tmp2.i = mul i32 %indvar.i, -2                 ; <i32> [#uses=2]
  %__secondChild.1.in3.i.i = add i32 %tmp2.i, %tmp3.i ; <i32> [#uses=2]
  %__secondChild.15.i.i = add i32 %tmp2.i, %tmp5.i ; <i32> [#uses=3]
  %scevgep.i = getelementptr double* %__first, i32 %__parent.0.i ; <double*> [#uses=1]
  %7 = load double* %scevgep.i, align 4           ; <double> [#uses=2]
  %8 = icmp slt i32 %__secondChild.15.i.i, %4     ; <i1> [#uses=1]
  br i1 %8, label %bb.i.i8, label %bb4.i.i12

bb.i.i8:                                          ; preds = %bb.i.i8, %bb1.i
  %__secondChild.16.i.i1 = phi i32 [ %__secondChild.1.i.i7, %bb.i.i8 ], [ %__secondChild.15.i.i, %bb1.i ] ; <i32> [#uses=2]
  %__secondChild.1.in4.i.i2 = phi i32 [ %phitmp.i.i6, %bb.i.i8 ], [ %__secondChild.1.in3.i.i, %bb1.i ] ; <i32> [#uses=1]
  %__holeIndex_addr.01.i.i3 = phi i32 [ %__secondChild.1..i.i5, %bb.i.i8 ], [ %__parent.0.i, %bb1.i ] ; <i32> [#uses=1]
  %9 = or i32 %__secondChild.1.in4.i.i2, 1        ; <i32> [#uses=2]
  %10 = getelementptr inbounds double* %__first, i32 %9 ; <double*> [#uses=1]
  %11 = load double* %10, align 4                 ; <double> [#uses=1]
  %12 = getelementptr inbounds double* %__first, i32 %__secondChild.16.i.i1 ; <double*> [#uses=1]
  %13 = load double* %12, align 4                 ; <double> [#uses=1]
  %14 = fcmp olt double %13, %11                  ; <i1> [#uses=1]
  %__secondChild.1..i.i5 = select i1 %14, i32 %9, i32 %__secondChild.16.i.i1 ; <i32> [#uses=4]
  %15 = getelementptr inbounds double* %__first, i32 %__secondChild.1..i.i5 ; <double*> [#uses=1]
  %16 = load double* %15, align 4                 ; <double> [#uses=1]
  %17 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.01.i.i3 ; <double*> [#uses=1]
  store double %16, double* %17, align 4
  %phitmp.i.i6 = shl i32 %__secondChild.1..i.i5, 1 ; <i32> [#uses=3]
  %__secondChild.1.i.i7 = add i32 %phitmp.i.i6, 2 ; <i32> [#uses=3]
  %18 = icmp slt i32 %__secondChild.1.i.i7, %4    ; <i1> [#uses=1]
  br i1 %18, label %bb.i.i8, label %bb4.i.i12

bb4.i.i12:                                        ; preds = %bb.i.i8, %bb1.i
  %__secondChild.1.lcssa.i.i9 = phi i32 [ %__secondChild.15.i.i, %bb1.i ], [ %__secondChild.1.i.i7, %bb.i.i8 ] ; <i32> [#uses=1]
  %__secondChild.1.in.lcssa.i.i10 = phi i32 [ %__secondChild.1.in3.i.i, %bb1.i ], [ %phitmp.i.i6, %bb.i.i8 ] ; <i32> [#uses=1]
  %__holeIndex_addr.0.lcssa.i.i11 = phi i32 [ %__parent.0.i, %bb1.i ], [ %__secondChild.1..i.i5, %bb.i.i8 ] ; <i32> [#uses=3]
  %19 = icmp eq i32 %__secondChild.1.lcssa.i.i9, %4 ; <i1> [#uses=1]
  br i1 %19, label %bb5.i.i13, label %bb1.i.i.i19

bb5.i.i13:                                        ; preds = %bb4.i.i12
  %20 = or i32 %__secondChild.1.in.lcssa.i.i10, 1 ; <i32> [#uses=3]
  %21 = getelementptr inbounds double* %__first, i32 %20 ; <double*> [#uses=1]
  %22 = load double* %21, align 4                 ; <double> [#uses=1]
  %23 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.lcssa.i.i11 ; <double*> [#uses=1]
  store double %22, double* %23, align 4
  br label %bb1.i.i.i19

bb.i.i.i14:                                       ; preds = %bb2.i.i.i21
  %24 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i16 ; <double*> [#uses=1]
  store double %27, double* %24, align 4
  br label %bb1.i.i.i19

bb1.i.i.i19:                                      ; preds = %bb.i.i.i14, %bb5.i.i13, %bb4.i.i12
  %__parent.0.in.in.i.i.i15 = phi i32 [ %__parent.0.i.i.i18, %bb.i.i.i14 ], [ %20, %bb5.i.i13 ], [ %__holeIndex_addr.0.lcssa.i.i11, %bb4.i.i12 ] ; <i32> [#uses=1]
  %__holeIndex_addr.0.i.i.i16 = phi i32 [ %__parent.0.i.i.i18, %bb.i.i.i14 ], [ %20, %bb5.i.i13 ], [ %__holeIndex_addr.0.lcssa.i.i11, %bb4.i.i12 ] ; <i32> [#uses=3]
  %__parent.0.in.i.i.i17 = add i32 %__parent.0.in.in.i.i.i15, -1 ; <i32> [#uses=1]
  %__parent.0.i.i.i18 = sdiv i32 %__parent.0.in.i.i.i17, 2 ; <i32> [#uses=3]
  %25 = icmp sgt i32 %__holeIndex_addr.0.i.i.i16, %__parent.0.i ; <i1> [#uses=1]
  br i1 %25, label %bb2.i.i.i21, label %_ZSt13__adjust_heapIPdidPFbddEEvT_T0_S4_T1_T2_.exit.i

bb2.i.i.i21:                                      ; preds = %bb1.i.i.i19
  %26 = getelementptr inbounds double* %__first, i32 %__parent.0.i.i.i18 ; <double*> [#uses=1]
  %27 = load double* %26, align 4                 ; <double> [#uses=2]
  %28 = fcmp olt double %27, %7                   ; <i1> [#uses=1]
  br i1 %28, label %bb.i.i.i14, label %_ZSt13__adjust_heapIPdidPFbddEEvT_T0_S4_T1_T2_.exit.i

_ZSt13__adjust_heapIPdidPFbddEEvT_T0_S4_T1_T2_.exit.i: ; preds = %bb2.i.i.i21, %bb1.i.i.i19
  %29 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i16 ; <double*> [#uses=1]
  store double %7, double* %29, align 4
  %30 = icmp eq i32 %6, %indvar.i                 ; <i1> [#uses=1]
  br i1 %30, label %_ZSt9make_heapIPdPFbddEEvT_S3_T0_.exit, label %bb2.i

bb2.i:                                            ; preds = %_ZSt13__adjust_heapIPdidPFbddEEvT_T0_S4_T1_T2_.exit.i
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br label %bb1.i

_ZSt9make_heapIPdPFbddEEvT_S3_T0_.exit:           ; preds = %_ZSt13__adjust_heapIPdidPFbddEEvT_T0_S4_T1_T2_.exit.i, %entry
  %31 = icmp ult double* %__middle, %__last       ; <i1> [#uses=1]
  br i1 %31, label %bb.nph, label %return

bb.nph:                                           ; preds = %_ZSt9make_heapIPdPFbddEEvT_S3_T0_.exit
  %32 = ashr i32 %2, 3                            ; <i32> [#uses=3]
  %33 = icmp sgt i32 %32, 2                       ; <i1> [#uses=1]
  br label %bb

bb:                                               ; preds = %bb2, %bb.nph
  %indvar = phi i32 [ 0, %bb.nph ], [ %tmp, %bb2 ] ; <i32> [#uses=2]
  %__i.01 = getelementptr double* %__middle, i32 %indvar ; <double*> [#uses=2]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=2]
  %scevgep = getelementptr double* %__middle, i32 %tmp ; <double*> [#uses=1]
  %34 = load double* %__first, align 8            ; <double> [#uses=2]
  %35 = load double* %__i.01, align 8             ; <double> [#uses=3]
  %36 = fcmp olt double %35, %34                  ; <i1> [#uses=1]
  br i1 %36, label %bb1, label %bb2

bb1:                                              ; preds = %bb
  store double %34, double* %__i.01, align 8
  br i1 %33, label %bb.i.i, label %bb4.i.i

bb.i.i:                                           ; preds = %bb.i.i, %bb1
  %__secondChild.16.i.i = phi i32 [ %__secondChild.1.i.i, %bb.i.i ], [ 2, %bb1 ] ; <i32> [#uses=2]
  %__secondChild.1.in4.i.i = phi i32 [ %phitmp.i.i, %bb.i.i ], [ 0, %bb1 ] ; <i32> [#uses=1]
  %__holeIndex_addr.01.i.i = phi i32 [ %__secondChild.1..i.i, %bb.i.i ], [ 0, %bb1 ] ; <i32> [#uses=1]
  %37 = or i32 %__secondChild.1.in4.i.i, 1        ; <i32> [#uses=2]
  %38 = getelementptr inbounds double* %__first, i32 %37 ; <double*> [#uses=1]
  %39 = load double* %38, align 4                 ; <double> [#uses=1]
  %40 = getelementptr inbounds double* %__first, i32 %__secondChild.16.i.i ; <double*> [#uses=1]
  %41 = load double* %40, align 4                 ; <double> [#uses=1]
  %42 = fcmp olt double %41, %39                  ; <i1> [#uses=1]
  %__secondChild.1..i.i = select i1 %42, i32 %37, i32 %__secondChild.16.i.i ; <i32> [#uses=4]
  %43 = getelementptr inbounds double* %__first, i32 %__secondChild.1..i.i ; <double*> [#uses=1]
  %44 = load double* %43, align 4                 ; <double> [#uses=1]
  %45 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.01.i.i ; <double*> [#uses=1]
  store double %44, double* %45, align 4
  %phitmp.i.i = shl i32 %__secondChild.1..i.i, 1  ; <i32> [#uses=3]
  %__secondChild.1.i.i = add i32 %phitmp.i.i, 2   ; <i32> [#uses=3]
  %46 = icmp slt i32 %__secondChild.1.i.i, %32    ; <i1> [#uses=1]
  br i1 %46, label %bb.i.i, label %bb4.i.loopexit.i

bb4.i.loopexit.i:                                 ; preds = %bb.i.i
  %phitmp.i = or i32 %phitmp.i.i, 1               ; <i32> [#uses=1]
  br label %bb4.i.i

bb4.i.i:                                          ; preds = %bb4.i.loopexit.i, %bb1
  %__secondChild.1.lcssa.i.i = phi i32 [ %__secondChild.1.i.i, %bb4.i.loopexit.i ], [ 2, %bb1 ] ; <i32> [#uses=1]
  %__secondChild.1.in.lcssa.i.i = phi i32 [ %phitmp.i, %bb4.i.loopexit.i ], [ 1, %bb1 ] ; <i32> [#uses=3]
  %__holeIndex_addr.0.lcssa.i.i = phi i32 [ %__secondChild.1..i.i, %bb4.i.loopexit.i ], [ 0, %bb1 ] ; <i32> [#uses=3]
  %47 = icmp eq i32 %__secondChild.1.lcssa.i.i, %32 ; <i1> [#uses=1]
  br i1 %47, label %bb5.i.i, label %bb1.i.i.i

bb5.i.i:                                          ; preds = %bb4.i.i
  %48 = getelementptr inbounds double* %__first, i32 %__secondChild.1.in.lcssa.i.i ; <double*> [#uses=1]
  %49 = load double* %48, align 4                 ; <double> [#uses=1]
  %50 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.lcssa.i.i ; <double*> [#uses=1]
  store double %49, double* %50, align 4
  br label %bb1.i.i.i

bb.i.i.i:                                         ; preds = %bb2.i.i.i
  %51 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i ; <double*> [#uses=1]
  store double %54, double* %51, align 4
  br label %bb1.i.i.i

bb1.i.i.i:                                        ; preds = %bb.i.i.i, %bb5.i.i, %bb4.i.i
  %__parent.0.in.in.i.i.i = phi i32 [ %__parent.0.i.i.i, %bb.i.i.i ], [ %__secondChild.1.in.lcssa.i.i, %bb5.i.i ], [ %__holeIndex_addr.0.lcssa.i.i, %bb4.i.i ] ; <i32> [#uses=1]
  %__holeIndex_addr.0.i.i.i = phi i32 [ %__parent.0.i.i.i, %bb.i.i.i ], [ %__secondChild.1.in.lcssa.i.i, %bb5.i.i ], [ %__holeIndex_addr.0.lcssa.i.i, %bb4.i.i ] ; <i32> [#uses=3]
  %__parent.0.in.i.i.i = add i32 %__parent.0.in.in.i.i.i, -1 ; <i32> [#uses=1]
  %__parent.0.i.i.i = sdiv i32 %__parent.0.in.i.i.i, 2 ; <i32> [#uses=3]
  %52 = icmp sgt i32 %__holeIndex_addr.0.i.i.i, 0 ; <i1> [#uses=1]
  br i1 %52, label %bb2.i.i.i, label %_ZSt10__pop_heapIPddPFbddEEvT_S3_S3_T0_T1_.exit

bb2.i.i.i:                                        ; preds = %bb1.i.i.i
  %53 = getelementptr inbounds double* %__first, i32 %__parent.0.i.i.i ; <double*> [#uses=1]
  %54 = load double* %53, align 4                 ; <double> [#uses=2]
  %55 = fcmp olt double %54, %35                  ; <i1> [#uses=1]
  br i1 %55, label %bb.i.i.i, label %_ZSt10__pop_heapIPddPFbddEEvT_S3_S3_T0_T1_.exit

_ZSt10__pop_heapIPddPFbddEEvT_S3_S3_T0_T1_.exit:  ; preds = %bb2.i.i.i, %bb1.i.i.i
  %56 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i ; <double*> [#uses=1]
  store double %35, double* %56, align 4
  br label %bb2

bb2:                                              ; preds = %_ZSt10__pop_heapIPddPFbddEEvT_S3_S3_T0_T1_.exit, %bb
  %57 = icmp ult double* %scevgep, %__last        ; <i1> [#uses=1]
  br i1 %57, label %bb, label %return

return:                                           ; preds = %bb2, %_ZSt9make_heapIPdPFbddEEvT_S3_T0_.exit
  ret void
}

define internal fastcc void @_ZSt8pop_heapIPdPFbddEEvT_S3_T0_(double* %__first, double* %__last) nounwind {
entry:
  %0 = getelementptr inbounds double* %__last, i32 -1 ; <double*> [#uses=3]
  %1 = load double* %0, align 4                   ; <double> [#uses=2]
  %2 = load double* %__first, align 8             ; <double> [#uses=1]
  store double %2, double* %0, align 8
  %3 = ptrtoint double* %0 to i32                 ; <i32> [#uses=1]
  %4 = ptrtoint double* %__first to i32           ; <i32> [#uses=1]
  %5 = sub i32 %3, %4                             ; <i32> [#uses=1]
  %6 = ashr i32 %5, 3                             ; <i32> [#uses=3]
  %7 = icmp sgt i32 %6, 2                         ; <i1> [#uses=1]
  br i1 %7, label %bb.i.i, label %bb4.i.i

bb.i.i:                                           ; preds = %bb.i.i, %entry
  %__secondChild.16.i.i = phi i32 [ %__secondChild.1.i.i, %bb.i.i ], [ 2, %entry ] ; <i32> [#uses=2]
  %__secondChild.1.in4.i.i = phi i32 [ %phitmp.i.i, %bb.i.i ], [ 0, %entry ] ; <i32> [#uses=1]
  %__holeIndex_addr.01.i.i = phi i32 [ %__secondChild.1..i.i, %bb.i.i ], [ 0, %entry ] ; <i32> [#uses=1]
  %8 = or i32 %__secondChild.1.in4.i.i, 1         ; <i32> [#uses=2]
  %9 = getelementptr inbounds double* %__first, i32 %8 ; <double*> [#uses=1]
  %10 = load double* %9, align 4                  ; <double> [#uses=1]
  %11 = getelementptr inbounds double* %__first, i32 %__secondChild.16.i.i ; <double*> [#uses=1]
  %12 = load double* %11, align 4                 ; <double> [#uses=1]
  %13 = fcmp olt double %12, %10                  ; <i1> [#uses=1]
  %__secondChild.1..i.i = select i1 %13, i32 %8, i32 %__secondChild.16.i.i ; <i32> [#uses=4]
  %14 = getelementptr inbounds double* %__first, i32 %__secondChild.1..i.i ; <double*> [#uses=1]
  %15 = load double* %14, align 4                 ; <double> [#uses=1]
  %16 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.01.i.i ; <double*> [#uses=1]
  store double %15, double* %16, align 4
  %phitmp.i.i = shl i32 %__secondChild.1..i.i, 1  ; <i32> [#uses=3]
  %__secondChild.1.i.i = add i32 %phitmp.i.i, 2   ; <i32> [#uses=3]
  %17 = icmp slt i32 %__secondChild.1.i.i, %6     ; <i1> [#uses=1]
  br i1 %17, label %bb.i.i, label %bb4.i.loopexit.i

bb4.i.loopexit.i:                                 ; preds = %bb.i.i
  %phitmp.i = or i32 %phitmp.i.i, 1               ; <i32> [#uses=1]
  br label %bb4.i.i

bb4.i.i:                                          ; preds = %bb4.i.loopexit.i, %entry
  %__secondChild.1.lcssa.i.i = phi i32 [ %__secondChild.1.i.i, %bb4.i.loopexit.i ], [ 2, %entry ] ; <i32> [#uses=1]
  %__secondChild.1.in.lcssa.i.i = phi i32 [ %phitmp.i, %bb4.i.loopexit.i ], [ 1, %entry ] ; <i32> [#uses=3]
  %__holeIndex_addr.0.lcssa.i.i = phi i32 [ %__secondChild.1..i.i, %bb4.i.loopexit.i ], [ 0, %entry ] ; <i32> [#uses=3]
  %18 = icmp eq i32 %__secondChild.1.lcssa.i.i, %6 ; <i1> [#uses=1]
  br i1 %18, label %bb5.i.i, label %bb1.i.i.i

bb5.i.i:                                          ; preds = %bb4.i.i
  %19 = getelementptr inbounds double* %__first, i32 %__secondChild.1.in.lcssa.i.i ; <double*> [#uses=1]
  %20 = load double* %19, align 4                 ; <double> [#uses=1]
  %21 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.lcssa.i.i ; <double*> [#uses=1]
  store double %20, double* %21, align 4
  br label %bb1.i.i.i

bb.i.i.i:                                         ; preds = %bb2.i.i.i
  %22 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i ; <double*> [#uses=1]
  store double %25, double* %22, align 4
  br label %bb1.i.i.i

bb1.i.i.i:                                        ; preds = %bb.i.i.i, %bb5.i.i, %bb4.i.i
  %__parent.0.in.in.i.i.i = phi i32 [ %__parent.0.i.i.i, %bb.i.i.i ], [ %__secondChild.1.in.lcssa.i.i, %bb5.i.i ], [ %__holeIndex_addr.0.lcssa.i.i, %bb4.i.i ] ; <i32> [#uses=1]
  %__holeIndex_addr.0.i.i.i = phi i32 [ %__parent.0.i.i.i, %bb.i.i.i ], [ %__secondChild.1.in.lcssa.i.i, %bb5.i.i ], [ %__holeIndex_addr.0.lcssa.i.i, %bb4.i.i ] ; <i32> [#uses=3]
  %__parent.0.in.i.i.i = add i32 %__parent.0.in.in.i.i.i, -1 ; <i32> [#uses=1]
  %__parent.0.i.i.i = sdiv i32 %__parent.0.in.i.i.i, 2 ; <i32> [#uses=3]
  %23 = icmp sgt i32 %__holeIndex_addr.0.i.i.i, 0 ; <i1> [#uses=1]
  br i1 %23, label %bb2.i.i.i, label %_ZSt10__pop_heapIPddPFbddEEvT_S3_S3_T0_T1_.exit

bb2.i.i.i:                                        ; preds = %bb1.i.i.i
  %24 = getelementptr inbounds double* %__first, i32 %__parent.0.i.i.i ; <double*> [#uses=1]
  %25 = load double* %24, align 4                 ; <double> [#uses=2]
  %26 = fcmp olt double %25, %1                   ; <i1> [#uses=1]
  br i1 %26, label %bb.i.i.i, label %_ZSt10__pop_heapIPddPFbddEEvT_S3_S3_T0_T1_.exit

_ZSt10__pop_heapIPddPFbddEEvT_S3_S3_T0_T1_.exit:  ; preds = %bb2.i.i.i, %bb1.i.i.i
  %27 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i ; <double*> [#uses=1]
  store double %1, double* %27, align 4
  ret void
}

define internal fastcc void @_ZSt16__introsort_loopIPdiPFbddEEvT_S3_T0_T1_(double* %__first, double* %__last, i32 %__depth_limit) nounwind {
entry:
  %0 = ptrtoint double* %__first to i32           ; <i32> [#uses=2]
  %tmp20 = add i32 %__depth_limit, -2             ; <i32> [#uses=1]
  %tmp23 = add i32 %__depth_limit, -1             ; <i32> [#uses=1]
  br label %bb3

bb:                                               ; preds = %bb3
  %1 = icmp eq i32 %indvar17, %__depth_limit      ; <i1> [#uses=1]
  br i1 %1, label %bb1, label %bb2

bb1:                                              ; preds = %bb
  tail call fastcc void @_ZSt13__heap_selectIPdPFbddEEvT_S3_S3_T0_(double* %__first, double* %__last_addr.0, double* %__last_addr.0)
  %2 = icmp sgt i32 %58, 15                       ; <i1> [#uses=1]
  br i1 %2, label %bb.i.i, label %_ZSt12partial_sortIPdPFbddEEvT_S3_S3_T0_.exit

bb.i.i:                                           ; preds = %bb.i.i, %bb1
  %indvar.i.i = phi i32 [ %indvar.next.i.i, %bb.i.i ], [ 0, %bb1 ] ; <i32> [#uses=3]
  %tmp = sub i32 0, %indvar.i.i                   ; <i32> [#uses=1]
  %tmp9 = xor i32 %indvar.i.i, -1                 ; <i32> [#uses=1]
  %scevgep.i.i = getelementptr double* %__last_addr.0, i32 %tmp9 ; <double*> [#uses=1]
  %__last_addr.01.i.i = getelementptr double* %__last_addr.0, i32 %tmp ; <double*> [#uses=1]
  tail call fastcc void @_ZSt8pop_heapIPdPFbddEEvT_S3_T0_(double* %__first, double* %__last_addr.01.i.i)
  %phitmp.i.i = ptrtoint double* %scevgep.i.i to i32 ; <i32> [#uses=1]
  %3 = sub i32 %phitmp.i.i, %0                    ; <i32> [#uses=1]
  %4 = icmp sgt i32 %3, 15                        ; <i1> [#uses=1]
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=1]
  br i1 %4, label %bb.i.i, label %_ZSt12partial_sortIPdPFbddEEvT_S3_S3_T0_.exit

_ZSt12partial_sortIPdPFbddEEvT_S3_S3_T0_.exit:    ; preds = %bb.i.i, %bb1
  ret void

bb2:                                              ; preds = %bb
  %5 = getelementptr inbounds double* %__last_addr.0, i32 -1 ; <double*> [#uses=3]
  %6 = sdiv i32 %58, 16                           ; <i32> [#uses=1]
  %7 = getelementptr inbounds double* %__first, i32 %6 ; <double*> [#uses=3]
  %8 = load double* %7, align 8                   ; <double> [#uses=3]
  %9 = load double* %__first, align 8             ; <double> [#uses=4]
  %10 = fcmp olt double %9, %8                    ; <i1> [#uses=1]
  %11 = load double* %5, align 8                  ; <double> [#uses=4]
  br i1 %10, label %bb.i3, label %bb7.i5

bb.i3:                                            ; preds = %bb2
  %12 = fcmp olt double %8, %11                   ; <i1> [#uses=1]
  br i1 %12, label %_ZSt8__medianIdPFbddEERKT_S4_S4_S4_T0_.exit, label %bb3.i4

bb3.i4:                                           ; preds = %bb.i3
  %13 = fcmp olt double %9, %11                   ; <i1> [#uses=1]
  %retval.i = select i1 %13, double* %5, double* %__first ; <double*> [#uses=1]
  br label %_ZSt8__medianIdPFbddEERKT_S4_S4_S4_T0_.exit

bb7.i5:                                           ; preds = %bb2
  %14 = fcmp olt double %9, %11                   ; <i1> [#uses=1]
  br i1 %14, label %_ZSt8__medianIdPFbddEERKT_S4_S4_S4_T0_.exit, label %bb10.i

bb10.i:                                           ; preds = %bb7.i5
  %15 = fcmp olt double %8, %11                   ; <i1> [#uses=1]
  %retval1.i = select i1 %15, double* %5, double* %7 ; <double*> [#uses=1]
  br label %_ZSt8__medianIdPFbddEERKT_S4_S4_S4_T0_.exit

_ZSt8__medianIdPFbddEERKT_S4_S4_S4_T0_.exit:      ; preds = %bb10.i, %bb7.i5, %bb3.i4, %bb.i3
  %16 = phi double* [ %retval.i, %bb3.i4 ], [ %retval1.i, %bb10.i ], [ %7, %bb.i3 ], [ %__first, %bb7.i5 ] ; <double*> [#uses=1]
  %17 = load double* %16, align 8                 ; <double> [#uses=3]
  br label %bb2.outer.i

bb2.outer.i:                                      ; preds = %bb9.i, %_ZSt8__medianIdPFbddEERKT_S4_S4_S4_T0_.exit
  %18 = phi double [ %.pre, %bb9.i ], [ %9, %_ZSt8__medianIdPFbddEERKT_S4_S4_S4_T0_.exit ] ; <double> [#uses=1]
  %__last_addr.0.ph.i = phi double* [ %__last_addr.0, %_ZSt8__medianIdPFbddEERKT_S4_S4_S4_T0_.exit ], [ %__last_addr.1.i, %bb9.i ] ; <double*> [#uses=1]
  %__first_addr.0.ph.i = phi double* [ %__first, %_ZSt8__medianIdPFbddEERKT_S4_S4_S4_T0_.exit ], [ %27, %bb9.i ] ; <double*> [#uses=2]
  %19 = fcmp olt double %18, %17                  ; <i1> [#uses=1]
  br i1 %19, label %bb1.i1, label %bb5.preheader.i

bb1.i1:                                           ; preds = %bb1.i1, %bb2.outer.i
  %indvar5.i = phi i32 [ %tmp12, %bb1.i1 ], [ 0, %bb2.outer.i ] ; <i32> [#uses=1]
  %tmp12 = add i32 %indvar5.i, 1                  ; <i32> [#uses=2]
  %scevgep.i = getelementptr double* %__first_addr.0.ph.i, i32 %tmp12 ; <double*> [#uses=2]
  %20 = load double* %scevgep.i, align 8          ; <double> [#uses=1]
  %21 = fcmp olt double %20, %17                  ; <i1> [#uses=1]
  br i1 %21, label %bb1.i1, label %bb5.preheader.i

bb5.preheader.i:                                  ; preds = %bb1.i1, %bb2.outer.i
  %__first_addr.0.lcssa.i = phi double* [ %__first_addr.0.ph.i, %bb2.outer.i ], [ %scevgep.i, %bb1.i1 ] ; <double*> [#uses=13]
  br label %bb5.i

bb5.i:                                            ; preds = %bb5.i, %bb5.preheader.i
  %indvar.i = phi i32 [ 0, %bb5.preheader.i ], [ %indvar.next.i, %bb5.i ] ; <i32> [#uses=2]
  %tmp14 = xor i32 %indvar.i, -1                  ; <i32> [#uses=1]
  %__last_addr.1.i = getelementptr double* %__last_addr.0.ph.i, i32 %tmp14 ; <double*> [#uses=4]
  %22 = load double* %__last_addr.1.i, align 8    ; <double> [#uses=2]
  %23 = fcmp olt double %17, %22                  ; <i1> [#uses=1]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br i1 %23, label %bb5.i, label %bb7.i

bb7.i:                                            ; preds = %bb5.i
  %24 = icmp ult double* %__first_addr.0.lcssa.i, %__last_addr.1.i ; <i1> [#uses=1]
  br i1 %24, label %bb9.i, label %bb3.i.preheader

bb3.i.preheader:                                  ; preds = %bb7.i
  %25 = ptrtoint double* %__first_addr.0.lcssa.i to i32 ; <i32> [#uses=2]
  br label %bb3.i

bb9.i:                                            ; preds = %bb7.i
  %26 = load double* %__first_addr.0.lcssa.i, align 8 ; <double> [#uses=1]
  store double %22, double* %__first_addr.0.lcssa.i, align 8
  store double %26, double* %__last_addr.1.i, align 8
  %27 = getelementptr inbounds double* %__first_addr.0.lcssa.i, i32 1 ; <double*> [#uses=2]
  %.pre = load double* %27, align 8               ; <double> [#uses=1]
  br label %bb2.outer.i

bb.i:                                             ; preds = %bb3.i
  %28 = icmp eq i32 %indvar, %tmp24               ; <i1> [#uses=1]
  br i1 %28, label %bb1.i, label %bb2.i

bb1.i:                                            ; preds = %bb.i
  tail call fastcc void @_ZSt13__heap_selectIPdPFbddEEvT_S3_S3_T0_(double* %__first_addr.0.lcssa.i, double* %__last_addr.0.i, double* %__last_addr.0.i)
  %29 = icmp sgt i32 %55, 15                      ; <i1> [#uses=1]
  br i1 %29, label %bb.i.i.i, label %bb3.backedge

bb3.backedge:                                     ; preds = %bb3.i, %bb.i.i.i, %bb1.i
  %indvar.next18 = add i32 %indvar17, 1           ; <i32> [#uses=1]
  br label %bb3

bb.i.i.i:                                         ; preds = %bb.i.i.i, %bb1.i
  %indvar.i.i.i = phi i32 [ %indvar.next.i.i.i, %bb.i.i.i ], [ 0, %bb1.i ] ; <i32> [#uses=3]
  %tmp10 = sub i32 0, %indvar.i.i.i               ; <i32> [#uses=1]
  %tmp11 = xor i32 %indvar.i.i.i, -1              ; <i32> [#uses=1]
  %scevgep.i.i.i = getelementptr double* %__last_addr.0.i, i32 %tmp11 ; <double*> [#uses=1]
  %__last_addr.01.i.i.i = getelementptr double* %__last_addr.0.i, i32 %tmp10 ; <double*> [#uses=1]
  tail call fastcc void @_ZSt8pop_heapIPdPFbddEEvT_S3_T0_(double* %__first_addr.0.lcssa.i, double* %__last_addr.01.i.i.i)
  %phitmp.i.i.i = ptrtoint double* %scevgep.i.i.i to i32 ; <i32> [#uses=1]
  %30 = sub i32 %phitmp.i.i.i, %25                ; <i32> [#uses=1]
  %31 = icmp sgt i32 %30, 15                      ; <i1> [#uses=1]
  %indvar.next.i.i.i = add i32 %indvar.i.i.i, 1   ; <i32> [#uses=1]
  br i1 %31, label %bb.i.i.i, label %bb3.backedge

bb2.i:                                            ; preds = %bb.i
  %32 = getelementptr inbounds double* %__last_addr.0.i, i32 -1 ; <double*> [#uses=3]
  %33 = sdiv i32 %55, 16                          ; <i32> [#uses=1]
  %34 = getelementptr inbounds double* %__first_addr.0.lcssa.i, i32 %33 ; <double*> [#uses=3]
  %35 = load double* %34, align 8                 ; <double> [#uses=3]
  %36 = load double* %__first_addr.0.lcssa.i, align 8 ; <double> [#uses=4]
  %37 = fcmp olt double %36, %35                  ; <i1> [#uses=1]
  %38 = load double* %32, align 8                 ; <double> [#uses=4]
  br i1 %37, label %bb.i22, label %bb7.i28

bb.i22:                                           ; preds = %bb2.i
  %39 = fcmp olt double %35, %38                  ; <i1> [#uses=1]
  br i1 %39, label %_ZSt8__medianIdPFbddEERKT_S4_S4_S4_T0_.exit33, label %bb3.i25

bb3.i25:                                          ; preds = %bb.i22
  %40 = fcmp olt double %36, %38                  ; <i1> [#uses=1]
  %retval.i24 = select i1 %40, double* %32, double* %__first_addr.0.lcssa.i ; <double*> [#uses=1]
  br label %_ZSt8__medianIdPFbddEERKT_S4_S4_S4_T0_.exit33

bb7.i28:                                          ; preds = %bb2.i
  %41 = fcmp olt double %36, %38                  ; <i1> [#uses=1]
  br i1 %41, label %_ZSt8__medianIdPFbddEERKT_S4_S4_S4_T0_.exit33, label %bb10.i32

bb10.i32:                                         ; preds = %bb7.i28
  %42 = fcmp olt double %35, %38                  ; <i1> [#uses=1]
  %retval1.i31 = select i1 %42, double* %32, double* %34 ; <double*> [#uses=1]
  br label %_ZSt8__medianIdPFbddEERKT_S4_S4_S4_T0_.exit33

_ZSt8__medianIdPFbddEERKT_S4_S4_S4_T0_.exit33:    ; preds = %bb10.i32, %bb7.i28, %bb3.i25, %bb.i22
  %43 = phi double* [ %retval.i24, %bb3.i25 ], [ %retval1.i31, %bb10.i32 ], [ %34, %bb.i22 ], [ %__first_addr.0.lcssa.i, %bb7.i28 ] ; <double*> [#uses=1]
  %44 = load double* %43, align 8                 ; <double> [#uses=3]
  br label %bb2.outer.i5

bb2.outer.i5:                                     ; preds = %bb9.i18, %_ZSt8__medianIdPFbddEERKT_S4_S4_S4_T0_.exit33
  %45 = phi double [ %.pre42, %bb9.i18 ], [ %36, %_ZSt8__medianIdPFbddEERKT_S4_S4_S4_T0_.exit33 ] ; <double> [#uses=1]
  %__last_addr.0.ph.i2 = phi double* [ %__last_addr.0.i, %_ZSt8__medianIdPFbddEERKT_S4_S4_S4_T0_.exit33 ], [ %__last_addr.1.i13, %bb9.i18 ] ; <double*> [#uses=1]
  %__first_addr.0.ph.i3 = phi double* [ %__first_addr.0.lcssa.i, %_ZSt8__medianIdPFbddEERKT_S4_S4_S4_T0_.exit33 ], [ %53, %bb9.i18 ] ; <double*> [#uses=2]
  %46 = fcmp olt double %45, %44                  ; <i1> [#uses=1]
  br i1 %46, label %bb1.i9, label %bb5.preheader.i11

bb1.i9:                                           ; preds = %bb1.i9, %bb2.outer.i5
  %indvar5.i6 = phi i32 [ %tmp7.i, %bb1.i9 ], [ 0, %bb2.outer.i5 ] ; <i32> [#uses=1]
  %tmp7.i = add i32 %indvar5.i6, 1                ; <i32> [#uses=2]
  %scevgep.i7 = getelementptr double* %__first_addr.0.ph.i3, i32 %tmp7.i ; <double*> [#uses=2]
  %47 = load double* %scevgep.i7, align 8         ; <double> [#uses=1]
  %48 = fcmp olt double %47, %44                  ; <i1> [#uses=1]
  br i1 %48, label %bb1.i9, label %bb5.preheader.i11

bb5.preheader.i11:                                ; preds = %bb1.i9, %bb2.outer.i5
  %__first_addr.0.lcssa.i10 = phi double* [ %__first_addr.0.ph.i3, %bb2.outer.i5 ], [ %scevgep.i7, %bb1.i9 ] ; <double*> [#uses=6]
  br label %bb5.i16

bb5.i16:                                          ; preds = %bb5.i16, %bb5.preheader.i11
  %indvar.i12 = phi i32 [ 0, %bb5.preheader.i11 ], [ %indvar.next.i15, %bb5.i16 ] ; <i32> [#uses=2]
  %tmp4.i = xor i32 %indvar.i12, -1               ; <i32> [#uses=1]
  %__last_addr.1.i13 = getelementptr double* %__last_addr.0.ph.i2, i32 %tmp4.i ; <double*> [#uses=4]
  %49 = load double* %__last_addr.1.i13, align 8  ; <double> [#uses=2]
  %50 = fcmp olt double %44, %49                  ; <i1> [#uses=1]
  %indvar.next.i15 = add i32 %indvar.i12, 1       ; <i32> [#uses=1]
  br i1 %50, label %bb5.i16, label %bb7.i17

bb7.i17:                                          ; preds = %bb5.i16
  %51 = icmp ult double* %__first_addr.0.lcssa.i10, %__last_addr.1.i13 ; <i1> [#uses=1]
  br i1 %51, label %bb9.i18, label %_ZSt21__unguarded_partitionIPddPFbddEET_S3_S3_T0_T1_.exit

bb9.i18:                                          ; preds = %bb7.i17
  %52 = load double* %__first_addr.0.lcssa.i10, align 8 ; <double> [#uses=1]
  store double %49, double* %__first_addr.0.lcssa.i10, align 8
  store double %52, double* %__last_addr.1.i13, align 8
  %53 = getelementptr inbounds double* %__first_addr.0.lcssa.i10, i32 1 ; <double*> [#uses=2]
  %.pre42 = load double* %53, align 8             ; <double> [#uses=1]
  br label %bb2.outer.i5

_ZSt21__unguarded_partitionIPddPFbddEET_S3_S3_T0_T1_.exit: ; preds = %bb7.i17
  tail call fastcc void @_ZSt16__introsort_loopIPdiPFbddEEvT_S3_T0_T1_(double* %__first_addr.0.lcssa.i10, double* %__last_addr.0.i, i32 %tmp22)
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb3.i

bb3.i:                                            ; preds = %_ZSt21__unguarded_partitionIPddPFbddEET_S3_S3_T0_T1_.exit, %bb3.i.preheader
  %indvar = phi i32 [ 0, %bb3.i.preheader ], [ %indvar.next, %_ZSt21__unguarded_partitionIPddPFbddEET_S3_S3_T0_T1_.exit ] ; <i32> [#uses=3]
  %__last_addr.0.i = phi double* [ %__first_addr.0.lcssa.i10, %_ZSt21__unguarded_partitionIPddPFbddEET_S3_S3_T0_T1_.exit ], [ %__last_addr.0, %bb3.i.preheader ] ; <double*> [#uses=8]
  %tmp22 = sub i32 %tmp21, %indvar                ; <i32> [#uses=1]
  %54 = ptrtoint double* %__last_addr.0.i to i32  ; <i32> [#uses=1]
  %55 = sub i32 %54, %25                          ; <i32> [#uses=3]
  %56 = icmp sgt i32 %55, 135                     ; <i1> [#uses=1]
  br i1 %56, label %bb.i, label %bb3.backedge

bb3:                                              ; preds = %bb3.backedge, %entry
  %indvar17 = phi i32 [ 0, %entry ], [ %indvar.next18, %bb3.backedge ] ; <i32> [#uses=4]
  %__last_addr.0 = phi double* [ %__last, %entry ], [ %__first_addr.0.lcssa.i, %bb3.backedge ] ; <double*> [#uses=8]
  %tmp24 = sub i32 %tmp23, %indvar17              ; <i32> [#uses=1]
  %tmp21 = sub i32 %tmp20, %indvar17              ; <i32> [#uses=1]
  %57 = ptrtoint double* %__last_addr.0 to i32    ; <i32> [#uses=1]
  %58 = sub i32 %57, %0                           ; <i32> [#uses=3]
  %59 = icmp sgt i32 %58, 135                     ; <i1> [#uses=1]
  br i1 %59, label %bb, label %return

return:                                           ; preds = %bb3
  ret void
}

define internal fastcc void @_ZSt16__introsort_loopIPdi17less_than_functorEvT_S2_T0_T1_(double* %__first, double* %__last, i32 %__depth_limit) nounwind {
entry:
  %0 = ptrtoint double* %__first to i32           ; <i32> [#uses=2]
  %tmp15 = add i32 %__depth_limit, -1             ; <i32> [#uses=1]
  br label %bb3

bb:                                               ; preds = %bb3
  %1 = icmp eq i32 %indvar, %__depth_limit        ; <i1> [#uses=1]
  br i1 %1, label %bb1, label %bb2

bb1:                                              ; preds = %bb
  %2 = icmp sgt i32 %80, 15                       ; <i1> [#uses=2]
  br i1 %2, label %bb.i.i, label %_ZSt9sort_heapIPd17less_than_functorEvT_S2_T0_.exit

bb.i.i:                                           ; preds = %bb1
  %3 = ashr i32 %80, 3                            ; <i32> [#uses=4]
  %4 = add i32 %3, -2                             ; <i32> [#uses=1]
  %5 = sdiv i32 %4, 2                             ; <i32> [#uses=3]
  %tmp6.i.i = shl i32 %5, 1                       ; <i32> [#uses=2]
  %tmp8.i.i = add i32 %tmp6.i.i, 2                ; <i32> [#uses=1]
  br label %bb1.i.i

bb1.i.i:                                          ; preds = %bb2.i.i, %bb.i.i
  %indvar.i.i = phi i32 [ 0, %bb.i.i ], [ %indvar.next.i.i, %bb2.i.i ] ; <i32> [#uses=4]
  %__parent.0.i.i = sub i32 %5, %indvar.i.i       ; <i32> [#uses=4]
  %tmp5.i.i = mul i32 %indvar.i.i, -2             ; <i32> [#uses=2]
  %__secondChild.1.in6.i.i.i = add i32 %tmp5.i.i, %tmp6.i.i ; <i32> [#uses=2]
  %__secondChild.18.i.i.i = add i32 %tmp5.i.i, %tmp8.i.i ; <i32> [#uses=3]
  %scevgep.i.i = getelementptr double* %__first, i32 %__parent.0.i.i ; <double*> [#uses=1]
  %6 = load double* %scevgep.i.i, align 4         ; <double> [#uses=2]
  %7 = icmp slt i32 %__secondChild.18.i.i.i, %3   ; <i1> [#uses=1]
  br i1 %7, label %bb.i.i7.i, label %bb4.i.i11.i

bb.i.i7.i:                                        ; preds = %bb.i.i7.i, %bb1.i.i
  %__secondChild.19.i.i1.i = phi i32 [ %__secondChild.1.i.i6.i, %bb.i.i7.i ], [ %__secondChild.18.i.i.i, %bb1.i.i ] ; <i32> [#uses=2]
  %__secondChild.1.in7.i.i2.i = phi i32 [ %phitmp.i.i5.i, %bb.i.i7.i ], [ %__secondChild.1.in6.i.i.i, %bb1.i.i ] ; <i32> [#uses=1]
  %__holeIndex_addr.04.i.i3.i = phi i32 [ %__secondChild.1..i.i4.i, %bb.i.i7.i ], [ %__parent.0.i.i, %bb1.i.i ] ; <i32> [#uses=1]
  %8 = or i32 %__secondChild.1.in7.i.i2.i, 1      ; <i32> [#uses=2]
  %9 = getelementptr inbounds double* %__first, i32 %8 ; <double*> [#uses=1]
  %10 = getelementptr inbounds double* %__first, i32 %__secondChild.19.i.i1.i ; <double*> [#uses=1]
  %11 = load double* %10, align 8                 ; <double> [#uses=1]
  %12 = load double* %9, align 8                  ; <double> [#uses=1]
  %13 = fcmp olt double %11, %12                  ; <i1> [#uses=1]
  %__secondChild.1..i.i4.i = select i1 %13, i32 %8, i32 %__secondChild.19.i.i1.i ; <i32> [#uses=4]
  %14 = getelementptr inbounds double* %__first, i32 %__secondChild.1..i.i4.i ; <double*> [#uses=1]
  %15 = load double* %14, align 4                 ; <double> [#uses=1]
  %16 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.04.i.i3.i ; <double*> [#uses=1]
  store double %15, double* %16, align 4
  %phitmp.i.i5.i = shl i32 %__secondChild.1..i.i4.i, 1 ; <i32> [#uses=3]
  %__secondChild.1.i.i6.i = add i32 %phitmp.i.i5.i, 2 ; <i32> [#uses=3]
  %17 = icmp slt i32 %__secondChild.1.i.i6.i, %3  ; <i1> [#uses=1]
  br i1 %17, label %bb.i.i7.i, label %bb4.i.i11.i

bb4.i.i11.i:                                      ; preds = %bb.i.i7.i, %bb1.i.i
  %__secondChild.1.lcssa.i.i8.i = phi i32 [ %__secondChild.18.i.i.i, %bb1.i.i ], [ %__secondChild.1.i.i6.i, %bb.i.i7.i ] ; <i32> [#uses=1]
  %__secondChild.1.in.lcssa.i.i9.i = phi i32 [ %__secondChild.1.in6.i.i.i, %bb1.i.i ], [ %phitmp.i.i5.i, %bb.i.i7.i ] ; <i32> [#uses=1]
  %__holeIndex_addr.0.lcssa.i.i10.i = phi i32 [ %__parent.0.i.i, %bb1.i.i ], [ %__secondChild.1..i.i4.i, %bb.i.i7.i ] ; <i32> [#uses=3]
  %18 = icmp eq i32 %__secondChild.1.lcssa.i.i8.i, %3 ; <i1> [#uses=1]
  br i1 %18, label %bb5.i.i12.i, label %bb1.i.i.i18.i

bb5.i.i12.i:                                      ; preds = %bb4.i.i11.i
  %19 = or i32 %__secondChild.1.in.lcssa.i.i9.i, 1 ; <i32> [#uses=3]
  %20 = getelementptr inbounds double* %__first, i32 %19 ; <double*> [#uses=1]
  %21 = load double* %20, align 4                 ; <double> [#uses=1]
  %22 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.lcssa.i.i10.i ; <double*> [#uses=1]
  store double %21, double* %22, align 4
  br label %bb1.i.i.i18.i

bb.i.i.i13.i:                                     ; preds = %bb2.i.i.i19.i
  %23 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i15.i ; <double*> [#uses=1]
  store double %26, double* %23, align 4
  br label %bb1.i.i.i18.i

bb1.i.i.i18.i:                                    ; preds = %bb.i.i.i13.i, %bb5.i.i12.i, %bb4.i.i11.i
  %__parent.0.in.in.i.i.i14.i = phi i32 [ %__parent.0.i.i.i17.i, %bb.i.i.i13.i ], [ %19, %bb5.i.i12.i ], [ %__holeIndex_addr.0.lcssa.i.i10.i, %bb4.i.i11.i ] ; <i32> [#uses=1]
  %__holeIndex_addr.0.i.i.i15.i = phi i32 [ %__parent.0.i.i.i17.i, %bb.i.i.i13.i ], [ %19, %bb5.i.i12.i ], [ %__holeIndex_addr.0.lcssa.i.i10.i, %bb4.i.i11.i ] ; <i32> [#uses=3]
  %__parent.0.in.i.i.i16.i = add i32 %__parent.0.in.in.i.i.i14.i, -1 ; <i32> [#uses=1]
  %__parent.0.i.i.i17.i = sdiv i32 %__parent.0.in.i.i.i16.i, 2 ; <i32> [#uses=3]
  %24 = icmp sgt i32 %__holeIndex_addr.0.i.i.i15.i, %__parent.0.i.i ; <i1> [#uses=1]
  br i1 %24, label %bb2.i.i.i19.i, label %_ZSt13__adjust_heapIPdid17less_than_functorEvT_T0_S3_T1_T2_.exit.i.i

bb2.i.i.i19.i:                                    ; preds = %bb1.i.i.i18.i
  %25 = getelementptr inbounds double* %__first, i32 %__parent.0.i.i.i17.i ; <double*> [#uses=1]
  %26 = load double* %25, align 8                 ; <double> [#uses=2]
  %27 = fcmp olt double %26, %6                   ; <i1> [#uses=1]
  br i1 %27, label %bb.i.i.i13.i, label %_ZSt13__adjust_heapIPdid17less_than_functorEvT_T0_S3_T1_T2_.exit.i.i

_ZSt13__adjust_heapIPdid17less_than_functorEvT_T0_S3_T1_T2_.exit.i.i: ; preds = %bb2.i.i.i19.i, %bb1.i.i.i18.i
  %28 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i15.i ; <double*> [#uses=1]
  store double %6, double* %28, align 4
  %29 = icmp eq i32 %5, %indvar.i.i               ; <i1> [#uses=1]
  br i1 %29, label %_ZSt13__heap_selectIPd17less_than_functorEvT_S2_S2_T0_.exit, label %bb2.i.i

bb2.i.i:                                          ; preds = %_ZSt13__adjust_heapIPdid17less_than_functorEvT_T0_S3_T1_T2_.exit.i.i
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=1]
  br label %bb1.i.i

_ZSt13__heap_selectIPd17less_than_functorEvT_S2_S2_T0_.exit: ; preds = %_ZSt13__adjust_heapIPdid17less_than_functorEvT_T0_S3_T1_T2_.exit.i.i
  br i1 %2, label %bb.i7, label %_ZSt9sort_heapIPd17less_than_functorEvT_S2_T0_.exit

bb.i7:                                            ; preds = %_ZSt8pop_heapIPd17less_than_functorEvT_S2_T0_.exit.i, %_ZSt13__heap_selectIPd17less_than_functorEvT_S2_S2_T0_.exit
  %indvar.i5 = phi i32 [ %indvar.next.i10, %_ZSt8pop_heapIPd17less_than_functorEvT_S2_T0_.exit.i ], [ 0, %_ZSt13__heap_selectIPd17less_than_functorEvT_S2_S2_T0_.exit ] ; <i32> [#uses=2]
  %tmp5.i = xor i32 %indvar.i5, -1                ; <i32> [#uses=1]
  %scevgep.i6 = getelementptr double* %__last_addr.0, i32 %tmp5.i ; <double*> [#uses=3]
  %30 = load double* %scevgep.i6, align 4         ; <double> [#uses=2]
  %31 = load double* %__first, align 8            ; <double> [#uses=1]
  store double %31, double* %scevgep.i6, align 8
  %32 = ptrtoint double* %scevgep.i6 to i32       ; <i32> [#uses=1]
  %33 = sub i32 %32, %0                           ; <i32> [#uses=2]
  %34 = ashr i32 %33, 3                           ; <i32> [#uses=3]
  %35 = icmp sgt i32 %34, 2                       ; <i1> [#uses=1]
  br i1 %35, label %bb.i.i.i.i8, label %bb4.i.i.i.i

bb.i.i.i.i8:                                      ; preds = %bb.i.i.i.i8, %bb.i7
  %__secondChild.19.i.i.i.i = phi i32 [ %__secondChild.1.i.i.i.i, %bb.i.i.i.i8 ], [ 2, %bb.i7 ] ; <i32> [#uses=2]
  %__secondChild.1.in7.i.i.i.i = phi i32 [ %phitmp.i.i.i.i, %bb.i.i.i.i8 ], [ 0, %bb.i7 ] ; <i32> [#uses=1]
  %__holeIndex_addr.04.i.i.i.i = phi i32 [ %__secondChild.1..i.i.i.i, %bb.i.i.i.i8 ], [ 0, %bb.i7 ] ; <i32> [#uses=1]
  %36 = or i32 %__secondChild.1.in7.i.i.i.i, 1    ; <i32> [#uses=2]
  %37 = getelementptr inbounds double* %__first, i32 %36 ; <double*> [#uses=1]
  %38 = getelementptr inbounds double* %__first, i32 %__secondChild.19.i.i.i.i ; <double*> [#uses=1]
  %39 = load double* %38, align 8                 ; <double> [#uses=1]
  %40 = load double* %37, align 8                 ; <double> [#uses=1]
  %41 = fcmp olt double %39, %40                  ; <i1> [#uses=1]
  %__secondChild.1..i.i.i.i = select i1 %41, i32 %36, i32 %__secondChild.19.i.i.i.i ; <i32> [#uses=4]
  %42 = getelementptr inbounds double* %__first, i32 %__secondChild.1..i.i.i.i ; <double*> [#uses=1]
  %43 = load double* %42, align 4                 ; <double> [#uses=1]
  %44 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.04.i.i.i.i ; <double*> [#uses=1]
  store double %43, double* %44, align 4
  %phitmp.i.i.i.i = shl i32 %__secondChild.1..i.i.i.i, 1 ; <i32> [#uses=3]
  %__secondChild.1.i.i.i.i = add i32 %phitmp.i.i.i.i, 2 ; <i32> [#uses=3]
  %45 = icmp slt i32 %__secondChild.1.i.i.i.i, %34 ; <i1> [#uses=1]
  br i1 %45, label %bb.i.i.i.i8, label %bb4.i.loopexit.i.i.i

bb4.i.loopexit.i.i.i:                             ; preds = %bb.i.i.i.i8
  %phitmp.i.i.i9 = or i32 %phitmp.i.i.i.i, 1      ; <i32> [#uses=1]
  br label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb4.i.loopexit.i.i.i, %bb.i7
  %__secondChild.1.lcssa.i.i.i.i = phi i32 [ %__secondChild.1.i.i.i.i, %bb4.i.loopexit.i.i.i ], [ 2, %bb.i7 ] ; <i32> [#uses=1]
  %__secondChild.1.in.lcssa.i.i.i.i = phi i32 [ %phitmp.i.i.i9, %bb4.i.loopexit.i.i.i ], [ 1, %bb.i7 ] ; <i32> [#uses=3]
  %__holeIndex_addr.0.lcssa.i.i.i.i = phi i32 [ %__secondChild.1..i.i.i.i, %bb4.i.loopexit.i.i.i ], [ 0, %bb.i7 ] ; <i32> [#uses=3]
  %46 = icmp eq i32 %__secondChild.1.lcssa.i.i.i.i, %34 ; <i1> [#uses=1]
  br i1 %46, label %bb5.i.i.i.i, label %bb1.i.i.i.i.i

bb5.i.i.i.i:                                      ; preds = %bb4.i.i.i.i
  %47 = getelementptr inbounds double* %__first, i32 %__secondChild.1.in.lcssa.i.i.i.i ; <double*> [#uses=1]
  %48 = load double* %47, align 4                 ; <double> [#uses=1]
  %49 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.lcssa.i.i.i.i ; <double*> [#uses=1]
  store double %48, double* %49, align 4
  br label %bb1.i.i.i.i.i

bb.i.i.i.i.i:                                     ; preds = %bb2.i.i.i.i.i
  %50 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i.i.i ; <double*> [#uses=1]
  store double %53, double* %50, align 4
  br label %bb1.i.i.i.i.i

bb1.i.i.i.i.i:                                    ; preds = %bb.i.i.i.i.i, %bb5.i.i.i.i, %bb4.i.i.i.i
  %__parent.0.in.in.i.i.i.i.i = phi i32 [ %__parent.0.i.i.i.i.i, %bb.i.i.i.i.i ], [ %__secondChild.1.in.lcssa.i.i.i.i, %bb5.i.i.i.i ], [ %__holeIndex_addr.0.lcssa.i.i.i.i, %bb4.i.i.i.i ] ; <i32> [#uses=1]
  %__holeIndex_addr.0.i.i.i.i.i = phi i32 [ %__parent.0.i.i.i.i.i, %bb.i.i.i.i.i ], [ %__secondChild.1.in.lcssa.i.i.i.i, %bb5.i.i.i.i ], [ %__holeIndex_addr.0.lcssa.i.i.i.i, %bb4.i.i.i.i ] ; <i32> [#uses=3]
  %__parent.0.in.i.i.i.i.i = add i32 %__parent.0.in.in.i.i.i.i.i, -1 ; <i32> [#uses=1]
  %__parent.0.i.i.i.i.i = sdiv i32 %__parent.0.in.i.i.i.i.i, 2 ; <i32> [#uses=3]
  %51 = icmp sgt i32 %__holeIndex_addr.0.i.i.i.i.i, 0 ; <i1> [#uses=1]
  br i1 %51, label %bb2.i.i.i.i.i, label %_ZSt8pop_heapIPd17less_than_functorEvT_S2_T0_.exit.i

bb2.i.i.i.i.i:                                    ; preds = %bb1.i.i.i.i.i
  %52 = getelementptr inbounds double* %__first, i32 %__parent.0.i.i.i.i.i ; <double*> [#uses=1]
  %53 = load double* %52, align 8                 ; <double> [#uses=2]
  %54 = fcmp olt double %53, %30                  ; <i1> [#uses=1]
  br i1 %54, label %bb.i.i.i.i.i, label %_ZSt8pop_heapIPd17less_than_functorEvT_S2_T0_.exit.i

_ZSt8pop_heapIPd17less_than_functorEvT_S2_T0_.exit.i: ; preds = %bb2.i.i.i.i.i, %bb1.i.i.i.i.i
  %55 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i.i.i ; <double*> [#uses=1]
  store double %30, double* %55, align 4
  %56 = icmp sgt i32 %33, 15                      ; <i1> [#uses=1]
  %indvar.next.i10 = add i32 %indvar.i5, 1        ; <i32> [#uses=1]
  br i1 %56, label %bb.i7, label %_ZSt9sort_heapIPd17less_than_functorEvT_S2_T0_.exit

_ZSt9sort_heapIPd17less_than_functorEvT_S2_T0_.exit: ; preds = %_ZSt8pop_heapIPd17less_than_functorEvT_S2_T0_.exit.i, %_ZSt13__heap_selectIPd17less_than_functorEvT_S2_S2_T0_.exit, %bb1
  ret void

bb2:                                              ; preds = %bb
  %57 = getelementptr inbounds double* %__last_addr.0, i32 -1 ; <double*> [#uses=3]
  %58 = sdiv i32 %80, 16                          ; <i32> [#uses=1]
  %59 = getelementptr inbounds double* %__first, i32 %58 ; <double*> [#uses=3]
  %60 = load double* %__first, align 8            ; <double> [#uses=4]
  %61 = load double* %59, align 8                 ; <double> [#uses=3]
  %62 = fcmp olt double %60, %61                  ; <i1> [#uses=1]
  %63 = load double* %57, align 8                 ; <double> [#uses=4]
  br i1 %62, label %bb.i, label %bb7.i

bb.i:                                             ; preds = %bb2
  %64 = fcmp olt double %61, %63                  ; <i1> [#uses=1]
  br i1 %64, label %_ZSt8__medianId17less_than_functorERKT_S3_S3_S3_T0_.exit, label %bb3.i

bb3.i:                                            ; preds = %bb.i
  %65 = fcmp olt double %60, %63                  ; <i1> [#uses=1]
  %retval.i = select i1 %65, double* %57, double* %__first ; <double*> [#uses=1]
  br label %_ZSt8__medianId17less_than_functorERKT_S3_S3_S3_T0_.exit

bb7.i:                                            ; preds = %bb2
  %66 = fcmp olt double %60, %63                  ; <i1> [#uses=1]
  br i1 %66, label %_ZSt8__medianId17less_than_functorERKT_S3_S3_S3_T0_.exit, label %bb10.i

bb10.i:                                           ; preds = %bb7.i
  %67 = fcmp olt double %61, %63                  ; <i1> [#uses=1]
  %retval1.i = select i1 %67, double* %57, double* %59 ; <double*> [#uses=1]
  br label %_ZSt8__medianId17less_than_functorERKT_S3_S3_S3_T0_.exit

_ZSt8__medianId17less_than_functorERKT_S3_S3_S3_T0_.exit: ; preds = %bb10.i, %bb7.i, %bb3.i, %bb.i
  %68 = phi double* [ %retval1.i, %bb10.i ], [ %retval.i, %bb3.i ], [ %59, %bb.i ], [ %__first, %bb7.i ] ; <double*> [#uses=1]
  %69 = load double* %68, align 8                 ; <double> [#uses=3]
  br label %bb2.outer.i

bb2.outer.i:                                      ; preds = %bb9.i, %_ZSt8__medianId17less_than_functorERKT_S3_S3_S3_T0_.exit
  %70 = phi double [ %.pre, %bb9.i ], [ %60, %_ZSt8__medianId17less_than_functorERKT_S3_S3_S3_T0_.exit ] ; <double> [#uses=2]
  %__last_addr.0.ph.i = phi double* [ %__last_addr.0, %_ZSt8__medianId17less_than_functorERKT_S3_S3_S3_T0_.exit ], [ %__last_addr.1.i, %bb9.i ] ; <double*> [#uses=1]
  %__first_addr.0.ph.i = phi double* [ %__first, %_ZSt8__medianId17less_than_functorERKT_S3_S3_S3_T0_.exit ], [ %78, %bb9.i ] ; <double*> [#uses=2]
  %71 = fcmp olt double %70, %69                  ; <i1> [#uses=1]
  br i1 %71, label %bb1.i, label %bb5.preheader.i

bb1.i:                                            ; preds = %bb1.i, %bb2.outer.i
  %indvar5.i = phi i32 [ %tmp, %bb1.i ], [ 0, %bb2.outer.i ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar5.i, 1                    ; <i32> [#uses=2]
  %scevgep.i = getelementptr double* %__first_addr.0.ph.i, i32 %tmp ; <double*> [#uses=2]
  %72 = load double* %scevgep.i, align 8          ; <double> [#uses=2]
  %73 = fcmp olt double %72, %69                  ; <i1> [#uses=1]
  br i1 %73, label %bb1.i, label %bb5.preheader.i

bb5.preheader.i:                                  ; preds = %bb1.i, %bb2.outer.i
  %74 = phi double [ %70, %bb2.outer.i ], [ %72, %bb1.i ] ; <double> [#uses=1]
  %__first_addr.0.lcssa.i = phi double* [ %__first_addr.0.ph.i, %bb2.outer.i ], [ %scevgep.i, %bb1.i ] ; <double*> [#uses=5]
  br label %bb5.i

bb5.i:                                            ; preds = %bb5.i, %bb5.preheader.i
  %indvar.i = phi i32 [ 0, %bb5.preheader.i ], [ %indvar.next.i, %bb5.i ] ; <i32> [#uses=2]
  %tmp12 = xor i32 %indvar.i, -1                  ; <i32> [#uses=1]
  %__last_addr.1.i = getelementptr double* %__last_addr.0.ph.i, i32 %tmp12 ; <double*> [#uses=4]
  %75 = load double* %__last_addr.1.i, align 8    ; <double> [#uses=2]
  %76 = fcmp ogt double %75, %69                  ; <i1> [#uses=1]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br i1 %76, label %bb5.i, label %bb7.i6

bb7.i6:                                           ; preds = %bb5.i
  %77 = icmp ult double* %__first_addr.0.lcssa.i, %__last_addr.1.i ; <i1> [#uses=1]
  br i1 %77, label %bb9.i, label %_ZSt21__unguarded_partitionIPdd17less_than_functorET_S2_S2_T0_T1_.exit

bb9.i:                                            ; preds = %bb7.i6
  store double %75, double* %__first_addr.0.lcssa.i, align 8
  store double %74, double* %__last_addr.1.i, align 8
  %78 = getelementptr inbounds double* %__first_addr.0.lcssa.i, i32 1 ; <double*> [#uses=2]
  %.pre = load double* %78, align 8               ; <double> [#uses=1]
  br label %bb2.outer.i

_ZSt21__unguarded_partitionIPdd17less_than_functorET_S2_S2_T0_T1_.exit: ; preds = %bb7.i6
  call fastcc void @_ZSt16__introsort_loopIPdi17less_than_functorEvT_S2_T0_T1_(double* %__first_addr.0.lcssa.i, double* %__last_addr.0, i32 %tmp16)
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb3

bb3:                                              ; preds = %_ZSt21__unguarded_partitionIPdd17less_than_functorET_S2_S2_T0_T1_.exit, %entry
  %indvar = phi i32 [ 0, %entry ], [ %indvar.next, %_ZSt21__unguarded_partitionIPdd17less_than_functorET_S2_S2_T0_T1_.exit ] ; <i32> [#uses=3]
  %__last_addr.0 = phi double* [ %__last, %entry ], [ %__first_addr.0.lcssa.i, %_ZSt21__unguarded_partitionIPdd17less_than_functorET_S2_S2_T0_T1_.exit ] ; <double*> [#uses=5]
  %tmp16 = sub i32 %tmp15, %indvar                ; <i32> [#uses=1]
  %79 = ptrtoint double* %__last_addr.0 to i32    ; <i32> [#uses=1]
  %80 = sub i32 %79, %0                           ; <i32> [#uses=4]
  %81 = icmp sgt i32 %80, 135                     ; <i1> [#uses=1]
  br i1 %81, label %bb, label %return

return:                                           ; preds = %bb3
  ret void
}

define internal fastcc void @_ZSt16__introsort_loopIPdi24inline_less_than_functorEvT_S2_T0_T1_(double* %__first, double* %__last, i32 %__depth_limit) nounwind {
entry:
  %0 = ptrtoint double* %__first to i32           ; <i32> [#uses=2]
  %tmp15 = add i32 %__depth_limit, -1             ; <i32> [#uses=1]
  br label %bb3

bb:                                               ; preds = %bb3
  %1 = icmp eq i32 %indvar, %__depth_limit        ; <i1> [#uses=1]
  br i1 %1, label %bb1, label %bb2

bb1:                                              ; preds = %bb
  %2 = icmp sgt i32 %80, 15                       ; <i1> [#uses=2]
  br i1 %2, label %bb.i.i, label %_ZSt9sort_heapIPd24inline_less_than_functorEvT_S2_T0_.exit

bb.i.i:                                           ; preds = %bb1
  %3 = ashr i32 %80, 3                            ; <i32> [#uses=4]
  %4 = add i32 %3, -2                             ; <i32> [#uses=1]
  %5 = sdiv i32 %4, 2                             ; <i32> [#uses=3]
  %tmp6.i.i = shl i32 %5, 1                       ; <i32> [#uses=2]
  %tmp8.i.i = add i32 %tmp6.i.i, 2                ; <i32> [#uses=1]
  br label %bb1.i.i

bb1.i.i:                                          ; preds = %bb2.i.i, %bb.i.i
  %indvar.i.i = phi i32 [ 0, %bb.i.i ], [ %indvar.next.i.i, %bb2.i.i ] ; <i32> [#uses=4]
  %__parent.0.i.i = sub i32 %5, %indvar.i.i       ; <i32> [#uses=4]
  %tmp5.i.i = mul i32 %indvar.i.i, -2             ; <i32> [#uses=2]
  %__secondChild.1.in6.i.i.i = add i32 %tmp5.i.i, %tmp6.i.i ; <i32> [#uses=2]
  %__secondChild.18.i.i.i = add i32 %tmp5.i.i, %tmp8.i.i ; <i32> [#uses=3]
  %scevgep.i.i = getelementptr double* %__first, i32 %__parent.0.i.i ; <double*> [#uses=1]
  %6 = load double* %scevgep.i.i, align 4         ; <double> [#uses=2]
  %7 = icmp slt i32 %__secondChild.18.i.i.i, %3   ; <i1> [#uses=1]
  br i1 %7, label %bb.i.i7.i, label %bb4.i.i11.i

bb.i.i7.i:                                        ; preds = %bb.i.i7.i, %bb1.i.i
  %__secondChild.19.i.i1.i = phi i32 [ %__secondChild.1.i.i6.i, %bb.i.i7.i ], [ %__secondChild.18.i.i.i, %bb1.i.i ] ; <i32> [#uses=2]
  %__secondChild.1.in7.i.i2.i = phi i32 [ %phitmp.i.i5.i, %bb.i.i7.i ], [ %__secondChild.1.in6.i.i.i, %bb1.i.i ] ; <i32> [#uses=1]
  %__holeIndex_addr.04.i.i3.i = phi i32 [ %__secondChild.1..i.i4.i, %bb.i.i7.i ], [ %__parent.0.i.i, %bb1.i.i ] ; <i32> [#uses=1]
  %8 = or i32 %__secondChild.1.in7.i.i2.i, 1      ; <i32> [#uses=2]
  %9 = getelementptr inbounds double* %__first, i32 %8 ; <double*> [#uses=1]
  %10 = getelementptr inbounds double* %__first, i32 %__secondChild.19.i.i1.i ; <double*> [#uses=1]
  %11 = load double* %10, align 8                 ; <double> [#uses=1]
  %12 = load double* %9, align 8                  ; <double> [#uses=1]
  %13 = fcmp olt double %11, %12                  ; <i1> [#uses=1]
  %__secondChild.1..i.i4.i = select i1 %13, i32 %8, i32 %__secondChild.19.i.i1.i ; <i32> [#uses=4]
  %14 = getelementptr inbounds double* %__first, i32 %__secondChild.1..i.i4.i ; <double*> [#uses=1]
  %15 = load double* %14, align 4                 ; <double> [#uses=1]
  %16 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.04.i.i3.i ; <double*> [#uses=1]
  store double %15, double* %16, align 4
  %phitmp.i.i5.i = shl i32 %__secondChild.1..i.i4.i, 1 ; <i32> [#uses=3]
  %__secondChild.1.i.i6.i = add i32 %phitmp.i.i5.i, 2 ; <i32> [#uses=3]
  %17 = icmp slt i32 %__secondChild.1.i.i6.i, %3  ; <i1> [#uses=1]
  br i1 %17, label %bb.i.i7.i, label %bb4.i.i11.i

bb4.i.i11.i:                                      ; preds = %bb.i.i7.i, %bb1.i.i
  %__secondChild.1.lcssa.i.i8.i = phi i32 [ %__secondChild.18.i.i.i, %bb1.i.i ], [ %__secondChild.1.i.i6.i, %bb.i.i7.i ] ; <i32> [#uses=1]
  %__secondChild.1.in.lcssa.i.i9.i = phi i32 [ %__secondChild.1.in6.i.i.i, %bb1.i.i ], [ %phitmp.i.i5.i, %bb.i.i7.i ] ; <i32> [#uses=1]
  %__holeIndex_addr.0.lcssa.i.i10.i = phi i32 [ %__parent.0.i.i, %bb1.i.i ], [ %__secondChild.1..i.i4.i, %bb.i.i7.i ] ; <i32> [#uses=3]
  %18 = icmp eq i32 %__secondChild.1.lcssa.i.i8.i, %3 ; <i1> [#uses=1]
  br i1 %18, label %bb5.i.i12.i, label %bb1.i.i.i18.i

bb5.i.i12.i:                                      ; preds = %bb4.i.i11.i
  %19 = or i32 %__secondChild.1.in.lcssa.i.i9.i, 1 ; <i32> [#uses=3]
  %20 = getelementptr inbounds double* %__first, i32 %19 ; <double*> [#uses=1]
  %21 = load double* %20, align 4                 ; <double> [#uses=1]
  %22 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.lcssa.i.i10.i ; <double*> [#uses=1]
  store double %21, double* %22, align 4
  br label %bb1.i.i.i18.i

bb.i.i.i13.i:                                     ; preds = %bb2.i.i.i19.i
  %23 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i15.i ; <double*> [#uses=1]
  store double %26, double* %23, align 4
  br label %bb1.i.i.i18.i

bb1.i.i.i18.i:                                    ; preds = %bb.i.i.i13.i, %bb5.i.i12.i, %bb4.i.i11.i
  %__parent.0.in.in.i.i.i14.i = phi i32 [ %__parent.0.i.i.i17.i, %bb.i.i.i13.i ], [ %19, %bb5.i.i12.i ], [ %__holeIndex_addr.0.lcssa.i.i10.i, %bb4.i.i11.i ] ; <i32> [#uses=1]
  %__holeIndex_addr.0.i.i.i15.i = phi i32 [ %__parent.0.i.i.i17.i, %bb.i.i.i13.i ], [ %19, %bb5.i.i12.i ], [ %__holeIndex_addr.0.lcssa.i.i10.i, %bb4.i.i11.i ] ; <i32> [#uses=3]
  %__parent.0.in.i.i.i16.i = add i32 %__parent.0.in.in.i.i.i14.i, -1 ; <i32> [#uses=1]
  %__parent.0.i.i.i17.i = sdiv i32 %__parent.0.in.i.i.i16.i, 2 ; <i32> [#uses=3]
  %24 = icmp sgt i32 %__holeIndex_addr.0.i.i.i15.i, %__parent.0.i.i ; <i1> [#uses=1]
  br i1 %24, label %bb2.i.i.i19.i, label %_ZSt13__adjust_heapIPdid24inline_less_than_functorEvT_T0_S3_T1_T2_.exit.i.i

bb2.i.i.i19.i:                                    ; preds = %bb1.i.i.i18.i
  %25 = getelementptr inbounds double* %__first, i32 %__parent.0.i.i.i17.i ; <double*> [#uses=1]
  %26 = load double* %25, align 8                 ; <double> [#uses=2]
  %27 = fcmp olt double %26, %6                   ; <i1> [#uses=1]
  br i1 %27, label %bb.i.i.i13.i, label %_ZSt13__adjust_heapIPdid24inline_less_than_functorEvT_T0_S3_T1_T2_.exit.i.i

_ZSt13__adjust_heapIPdid24inline_less_than_functorEvT_T0_S3_T1_T2_.exit.i.i: ; preds = %bb2.i.i.i19.i, %bb1.i.i.i18.i
  %28 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i15.i ; <double*> [#uses=1]
  store double %6, double* %28, align 4
  %29 = icmp eq i32 %5, %indvar.i.i               ; <i1> [#uses=1]
  br i1 %29, label %_ZSt13__heap_selectIPd24inline_less_than_functorEvT_S2_S2_T0_.exit, label %bb2.i.i

bb2.i.i:                                          ; preds = %_ZSt13__adjust_heapIPdid24inline_less_than_functorEvT_T0_S3_T1_T2_.exit.i.i
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=1]
  br label %bb1.i.i

_ZSt13__heap_selectIPd24inline_less_than_functorEvT_S2_S2_T0_.exit: ; preds = %_ZSt13__adjust_heapIPdid24inline_less_than_functorEvT_T0_S3_T1_T2_.exit.i.i
  br i1 %2, label %bb.i7, label %_ZSt9sort_heapIPd24inline_less_than_functorEvT_S2_T0_.exit

bb.i7:                                            ; preds = %_ZSt8pop_heapIPd24inline_less_than_functorEvT_S2_T0_.exit.i, %_ZSt13__heap_selectIPd24inline_less_than_functorEvT_S2_S2_T0_.exit
  %indvar.i5 = phi i32 [ %indvar.next.i10, %_ZSt8pop_heapIPd24inline_less_than_functorEvT_S2_T0_.exit.i ], [ 0, %_ZSt13__heap_selectIPd24inline_less_than_functorEvT_S2_S2_T0_.exit ] ; <i32> [#uses=2]
  %tmp5.i = xor i32 %indvar.i5, -1                ; <i32> [#uses=1]
  %scevgep.i6 = getelementptr double* %__last_addr.0, i32 %tmp5.i ; <double*> [#uses=3]
  %30 = load double* %scevgep.i6, align 4         ; <double> [#uses=2]
  %31 = load double* %__first, align 8            ; <double> [#uses=1]
  store double %31, double* %scevgep.i6, align 8
  %32 = ptrtoint double* %scevgep.i6 to i32       ; <i32> [#uses=1]
  %33 = sub i32 %32, %0                           ; <i32> [#uses=2]
  %34 = ashr i32 %33, 3                           ; <i32> [#uses=3]
  %35 = icmp sgt i32 %34, 2                       ; <i1> [#uses=1]
  br i1 %35, label %bb.i.i.i.i8, label %bb4.i.i.i.i

bb.i.i.i.i8:                                      ; preds = %bb.i.i.i.i8, %bb.i7
  %__secondChild.19.i.i.i.i = phi i32 [ %__secondChild.1.i.i.i.i, %bb.i.i.i.i8 ], [ 2, %bb.i7 ] ; <i32> [#uses=2]
  %__secondChild.1.in7.i.i.i.i = phi i32 [ %phitmp.i.i.i.i, %bb.i.i.i.i8 ], [ 0, %bb.i7 ] ; <i32> [#uses=1]
  %__holeIndex_addr.04.i.i.i.i = phi i32 [ %__secondChild.1..i.i.i.i, %bb.i.i.i.i8 ], [ 0, %bb.i7 ] ; <i32> [#uses=1]
  %36 = or i32 %__secondChild.1.in7.i.i.i.i, 1    ; <i32> [#uses=2]
  %37 = getelementptr inbounds double* %__first, i32 %36 ; <double*> [#uses=1]
  %38 = getelementptr inbounds double* %__first, i32 %__secondChild.19.i.i.i.i ; <double*> [#uses=1]
  %39 = load double* %38, align 8                 ; <double> [#uses=1]
  %40 = load double* %37, align 8                 ; <double> [#uses=1]
  %41 = fcmp olt double %39, %40                  ; <i1> [#uses=1]
  %__secondChild.1..i.i.i.i = select i1 %41, i32 %36, i32 %__secondChild.19.i.i.i.i ; <i32> [#uses=4]
  %42 = getelementptr inbounds double* %__first, i32 %__secondChild.1..i.i.i.i ; <double*> [#uses=1]
  %43 = load double* %42, align 4                 ; <double> [#uses=1]
  %44 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.04.i.i.i.i ; <double*> [#uses=1]
  store double %43, double* %44, align 4
  %phitmp.i.i.i.i = shl i32 %__secondChild.1..i.i.i.i, 1 ; <i32> [#uses=3]
  %__secondChild.1.i.i.i.i = add i32 %phitmp.i.i.i.i, 2 ; <i32> [#uses=3]
  %45 = icmp slt i32 %__secondChild.1.i.i.i.i, %34 ; <i1> [#uses=1]
  br i1 %45, label %bb.i.i.i.i8, label %bb4.i.loopexit.i.i.i

bb4.i.loopexit.i.i.i:                             ; preds = %bb.i.i.i.i8
  %phitmp.i.i.i9 = or i32 %phitmp.i.i.i.i, 1      ; <i32> [#uses=1]
  br label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb4.i.loopexit.i.i.i, %bb.i7
  %__secondChild.1.lcssa.i.i.i.i = phi i32 [ %__secondChild.1.i.i.i.i, %bb4.i.loopexit.i.i.i ], [ 2, %bb.i7 ] ; <i32> [#uses=1]
  %__secondChild.1.in.lcssa.i.i.i.i = phi i32 [ %phitmp.i.i.i9, %bb4.i.loopexit.i.i.i ], [ 1, %bb.i7 ] ; <i32> [#uses=3]
  %__holeIndex_addr.0.lcssa.i.i.i.i = phi i32 [ %__secondChild.1..i.i.i.i, %bb4.i.loopexit.i.i.i ], [ 0, %bb.i7 ] ; <i32> [#uses=3]
  %46 = icmp eq i32 %__secondChild.1.lcssa.i.i.i.i, %34 ; <i1> [#uses=1]
  br i1 %46, label %bb5.i.i.i.i, label %bb1.i.i.i.i.i

bb5.i.i.i.i:                                      ; preds = %bb4.i.i.i.i
  %47 = getelementptr inbounds double* %__first, i32 %__secondChild.1.in.lcssa.i.i.i.i ; <double*> [#uses=1]
  %48 = load double* %47, align 4                 ; <double> [#uses=1]
  %49 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.lcssa.i.i.i.i ; <double*> [#uses=1]
  store double %48, double* %49, align 4
  br label %bb1.i.i.i.i.i

bb.i.i.i.i.i:                                     ; preds = %bb2.i.i.i.i.i
  %50 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i.i.i ; <double*> [#uses=1]
  store double %53, double* %50, align 4
  br label %bb1.i.i.i.i.i

bb1.i.i.i.i.i:                                    ; preds = %bb.i.i.i.i.i, %bb5.i.i.i.i, %bb4.i.i.i.i
  %__parent.0.in.in.i.i.i.i.i = phi i32 [ %__parent.0.i.i.i.i.i, %bb.i.i.i.i.i ], [ %__secondChild.1.in.lcssa.i.i.i.i, %bb5.i.i.i.i ], [ %__holeIndex_addr.0.lcssa.i.i.i.i, %bb4.i.i.i.i ] ; <i32> [#uses=1]
  %__holeIndex_addr.0.i.i.i.i.i = phi i32 [ %__parent.0.i.i.i.i.i, %bb.i.i.i.i.i ], [ %__secondChild.1.in.lcssa.i.i.i.i, %bb5.i.i.i.i ], [ %__holeIndex_addr.0.lcssa.i.i.i.i, %bb4.i.i.i.i ] ; <i32> [#uses=3]
  %__parent.0.in.i.i.i.i.i = add i32 %__parent.0.in.in.i.i.i.i.i, -1 ; <i32> [#uses=1]
  %__parent.0.i.i.i.i.i = sdiv i32 %__parent.0.in.i.i.i.i.i, 2 ; <i32> [#uses=3]
  %51 = icmp sgt i32 %__holeIndex_addr.0.i.i.i.i.i, 0 ; <i1> [#uses=1]
  br i1 %51, label %bb2.i.i.i.i.i, label %_ZSt8pop_heapIPd24inline_less_than_functorEvT_S2_T0_.exit.i

bb2.i.i.i.i.i:                                    ; preds = %bb1.i.i.i.i.i
  %52 = getelementptr inbounds double* %__first, i32 %__parent.0.i.i.i.i.i ; <double*> [#uses=1]
  %53 = load double* %52, align 8                 ; <double> [#uses=2]
  %54 = fcmp olt double %53, %30                  ; <i1> [#uses=1]
  br i1 %54, label %bb.i.i.i.i.i, label %_ZSt8pop_heapIPd24inline_less_than_functorEvT_S2_T0_.exit.i

_ZSt8pop_heapIPd24inline_less_than_functorEvT_S2_T0_.exit.i: ; preds = %bb2.i.i.i.i.i, %bb1.i.i.i.i.i
  %55 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i.i.i ; <double*> [#uses=1]
  store double %30, double* %55, align 4
  %56 = icmp sgt i32 %33, 15                      ; <i1> [#uses=1]
  %indvar.next.i10 = add i32 %indvar.i5, 1        ; <i32> [#uses=1]
  br i1 %56, label %bb.i7, label %_ZSt9sort_heapIPd24inline_less_than_functorEvT_S2_T0_.exit

_ZSt9sort_heapIPd24inline_less_than_functorEvT_S2_T0_.exit: ; preds = %_ZSt8pop_heapIPd24inline_less_than_functorEvT_S2_T0_.exit.i, %_ZSt13__heap_selectIPd24inline_less_than_functorEvT_S2_S2_T0_.exit, %bb1
  ret void

bb2:                                              ; preds = %bb
  %57 = getelementptr inbounds double* %__last_addr.0, i32 -1 ; <double*> [#uses=3]
  %58 = sdiv i32 %80, 16                          ; <i32> [#uses=1]
  %59 = getelementptr inbounds double* %__first, i32 %58 ; <double*> [#uses=3]
  %60 = load double* %__first, align 8            ; <double> [#uses=4]
  %61 = load double* %59, align 8                 ; <double> [#uses=3]
  %62 = fcmp olt double %60, %61                  ; <i1> [#uses=1]
  %63 = load double* %57, align 8                 ; <double> [#uses=4]
  br i1 %62, label %bb.i, label %bb7.i

bb.i:                                             ; preds = %bb2
  %64 = fcmp olt double %61, %63                  ; <i1> [#uses=1]
  br i1 %64, label %_ZSt8__medianId24inline_less_than_functorERKT_S3_S3_S3_T0_.exit, label %bb3.i

bb3.i:                                            ; preds = %bb.i
  %65 = fcmp olt double %60, %63                  ; <i1> [#uses=1]
  %retval.i = select i1 %65, double* %57, double* %__first ; <double*> [#uses=1]
  br label %_ZSt8__medianId24inline_less_than_functorERKT_S3_S3_S3_T0_.exit

bb7.i:                                            ; preds = %bb2
  %66 = fcmp olt double %60, %63                  ; <i1> [#uses=1]
  br i1 %66, label %_ZSt8__medianId24inline_less_than_functorERKT_S3_S3_S3_T0_.exit, label %bb10.i

bb10.i:                                           ; preds = %bb7.i
  %67 = fcmp olt double %61, %63                  ; <i1> [#uses=1]
  %retval1.i = select i1 %67, double* %57, double* %59 ; <double*> [#uses=1]
  br label %_ZSt8__medianId24inline_less_than_functorERKT_S3_S3_S3_T0_.exit

_ZSt8__medianId24inline_less_than_functorERKT_S3_S3_S3_T0_.exit: ; preds = %bb10.i, %bb7.i, %bb3.i, %bb.i
  %68 = phi double* [ %retval1.i, %bb10.i ], [ %retval.i, %bb3.i ], [ %59, %bb.i ], [ %__first, %bb7.i ] ; <double*> [#uses=1]
  %69 = load double* %68, align 8                 ; <double> [#uses=3]
  br label %bb2.outer.i

bb2.outer.i:                                      ; preds = %bb9.i, %_ZSt8__medianId24inline_less_than_functorERKT_S3_S3_S3_T0_.exit
  %70 = phi double [ %.pre, %bb9.i ], [ %60, %_ZSt8__medianId24inline_less_than_functorERKT_S3_S3_S3_T0_.exit ] ; <double> [#uses=2]
  %__last_addr.0.ph.i = phi double* [ %__last_addr.0, %_ZSt8__medianId24inline_less_than_functorERKT_S3_S3_S3_T0_.exit ], [ %__last_addr.1.i, %bb9.i ] ; <double*> [#uses=1]
  %__first_addr.0.ph.i = phi double* [ %__first, %_ZSt8__medianId24inline_less_than_functorERKT_S3_S3_S3_T0_.exit ], [ %78, %bb9.i ] ; <double*> [#uses=2]
  %71 = fcmp olt double %70, %69                  ; <i1> [#uses=1]
  br i1 %71, label %bb1.i, label %bb5.preheader.i

bb1.i:                                            ; preds = %bb1.i, %bb2.outer.i
  %indvar5.i = phi i32 [ %tmp, %bb1.i ], [ 0, %bb2.outer.i ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar5.i, 1                    ; <i32> [#uses=2]
  %scevgep.i = getelementptr double* %__first_addr.0.ph.i, i32 %tmp ; <double*> [#uses=2]
  %72 = load double* %scevgep.i, align 8          ; <double> [#uses=2]
  %73 = fcmp olt double %72, %69                  ; <i1> [#uses=1]
  br i1 %73, label %bb1.i, label %bb5.preheader.i

bb5.preheader.i:                                  ; preds = %bb1.i, %bb2.outer.i
  %74 = phi double [ %70, %bb2.outer.i ], [ %72, %bb1.i ] ; <double> [#uses=1]
  %__first_addr.0.lcssa.i = phi double* [ %__first_addr.0.ph.i, %bb2.outer.i ], [ %scevgep.i, %bb1.i ] ; <double*> [#uses=5]
  br label %bb5.i

bb5.i:                                            ; preds = %bb5.i, %bb5.preheader.i
  %indvar.i = phi i32 [ 0, %bb5.preheader.i ], [ %indvar.next.i, %bb5.i ] ; <i32> [#uses=2]
  %tmp12 = xor i32 %indvar.i, -1                  ; <i32> [#uses=1]
  %__last_addr.1.i = getelementptr double* %__last_addr.0.ph.i, i32 %tmp12 ; <double*> [#uses=4]
  %75 = load double* %__last_addr.1.i, align 8    ; <double> [#uses=2]
  %76 = fcmp ogt double %75, %69                  ; <i1> [#uses=1]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br i1 %76, label %bb5.i, label %bb7.i6

bb7.i6:                                           ; preds = %bb5.i
  %77 = icmp ult double* %__first_addr.0.lcssa.i, %__last_addr.1.i ; <i1> [#uses=1]
  br i1 %77, label %bb9.i, label %_ZSt21__unguarded_partitionIPdd24inline_less_than_functorET_S2_S2_T0_T1_.exit

bb9.i:                                            ; preds = %bb7.i6
  store double %75, double* %__first_addr.0.lcssa.i, align 8
  store double %74, double* %__last_addr.1.i, align 8
  %78 = getelementptr inbounds double* %__first_addr.0.lcssa.i, i32 1 ; <double*> [#uses=2]
  %.pre = load double* %78, align 8               ; <double> [#uses=1]
  br label %bb2.outer.i

_ZSt21__unguarded_partitionIPdd24inline_less_than_functorET_S2_S2_T0_T1_.exit: ; preds = %bb7.i6
  call fastcc void @_ZSt16__introsort_loopIPdi24inline_less_than_functorEvT_S2_T0_T1_(double* %__first_addr.0.lcssa.i, double* %__last_addr.0, i32 %tmp16)
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb3

bb3:                                              ; preds = %_ZSt21__unguarded_partitionIPdd24inline_less_than_functorET_S2_S2_T0_T1_.exit, %entry
  %indvar = phi i32 [ 0, %entry ], [ %indvar.next, %_ZSt21__unguarded_partitionIPdd24inline_less_than_functorET_S2_S2_T0_T1_.exit ] ; <i32> [#uses=3]
  %__last_addr.0 = phi double* [ %__last, %entry ], [ %__first_addr.0.lcssa.i, %_ZSt21__unguarded_partitionIPdd24inline_less_than_functorET_S2_S2_T0_T1_.exit ] ; <double*> [#uses=5]
  %tmp16 = sub i32 %tmp15, %indvar                ; <i32> [#uses=1]
  %79 = ptrtoint double* %__last_addr.0 to i32    ; <i32> [#uses=1]
  %80 = sub i32 %79, %0                           ; <i32> [#uses=4]
  %81 = icmp sgt i32 %80, 135                     ; <i1> [#uses=1]
  br i1 %81, label %bb, label %return

return:                                           ; preds = %bb3
  ret void
}

define internal fastcc void @_ZSt16__introsort_loopIPdiSt4lessIdEEvT_S3_T0_T1_(double* %__first, double* %__last, i32 %__depth_limit) nounwind {
entry:
  %0 = ptrtoint double* %__first to i32           ; <i32> [#uses=2]
  %tmp15 = add i32 %__depth_limit, -1             ; <i32> [#uses=1]
  br label %bb3

bb:                                               ; preds = %bb3
  %1 = icmp eq i32 %indvar, %__depth_limit        ; <i1> [#uses=1]
  br i1 %1, label %bb1, label %bb2

bb1:                                              ; preds = %bb
  %2 = icmp sgt i32 %80, 15                       ; <i1> [#uses=2]
  br i1 %2, label %bb.i.i, label %_ZSt9sort_heapIPdSt4lessIdEEvT_S3_T0_.exit

bb.i.i:                                           ; preds = %bb1
  %3 = ashr i32 %80, 3                            ; <i32> [#uses=4]
  %4 = add i32 %3, -2                             ; <i32> [#uses=1]
  %5 = sdiv i32 %4, 2                             ; <i32> [#uses=3]
  %tmp6.i.i = shl i32 %5, 1                       ; <i32> [#uses=2]
  %tmp8.i.i = add i32 %tmp6.i.i, 2                ; <i32> [#uses=1]
  br label %bb1.i.i

bb1.i.i:                                          ; preds = %bb2.i.i, %bb.i.i
  %indvar.i.i = phi i32 [ 0, %bb.i.i ], [ %indvar.next.i.i, %bb2.i.i ] ; <i32> [#uses=4]
  %__parent.0.i.i = sub i32 %5, %indvar.i.i       ; <i32> [#uses=4]
  %tmp5.i.i = mul i32 %indvar.i.i, -2             ; <i32> [#uses=2]
  %__secondChild.1.in6.i.i.i = add i32 %tmp5.i.i, %tmp6.i.i ; <i32> [#uses=2]
  %__secondChild.18.i.i.i = add i32 %tmp5.i.i, %tmp8.i.i ; <i32> [#uses=3]
  %scevgep.i.i = getelementptr double* %__first, i32 %__parent.0.i.i ; <double*> [#uses=1]
  %6 = load double* %scevgep.i.i, align 4         ; <double> [#uses=2]
  %7 = icmp slt i32 %__secondChild.18.i.i.i, %3   ; <i1> [#uses=1]
  br i1 %7, label %bb.i.i7.i, label %bb4.i.i11.i

bb.i.i7.i:                                        ; preds = %bb.i.i7.i, %bb1.i.i
  %__secondChild.19.i.i1.i = phi i32 [ %__secondChild.1.i.i6.i, %bb.i.i7.i ], [ %__secondChild.18.i.i.i, %bb1.i.i ] ; <i32> [#uses=2]
  %__secondChild.1.in7.i.i2.i = phi i32 [ %phitmp.i.i5.i, %bb.i.i7.i ], [ %__secondChild.1.in6.i.i.i, %bb1.i.i ] ; <i32> [#uses=1]
  %__holeIndex_addr.04.i.i3.i = phi i32 [ %__secondChild.1..i.i4.i, %bb.i.i7.i ], [ %__parent.0.i.i, %bb1.i.i ] ; <i32> [#uses=1]
  %8 = or i32 %__secondChild.1.in7.i.i2.i, 1      ; <i32> [#uses=2]
  %9 = getelementptr inbounds double* %__first, i32 %8 ; <double*> [#uses=1]
  %10 = getelementptr inbounds double* %__first, i32 %__secondChild.19.i.i1.i ; <double*> [#uses=1]
  %11 = load double* %10, align 8                 ; <double> [#uses=1]
  %12 = load double* %9, align 8                  ; <double> [#uses=1]
  %13 = fcmp olt double %11, %12                  ; <i1> [#uses=1]
  %__secondChild.1..i.i4.i = select i1 %13, i32 %8, i32 %__secondChild.19.i.i1.i ; <i32> [#uses=4]
  %14 = getelementptr inbounds double* %__first, i32 %__secondChild.1..i.i4.i ; <double*> [#uses=1]
  %15 = load double* %14, align 4                 ; <double> [#uses=1]
  %16 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.04.i.i3.i ; <double*> [#uses=1]
  store double %15, double* %16, align 4
  %phitmp.i.i5.i = shl i32 %__secondChild.1..i.i4.i, 1 ; <i32> [#uses=3]
  %__secondChild.1.i.i6.i = add i32 %phitmp.i.i5.i, 2 ; <i32> [#uses=3]
  %17 = icmp slt i32 %__secondChild.1.i.i6.i, %3  ; <i1> [#uses=1]
  br i1 %17, label %bb.i.i7.i, label %bb4.i.i11.i

bb4.i.i11.i:                                      ; preds = %bb.i.i7.i, %bb1.i.i
  %__secondChild.1.lcssa.i.i8.i = phi i32 [ %__secondChild.18.i.i.i, %bb1.i.i ], [ %__secondChild.1.i.i6.i, %bb.i.i7.i ] ; <i32> [#uses=1]
  %__secondChild.1.in.lcssa.i.i9.i = phi i32 [ %__secondChild.1.in6.i.i.i, %bb1.i.i ], [ %phitmp.i.i5.i, %bb.i.i7.i ] ; <i32> [#uses=1]
  %__holeIndex_addr.0.lcssa.i.i10.i = phi i32 [ %__parent.0.i.i, %bb1.i.i ], [ %__secondChild.1..i.i4.i, %bb.i.i7.i ] ; <i32> [#uses=3]
  %18 = icmp eq i32 %__secondChild.1.lcssa.i.i8.i, %3 ; <i1> [#uses=1]
  br i1 %18, label %bb5.i.i12.i, label %bb1.i.i.i18.i

bb5.i.i12.i:                                      ; preds = %bb4.i.i11.i
  %19 = or i32 %__secondChild.1.in.lcssa.i.i9.i, 1 ; <i32> [#uses=3]
  %20 = getelementptr inbounds double* %__first, i32 %19 ; <double*> [#uses=1]
  %21 = load double* %20, align 4                 ; <double> [#uses=1]
  %22 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.lcssa.i.i10.i ; <double*> [#uses=1]
  store double %21, double* %22, align 4
  br label %bb1.i.i.i18.i

bb.i.i.i13.i:                                     ; preds = %bb2.i.i.i19.i
  %23 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i15.i ; <double*> [#uses=1]
  store double %26, double* %23, align 4
  br label %bb1.i.i.i18.i

bb1.i.i.i18.i:                                    ; preds = %bb.i.i.i13.i, %bb5.i.i12.i, %bb4.i.i11.i
  %__parent.0.in.in.i.i.i14.i = phi i32 [ %__parent.0.i.i.i17.i, %bb.i.i.i13.i ], [ %19, %bb5.i.i12.i ], [ %__holeIndex_addr.0.lcssa.i.i10.i, %bb4.i.i11.i ] ; <i32> [#uses=1]
  %__holeIndex_addr.0.i.i.i15.i = phi i32 [ %__parent.0.i.i.i17.i, %bb.i.i.i13.i ], [ %19, %bb5.i.i12.i ], [ %__holeIndex_addr.0.lcssa.i.i10.i, %bb4.i.i11.i ] ; <i32> [#uses=3]
  %__parent.0.in.i.i.i16.i = add i32 %__parent.0.in.in.i.i.i14.i, -1 ; <i32> [#uses=1]
  %__parent.0.i.i.i17.i = sdiv i32 %__parent.0.in.i.i.i16.i, 2 ; <i32> [#uses=3]
  %24 = icmp sgt i32 %__holeIndex_addr.0.i.i.i15.i, %__parent.0.i.i ; <i1> [#uses=1]
  br i1 %24, label %bb2.i.i.i19.i, label %_ZSt13__adjust_heapIPdidSt4lessIdEEvT_T0_S4_T1_T2_.exit.i.i

bb2.i.i.i19.i:                                    ; preds = %bb1.i.i.i18.i
  %25 = getelementptr inbounds double* %__first, i32 %__parent.0.i.i.i17.i ; <double*> [#uses=1]
  %26 = load double* %25, align 8                 ; <double> [#uses=2]
  %27 = fcmp olt double %26, %6                   ; <i1> [#uses=1]
  br i1 %27, label %bb.i.i.i13.i, label %_ZSt13__adjust_heapIPdidSt4lessIdEEvT_T0_S4_T1_T2_.exit.i.i

_ZSt13__adjust_heapIPdidSt4lessIdEEvT_T0_S4_T1_T2_.exit.i.i: ; preds = %bb2.i.i.i19.i, %bb1.i.i.i18.i
  %28 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i15.i ; <double*> [#uses=1]
  store double %6, double* %28, align 4
  %29 = icmp eq i32 %5, %indvar.i.i               ; <i1> [#uses=1]
  br i1 %29, label %_ZSt13__heap_selectIPdSt4lessIdEEvT_S3_S3_T0_.exit, label %bb2.i.i

bb2.i.i:                                          ; preds = %_ZSt13__adjust_heapIPdidSt4lessIdEEvT_T0_S4_T1_T2_.exit.i.i
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=1]
  br label %bb1.i.i

_ZSt13__heap_selectIPdSt4lessIdEEvT_S3_S3_T0_.exit: ; preds = %_ZSt13__adjust_heapIPdidSt4lessIdEEvT_T0_S4_T1_T2_.exit.i.i
  br i1 %2, label %bb.i7, label %_ZSt9sort_heapIPdSt4lessIdEEvT_S3_T0_.exit

bb.i7:                                            ; preds = %_ZSt8pop_heapIPdSt4lessIdEEvT_S3_T0_.exit.i, %_ZSt13__heap_selectIPdSt4lessIdEEvT_S3_S3_T0_.exit
  %indvar.i5 = phi i32 [ %indvar.next.i10, %_ZSt8pop_heapIPdSt4lessIdEEvT_S3_T0_.exit.i ], [ 0, %_ZSt13__heap_selectIPdSt4lessIdEEvT_S3_S3_T0_.exit ] ; <i32> [#uses=2]
  %tmp5.i = xor i32 %indvar.i5, -1                ; <i32> [#uses=1]
  %scevgep.i6 = getelementptr double* %__last_addr.0, i32 %tmp5.i ; <double*> [#uses=3]
  %30 = load double* %scevgep.i6, align 4         ; <double> [#uses=2]
  %31 = load double* %__first, align 8            ; <double> [#uses=1]
  store double %31, double* %scevgep.i6, align 8
  %32 = ptrtoint double* %scevgep.i6 to i32       ; <i32> [#uses=1]
  %33 = sub i32 %32, %0                           ; <i32> [#uses=2]
  %34 = ashr i32 %33, 3                           ; <i32> [#uses=3]
  %35 = icmp sgt i32 %34, 2                       ; <i1> [#uses=1]
  br i1 %35, label %bb.i.i.i.i8, label %bb4.i.i.i.i

bb.i.i.i.i8:                                      ; preds = %bb.i.i.i.i8, %bb.i7
  %__secondChild.19.i.i.i.i = phi i32 [ %__secondChild.1.i.i.i.i, %bb.i.i.i.i8 ], [ 2, %bb.i7 ] ; <i32> [#uses=2]
  %__secondChild.1.in7.i.i.i.i = phi i32 [ %phitmp.i.i.i.i, %bb.i.i.i.i8 ], [ 0, %bb.i7 ] ; <i32> [#uses=1]
  %__holeIndex_addr.04.i.i.i.i = phi i32 [ %__secondChild.1..i.i.i.i, %bb.i.i.i.i8 ], [ 0, %bb.i7 ] ; <i32> [#uses=1]
  %36 = or i32 %__secondChild.1.in7.i.i.i.i, 1    ; <i32> [#uses=2]
  %37 = getelementptr inbounds double* %__first, i32 %36 ; <double*> [#uses=1]
  %38 = getelementptr inbounds double* %__first, i32 %__secondChild.19.i.i.i.i ; <double*> [#uses=1]
  %39 = load double* %38, align 8                 ; <double> [#uses=1]
  %40 = load double* %37, align 8                 ; <double> [#uses=1]
  %41 = fcmp olt double %39, %40                  ; <i1> [#uses=1]
  %__secondChild.1..i.i.i.i = select i1 %41, i32 %36, i32 %__secondChild.19.i.i.i.i ; <i32> [#uses=4]
  %42 = getelementptr inbounds double* %__first, i32 %__secondChild.1..i.i.i.i ; <double*> [#uses=1]
  %43 = load double* %42, align 4                 ; <double> [#uses=1]
  %44 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.04.i.i.i.i ; <double*> [#uses=1]
  store double %43, double* %44, align 4
  %phitmp.i.i.i.i = shl i32 %__secondChild.1..i.i.i.i, 1 ; <i32> [#uses=3]
  %__secondChild.1.i.i.i.i = add i32 %phitmp.i.i.i.i, 2 ; <i32> [#uses=3]
  %45 = icmp slt i32 %__secondChild.1.i.i.i.i, %34 ; <i1> [#uses=1]
  br i1 %45, label %bb.i.i.i.i8, label %bb4.i.loopexit.i.i.i

bb4.i.loopexit.i.i.i:                             ; preds = %bb.i.i.i.i8
  %phitmp.i.i.i9 = or i32 %phitmp.i.i.i.i, 1      ; <i32> [#uses=1]
  br label %bb4.i.i.i.i

bb4.i.i.i.i:                                      ; preds = %bb4.i.loopexit.i.i.i, %bb.i7
  %__secondChild.1.lcssa.i.i.i.i = phi i32 [ %__secondChild.1.i.i.i.i, %bb4.i.loopexit.i.i.i ], [ 2, %bb.i7 ] ; <i32> [#uses=1]
  %__secondChild.1.in.lcssa.i.i.i.i = phi i32 [ %phitmp.i.i.i9, %bb4.i.loopexit.i.i.i ], [ 1, %bb.i7 ] ; <i32> [#uses=3]
  %__holeIndex_addr.0.lcssa.i.i.i.i = phi i32 [ %__secondChild.1..i.i.i.i, %bb4.i.loopexit.i.i.i ], [ 0, %bb.i7 ] ; <i32> [#uses=3]
  %46 = icmp eq i32 %__secondChild.1.lcssa.i.i.i.i, %34 ; <i1> [#uses=1]
  br i1 %46, label %bb5.i.i.i.i, label %bb1.i.i.i.i.i

bb5.i.i.i.i:                                      ; preds = %bb4.i.i.i.i
  %47 = getelementptr inbounds double* %__first, i32 %__secondChild.1.in.lcssa.i.i.i.i ; <double*> [#uses=1]
  %48 = load double* %47, align 4                 ; <double> [#uses=1]
  %49 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.lcssa.i.i.i.i ; <double*> [#uses=1]
  store double %48, double* %49, align 4
  br label %bb1.i.i.i.i.i

bb.i.i.i.i.i:                                     ; preds = %bb2.i.i.i.i.i
  %50 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i.i.i ; <double*> [#uses=1]
  store double %53, double* %50, align 4
  br label %bb1.i.i.i.i.i

bb1.i.i.i.i.i:                                    ; preds = %bb.i.i.i.i.i, %bb5.i.i.i.i, %bb4.i.i.i.i
  %__parent.0.in.in.i.i.i.i.i = phi i32 [ %__parent.0.i.i.i.i.i, %bb.i.i.i.i.i ], [ %__secondChild.1.in.lcssa.i.i.i.i, %bb5.i.i.i.i ], [ %__holeIndex_addr.0.lcssa.i.i.i.i, %bb4.i.i.i.i ] ; <i32> [#uses=1]
  %__holeIndex_addr.0.i.i.i.i.i = phi i32 [ %__parent.0.i.i.i.i.i, %bb.i.i.i.i.i ], [ %__secondChild.1.in.lcssa.i.i.i.i, %bb5.i.i.i.i ], [ %__holeIndex_addr.0.lcssa.i.i.i.i, %bb4.i.i.i.i ] ; <i32> [#uses=3]
  %__parent.0.in.i.i.i.i.i = add i32 %__parent.0.in.in.i.i.i.i.i, -1 ; <i32> [#uses=1]
  %__parent.0.i.i.i.i.i = sdiv i32 %__parent.0.in.i.i.i.i.i, 2 ; <i32> [#uses=3]
  %51 = icmp sgt i32 %__holeIndex_addr.0.i.i.i.i.i, 0 ; <i1> [#uses=1]
  br i1 %51, label %bb2.i.i.i.i.i, label %_ZSt8pop_heapIPdSt4lessIdEEvT_S3_T0_.exit.i

bb2.i.i.i.i.i:                                    ; preds = %bb1.i.i.i.i.i
  %52 = getelementptr inbounds double* %__first, i32 %__parent.0.i.i.i.i.i ; <double*> [#uses=1]
  %53 = load double* %52, align 8                 ; <double> [#uses=2]
  %54 = fcmp olt double %53, %30                  ; <i1> [#uses=1]
  br i1 %54, label %bb.i.i.i.i.i, label %_ZSt8pop_heapIPdSt4lessIdEEvT_S3_T0_.exit.i

_ZSt8pop_heapIPdSt4lessIdEEvT_S3_T0_.exit.i:      ; preds = %bb2.i.i.i.i.i, %bb1.i.i.i.i.i
  %55 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i.i.i ; <double*> [#uses=1]
  store double %30, double* %55, align 4
  %56 = icmp sgt i32 %33, 15                      ; <i1> [#uses=1]
  %indvar.next.i10 = add i32 %indvar.i5, 1        ; <i32> [#uses=1]
  br i1 %56, label %bb.i7, label %_ZSt9sort_heapIPdSt4lessIdEEvT_S3_T0_.exit

_ZSt9sort_heapIPdSt4lessIdEEvT_S3_T0_.exit:       ; preds = %_ZSt8pop_heapIPdSt4lessIdEEvT_S3_T0_.exit.i, %_ZSt13__heap_selectIPdSt4lessIdEEvT_S3_S3_T0_.exit, %bb1
  ret void

bb2:                                              ; preds = %bb
  %57 = getelementptr inbounds double* %__last_addr.0, i32 -1 ; <double*> [#uses=3]
  %58 = sdiv i32 %80, 16                          ; <i32> [#uses=1]
  %59 = getelementptr inbounds double* %__first, i32 %58 ; <double*> [#uses=3]
  %60 = load double* %__first, align 8            ; <double> [#uses=4]
  %61 = load double* %59, align 8                 ; <double> [#uses=3]
  %62 = fcmp olt double %60, %61                  ; <i1> [#uses=1]
  %63 = load double* %57, align 8                 ; <double> [#uses=4]
  br i1 %62, label %bb.i, label %bb7.i

bb.i:                                             ; preds = %bb2
  %64 = fcmp olt double %61, %63                  ; <i1> [#uses=1]
  br i1 %64, label %_ZSt8__medianIdSt4lessIdEERKT_S4_S4_S4_T0_.exit, label %bb3.i

bb3.i:                                            ; preds = %bb.i
  %65 = fcmp olt double %60, %63                  ; <i1> [#uses=1]
  %retval.i = select i1 %65, double* %57, double* %__first ; <double*> [#uses=1]
  br label %_ZSt8__medianIdSt4lessIdEERKT_S4_S4_S4_T0_.exit

bb7.i:                                            ; preds = %bb2
  %66 = fcmp olt double %60, %63                  ; <i1> [#uses=1]
  br i1 %66, label %_ZSt8__medianIdSt4lessIdEERKT_S4_S4_S4_T0_.exit, label %bb10.i

bb10.i:                                           ; preds = %bb7.i
  %67 = fcmp olt double %61, %63                  ; <i1> [#uses=1]
  %retval1.i = select i1 %67, double* %57, double* %59 ; <double*> [#uses=1]
  br label %_ZSt8__medianIdSt4lessIdEERKT_S4_S4_S4_T0_.exit

_ZSt8__medianIdSt4lessIdEERKT_S4_S4_S4_T0_.exit:  ; preds = %bb10.i, %bb7.i, %bb3.i, %bb.i
  %68 = phi double* [ %retval1.i, %bb10.i ], [ %retval.i, %bb3.i ], [ %59, %bb.i ], [ %__first, %bb7.i ] ; <double*> [#uses=1]
  %69 = load double* %68, align 8                 ; <double> [#uses=3]
  br label %bb2.outer.i

bb2.outer.i:                                      ; preds = %bb9.i, %_ZSt8__medianIdSt4lessIdEERKT_S4_S4_S4_T0_.exit
  %70 = phi double [ %.pre, %bb9.i ], [ %60, %_ZSt8__medianIdSt4lessIdEERKT_S4_S4_S4_T0_.exit ] ; <double> [#uses=2]
  %__last_addr.0.ph.i = phi double* [ %__last_addr.0, %_ZSt8__medianIdSt4lessIdEERKT_S4_S4_S4_T0_.exit ], [ %__last_addr.1.i, %bb9.i ] ; <double*> [#uses=1]
  %__first_addr.0.ph.i = phi double* [ %__first, %_ZSt8__medianIdSt4lessIdEERKT_S4_S4_S4_T0_.exit ], [ %78, %bb9.i ] ; <double*> [#uses=2]
  %71 = fcmp olt double %70, %69                  ; <i1> [#uses=1]
  br i1 %71, label %bb1.i, label %bb5.preheader.i

bb1.i:                                            ; preds = %bb1.i, %bb2.outer.i
  %indvar5.i = phi i32 [ %tmp, %bb1.i ], [ 0, %bb2.outer.i ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar5.i, 1                    ; <i32> [#uses=2]
  %scevgep.i = getelementptr double* %__first_addr.0.ph.i, i32 %tmp ; <double*> [#uses=2]
  %72 = load double* %scevgep.i, align 8          ; <double> [#uses=2]
  %73 = fcmp olt double %72, %69                  ; <i1> [#uses=1]
  br i1 %73, label %bb1.i, label %bb5.preheader.i

bb5.preheader.i:                                  ; preds = %bb1.i, %bb2.outer.i
  %74 = phi double [ %70, %bb2.outer.i ], [ %72, %bb1.i ] ; <double> [#uses=1]
  %__first_addr.0.lcssa.i = phi double* [ %__first_addr.0.ph.i, %bb2.outer.i ], [ %scevgep.i, %bb1.i ] ; <double*> [#uses=5]
  br label %bb5.i

bb5.i:                                            ; preds = %bb5.i, %bb5.preheader.i
  %indvar.i = phi i32 [ 0, %bb5.preheader.i ], [ %indvar.next.i, %bb5.i ] ; <i32> [#uses=2]
  %tmp12 = xor i32 %indvar.i, -1                  ; <i32> [#uses=1]
  %__last_addr.1.i = getelementptr double* %__last_addr.0.ph.i, i32 %tmp12 ; <double*> [#uses=4]
  %75 = load double* %__last_addr.1.i, align 8    ; <double> [#uses=2]
  %76 = fcmp ogt double %75, %69                  ; <i1> [#uses=1]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br i1 %76, label %bb5.i, label %bb7.i6

bb7.i6:                                           ; preds = %bb5.i
  %77 = icmp ult double* %__first_addr.0.lcssa.i, %__last_addr.1.i ; <i1> [#uses=1]
  br i1 %77, label %bb9.i, label %_ZSt21__unguarded_partitionIPddSt4lessIdEET_S3_S3_T0_T1_.exit

bb9.i:                                            ; preds = %bb7.i6
  store double %75, double* %__first_addr.0.lcssa.i, align 8
  store double %74, double* %__last_addr.1.i, align 8
  %78 = getelementptr inbounds double* %__first_addr.0.lcssa.i, i32 1 ; <double*> [#uses=2]
  %.pre = load double* %78, align 8               ; <double> [#uses=1]
  br label %bb2.outer.i

_ZSt21__unguarded_partitionIPddSt4lessIdEET_S3_S3_T0_T1_.exit: ; preds = %bb7.i6
  call fastcc void @_ZSt16__introsort_loopIPdiSt4lessIdEEvT_S3_T0_T1_(double* %__first_addr.0.lcssa.i, double* %__last_addr.0, i32 %tmp16)
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb3

bb3:                                              ; preds = %_ZSt21__unguarded_partitionIPddSt4lessIdEET_S3_S3_T0_T1_.exit, %entry
  %indvar = phi i32 [ 0, %entry ], [ %indvar.next, %_ZSt21__unguarded_partitionIPddSt4lessIdEET_S3_S3_T0_T1_.exit ] ; <i32> [#uses=3]
  %__last_addr.0 = phi double* [ %__last, %entry ], [ %__first_addr.0.lcssa.i, %_ZSt21__unguarded_partitionIPddSt4lessIdEET_S3_S3_T0_T1_.exit ] ; <double*> [#uses=5]
  %tmp16 = sub i32 %tmp15, %indvar                ; <i32> [#uses=1]
  %79 = ptrtoint double* %__last_addr.0 to i32    ; <i32> [#uses=1]
  %80 = sub i32 %79, %0                           ; <i32> [#uses=4]
  %81 = icmp sgt i32 %80, 135                     ; <i1> [#uses=1]
  br i1 %81, label %bb, label %return

return:                                           ; preds = %bb3
  ret void
}

define internal fastcc void @_ZSt13__heap_selectIPdEvT_S1_S1_(double* %__first, double* %__middle, double* %__last) nounwind {
entry:
  %0 = ptrtoint double* %__middle to i32          ; <i32> [#uses=1]
  %1 = ptrtoint double* %__first to i32           ; <i32> [#uses=1]
  %2 = sub i32 %0, %1                             ; <i32> [#uses=3]
  %3 = icmp sgt i32 %2, 15                        ; <i1> [#uses=1]
  br i1 %3, label %bb.i, label %_ZSt9make_heapIPdEvT_S1_.exit

bb.i:                                             ; preds = %entry
  %4 = ashr i32 %2, 3                             ; <i32> [#uses=4]
  %5 = add i32 %4, -2                             ; <i32> [#uses=1]
  %6 = sdiv i32 %5, 2                             ; <i32> [#uses=3]
  %tmp3.i = shl i32 %6, 1                         ; <i32> [#uses=2]
  %tmp5.i = add i32 %tmp3.i, 2                    ; <i32> [#uses=1]
  br label %bb1.i

bb1.i:                                            ; preds = %bb2.i, %bb.i
  %indvar.i = phi i32 [ 0, %bb.i ], [ %indvar.next.i, %bb2.i ] ; <i32> [#uses=4]
  %__parent.0.i = sub i32 %6, %indvar.i           ; <i32> [#uses=4]
  %tmp2.i = mul i32 %indvar.i, -2                 ; <i32> [#uses=2]
  %__secondChild.1.in3.i.i = add i32 %tmp2.i, %tmp3.i ; <i32> [#uses=2]
  %__secondChild.15.i.i = add i32 %tmp2.i, %tmp5.i ; <i32> [#uses=3]
  %scevgep.i = getelementptr double* %__first, i32 %__parent.0.i ; <double*> [#uses=1]
  %7 = load double* %scevgep.i, align 4           ; <double> [#uses=2]
  %8 = icmp slt i32 %__secondChild.15.i.i, %4     ; <i1> [#uses=1]
  br i1 %8, label %bb.i.i7, label %bb4.i.i11

bb.i.i7:                                          ; preds = %bb.i.i7, %bb1.i
  %__secondChild.16.i.i1 = phi i32 [ %__secondChild.1.i.i6, %bb.i.i7 ], [ %__secondChild.15.i.i, %bb1.i ] ; <i32> [#uses=2]
  %__secondChild.1.in4.i.i2 = phi i32 [ %phitmp.i.i5, %bb.i.i7 ], [ %__secondChild.1.in3.i.i, %bb1.i ] ; <i32> [#uses=1]
  %__holeIndex_addr.01.i.i3 = phi i32 [ %__secondChild.0.i.i4, %bb.i.i7 ], [ %__parent.0.i, %bb1.i ] ; <i32> [#uses=1]
  %9 = getelementptr inbounds double* %__first, i32 %__secondChild.16.i.i1 ; <double*> [#uses=1]
  %10 = load double* %9, align 4                  ; <double> [#uses=1]
  %11 = or i32 %__secondChild.1.in4.i.i2, 1       ; <i32> [#uses=2]
  %12 = getelementptr inbounds double* %__first, i32 %11 ; <double*> [#uses=1]
  %13 = load double* %12, align 4                 ; <double> [#uses=1]
  %14 = fcmp olt double %10, %13                  ; <i1> [#uses=1]
  %__secondChild.0.i.i4 = select i1 %14, i32 %11, i32 %__secondChild.16.i.i1 ; <i32> [#uses=4]
  %15 = getelementptr inbounds double* %__first, i32 %__secondChild.0.i.i4 ; <double*> [#uses=1]
  %16 = load double* %15, align 4                 ; <double> [#uses=1]
  %17 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.01.i.i3 ; <double*> [#uses=1]
  store double %16, double* %17, align 4
  %phitmp.i.i5 = shl i32 %__secondChild.0.i.i4, 1 ; <i32> [#uses=3]
  %__secondChild.1.i.i6 = add i32 %phitmp.i.i5, 2 ; <i32> [#uses=3]
  %18 = icmp slt i32 %__secondChild.1.i.i6, %4    ; <i1> [#uses=1]
  br i1 %18, label %bb.i.i7, label %bb4.i.i11

bb4.i.i11:                                        ; preds = %bb.i.i7, %bb1.i
  %__secondChild.1.lcssa.i.i8 = phi i32 [ %__secondChild.15.i.i, %bb1.i ], [ %__secondChild.1.i.i6, %bb.i.i7 ] ; <i32> [#uses=1]
  %__secondChild.1.in.lcssa.i.i9 = phi i32 [ %__secondChild.1.in3.i.i, %bb1.i ], [ %phitmp.i.i5, %bb.i.i7 ] ; <i32> [#uses=1]
  %__holeIndex_addr.0.lcssa.i.i10 = phi i32 [ %__parent.0.i, %bb1.i ], [ %__secondChild.0.i.i4, %bb.i.i7 ] ; <i32> [#uses=3]
  %19 = icmp eq i32 %__secondChild.1.lcssa.i.i8, %4 ; <i1> [#uses=1]
  br i1 %19, label %bb5.i.i12, label %bb1.i.i.i18

bb5.i.i12:                                        ; preds = %bb4.i.i11
  %20 = or i32 %__secondChild.1.in.lcssa.i.i9, 1  ; <i32> [#uses=3]
  %21 = getelementptr inbounds double* %__first, i32 %20 ; <double*> [#uses=1]
  %22 = load double* %21, align 4                 ; <double> [#uses=1]
  %23 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.lcssa.i.i10 ; <double*> [#uses=1]
  store double %22, double* %23, align 4
  br label %bb1.i.i.i18

bb.i.i.i13:                                       ; preds = %bb2.i.i.i19
  %24 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i14 ; <double*> [#uses=1]
  store double %27, double* %24, align 4
  br label %bb1.i.i.i18

bb1.i.i.i18:                                      ; preds = %bb.i.i.i13, %bb5.i.i12, %bb4.i.i11
  %__holeIndex_addr.0.i.i.i14 = phi i32 [ %__parent.0.i.i.i17, %bb.i.i.i13 ], [ %20, %bb5.i.i12 ], [ %__holeIndex_addr.0.lcssa.i.i10, %bb4.i.i11 ] ; <i32> [#uses=3]
  %__parent.0.in.in.i.i.i15 = phi i32 [ %__parent.0.i.i.i17, %bb.i.i.i13 ], [ %20, %bb5.i.i12 ], [ %__holeIndex_addr.0.lcssa.i.i10, %bb4.i.i11 ] ; <i32> [#uses=1]
  %__parent.0.in.i.i.i16 = add i32 %__parent.0.in.in.i.i.i15, -1 ; <i32> [#uses=1]
  %__parent.0.i.i.i17 = sdiv i32 %__parent.0.in.i.i.i16, 2 ; <i32> [#uses=3]
  %25 = icmp sgt i32 %__holeIndex_addr.0.i.i.i14, %__parent.0.i ; <i1> [#uses=1]
  br i1 %25, label %bb2.i.i.i19, label %_ZSt13__adjust_heapIPdidEvT_T0_S2_T1_.exit.i

bb2.i.i.i19:                                      ; preds = %bb1.i.i.i18
  %26 = getelementptr inbounds double* %__first, i32 %__parent.0.i.i.i17 ; <double*> [#uses=1]
  %27 = load double* %26, align 4                 ; <double> [#uses=2]
  %28 = fcmp olt double %27, %7                   ; <i1> [#uses=1]
  br i1 %28, label %bb.i.i.i13, label %_ZSt13__adjust_heapIPdidEvT_T0_S2_T1_.exit.i

_ZSt13__adjust_heapIPdidEvT_T0_S2_T1_.exit.i:     ; preds = %bb2.i.i.i19, %bb1.i.i.i18
  %29 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i14 ; <double*> [#uses=1]
  store double %7, double* %29, align 4
  %30 = icmp eq i32 %6, %indvar.i                 ; <i1> [#uses=1]
  br i1 %30, label %_ZSt9make_heapIPdEvT_S1_.exit, label %bb2.i

bb2.i:                                            ; preds = %_ZSt13__adjust_heapIPdidEvT_T0_S2_T1_.exit.i
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br label %bb1.i

_ZSt9make_heapIPdEvT_S1_.exit:                    ; preds = %_ZSt13__adjust_heapIPdidEvT_T0_S2_T1_.exit.i, %entry
  %31 = icmp ult double* %__middle, %__last       ; <i1> [#uses=1]
  br i1 %31, label %bb.nph, label %return

bb.nph:                                           ; preds = %_ZSt9make_heapIPdEvT_S1_.exit
  %32 = ashr i32 %2, 3                            ; <i32> [#uses=3]
  %33 = icmp sgt i32 %32, 2                       ; <i1> [#uses=1]
  br label %bb

bb:                                               ; preds = %bb2, %bb.nph
  %indvar = phi i32 [ 0, %bb.nph ], [ %tmp, %bb2 ] ; <i32> [#uses=2]
  %__i.01 = getelementptr double* %__middle, i32 %indvar ; <double*> [#uses=2]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=2]
  %scevgep = getelementptr double* %__middle, i32 %tmp ; <double*> [#uses=1]
  %34 = load double* %__i.01, align 8             ; <double> [#uses=3]
  %35 = load double* %__first, align 8            ; <double> [#uses=2]
  %36 = fcmp olt double %34, %35                  ; <i1> [#uses=1]
  br i1 %36, label %bb1, label %bb2

bb1:                                              ; preds = %bb
  store double %35, double* %__i.01, align 8
  br i1 %33, label %bb.i.i, label %bb4.i.i

bb.i.i:                                           ; preds = %bb.i.i, %bb1
  %__secondChild.16.i.i = phi i32 [ %__secondChild.1.i.i, %bb.i.i ], [ 2, %bb1 ] ; <i32> [#uses=2]
  %__secondChild.1.in4.i.i = phi i32 [ %phitmp.i.i, %bb.i.i ], [ 0, %bb1 ] ; <i32> [#uses=1]
  %__holeIndex_addr.01.i.i = phi i32 [ %__secondChild.0.i.i, %bb.i.i ], [ 0, %bb1 ] ; <i32> [#uses=1]
  %37 = getelementptr inbounds double* %__first, i32 %__secondChild.16.i.i ; <double*> [#uses=1]
  %38 = load double* %37, align 4                 ; <double> [#uses=1]
  %39 = or i32 %__secondChild.1.in4.i.i, 1        ; <i32> [#uses=2]
  %40 = getelementptr inbounds double* %__first, i32 %39 ; <double*> [#uses=1]
  %41 = load double* %40, align 4                 ; <double> [#uses=1]
  %42 = fcmp olt double %38, %41                  ; <i1> [#uses=1]
  %__secondChild.0.i.i = select i1 %42, i32 %39, i32 %__secondChild.16.i.i ; <i32> [#uses=4]
  %43 = getelementptr inbounds double* %__first, i32 %__secondChild.0.i.i ; <double*> [#uses=1]
  %44 = load double* %43, align 4                 ; <double> [#uses=1]
  %45 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.01.i.i ; <double*> [#uses=1]
  store double %44, double* %45, align 4
  %phitmp.i.i = shl i32 %__secondChild.0.i.i, 1   ; <i32> [#uses=3]
  %__secondChild.1.i.i = add i32 %phitmp.i.i, 2   ; <i32> [#uses=3]
  %46 = icmp slt i32 %__secondChild.1.i.i, %32    ; <i1> [#uses=1]
  br i1 %46, label %bb.i.i, label %bb4.i.loopexit.i

bb4.i.loopexit.i:                                 ; preds = %bb.i.i
  %phitmp.i = or i32 %phitmp.i.i, 1               ; <i32> [#uses=1]
  br label %bb4.i.i

bb4.i.i:                                          ; preds = %bb4.i.loopexit.i, %bb1
  %__secondChild.1.lcssa.i.i = phi i32 [ %__secondChild.1.i.i, %bb4.i.loopexit.i ], [ 2, %bb1 ] ; <i32> [#uses=1]
  %__secondChild.1.in.lcssa.i.i = phi i32 [ %phitmp.i, %bb4.i.loopexit.i ], [ 1, %bb1 ] ; <i32> [#uses=3]
  %__holeIndex_addr.0.lcssa.i.i = phi i32 [ %__secondChild.0.i.i, %bb4.i.loopexit.i ], [ 0, %bb1 ] ; <i32> [#uses=3]
  %47 = icmp eq i32 %__secondChild.1.lcssa.i.i, %32 ; <i1> [#uses=1]
  br i1 %47, label %bb5.i.i, label %bb1.i.i.i

bb5.i.i:                                          ; preds = %bb4.i.i
  %48 = getelementptr inbounds double* %__first, i32 %__secondChild.1.in.lcssa.i.i ; <double*> [#uses=1]
  %49 = load double* %48, align 4                 ; <double> [#uses=1]
  %50 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.lcssa.i.i ; <double*> [#uses=1]
  store double %49, double* %50, align 4
  br label %bb1.i.i.i

bb.i.i.i:                                         ; preds = %bb2.i.i.i
  %51 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i ; <double*> [#uses=1]
  store double %54, double* %51, align 4
  br label %bb1.i.i.i

bb1.i.i.i:                                        ; preds = %bb.i.i.i, %bb5.i.i, %bb4.i.i
  %__holeIndex_addr.0.i.i.i = phi i32 [ %__parent.0.i.i.i, %bb.i.i.i ], [ %__secondChild.1.in.lcssa.i.i, %bb5.i.i ], [ %__holeIndex_addr.0.lcssa.i.i, %bb4.i.i ] ; <i32> [#uses=3]
  %__parent.0.in.in.i.i.i = phi i32 [ %__parent.0.i.i.i, %bb.i.i.i ], [ %__secondChild.1.in.lcssa.i.i, %bb5.i.i ], [ %__holeIndex_addr.0.lcssa.i.i, %bb4.i.i ] ; <i32> [#uses=1]
  %__parent.0.in.i.i.i = add i32 %__parent.0.in.in.i.i.i, -1 ; <i32> [#uses=1]
  %__parent.0.i.i.i = sdiv i32 %__parent.0.in.i.i.i, 2 ; <i32> [#uses=3]
  %52 = icmp sgt i32 %__holeIndex_addr.0.i.i.i, 0 ; <i1> [#uses=1]
  br i1 %52, label %bb2.i.i.i, label %_ZSt10__pop_heapIPddEvT_S1_S1_T0_.exit

bb2.i.i.i:                                        ; preds = %bb1.i.i.i
  %53 = getelementptr inbounds double* %__first, i32 %__parent.0.i.i.i ; <double*> [#uses=1]
  %54 = load double* %53, align 4                 ; <double> [#uses=2]
  %55 = fcmp olt double %54, %34                  ; <i1> [#uses=1]
  br i1 %55, label %bb.i.i.i, label %_ZSt10__pop_heapIPddEvT_S1_S1_T0_.exit

_ZSt10__pop_heapIPddEvT_S1_S1_T0_.exit:           ; preds = %bb2.i.i.i, %bb1.i.i.i
  %56 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i ; <double*> [#uses=1]
  store double %34, double* %56, align 4
  br label %bb2

bb2:                                              ; preds = %_ZSt10__pop_heapIPddEvT_S1_S1_T0_.exit, %bb
  %57 = icmp ult double* %scevgep, %__last        ; <i1> [#uses=1]
  br i1 %57, label %bb, label %return

return:                                           ; preds = %bb2, %_ZSt9make_heapIPdEvT_S1_.exit
  ret void
}

define internal fastcc void @_ZSt9sort_heapIPdEvT_S1_(double* %__first, double* %__last) nounwind {
entry:
  %0 = ptrtoint double* %__last to i32            ; <i32> [#uses=1]
  %1 = ptrtoint double* %__first to i32           ; <i32> [#uses=2]
  %2 = sub i32 %0, %1                             ; <i32> [#uses=1]
  %3 = icmp sgt i32 %2, 15                        ; <i1> [#uses=1]
  br i1 %3, label %bb, label %return

bb:                                               ; preds = %_ZSt8pop_heapIPdEvT_S1_.exit, %entry
  %indvar = phi i32 [ %indvar.next, %_ZSt8pop_heapIPdEvT_S1_.exit ], [ 0, %entry ] ; <i32> [#uses=2]
  %tmp2 = xor i32 %indvar, -1                     ; <i32> [#uses=1]
  %scevgep = getelementptr double* %__last, i32 %tmp2 ; <double*> [#uses=3]
  %4 = load double* %scevgep, align 4             ; <double> [#uses=2]
  %5 = load double* %__first, align 8             ; <double> [#uses=1]
  store double %5, double* %scevgep, align 8
  %6 = ptrtoint double* %scevgep to i32           ; <i32> [#uses=1]
  %7 = sub i32 %6, %1                             ; <i32> [#uses=2]
  %8 = ashr i32 %7, 3                             ; <i32> [#uses=3]
  %9 = icmp sgt i32 %8, 2                         ; <i1> [#uses=1]
  br i1 %9, label %bb.i.i.i, label %bb4.i.i.i

bb.i.i.i:                                         ; preds = %bb.i.i.i, %bb
  %__secondChild.16.i.i.i = phi i32 [ %__secondChild.1.i.i.i, %bb.i.i.i ], [ 2, %bb ] ; <i32> [#uses=2]
  %__secondChild.1.in4.i.i.i = phi i32 [ %phitmp.i.i.i, %bb.i.i.i ], [ 0, %bb ] ; <i32> [#uses=1]
  %__holeIndex_addr.01.i.i.i = phi i32 [ %__secondChild.0.i.i.i, %bb.i.i.i ], [ 0, %bb ] ; <i32> [#uses=1]
  %10 = getelementptr inbounds double* %__first, i32 %__secondChild.16.i.i.i ; <double*> [#uses=1]
  %11 = load double* %10, align 4                 ; <double> [#uses=1]
  %12 = or i32 %__secondChild.1.in4.i.i.i, 1      ; <i32> [#uses=2]
  %13 = getelementptr inbounds double* %__first, i32 %12 ; <double*> [#uses=1]
  %14 = load double* %13, align 4                 ; <double> [#uses=1]
  %15 = fcmp olt double %11, %14                  ; <i1> [#uses=1]
  %__secondChild.0.i.i.i = select i1 %15, i32 %12, i32 %__secondChild.16.i.i.i ; <i32> [#uses=4]
  %16 = getelementptr inbounds double* %__first, i32 %__secondChild.0.i.i.i ; <double*> [#uses=1]
  %17 = load double* %16, align 4                 ; <double> [#uses=1]
  %18 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.01.i.i.i ; <double*> [#uses=1]
  store double %17, double* %18, align 4
  %phitmp.i.i.i = shl i32 %__secondChild.0.i.i.i, 1 ; <i32> [#uses=3]
  %__secondChild.1.i.i.i = add i32 %phitmp.i.i.i, 2 ; <i32> [#uses=3]
  %19 = icmp slt i32 %__secondChild.1.i.i.i, %8   ; <i1> [#uses=1]
  br i1 %19, label %bb.i.i.i, label %bb4.i.loopexit.i.i

bb4.i.loopexit.i.i:                               ; preds = %bb.i.i.i
  %phitmp.i.i = or i32 %phitmp.i.i.i, 1           ; <i32> [#uses=1]
  br label %bb4.i.i.i

bb4.i.i.i:                                        ; preds = %bb4.i.loopexit.i.i, %bb
  %__secondChild.1.lcssa.i.i.i = phi i32 [ %__secondChild.1.i.i.i, %bb4.i.loopexit.i.i ], [ 2, %bb ] ; <i32> [#uses=1]
  %__secondChild.1.in.lcssa.i.i.i = phi i32 [ %phitmp.i.i, %bb4.i.loopexit.i.i ], [ 1, %bb ] ; <i32> [#uses=3]
  %__holeIndex_addr.0.lcssa.i.i.i = phi i32 [ %__secondChild.0.i.i.i, %bb4.i.loopexit.i.i ], [ 0, %bb ] ; <i32> [#uses=3]
  %20 = icmp eq i32 %__secondChild.1.lcssa.i.i.i, %8 ; <i1> [#uses=1]
  br i1 %20, label %bb5.i.i.i, label %bb1.i.i.i.i

bb5.i.i.i:                                        ; preds = %bb4.i.i.i
  %21 = getelementptr inbounds double* %__first, i32 %__secondChild.1.in.lcssa.i.i.i ; <double*> [#uses=1]
  %22 = load double* %21, align 4                 ; <double> [#uses=1]
  %23 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.lcssa.i.i.i ; <double*> [#uses=1]
  store double %22, double* %23, align 4
  br label %bb1.i.i.i.i

bb.i.i.i.i:                                       ; preds = %bb2.i.i.i.i
  %24 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i.i ; <double*> [#uses=1]
  store double %27, double* %24, align 4
  br label %bb1.i.i.i.i

bb1.i.i.i.i:                                      ; preds = %bb.i.i.i.i, %bb5.i.i.i, %bb4.i.i.i
  %__holeIndex_addr.0.i.i.i.i = phi i32 [ %__parent.0.i.i.i.i, %bb.i.i.i.i ], [ %__secondChild.1.in.lcssa.i.i.i, %bb5.i.i.i ], [ %__holeIndex_addr.0.lcssa.i.i.i, %bb4.i.i.i ] ; <i32> [#uses=3]
  %__parent.0.in.in.i.i.i.i = phi i32 [ %__parent.0.i.i.i.i, %bb.i.i.i.i ], [ %__secondChild.1.in.lcssa.i.i.i, %bb5.i.i.i ], [ %__holeIndex_addr.0.lcssa.i.i.i, %bb4.i.i.i ] ; <i32> [#uses=1]
  %__parent.0.in.i.i.i.i = add i32 %__parent.0.in.in.i.i.i.i, -1 ; <i32> [#uses=1]
  %__parent.0.i.i.i.i = sdiv i32 %__parent.0.in.i.i.i.i, 2 ; <i32> [#uses=3]
  %25 = icmp sgt i32 %__holeIndex_addr.0.i.i.i.i, 0 ; <i1> [#uses=1]
  br i1 %25, label %bb2.i.i.i.i, label %_ZSt8pop_heapIPdEvT_S1_.exit

bb2.i.i.i.i:                                      ; preds = %bb1.i.i.i.i
  %26 = getelementptr inbounds double* %__first, i32 %__parent.0.i.i.i.i ; <double*> [#uses=1]
  %27 = load double* %26, align 4                 ; <double> [#uses=2]
  %28 = fcmp olt double %27, %4                   ; <i1> [#uses=1]
  br i1 %28, label %bb.i.i.i.i, label %_ZSt8pop_heapIPdEvT_S1_.exit

_ZSt8pop_heapIPdEvT_S1_.exit:                     ; preds = %bb2.i.i.i.i, %bb1.i.i.i.i
  %29 = getelementptr inbounds double* %__first, i32 %__holeIndex_addr.0.i.i.i.i ; <double*> [#uses=1]
  store double %4, double* %29, align 4
  %30 = icmp sgt i32 %7, 15                       ; <i1> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br i1 %30, label %bb, label %return

return:                                           ; preds = %_ZSt8pop_heapIPdEvT_S1_.exit, %entry
  ret void
}

define internal fastcc void @_ZSt16__introsort_loopIPdiEvT_S1_T0_(double* %__first, double* %__last, i32 %__depth_limit) nounwind {
entry:
  %0 = ptrtoint double* %__first to i32           ; <i32> [#uses=1]
  %tmp16 = add i32 %__depth_limit, -2             ; <i32> [#uses=1]
  %tmp19 = add i32 %__depth_limit, -1             ; <i32> [#uses=1]
  br label %bb3

bb:                                               ; preds = %bb3
  %1 = icmp eq i32 %indvar13, %__depth_limit      ; <i1> [#uses=1]
  br i1 %1, label %bb1, label %bb2

bb1:                                              ; preds = %bb
  tail call fastcc void @_ZSt13__heap_selectIPdEvT_S1_S1_(double* %__first, double* %__last_addr.0, double* %__last_addr.0) nounwind
  tail call fastcc void @_ZSt9sort_heapIPdEvT_S1_(double* %__first, double* %__last_addr.0) nounwind
  ret void

bb2:                                              ; preds = %bb
  %2 = getelementptr inbounds double* %__last_addr.0, i32 -1 ; <double*> [#uses=3]
  %3 = sdiv i32 %52, 16                           ; <i32> [#uses=1]
  %4 = getelementptr inbounds double* %__first, i32 %3 ; <double*> [#uses=3]
  %5 = load double* %__first, align 8             ; <double> [#uses=4]
  %6 = load double* %4, align 8                   ; <double> [#uses=3]
  %7 = fcmp olt double %5, %6                     ; <i1> [#uses=1]
  %8 = load double* %2, align 8                   ; <double> [#uses=4]
  br i1 %7, label %bb.i2, label %bb5.i4

bb.i2:                                            ; preds = %bb2
  %9 = fcmp olt double %6, %8                     ; <i1> [#uses=1]
  br i1 %9, label %_ZSt8__medianIdERKT_S2_S2_S2_.exit, label %bb2.i3

bb2.i3:                                           ; preds = %bb.i2
  %10 = fcmp olt double %5, %8                    ; <i1> [#uses=1]
  %retval.i = select i1 %10, double* %2, double* %__first ; <double*> [#uses=1]
  br label %_ZSt8__medianIdERKT_S2_S2_S2_.exit

bb5.i4:                                           ; preds = %bb2
  %11 = fcmp olt double %5, %8                    ; <i1> [#uses=1]
  br i1 %11, label %_ZSt8__medianIdERKT_S2_S2_S2_.exit, label %bb7.i

bb7.i:                                            ; preds = %bb5.i4
  %12 = fcmp olt double %6, %8                    ; <i1> [#uses=1]
  %retval1.i = select i1 %12, double* %2, double* %4 ; <double*> [#uses=1]
  br label %_ZSt8__medianIdERKT_S2_S2_S2_.exit

_ZSt8__medianIdERKT_S2_S2_S2_.exit:               ; preds = %bb7.i, %bb5.i4, %bb2.i3, %bb.i2
  %13 = phi double* [ %retval1.i, %bb7.i ], [ %retval.i, %bb2.i3 ], [ %4, %bb.i2 ], [ %__first, %bb5.i4 ] ; <double*> [#uses=1]
  %14 = load double* %13, align 8                 ; <double> [#uses=3]
  br label %bb2.outer.i

bb2.outer.i:                                      ; preds = %bb8.i, %_ZSt8__medianIdERKT_S2_S2_S2_.exit
  %15 = phi double [ %.pre, %bb8.i ], [ %5, %_ZSt8__medianIdERKT_S2_S2_S2_.exit ] ; <double> [#uses=2]
  %__last_addr.0.ph.i = phi double* [ %__last_addr.0, %_ZSt8__medianIdERKT_S2_S2_S2_.exit ], [ %__last_addr.1.i, %bb8.i ] ; <double*> [#uses=1]
  %__first_addr.0.ph.i = phi double* [ %__first, %_ZSt8__medianIdERKT_S2_S2_S2_.exit ], [ %24, %bb8.i ] ; <double*> [#uses=2]
  %16 = fcmp olt double %15, %14                  ; <i1> [#uses=1]
  br i1 %16, label %bb1.i1, label %bb5.preheader.i

bb1.i1:                                           ; preds = %bb1.i1, %bb2.outer.i
  %indvar4.i = phi i32 [ %tmp, %bb1.i1 ], [ 0, %bb2.outer.i ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar4.i, 1                    ; <i32> [#uses=2]
  %scevgep.i = getelementptr double* %__first_addr.0.ph.i, i32 %tmp ; <double*> [#uses=2]
  %17 = load double* %scevgep.i, align 8          ; <double> [#uses=2]
  %18 = fcmp olt double %17, %14                  ; <i1> [#uses=1]
  br i1 %18, label %bb1.i1, label %bb5.preheader.i

bb5.preheader.i:                                  ; preds = %bb1.i1, %bb2.outer.i
  %19 = phi double [ %15, %bb2.outer.i ], [ %17, %bb1.i1 ] ; <double> [#uses=1]
  %__first_addr.0.lcssa.i = phi double* [ %__first_addr.0.ph.i, %bb2.outer.i ], [ %scevgep.i, %bb1.i1 ] ; <double*> [#uses=12]
  br label %bb5.i

bb5.i:                                            ; preds = %bb5.i, %bb5.preheader.i
  %indvar.i = phi i32 [ 0, %bb5.preheader.i ], [ %indvar.next.i, %bb5.i ] ; <i32> [#uses=2]
  %tmp10 = xor i32 %indvar.i, -1                  ; <i32> [#uses=1]
  %__last_addr.1.i = getelementptr double* %__last_addr.0.ph.i, i32 %tmp10 ; <double*> [#uses=4]
  %20 = load double* %__last_addr.1.i, align 8    ; <double> [#uses=2]
  %21 = fcmp ogt double %20, %14                  ; <i1> [#uses=1]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br i1 %21, label %bb5.i, label %bb6.i

bb6.i:                                            ; preds = %bb5.i
  %22 = icmp ult double* %__first_addr.0.lcssa.i, %__last_addr.1.i ; <i1> [#uses=1]
  br i1 %22, label %bb8.i, label %bb3.i.preheader

bb3.i.preheader:                                  ; preds = %bb6.i
  %23 = ptrtoint double* %__first_addr.0.lcssa.i to i32 ; <i32> [#uses=1]
  br label %bb3.i

bb8.i:                                            ; preds = %bb6.i
  store double %20, double* %__first_addr.0.lcssa.i, align 8
  store double %19, double* %__last_addr.1.i, align 8
  %24 = getelementptr inbounds double* %__first_addr.0.lcssa.i, i32 1 ; <double*> [#uses=2]
  %.pre = load double* %24, align 8               ; <double> [#uses=1]
  br label %bb2.outer.i

bb.i:                                             ; preds = %bb3.i
  %25 = icmp eq i32 %indvar, %tmp20               ; <i1> [#uses=1]
  br i1 %25, label %bb1.i, label %bb2.i

bb1.i:                                            ; preds = %bb.i
  tail call fastcc void @_ZSt13__heap_selectIPdEvT_S1_S1_(double* %__first_addr.0.lcssa.i, double* %__last_addr.0.i, double* %__last_addr.0.i) nounwind
  tail call fastcc void @_ZSt9sort_heapIPdEvT_S1_(double* %__first_addr.0.lcssa.i, double* %__last_addr.0.i) nounwind
  br label %bb3.backedge

bb3.backedge:                                     ; preds = %bb3.i, %bb1.i
  %indvar.next14 = add i32 %indvar13, 1           ; <i32> [#uses=1]
  br label %bb3

bb2.i:                                            ; preds = %bb.i
  %26 = getelementptr inbounds double* %__last_addr.0.i, i32 -1 ; <double*> [#uses=3]
  %27 = sdiv i32 %49, 16                          ; <i32> [#uses=1]
  %28 = getelementptr inbounds double* %__first_addr.0.lcssa.i, i32 %27 ; <double*> [#uses=3]
  %29 = load double* %__first_addr.0.lcssa.i, align 8 ; <double> [#uses=4]
  %30 = load double* %28, align 8                 ; <double> [#uses=3]
  %31 = fcmp olt double %29, %30                  ; <i1> [#uses=1]
  %32 = load double* %26, align 8                 ; <double> [#uses=4]
  br i1 %31, label %bb.i1, label %bb5.i5

bb.i1:                                            ; preds = %bb2.i
  %33 = fcmp olt double %30, %32                  ; <i1> [#uses=1]
  br i1 %33, label %_ZSt8__medianIdERKT_S2_S2_S2_.exit8, label %bb2.i4

bb2.i4:                                           ; preds = %bb.i1
  %34 = fcmp olt double %29, %32                  ; <i1> [#uses=1]
  %retval.i2 = select i1 %34, double* %26, double* %__first_addr.0.lcssa.i ; <double*> [#uses=1]
  br label %_ZSt8__medianIdERKT_S2_S2_S2_.exit8

bb5.i5:                                           ; preds = %bb2.i
  %35 = fcmp olt double %29, %32                  ; <i1> [#uses=1]
  br i1 %35, label %_ZSt8__medianIdERKT_S2_S2_S2_.exit8, label %bb7.i7

bb7.i7:                                           ; preds = %bb5.i5
  %36 = fcmp olt double %30, %32                  ; <i1> [#uses=1]
  %retval1.i6 = select i1 %36, double* %26, double* %28 ; <double*> [#uses=1]
  br label %_ZSt8__medianIdERKT_S2_S2_S2_.exit8

_ZSt8__medianIdERKT_S2_S2_S2_.exit8:              ; preds = %bb7.i7, %bb5.i5, %bb2.i4, %bb.i1
  %37 = phi double* [ %retval1.i6, %bb7.i7 ], [ %retval.i2, %bb2.i4 ], [ %28, %bb.i1 ], [ %__first_addr.0.lcssa.i, %bb5.i5 ] ; <double*> [#uses=1]
  %38 = load double* %37, align 8                 ; <double> [#uses=3]
  br label %bb2.outer.i11

bb2.outer.i11:                                    ; preds = %bb8.i23, %_ZSt8__medianIdERKT_S2_S2_S2_.exit8
  %39 = phi double [ %.pre24, %bb8.i23 ], [ %29, %_ZSt8__medianIdERKT_S2_S2_S2_.exit8 ] ; <double> [#uses=2]
  %__last_addr.0.ph.i9 = phi double* [ %__last_addr.0.i, %_ZSt8__medianIdERKT_S2_S2_S2_.exit8 ], [ %__last_addr.1.i18, %bb8.i23 ] ; <double*> [#uses=1]
  %__first_addr.0.ph.i10 = phi double* [ %__first_addr.0.lcssa.i, %_ZSt8__medianIdERKT_S2_S2_S2_.exit8 ], [ %47, %bb8.i23 ] ; <double*> [#uses=2]
  %40 = fcmp olt double %39, %38                  ; <i1> [#uses=1]
  br i1 %40, label %bb1.i14, label %bb5.preheader.i16

bb1.i14:                                          ; preds = %bb1.i14, %bb2.outer.i11
  %indvar4.i12 = phi i32 [ %tmp6.i, %bb1.i14 ], [ 0, %bb2.outer.i11 ] ; <i32> [#uses=1]
  %tmp6.i = add i32 %indvar4.i12, 1               ; <i32> [#uses=2]
  %scevgep.i13 = getelementptr double* %__first_addr.0.ph.i10, i32 %tmp6.i ; <double*> [#uses=2]
  %41 = load double* %scevgep.i13, align 8        ; <double> [#uses=2]
  %42 = fcmp olt double %41, %38                  ; <i1> [#uses=1]
  br i1 %42, label %bb1.i14, label %bb5.preheader.i16

bb5.preheader.i16:                                ; preds = %bb1.i14, %bb2.outer.i11
  %43 = phi double [ %39, %bb2.outer.i11 ], [ %41, %bb1.i14 ] ; <double> [#uses=1]
  %__first_addr.0.lcssa.i15 = phi double* [ %__first_addr.0.ph.i10, %bb2.outer.i11 ], [ %scevgep.i13, %bb1.i14 ] ; <double*> [#uses=5]
  br label %bb5.i20

bb5.i20:                                          ; preds = %bb5.i20, %bb5.preheader.i16
  %indvar.i17 = phi i32 [ 0, %bb5.preheader.i16 ], [ %indvar.next.i19, %bb5.i20 ] ; <i32> [#uses=2]
  %tmp3.i = xor i32 %indvar.i17, -1               ; <i32> [#uses=1]
  %__last_addr.1.i18 = getelementptr double* %__last_addr.0.ph.i9, i32 %tmp3.i ; <double*> [#uses=4]
  %44 = load double* %__last_addr.1.i18, align 8  ; <double> [#uses=2]
  %45 = fcmp ogt double %44, %38                  ; <i1> [#uses=1]
  %indvar.next.i19 = add i32 %indvar.i17, 1       ; <i32> [#uses=1]
  br i1 %45, label %bb5.i20, label %bb6.i21

bb6.i21:                                          ; preds = %bb5.i20
  %46 = icmp ult double* %__first_addr.0.lcssa.i15, %__last_addr.1.i18 ; <i1> [#uses=1]
  br i1 %46, label %bb8.i23, label %_ZSt21__unguarded_partitionIPddET_S1_S1_T0_.exit

bb8.i23:                                          ; preds = %bb6.i21
  store double %44, double* %__first_addr.0.lcssa.i15, align 8
  store double %43, double* %__last_addr.1.i18, align 8
  %47 = getelementptr inbounds double* %__first_addr.0.lcssa.i15, i32 1 ; <double*> [#uses=2]
  %.pre24 = load double* %47, align 8             ; <double> [#uses=1]
  br label %bb2.outer.i11

_ZSt21__unguarded_partitionIPddET_S1_S1_T0_.exit: ; preds = %bb6.i21
  tail call fastcc void @_ZSt16__introsort_loopIPdiEvT_S1_T0_(double* %__first_addr.0.lcssa.i15, double* %__last_addr.0.i, i32 %tmp18) nounwind
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb3.i

bb3.i:                                            ; preds = %_ZSt21__unguarded_partitionIPddET_S1_S1_T0_.exit, %bb3.i.preheader
  %indvar = phi i32 [ 0, %bb3.i.preheader ], [ %indvar.next, %_ZSt21__unguarded_partitionIPddET_S1_S1_T0_.exit ] ; <i32> [#uses=3]
  %__last_addr.0.i = phi double* [ %__first_addr.0.lcssa.i15, %_ZSt21__unguarded_partitionIPddET_S1_S1_T0_.exit ], [ %__last_addr.0, %bb3.i.preheader ] ; <double*> [#uses=7]
  %tmp18 = sub i32 %tmp17, %indvar                ; <i32> [#uses=1]
  %48 = ptrtoint double* %__last_addr.0.i to i32  ; <i32> [#uses=1]
  %49 = sub i32 %48, %23                          ; <i32> [#uses=2]
  %50 = icmp sgt i32 %49, 135                     ; <i1> [#uses=1]
  br i1 %50, label %bb.i, label %bb3.backedge

bb3:                                              ; preds = %bb3.backedge, %entry
  %indvar13 = phi i32 [ 0, %entry ], [ %indvar.next14, %bb3.backedge ] ; <i32> [#uses=4]
  %__last_addr.0 = phi double* [ %__last, %entry ], [ %__first_addr.0.lcssa.i, %bb3.backedge ] ; <double*> [#uses=7]
  %tmp20 = sub i32 %tmp19, %indvar13              ; <i32> [#uses=1]
  %tmp17 = sub i32 %tmp16, %indvar13              ; <i32> [#uses=1]
  %51 = ptrtoint double* %__last_addr.0 to i32    ; <i32> [#uses=1]
  %52 = sub i32 %51, %0                           ; <i32> [#uses=2]
  %53 = icmp sgt i32 %52, 135                     ; <i1> [#uses=1]
  br i1 %53, label %bb, label %return

return:                                           ; preds = %bb3
  ret void
}

declare void @llvm.memmove.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind

define internal fastcc void @_ZSt16__insertion_sortIPdPFbddEEvT_S3_T0_(double* %__first, double* %__last) nounwind {
entry:
  %0 = icmp eq double* %__first, %__last          ; <i1> [#uses=1]
  br i1 %0, label %return, label %bb5.preheader

bb5.preheader:                                    ; preds = %entry
  %__i.04 = getelementptr inbounds double* %__first, i32 1 ; <double*> [#uses=1]
  %1 = icmp eq double* %__i.04, %__last           ; <i1> [#uses=1]
  br i1 %1, label %return, label %bb.nph

bb.nph:                                           ; preds = %bb5.preheader
  %2 = ptrtoint double* %__first to i32           ; <i32> [#uses=1]
  %3 = bitcast double* %__first to i8*            ; <i8*> [#uses=1]
  br label %bb1

bb1:                                              ; preds = %bb5.backedge, %bb.nph
  %4 = phi i32 [ 0, %bb.nph ], [ %tmp9, %bb5.backedge ] ; <i32> [#uses=5]
  %tmp9 = add i32 %4, 1                           ; <i32> [#uses=3]
  %tmp6 = add i32 %4, -1                          ; <i32> [#uses=1]
  %tmp13 = add i32 %4, 2                          ; <i32> [#uses=2]
  %__i.0 = getelementptr double* %__first, i32 %tmp13 ; <double*> [#uses=1]
  %__i.05 = getelementptr double* %__first, i32 %tmp9 ; <double*> [#uses=3]
  %5 = load double* %__i.05, align 8              ; <double> [#uses=5]
  %6 = load double* %__first, align 8             ; <double> [#uses=1]
  %7 = fcmp olt double %5, %6                     ; <i1> [#uses=1]
  br i1 %7, label %bb2, label %bb3

bb2:                                              ; preds = %bb1
  %8 = ptrtoint double* %__i.05 to i32            ; <i32> [#uses=1]
  %9 = sub i32 %8, %2                             ; <i32> [#uses=2]
  %10 = ashr i32 %9, 3                            ; <i32> [#uses=1]
  %11 = and i32 %9, -8                            ; <i32> [#uses=1]
  %__i.0.sum = sub i32 %tmp13, %10                ; <i32> [#uses=1]
  %scevgep = getelementptr double* %__first, i32 %__i.0.sum ; <double*> [#uses=1]
  %scevgep15 = bitcast double* %scevgep to i8*    ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %scevgep15, i8* %3, i32 %11, i32 8) nounwind
  store double %5, double* %__first, align 8
  br label %bb5.backedge

bb3:                                              ; preds = %bb1
  %__first.pn3 = getelementptr double* %__first, i32 %4 ; <double*> [#uses=1]
  %12 = load double* %__first.pn3, align 8        ; <double> [#uses=1]
  %13 = fcmp olt double %5, %12                   ; <i1> [#uses=1]
  br i1 %13, label %bb.i, label %_ZSt25__unguarded_linear_insertIPddPFbddEEvT_T0_T1_.exit

bb.i:                                             ; preds = %bb.i, %bb3
  %indvar.i = phi i32 [ %indvar.next.i, %bb.i ], [ 0, %bb3 ] ; <i32> [#uses=4]
  %tmp7 = sub i32 %tmp6, %indvar.i                ; <i32> [#uses=1]
  %__next.0.i = getelementptr double* %__first, i32 %tmp7 ; <double*> [#uses=1]
  %tmp8 = sub i32 %4, %indvar.i                   ; <i32> [#uses=1]
  %__next.04.i = getelementptr double* %__first, i32 %tmp8 ; <double*> [#uses=2]
  %tmp10 = sub i32 %tmp9, %indvar.i               ; <i32> [#uses=1]
  %__last_addr.02.i = getelementptr double* %__first, i32 %tmp10 ; <double*> [#uses=1]
  %14 = load double* %__next.04.i, align 8        ; <double> [#uses=1]
  store double %14, double* %__last_addr.02.i, align 8
  %15 = load double* %__next.0.i, align 8         ; <double> [#uses=1]
  %16 = fcmp olt double %5, %15                   ; <i1> [#uses=1]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br i1 %16, label %bb.i, label %_ZSt25__unguarded_linear_insertIPddPFbddEEvT_T0_T1_.exit

_ZSt25__unguarded_linear_insertIPddPFbddEEvT_T0_T1_.exit: ; preds = %bb.i, %bb3
  %__last_addr.0.lcssa.i = phi double* [ %__i.05, %bb3 ], [ %__next.04.i, %bb.i ] ; <double*> [#uses=1]
  store double %5, double* %__last_addr.0.lcssa.i, align 8
  br label %bb5.backedge

bb5.backedge:                                     ; preds = %_ZSt25__unguarded_linear_insertIPddPFbddEEvT_T0_T1_.exit, %bb2
  %17 = icmp eq double* %__i.0, %__last           ; <i1> [#uses=1]
  br i1 %17, label %return, label %bb1

return:                                           ; preds = %bb5.backedge, %bb5.preheader, %entry
  ret void
}

declare i32 @printf(i8* noalias nocapture, ...) nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) {
entry:
  %0 = icmp sgt i32 %argc, 1                      ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb2

bb:                                               ; preds = %entry
  %1 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %2 = load i8** %1, align 4                      ; <i8*> [#uses=1]
  %3 = call i32 @atoi(i8* %2) nounwind readonly   ; <i32> [#uses=1]
  br label %bb2

bb2:                                              ; preds = %bb, %entry
  %iftmp.86.0 = phi i32 [ %3, %bb ], [ 300, %entry ] ; <i32> [#uses=14]
  %4 = icmp sgt i32 %argc, 2                      ; <i1> [#uses=1]
  br i1 %4, label %bb3, label %bb5

bb3:                                              ; preds = %bb2
  %5 = getelementptr inbounds i8** %argv, i32 2   ; <i8**> [#uses=1]
  %6 = load i8** %5, align 4                      ; <i8*> [#uses=1]
  %7 = call i32 @atoi(i8* %6) nounwind readonly   ; <i32> [#uses=1]
  br label %bb5

bb5:                                              ; preds = %bb3, %bb2
  %iftmp.87.0 = phi i32 [ %7, %bb3 ], [ 10000, %bb2 ] ; <i32> [#uses=31]
  %8 = add nsw i32 %iftmp.87.0, 123               ; <i32> [#uses=1]
  call void @srand(i32 %8) nounwind
  %9 = shl i32 %iftmp.87.0, 3                     ; <i32> [#uses=2]
  %10 = call i8* @_Znaj(i32 %9)                   ; <i8*> [#uses=18]
  %11 = bitcast i8* %10 to double*                ; <double*> [#uses=1]
  %12 = icmp sgt i32 %iftmp.87.0, 0               ; <i1> [#uses=1]
  br i1 %12, label %bb6, label %bb8

bb6:                                              ; preds = %bb6, %bb5
  %n.0219 = phi i32 [ %15, %bb6 ], [ 0, %bb5 ]    ; <i32> [#uses=2]
  %tmp335 = shl i32 %n.0219, 3                    ; <i32> [#uses=1]
  %scevgep336 = getelementptr i8* %10, i32 %tmp335 ; <i8*> [#uses=1]
  %scevgep336337 = bitcast i8* %scevgep336 to double* ; <double*> [#uses=1]
  %13 = call i32 @rand() nounwind                 ; <i32> [#uses=1]
  %14 = sitofp i32 %13 to double                  ; <double> [#uses=1]
  store double %14, double* %scevgep336337, align 4
  %15 = add nsw i32 %n.0219, 1                    ; <i32> [#uses=2]
  %exitcond334 = icmp eq i32 %15, %iftmp.87.0     ; <i1> [#uses=1]
  br i1 %exitcond334, label %bb8, label %bb6

bb8:                                              ; preds = %bb6, %bb5
  %16 = call i8* @_Znaj(i32 %9)                   ; <i8*> [#uses=53]
  %17 = bitcast i8* %16 to double*                ; <double*> [#uses=109]
  %18 = icmp sgt i32 %iftmp.86.0, 0               ; <i1> [#uses=13]
  br i1 %18, label %bb.nph218, label %bb47

bb.nph218:                                        ; preds = %bb8
  %19 = getelementptr inbounds double* %11, i32 %iftmp.87.0 ; <double*> [#uses=1]
  %20 = ptrtoint double* %19 to i32               ; <i32> [#uses=1]
  %21 = ptrtoint i8* %10 to i32                   ; <i32> [#uses=1]
  %22 = sub i32 %20, %21                          ; <i32> [#uses=13]
  br label %bb9

bb9:                                              ; preds = %_Z13verify_sortedIPdEvT_S1_.exit20, %bb.nph218
  %i.0217 = phi i32 [ 0, %bb.nph218 ], [ %28, %_Z13verify_sortedIPdEvT_S1_.exit20 ] ; <i32> [#uses=1]
  call void @llvm.memmove.i32(i8* %16, i8* %10, i32 %22, i32 8) nounwind
  call void @qsort(i8* %16, i32 %iftmp.87.0, i32 8, i32 (i8*, i8*)* @_Z19less_than_function1PKvS0_)
  br label %bb2.i18

bb.i13:                                           ; preds = %bb2.i18
  %tmp328 = add i32 %tmp327, 8                    ; <i32> [#uses=1]
  %scevgep329 = getelementptr i8* %16, i32 %tmp328 ; <i8*> [#uses=1]
  %first_addr.0.i17 = bitcast i8* %scevgep329 to double* ; <double*> [#uses=1]
  %scevgep331 = getelementptr i8* %16, i32 %tmp327 ; <i8*> [#uses=1]
  %prev.0.i12 = bitcast i8* %scevgep331 to double* ; <double*> [#uses=1]
  %23 = load double* %first_addr.0.i17, align 8   ; <double> [#uses=1]
  %24 = load double* %prev.0.i12, align 8         ; <double> [#uses=1]
  %25 = fcmp olt double %23, %24                  ; <i1> [#uses=1]
  br i1 %25, label %bb1.i14, label %bb2.i18

bb1.i14:                                          ; preds = %bb.i13
  %26 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIPdEvT_S1_.exit20

bb2.i18:                                          ; preds = %bb.i13, %bb9
  %indvar.i15 = phi i32 [ 0, %bb9 ], [ %tmp.i16, %bb.i13 ] ; <i32> [#uses=2]
  %tmp.i16 = add i32 %indvar.i15, 1               ; <i32> [#uses=2]
  %tmp327 = shl i32 %indvar.i15, 3                ; <i32> [#uses=2]
  %27 = icmp eq i32 %tmp.i16, %iftmp.87.0         ; <i1> [#uses=1]
  br i1 %27, label %_Z13verify_sortedIPdEvT_S1_.exit20, label %bb.i13

_Z13verify_sortedIPdEvT_S1_.exit20:               ; preds = %bb2.i18, %bb1.i14
  %28 = add nsw i32 %i.0217, 1                    ; <i32> [#uses=2]
  %exitcond333 = icmp eq i32 %28, %iftmp.86.0     ; <i1> [#uses=1]
  br i1 %exitcond333, label %bb13.loopexit, label %bb9

bb.nph216:                                        ; preds = %bb13.loopexit
  %29 = getelementptr inbounds double* %17, i32 %iftmp.87.0 ; <double*> [#uses=17]
  %30 = ptrtoint double* %29 to i32               ; <i32> [#uses=1]
  %31 = ptrtoint i8* %16 to i32                   ; <i32> [#uses=9]
  %32 = sub i32 %30, %31                          ; <i32> [#uses=3]
  %33 = icmp sgt i32 %32, 15                      ; <i1> [#uses=2]
  br label %bb12

bb12:                                             ; preds = %_Z13verify_sortedIPdEvT_S1_.exit129, %bb.nph216
  %i.1215 = phi i32 [ 0, %bb.nph216 ], [ %49, %_Z13verify_sortedIPdEvT_S1_.exit129 ] ; <i32> [#uses=1]
  call void @llvm.memmove.i32(i8* %16, i8* %10, i32 %22, i32 8) nounwind
  br i1 %33, label %bb.i83, label %bb2.i127

bb.i83:                                           ; preds = %bb12
  %34 = load double* %17, align 8                 ; <double> [#uses=5]
  br label %bb1.outer.i

bb1.outer.i:                                      ; preds = %bb7.i, %bb.i83
  %.rle341 = phi double [ %36, %bb7.i ], [ %34, %bb.i83 ] ; <double> [#uses=1]
  %35 = phi double [ %36, %bb7.i ], [ %34, %bb.i83 ] ; <double> [#uses=1]
  %right.0.ph.i = phi double* [ %29, %bb.i83 ], [ %scevgep10.i, %bb7.i ] ; <double*> [#uses=2]
  %left.1.ph.i = phi double* [ %17, %bb.i83 ], [ %left.0.lcssa.i, %bb7.i ] ; <double*> [#uses=3]
  br label %bb1.i84

bb1.i84:                                          ; preds = %bb1.i84, %bb1.outer.i
  %indvar5.i = phi i32 [ 0, %bb1.outer.i ], [ %indvar.next6.i, %bb1.i84 ] ; <i32> [#uses=3]
  %tmp315 = xor i32 %indvar5.i, -1                ; <i32> [#uses=1]
  %scevgep10.i = getelementptr double* %right.0.ph.i, i32 %tmp315 ; <double*> [#uses=5]
  %36 = load double* %scevgep10.i, align 8        ; <double> [#uses=4]
  %37 = fcmp olt double %34, %36                  ; <i1> [#uses=1]
  %indvar.next6.i = add i32 %indvar5.i, 1         ; <i32> [#uses=1]
  br i1 %37, label %bb1.i84, label %bb2.i85

bb2.i85:                                          ; preds = %bb1.i84
  %38 = icmp ult double* %left.1.ph.i, %scevgep10.i ; <i1> [#uses=1]
  br i1 %38, label %bb4.preheader.i, label %bb8.i

bb4.preheader.i:                                  ; preds = %bb2.i85
  %39 = fcmp olt double %35, %34                  ; <i1> [#uses=1]
  br i1 %39, label %bb3.i, label %bb6.i

bb3.i:                                            ; preds = %bb3.i, %bb4.preheader.i
  %indvar.i86 = phi i32 [ %tmp312, %bb3.i ], [ 0, %bb4.preheader.i ] ; <i32> [#uses=1]
  %tmp312 = add i32 %indvar.i86, 1                ; <i32> [#uses=2]
  %scevgep.i = getelementptr double* %left.1.ph.i, i32 %tmp312 ; <double*> [#uses=2]
  %40 = load double* %scevgep.i, align 8          ; <double> [#uses=2]
  %41 = fcmp olt double %40, %34                  ; <i1> [#uses=1]
  br i1 %41, label %bb3.i, label %bb6.i

bb6.i:                                            ; preds = %bb3.i, %bb4.preheader.i
  %42 = phi double [ %.rle341, %bb4.preheader.i ], [ %40, %bb3.i ] ; <double> [#uses=1]
  %left.0.lcssa.i = phi double* [ %left.1.ph.i, %bb4.preheader.i ], [ %scevgep.i, %bb3.i ] ; <double*> [#uses=3]
  %43 = icmp ult double* %left.0.lcssa.i, %scevgep10.i ; <i1> [#uses=1]
  br i1 %43, label %bb7.i, label %bb8.i

bb7.i:                                            ; preds = %bb6.i
  store double %42, double* %scevgep10.i, align 8
  store double %36, double* %left.0.lcssa.i, align 8
  br label %bb1.outer.i

bb8.i:                                            ; preds = %bb6.i, %bb2.i85
  %tmp314 = sub i32 0, %indvar5.i                 ; <i32> [#uses=1]
  %right.0.i = getelementptr double* %right.0.ph.i, i32 %tmp314 ; <double*> [#uses=2]
  call fastcc void @_Z9quicksortIPdPFbddEEvT_S3_T0_(double* %17, double* %right.0.i)
  call fastcc void @_Z9quicksortIPdPFbddEEvT_S3_T0_(double* %right.0.i, double* %29)
  br label %bb2.i127

bb.i122:                                          ; preds = %bb2.i127
  %tmp320 = add i32 %tmp319, 8                    ; <i32> [#uses=1]
  %scevgep321 = getelementptr i8* %16, i32 %tmp320 ; <i8*> [#uses=1]
  %first_addr.0.i126 = bitcast i8* %scevgep321 to double* ; <double*> [#uses=1]
  %scevgep323 = getelementptr i8* %16, i32 %tmp319 ; <i8*> [#uses=1]
  %prev.0.i121 = bitcast i8* %scevgep323 to double* ; <double*> [#uses=1]
  %44 = load double* %first_addr.0.i126, align 8  ; <double> [#uses=1]
  %45 = load double* %prev.0.i121, align 8        ; <double> [#uses=1]
  %46 = fcmp olt double %44, %45                  ; <i1> [#uses=1]
  br i1 %46, label %bb1.i123, label %bb2.i127

bb1.i123:                                         ; preds = %bb.i122
  %47 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIPdEvT_S1_.exit129

bb2.i127:                                         ; preds = %bb.i122, %bb8.i, %bb12
  %indvar.i124 = phi i32 [ %tmp.i125, %bb.i122 ], [ 0, %bb12 ], [ 0, %bb8.i ] ; <i32> [#uses=2]
  %tmp.i125 = add i32 %indvar.i124, 1             ; <i32> [#uses=2]
  %tmp319 = shl i32 %indvar.i124, 3               ; <i32> [#uses=2]
  %48 = icmp eq i32 %tmp.i125, %iftmp.87.0        ; <i1> [#uses=1]
  br i1 %48, label %_Z13verify_sortedIPdEvT_S1_.exit129, label %bb.i122

_Z13verify_sortedIPdEvT_S1_.exit129:              ; preds = %bb2.i127, %bb1.i123
  %49 = add nsw i32 %i.1215, 1                    ; <i32> [#uses=2]
  %exitcond325 = icmp eq i32 %49, %iftmp.86.0     ; <i1> [#uses=1]
  br i1 %exitcond325, label %bb16.loopexit, label %bb12

bb13.loopexit:                                    ; preds = %_Z13verify_sortedIPdEvT_S1_.exit20
  br i1 %18, label %bb.nph216, label %bb47

bb15:                                             ; preds = %bb16.loopexit, %_Z13verify_sortedIPdEvT_S1_.exit189
  %i.2213 = phi i32 [ %55, %_Z13verify_sortedIPdEvT_S1_.exit189 ], [ 0, %bb16.loopexit ] ; <i32> [#uses=1]
  call void @llvm.memmove.i32(i8* %16, i8* %10, i32 %22, i32 8) nounwind
  call fastcc void @_Z9quicksortIPdPFbddEEvT_S3_T0_(double* %17, double* %29)
  br label %bb2.i187

bb.i182:                                          ; preds = %bb2.i187
  %tmp306 = add i32 %tmp305, 8                    ; <i32> [#uses=1]
  %scevgep307 = getelementptr i8* %16, i32 %tmp306 ; <i8*> [#uses=1]
  %first_addr.0.i186 = bitcast i8* %scevgep307 to double* ; <double*> [#uses=1]
  %scevgep309 = getelementptr i8* %16, i32 %tmp305 ; <i8*> [#uses=1]
  %prev.0.i181 = bitcast i8* %scevgep309 to double* ; <double*> [#uses=1]
  %50 = load double* %first_addr.0.i186, align 8  ; <double> [#uses=1]
  %51 = load double* %prev.0.i181, align 8        ; <double> [#uses=1]
  %52 = fcmp olt double %50, %51                  ; <i1> [#uses=1]
  br i1 %52, label %bb1.i183, label %bb2.i187

bb1.i183:                                         ; preds = %bb.i182
  %53 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIPdEvT_S1_.exit189

bb2.i187:                                         ; preds = %bb.i182, %bb15
  %indvar.i184 = phi i32 [ 0, %bb15 ], [ %tmp.i185, %bb.i182 ] ; <i32> [#uses=2]
  %tmp.i185 = add i32 %indvar.i184, 1             ; <i32> [#uses=2]
  %tmp305 = shl i32 %indvar.i184, 3               ; <i32> [#uses=2]
  %54 = icmp eq i32 %tmp.i185, %iftmp.87.0        ; <i1> [#uses=1]
  br i1 %54, label %_Z13verify_sortedIPdEvT_S1_.exit189, label %bb.i182

_Z13verify_sortedIPdEvT_S1_.exit189:              ; preds = %bb2.i187, %bb1.i183
  %55 = add nsw i32 %i.2213, 1                    ; <i32> [#uses=2]
  %exitcond311 = icmp eq i32 %55, %iftmp.86.0     ; <i1> [#uses=1]
  br i1 %exitcond311, label %bb19.loopexit, label %bb15

bb16.loopexit:                                    ; preds = %_Z13verify_sortedIPdEvT_S1_.exit129
  br i1 %18, label %bb15, label %bb47

bb18:                                             ; preds = %bb19.loopexit, %_Z13verify_sortedIPdEvT_S1_.exit158
  %i.3211 = phi i32 [ %71, %_Z13verify_sortedIPdEvT_S1_.exit158 ], [ 0, %bb19.loopexit ] ; <i32> [#uses=1]
  call void @llvm.memmove.i32(i8* %16, i8* %10, i32 %22, i32 8) nounwind
  br i1 %33, label %bb.i159, label %bb2.i156

bb.i159:                                          ; preds = %bb18
  %56 = load double* %17, align 8                 ; <double> [#uses=5]
  br label %bb1.outer.i162

bb1.outer.i162:                                   ; preds = %bb7.i178, %bb.i159
  %.rle14.i = phi double [ %58, %bb7.i178 ], [ %56, %bb.i159 ] ; <double> [#uses=1]
  %57 = phi double [ %58, %bb7.i178 ], [ %56, %bb.i159 ] ; <double> [#uses=1]
  %right.0.ph.i160 = phi double* [ %29, %bb.i159 ], [ %scevgep10.i167, %bb7.i178 ] ; <double*> [#uses=2]
  %left.1.ph.i161 = phi double* [ %17, %bb.i159 ], [ %left.0.lcssa.i176, %bb7.i178 ] ; <double*> [#uses=3]
  br label %bb1.i169

bb1.i169:                                         ; preds = %bb1.i169, %bb1.outer.i162
  %indvar5.i163 = phi i32 [ 0, %bb1.outer.i162 ], [ %indvar.next6.i168, %bb1.i169 ] ; <i32> [#uses=3]
  %tmp293 = xor i32 %indvar5.i163, -1             ; <i32> [#uses=1]
  %scevgep10.i167 = getelementptr double* %right.0.ph.i160, i32 %tmp293 ; <double*> [#uses=5]
  %58 = load double* %scevgep10.i167, align 8     ; <double> [#uses=4]
  %59 = fcmp olt double %56, %58                  ; <i1> [#uses=1]
  %indvar.next6.i168 = add i32 %indvar5.i163, 1   ; <i32> [#uses=1]
  br i1 %59, label %bb1.i169, label %bb2.i170

bb2.i170:                                         ; preds = %bb1.i169
  %60 = icmp ult double* %left.1.ph.i161, %scevgep10.i167 ; <i1> [#uses=1]
  br i1 %60, label %bb4.preheader.i171, label %bb8.i179

bb4.preheader.i171:                               ; preds = %bb2.i170
  %61 = fcmp olt double %57, %56                  ; <i1> [#uses=1]
  br i1 %61, label %bb3.i175, label %bb6.i177

bb3.i175:                                         ; preds = %bb3.i175, %bb4.preheader.i171
  %indvar.i172 = phi i32 [ %tmp289, %bb3.i175 ], [ 0, %bb4.preheader.i171 ] ; <i32> [#uses=1]
  %tmp289 = add i32 %indvar.i172, 1               ; <i32> [#uses=2]
  %scevgep.i174 = getelementptr double* %left.1.ph.i161, i32 %tmp289 ; <double*> [#uses=2]
  %62 = load double* %scevgep.i174, align 8       ; <double> [#uses=2]
  %63 = fcmp olt double %62, %56                  ; <i1> [#uses=1]
  br i1 %63, label %bb3.i175, label %bb6.i177

bb6.i177:                                         ; preds = %bb3.i175, %bb4.preheader.i171
  %64 = phi double [ %.rle14.i, %bb4.preheader.i171 ], [ %62, %bb3.i175 ] ; <double> [#uses=1]
  %left.0.lcssa.i176 = phi double* [ %left.1.ph.i161, %bb4.preheader.i171 ], [ %scevgep.i174, %bb3.i175 ] ; <double*> [#uses=3]
  %65 = icmp ult double* %left.0.lcssa.i176, %scevgep10.i167 ; <i1> [#uses=1]
  br i1 %65, label %bb7.i178, label %bb8.i179

bb7.i178:                                         ; preds = %bb6.i177
  store double %64, double* %scevgep10.i167, align 8
  store double %58, double* %left.0.lcssa.i176, align 8
  br label %bb1.outer.i162

bb8.i179:                                         ; preds = %bb6.i177, %bb2.i170
  %tmp292 = sub i32 0, %indvar5.i163              ; <i32> [#uses=1]
  %right.0.i165 = getelementptr double* %right.0.ph.i160, i32 %tmp292 ; <double*> [#uses=2]
  call fastcc void @_Z9quicksortIPdPFbddEEvT_S3_T0_(double* %17, double* %right.0.i165)
  call fastcc void @_Z9quicksortIPdPFbddEEvT_S3_T0_(double* %right.0.i165, double* %29)
  br label %bb2.i156

bb.i151:                                          ; preds = %bb2.i156
  %tmp298 = add i32 %tmp297, 8                    ; <i32> [#uses=1]
  %scevgep299 = getelementptr i8* %16, i32 %tmp298 ; <i8*> [#uses=1]
  %first_addr.0.i155 = bitcast i8* %scevgep299 to double* ; <double*> [#uses=1]
  %scevgep301 = getelementptr i8* %16, i32 %tmp297 ; <i8*> [#uses=1]
  %prev.0.i150 = bitcast i8* %scevgep301 to double* ; <double*> [#uses=1]
  %66 = load double* %first_addr.0.i155, align 8  ; <double> [#uses=1]
  %67 = load double* %prev.0.i150, align 8        ; <double> [#uses=1]
  %68 = fcmp olt double %66, %67                  ; <i1> [#uses=1]
  br i1 %68, label %bb1.i152, label %bb2.i156

bb1.i152:                                         ; preds = %bb.i151
  %69 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIPdEvT_S1_.exit158

bb2.i156:                                         ; preds = %bb.i151, %bb8.i179, %bb18
  %indvar.i153 = phi i32 [ %tmp.i154, %bb.i151 ], [ 0, %bb18 ], [ 0, %bb8.i179 ] ; <i32> [#uses=2]
  %tmp.i154 = add i32 %indvar.i153, 1             ; <i32> [#uses=2]
  %tmp297 = shl i32 %indvar.i153, 3               ; <i32> [#uses=2]
  %70 = icmp eq i32 %tmp.i154, %iftmp.87.0        ; <i1> [#uses=1]
  br i1 %70, label %_Z13verify_sortedIPdEvT_S1_.exit158, label %bb.i151

_Z13verify_sortedIPdEvT_S1_.exit158:              ; preds = %bb2.i156, %bb1.i152
  %71 = add nsw i32 %i.3211, 1                    ; <i32> [#uses=2]
  %exitcond303 = icmp eq i32 %71, %iftmp.86.0     ; <i1> [#uses=1]
  br i1 %exitcond303, label %bb22.loopexit, label %bb18

bb19.loopexit:                                    ; preds = %_Z13verify_sortedIPdEvT_S1_.exit189
  br i1 %18, label %bb18, label %bb47

bb.nph209:                                        ; preds = %bb22.loopexit
  %72 = icmp eq double* %17, %29                  ; <i1> [#uses=9]
  %73 = ashr i32 %32, 3                           ; <i32> [#uses=6]
  %74 = icmp eq i32 %73, 1                        ; <i1> [#uses=5]
  %75 = icmp sgt i32 %32, 135                     ; <i1> [#uses=5]
  %76 = getelementptr inbounds i8* %16, i32 128   ; <i8*> [#uses=1]
  %77 = bitcast i8* %76 to double*                ; <double*> [#uses=1]
  %78 = icmp eq i32 %iftmp.87.0, 16               ; <i1> [#uses=5]
  br label %bb21

bb21:                                             ; preds = %_Z13verify_sortedIPdEvT_S1_.exit138, %bb.nph209
  %i.4208 = phi i32 [ 0, %bb.nph209 ], [ %95, %_Z13verify_sortedIPdEvT_S1_.exit138 ] ; <i32> [#uses=1]
  call void @llvm.memmove.i32(i8* %16, i8* %10, i32 %22, i32 8) nounwind
  br i1 %72, label %bb2.i136, label %bb.i139

bb.i139:                                          ; preds = %bb21
  br i1 %74, label %_ZSt4__lgIiET_S0_.exit.i148, label %bb.i.i143

bb.i.i143:                                        ; preds = %bb.i.i143, %bb.i139
  %__n_addr.02.i.i140 = phi i32 [ %81, %bb.i.i143 ], [ %73, %bb.i139 ] ; <i32> [#uses=1]
  %79 = phi i32 [ %80, %bb.i.i143 ], [ 0, %bb.i139 ] ; <i32> [#uses=2]
  %80 = add i32 %79, 1                            ; <i32> [#uses=1]
  %81 = ashr i32 %__n_addr.02.i.i140, 1           ; <i32> [#uses=2]
  %phitmp.i.i142 = icmp eq i32 %81, 1             ; <i1> [#uses=1]
  br i1 %phitmp.i.i142, label %_ZSt4__lgIiET_S0_.exit.loopexit.i146, label %bb.i.i143

_ZSt4__lgIiET_S0_.exit.loopexit.i146:             ; preds = %bb.i.i143
  %tmp.i.i144 = shl i32 %79, 1                    ; <i32> [#uses=1]
  %phitmp.i145 = add i32 %tmp.i.i144, 2           ; <i32> [#uses=1]
  br label %_ZSt4__lgIiET_S0_.exit.i148

_ZSt4__lgIiET_S0_.exit.i148:                      ; preds = %_ZSt4__lgIiET_S0_.exit.loopexit.i146, %bb.i139
  %__k.0.lcssa.i.i147 = phi i32 [ %phitmp.i145, %_ZSt4__lgIiET_S0_.exit.loopexit.i146 ], [ 0, %bb.i139 ] ; <i32> [#uses=1]
  call fastcc void @_ZSt16__introsort_loopIPdiPFbddEEvT_S3_T0_T1_(double* %17, double* %29, i32 %__k.0.lcssa.i.i147)
  br i1 %75, label %bb.i32, label %bb1.i45

bb.i32:                                           ; preds = %_ZSt4__lgIiET_S0_.exit.i148
  call fastcc void @_ZSt16__insertion_sortIPdPFbddEEvT_S3_T0_(double* %17, double* %77) nounwind
  br i1 %78, label %bb2.i136, label %bb.i.i36

bb.i.i36:                                         ; preds = %_ZSt25__unguarded_linear_insertIPddPFbddEEvT_T0_T1_.exit.i.i, %bb.i32
  %82 = phi i32 [ %tmp9.i.i, %_ZSt25__unguarded_linear_insertIPddPFbddEEvT_T0_T1_.exit.i.i ], [ 0, %bb.i32 ] ; <i32> [#uses=5]
  %tmp12.i = add i32 %82, 16                      ; <i32> [#uses=2]
  %tmp10.i = add i32 %82, 14                      ; <i32> [#uses=1]
  %tmp8.i = add i32 %82, 15                       ; <i32> [#uses=2]
  %__next.03.i.i.i33 = getelementptr double* %17, i32 %tmp8.i ; <double*> [#uses=1]
  %tmp17.i = add i32 %82, 17                      ; <i32> [#uses=1]
  %__i.01.i.i35 = getelementptr double* %17, i32 %tmp12.i ; <double*> [#uses=2]
  %tmp9.i.i = add i32 %82, 1                      ; <i32> [#uses=1]
  %83 = load double* %__i.01.i.i35, align 8       ; <double> [#uses=3]
  %84 = load double* %__next.03.i.i.i33, align 8  ; <double> [#uses=1]
  %85 = fcmp olt double %83, %84                  ; <i1> [#uses=1]
  br i1 %85, label %bb.i.i.i42, label %_ZSt25__unguarded_linear_insertIPddPFbddEEvT_T0_T1_.exit.i.i

bb.i.i.i42:                                       ; preds = %bb.i.i.i42, %bb.i.i36
  %indvar.i.i.i37 = phi i32 [ %indvar.next.i.i.i41, %bb.i.i.i42 ], [ 0, %bb.i.i36 ] ; <i32> [#uses=4]
  %tmp9.i = sub i32 %tmp8.i, %indvar.i.i.i37      ; <i32> [#uses=1]
  %__next.04.i.i.i38 = getelementptr double* %17, i32 %tmp9.i ; <double*> [#uses=2]
  %tmp11.i = sub i32 %tmp10.i, %indvar.i.i.i37    ; <i32> [#uses=1]
  %__next.0.i.i.i39 = getelementptr double* %17, i32 %tmp11.i ; <double*> [#uses=1]
  %tmp13.i = sub i32 %tmp12.i, %indvar.i.i.i37    ; <i32> [#uses=1]
  %__last_addr.02.i.i.i40 = getelementptr double* %17, i32 %tmp13.i ; <double*> [#uses=1]
  %86 = load double* %__next.04.i.i.i38, align 8  ; <double> [#uses=1]
  store double %86, double* %__last_addr.02.i.i.i40, align 8
  %87 = load double* %__next.0.i.i.i39, align 8   ; <double> [#uses=1]
  %88 = fcmp olt double %83, %87                  ; <i1> [#uses=1]
  %indvar.next.i.i.i41 = add i32 %indvar.i.i.i37, 1 ; <i32> [#uses=1]
  br i1 %88, label %bb.i.i.i42, label %_ZSt25__unguarded_linear_insertIPddPFbddEEvT_T0_T1_.exit.i.i

_ZSt25__unguarded_linear_insertIPddPFbddEEvT_T0_T1_.exit.i.i: ; preds = %bb.i.i.i42, %bb.i.i36
  %__last_addr.0.lcssa.i.i.i43 = phi double* [ %__i.01.i.i35, %bb.i.i36 ], [ %__next.04.i.i.i38, %bb.i.i.i42 ] ; <double*> [#uses=1]
  store double %83, double* %__last_addr.0.lcssa.i.i.i43, align 8
  %89 = icmp eq i32 %tmp17.i, %iftmp.87.0         ; <i1> [#uses=1]
  br i1 %89, label %bb2.i136, label %bb.i.i36

bb1.i45:                                          ; preds = %_ZSt4__lgIiET_S0_.exit.i148
  call fastcc void @_ZSt16__insertion_sortIPdPFbddEEvT_S3_T0_(double* %17, double* %29) nounwind
  br label %bb2.i136

bb.i131:                                          ; preds = %bb2.i136
  %tmp283 = add i32 %tmp282, 8                    ; <i32> [#uses=1]
  %scevgep284 = getelementptr i8* %16, i32 %tmp283 ; <i8*> [#uses=1]
  %first_addr.0.i135 = bitcast i8* %scevgep284 to double* ; <double*> [#uses=1]
  %scevgep286 = getelementptr i8* %16, i32 %tmp282 ; <i8*> [#uses=1]
  %prev.0.i130 = bitcast i8* %scevgep286 to double* ; <double*> [#uses=1]
  %90 = load double* %first_addr.0.i135, align 8  ; <double> [#uses=1]
  %91 = load double* %prev.0.i130, align 8        ; <double> [#uses=1]
  %92 = fcmp olt double %90, %91                  ; <i1> [#uses=1]
  br i1 %92, label %bb1.i132, label %bb2.i136

bb1.i132:                                         ; preds = %bb.i131
  %93 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIPdEvT_S1_.exit138

bb2.i136:                                         ; preds = %bb.i131, %bb1.i45, %_ZSt25__unguarded_linear_insertIPddPFbddEEvT_T0_T1_.exit.i.i, %bb.i32, %bb21
  %indvar.i133 = phi i32 [ %tmp.i134, %bb.i131 ], [ 0, %bb1.i45 ], [ 0, %_ZSt25__unguarded_linear_insertIPddPFbddEEvT_T0_T1_.exit.i.i ], [ 0, %bb.i32 ], [ 0, %bb21 ] ; <i32> [#uses=2]
  %tmp.i134 = add i32 %indvar.i133, 1             ; <i32> [#uses=2]
  %tmp282 = shl i32 %indvar.i133, 3               ; <i32> [#uses=2]
  %94 = icmp eq i32 %tmp.i134, %iftmp.87.0        ; <i1> [#uses=1]
  br i1 %94, label %_Z13verify_sortedIPdEvT_S1_.exit138, label %bb.i131

_Z13verify_sortedIPdEvT_S1_.exit138:              ; preds = %bb2.i136, %bb1.i132
  %95 = add nsw i32 %i.4208, 1                    ; <i32> [#uses=2]
  %exitcond288 = icmp eq i32 %95, %iftmp.86.0     ; <i1> [#uses=1]
  br i1 %exitcond288, label %bb25.loopexit, label %bb21

bb22.loopexit:                                    ; preds = %_Z13verify_sortedIPdEvT_S1_.exit158
  br i1 %18, label %bb.nph209, label %bb47

bb24:                                             ; preds = %bb25.loopexit, %_Z13verify_sortedIPdEvT_S1_.exit120
  %i.5206 = phi i32 [ %101, %_Z13verify_sortedIPdEvT_S1_.exit120 ], [ 0, %bb25.loopexit ] ; <i32> [#uses=1]
  call void @llvm.memmove.i32(i8* %16, i8* %10, i32 %22, i32 8) nounwind
  call fastcc void @_Z9quicksortIPd17less_than_functorEvT_S2_T0_(double* %17, double* %29)
  br label %bb2.i118

bb.i113:                                          ; preds = %bb2.i118
  %tmp275 = add i32 %tmp274, 8                    ; <i32> [#uses=1]
  %scevgep276 = getelementptr i8* %16, i32 %tmp275 ; <i8*> [#uses=1]
  %first_addr.0.i117 = bitcast i8* %scevgep276 to double* ; <double*> [#uses=1]
  %scevgep278 = getelementptr i8* %16, i32 %tmp274 ; <i8*> [#uses=1]
  %prev.0.i112 = bitcast i8* %scevgep278 to double* ; <double*> [#uses=1]
  %96 = load double* %first_addr.0.i117, align 8  ; <double> [#uses=1]
  %97 = load double* %prev.0.i112, align 8        ; <double> [#uses=1]
  %98 = fcmp olt double %96, %97                  ; <i1> [#uses=1]
  br i1 %98, label %bb1.i114, label %bb2.i118

bb1.i114:                                         ; preds = %bb.i113
  %99 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIPdEvT_S1_.exit120

bb2.i118:                                         ; preds = %bb.i113, %bb24
  %indvar.i115 = phi i32 [ 0, %bb24 ], [ %tmp.i116, %bb.i113 ] ; <i32> [#uses=2]
  %tmp.i116 = add i32 %indvar.i115, 1             ; <i32> [#uses=2]
  %tmp274 = shl i32 %indvar.i115, 3               ; <i32> [#uses=2]
  %100 = icmp eq i32 %tmp.i116, %iftmp.87.0       ; <i1> [#uses=1]
  br i1 %100, label %_Z13verify_sortedIPdEvT_S1_.exit120, label %bb.i113

_Z13verify_sortedIPdEvT_S1_.exit120:              ; preds = %bb2.i118, %bb1.i114
  %101 = add nsw i32 %i.5206, 1                   ; <i32> [#uses=2]
  %exitcond280 = icmp eq i32 %101, %iftmp.86.0    ; <i1> [#uses=1]
  br i1 %exitcond280, label %bb28.loopexit, label %bb24

bb25.loopexit:                                    ; preds = %_Z13verify_sortedIPdEvT_S1_.exit138
  br i1 %18, label %bb24, label %bb47

bb.nph205:                                        ; preds = %bb28.loopexit
  %102 = icmp eq i32 %iftmp.87.0, 1               ; <i1> [#uses=4]
  br label %bb27

bb27:                                             ; preds = %_Z13verify_sortedIPdEvT_S1_.exit97, %bb.nph205
  %i.6204 = phi i32 [ 0, %bb.nph205 ], [ %146, %_Z13verify_sortedIPdEvT_S1_.exit97 ] ; <i32> [#uses=1]
  br i1 %72, label %bb2.i95, label %bb.i101

bb.i101:                                          ; preds = %bb27
  br i1 %74, label %_ZSt4__lgIiET_S0_.exit.i110, label %bb.i.i105

bb.i.i105:                                        ; preds = %bb.i.i105, %bb.i101
  %__n_addr.02.i.i102 = phi i32 [ %105, %bb.i.i105 ], [ %73, %bb.i101 ] ; <i32> [#uses=1]
  %103 = phi i32 [ %104, %bb.i.i105 ], [ 0, %bb.i101 ] ; <i32> [#uses=2]
  %104 = add i32 %103, 1                          ; <i32> [#uses=1]
  %105 = ashr i32 %__n_addr.02.i.i102, 1          ; <i32> [#uses=2]
  %phitmp.i.i104 = icmp eq i32 %105, 1            ; <i1> [#uses=1]
  br i1 %phitmp.i.i104, label %_ZSt4__lgIiET_S0_.exit.loopexit.i108, label %bb.i.i105

_ZSt4__lgIiET_S0_.exit.loopexit.i108:             ; preds = %bb.i.i105
  %tmp.i.i106 = shl i32 %103, 1                   ; <i32> [#uses=1]
  %phitmp.i107 = add i32 %tmp.i.i106, 2           ; <i32> [#uses=1]
  br label %_ZSt4__lgIiET_S0_.exit.i110

_ZSt4__lgIiET_S0_.exit.i110:                      ; preds = %_ZSt4__lgIiET_S0_.exit.loopexit.i108, %bb.i101
  %__k.0.lcssa.i.i109 = phi i32 [ %phitmp.i107, %_ZSt4__lgIiET_S0_.exit.loopexit.i108 ], [ 0, %bb.i101 ] ; <i32> [#uses=1]
  call fastcc void @_ZSt16__introsort_loopIPdi17less_than_functorEvT_S2_T0_T1_(double* %17, double* %29, i32 %__k.0.lcssa.i.i109) nounwind
  br i1 %75, label %bb1.i.i50, label %bb1.i89

bb1.i.i50:                                        ; preds = %bb5.backedge.i.i69, %_ZSt4__lgIiET_S0_.exit.i110
  %106 = phi i32 [ %tmp81.i47, %bb5.backedge.i.i69 ], [ 0, %_ZSt4__lgIiET_S0_.exit.i110 ] ; <i32> [#uses=5]
  %tmp81.i47 = add i32 %106, 1                    ; <i32> [#uses=4]
  %tmp79.i48 = add i32 %106, -1                   ; <i32> [#uses=1]
  %__i.08.i.i49 = getelementptr double* %17, i32 %tmp81.i47 ; <double*> [#uses=3]
  %107 = load double* %__i.08.i.i49, align 8      ; <double> [#uses=5]
  %108 = load double* %17, align 8                ; <double> [#uses=1]
  %109 = fcmp olt double %107, %108               ; <i1> [#uses=1]
  br i1 %109, label %bb2.i.i55, label %bb3.i.i57

bb2.i.i55:                                        ; preds = %bb1.i.i50
  %tmp86.i51 = add i32 %106, 2                    ; <i32> [#uses=1]
  %110 = ptrtoint double* %__i.08.i.i49 to i32    ; <i32> [#uses=1]
  %111 = sub i32 %110, %31                        ; <i32> [#uses=2]
  %112 = ashr i32 %111, 3                         ; <i32> [#uses=1]
  %113 = and i32 %111, -8                         ; <i32> [#uses=1]
  %__i.0.sum.i.i52 = sub i32 %tmp86.i51, %112     ; <i32> [#uses=1]
  %scevgep.i.i53 = getelementptr double* %17, i32 %__i.0.sum.i.i52 ; <double*> [#uses=1]
  %scevgep18.i.i54 = bitcast double* %scevgep.i.i53 to i8* ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %scevgep18.i.i54, i8* %16, i32 %113, i32 8) nounwind
  store double %107, double* %17, align 8
  br label %bb5.backedge.i.i69

bb3.i.i57:                                        ; preds = %bb1.i.i50
  %__first.pn6.i.i56 = getelementptr double* %17, i32 %106 ; <double*> [#uses=1]
  %114 = load double* %__first.pn6.i.i56, align 8 ; <double> [#uses=1]
  %115 = fcmp ogt double %114, %107               ; <i1> [#uses=1]
  br i1 %115, label %bb.i.i.i66, label %_ZSt25__unguarded_linear_insertIPdd17less_than_functorEvT_T0_T1_.exit.i.i

bb.i.i.i66:                                       ; preds = %bb.i.i.i66, %bb3.i.i57
  %indvar.i.i.i58 = phi i32 [ %indvar.next.i.i.i65, %bb.i.i.i66 ], [ 0, %bb3.i.i57 ] ; <i32> [#uses=4]
  %tmp80.i59 = sub i32 %tmp79.i48, %indvar.i.i.i58 ; <i32> [#uses=1]
  %__next.0.i.i.i60 = getelementptr double* %17, i32 %tmp80.i59 ; <double*> [#uses=1]
  %tmp82.i61 = sub i32 %tmp81.i47, %indvar.i.i.i58 ; <i32> [#uses=1]
  %__last_addr.02.i.i.i62 = getelementptr double* %17, i32 %tmp82.i61 ; <double*> [#uses=1]
  %tmp83.i63 = sub i32 %106, %indvar.i.i.i58      ; <i32> [#uses=1]
  %__next.04.i.i.i64 = getelementptr double* %17, i32 %tmp83.i63 ; <double*> [#uses=2]
  %116 = load double* %__next.04.i.i.i64, align 8 ; <double> [#uses=1]
  store double %116, double* %__last_addr.02.i.i.i62, align 8
  %117 = load double* %__next.0.i.i.i60, align 8  ; <double> [#uses=1]
  %118 = fcmp ogt double %117, %107               ; <i1> [#uses=1]
  %indvar.next.i.i.i65 = add i32 %indvar.i.i.i58, 1 ; <i32> [#uses=1]
  br i1 %118, label %bb.i.i.i66, label %_ZSt25__unguarded_linear_insertIPdd17less_than_functorEvT_T0_T1_.exit.i.i

_ZSt25__unguarded_linear_insertIPdd17less_than_functorEvT_T0_T1_.exit.i.i: ; preds = %bb.i.i.i66, %bb3.i.i57
  %__last_addr.0.lcssa.i.i.i67 = phi double* [ %__i.08.i.i49, %bb3.i.i57 ], [ %__next.04.i.i.i64, %bb.i.i.i66 ] ; <double*> [#uses=1]
  store double %107, double* %__last_addr.0.lcssa.i.i.i67, align 8
  br label %bb5.backedge.i.i69

bb5.backedge.i.i69:                               ; preds = %_ZSt25__unguarded_linear_insertIPdd17less_than_functorEvT_T0_T1_.exit.i.i, %bb2.i.i55
  %exitcond.i68 = icmp eq i32 %tmp81.i47, 15      ; <i1> [#uses=1]
  br i1 %exitcond.i68, label %_ZSt16__insertion_sortIPd17less_than_functorEvT_S2_T0_.exit.i, label %bb1.i.i50

_ZSt16__insertion_sortIPd17less_than_functorEvT_S2_T0_.exit.i: ; preds = %bb5.backedge.i.i69
  br i1 %78, label %bb2.i95, label %bb.i.i78

bb.i.i78:                                         ; preds = %_ZSt25__unguarded_linear_insertIPdd17less_than_functorEvT_T0_T1_.exit.i47.i, %_ZSt16__insertion_sortIPd17less_than_functorEvT_S2_T0_.exit.i
  %119 = phi i32 [ %tmp12.i37.i77, %_ZSt25__unguarded_linear_insertIPdd17less_than_functorEvT_T0_T1_.exit.i47.i ], [ 0, %_ZSt16__insertion_sortIPd17less_than_functorEvT_S2_T0_.exit.i ] ; <i32> [#uses=5]
  %tmp72.i70 = add i32 %119, 16                   ; <i32> [#uses=2]
  %tmp70.i71 = add i32 %119, 14                   ; <i32> [#uses=1]
  %tmp68.i72 = add i32 %119, 15                   ; <i32> [#uses=2]
  %__next.03.i.i.i73 = getelementptr double* %17, i32 %tmp68.i72 ; <double*> [#uses=1]
  %tmp77.i74 = add i32 %119, 17                   ; <i32> [#uses=1]
  %__i.04.i.i76 = getelementptr double* %17, i32 %tmp72.i70 ; <double*> [#uses=2]
  %tmp12.i37.i77 = add i32 %119, 1                ; <i32> [#uses=1]
  %120 = load double* %__i.04.i.i76, align 8      ; <double> [#uses=3]
  %121 = load double* %__next.03.i.i.i73, align 8 ; <double> [#uses=1]
  %122 = fcmp ogt double %121, %120               ; <i1> [#uses=1]
  br i1 %122, label %bb.i.i45.i87, label %_ZSt25__unguarded_linear_insertIPdd17less_than_functorEvT_T0_T1_.exit.i47.i

bb.i.i45.i87:                                     ; preds = %bb.i.i45.i87, %bb.i.i78
  %indvar.i.i39.i79 = phi i32 [ %indvar.next.i.i44.i86, %bb.i.i45.i87 ], [ 0, %bb.i.i78 ] ; <i32> [#uses=4]
  %tmp69.i80 = sub i32 %tmp68.i72, %indvar.i.i39.i79 ; <i32> [#uses=1]
  %__next.04.i.i40.i81 = getelementptr double* %17, i32 %tmp69.i80 ; <double*> [#uses=2]
  %tmp71.i82 = sub i32 %tmp70.i71, %indvar.i.i39.i79 ; <i32> [#uses=1]
  %__next.0.i.i41.i83 = getelementptr double* %17, i32 %tmp71.i82 ; <double*> [#uses=1]
  %tmp73.i84 = sub i32 %tmp72.i70, %indvar.i.i39.i79 ; <i32> [#uses=1]
  %__last_addr.02.i.i43.i85 = getelementptr double* %17, i32 %tmp73.i84 ; <double*> [#uses=1]
  %123 = load double* %__next.04.i.i40.i81, align 8 ; <double> [#uses=1]
  store double %123, double* %__last_addr.02.i.i43.i85, align 8
  %124 = load double* %__next.0.i.i41.i83, align 8 ; <double> [#uses=1]
  %125 = fcmp ogt double %124, %120               ; <i1> [#uses=1]
  %indvar.next.i.i44.i86 = add i32 %indvar.i.i39.i79, 1 ; <i32> [#uses=1]
  br i1 %125, label %bb.i.i45.i87, label %_ZSt25__unguarded_linear_insertIPdd17less_than_functorEvT_T0_T1_.exit.i47.i

_ZSt25__unguarded_linear_insertIPdd17less_than_functorEvT_T0_T1_.exit.i47.i: ; preds = %bb.i.i45.i87, %bb.i.i78
  %__last_addr.0.lcssa.i.i46.i88 = phi double* [ %__i.04.i.i76, %bb.i.i78 ], [ %__next.04.i.i40.i81, %bb.i.i45.i87 ] ; <double*> [#uses=1]
  store double %120, double* %__last_addr.0.lcssa.i.i46.i88, align 8
  %126 = icmp eq i32 %tmp77.i74, %iftmp.87.0      ; <i1> [#uses=1]
  br i1 %126, label %bb2.i95, label %bb.i.i78

bb1.i89:                                          ; preds = %_ZSt4__lgIiET_S0_.exit.i110
  %brmerge = or i1 %72, %102                      ; <i1> [#uses=1]
  br i1 %brmerge, label %bb2.i95, label %bb1.i14.i98

bb1.i14.i98:                                      ; preds = %bb5.backedge.i32.i115, %bb1.i89
  %127 = phi i32 [ %tmp59.i93, %bb5.backedge.i32.i115 ], [ 0, %bb1.i89 ] ; <i32> [#uses=5]
  %tmp59.i93 = add i32 %127, 1                    ; <i32> [#uses=3]
  %tmp57.i94 = add i32 %127, -1                   ; <i32> [#uses=1]
  %tmp64.i95 = add i32 %127, 2                    ; <i32> [#uses=2]
  %__i.08.i13.i97 = getelementptr double* %17, i32 %tmp59.i93 ; <double*> [#uses=3]
  %128 = load double* %__i.08.i13.i97, align 8    ; <double> [#uses=5]
  %129 = load double* %17, align 8                ; <double> [#uses=1]
  %130 = fcmp olt double %128, %129               ; <i1> [#uses=1]
  br i1 %130, label %bb2.i18.i102, label %bb3.i20.i104

bb2.i18.i102:                                     ; preds = %bb1.i14.i98
  %131 = ptrtoint double* %__i.08.i13.i97 to i32  ; <i32> [#uses=1]
  %132 = sub i32 %131, %31                        ; <i32> [#uses=2]
  %133 = ashr i32 %132, 3                         ; <i32> [#uses=1]
  %134 = and i32 %132, -8                         ; <i32> [#uses=1]
  %__i.0.sum.i15.i99 = sub i32 %tmp64.i95, %133   ; <i32> [#uses=1]
  %scevgep.i16.i100 = getelementptr double* %17, i32 %__i.0.sum.i15.i99 ; <double*> [#uses=1]
  %scevgep18.i17.i101 = bitcast double* %scevgep.i16.i100 to i8* ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %scevgep18.i17.i101, i8* %16, i32 %134, i32 8) nounwind
  store double %128, double* %17, align 8
  br label %bb5.backedge.i32.i115

bb3.i20.i104:                                     ; preds = %bb1.i14.i98
  %__first.pn6.i19.i103 = getelementptr double* %17, i32 %127 ; <double*> [#uses=1]
  %135 = load double* %__first.pn6.i19.i103, align 8 ; <double> [#uses=1]
  %136 = fcmp ogt double %135, %128               ; <i1> [#uses=1]
  br i1 %136, label %bb.i.i29.i113, label %_ZSt25__unguarded_linear_insertIPdd17less_than_functorEvT_T0_T1_.exit.i31.i

bb.i.i29.i113:                                    ; preds = %bb.i.i29.i113, %bb3.i20.i104
  %indvar.i.i21.i105 = phi i32 [ %indvar.next.i.i28.i112, %bb.i.i29.i113 ], [ 0, %bb3.i20.i104 ] ; <i32> [#uses=4]
  %tmp58.i106 = sub i32 %tmp57.i94, %indvar.i.i21.i105 ; <i32> [#uses=1]
  %__next.0.i.i23.i107 = getelementptr double* %17, i32 %tmp58.i106 ; <double*> [#uses=1]
  %tmp60.i108 = sub i32 %tmp59.i93, %indvar.i.i21.i105 ; <i32> [#uses=1]
  %__last_addr.02.i.i27.i109 = getelementptr double* %17, i32 %tmp60.i108 ; <double*> [#uses=1]
  %tmp61.i110 = sub i32 %127, %indvar.i.i21.i105  ; <i32> [#uses=1]
  %__next.04.i.i25.i111 = getelementptr double* %17, i32 %tmp61.i110 ; <double*> [#uses=2]
  %137 = load double* %__next.04.i.i25.i111, align 8 ; <double> [#uses=1]
  store double %137, double* %__last_addr.02.i.i27.i109, align 8
  %138 = load double* %__next.0.i.i23.i107, align 8 ; <double> [#uses=1]
  %139 = fcmp ogt double %138, %128               ; <i1> [#uses=1]
  %indvar.next.i.i28.i112 = add i32 %indvar.i.i21.i105, 1 ; <i32> [#uses=1]
  br i1 %139, label %bb.i.i29.i113, label %_ZSt25__unguarded_linear_insertIPdd17less_than_functorEvT_T0_T1_.exit.i31.i

_ZSt25__unguarded_linear_insertIPdd17less_than_functorEvT_T0_T1_.exit.i31.i: ; preds = %bb.i.i29.i113, %bb3.i20.i104
  %__last_addr.0.lcssa.i.i30.i114 = phi double* [ %__i.08.i13.i97, %bb3.i20.i104 ], [ %__next.04.i.i25.i111, %bb.i.i29.i113 ] ; <double*> [#uses=1]
  store double %128, double* %__last_addr.0.lcssa.i.i30.i114, align 8
  br label %bb5.backedge.i32.i115

bb5.backedge.i32.i115:                            ; preds = %_ZSt25__unguarded_linear_insertIPdd17less_than_functorEvT_T0_T1_.exit.i31.i, %bb2.i18.i102
  %140 = icmp eq i32 %tmp64.i95, %iftmp.87.0      ; <i1> [#uses=1]
  br i1 %140, label %bb2.i95, label %bb1.i14.i98

bb.i90:                                           ; preds = %bb2.i95
  %tmp267 = add i32 %tmp266, 8                    ; <i32> [#uses=1]
  %scevgep268 = getelementptr i8* %16, i32 %tmp267 ; <i8*> [#uses=1]
  %first_addr.0.i94 = bitcast i8* %scevgep268 to double* ; <double*> [#uses=1]
  %scevgep270 = getelementptr i8* %16, i32 %tmp266 ; <i8*> [#uses=1]
  %prev.0.i89 = bitcast i8* %scevgep270 to double* ; <double*> [#uses=1]
  %141 = load double* %first_addr.0.i94, align 8  ; <double> [#uses=1]
  %142 = load double* %prev.0.i89, align 8        ; <double> [#uses=1]
  %143 = fcmp olt double %141, %142               ; <i1> [#uses=1]
  br i1 %143, label %bb1.i91, label %bb2.i95

bb1.i91:                                          ; preds = %bb.i90
  %144 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIPdEvT_S1_.exit97

bb2.i95:                                          ; preds = %bb.i90, %bb5.backedge.i32.i115, %bb1.i89, %_ZSt25__unguarded_linear_insertIPdd17less_than_functorEvT_T0_T1_.exit.i47.i, %_ZSt16__insertion_sortIPd17less_than_functorEvT_S2_T0_.exit.i, %bb27
  %indvar.i92 = phi i32 [ %tmp.i93, %bb.i90 ], [ 0, %_ZSt25__unguarded_linear_insertIPdd17less_than_functorEvT_T0_T1_.exit.i47.i ], [ 0, %_ZSt16__insertion_sortIPd17less_than_functorEvT_S2_T0_.exit.i ], [ 0, %bb5.backedge.i32.i115 ], [ 0, %bb1.i89 ], [ 0, %bb27 ] ; <i32> [#uses=2]
  %tmp.i93 = add i32 %indvar.i92, 1               ; <i32> [#uses=2]
  %tmp266 = shl i32 %indvar.i92, 3                ; <i32> [#uses=2]
  %145 = icmp eq i32 %tmp.i93, %iftmp.87.0        ; <i1> [#uses=1]
  br i1 %145, label %_Z13verify_sortedIPdEvT_S1_.exit97, label %bb.i90

_Z13verify_sortedIPdEvT_S1_.exit97:               ; preds = %bb2.i95, %bb1.i91
  call void @llvm.memmove.i32(i8* %16, i8* %10, i32 %22, i32 8) nounwind
  %146 = add nsw i32 %i.6204, 1                   ; <i32> [#uses=2]
  %exitcond272 = icmp eq i32 %146, %iftmp.86.0    ; <i1> [#uses=1]
  br i1 %exitcond272, label %bb31.loopexit, label %bb27

bb28.loopexit:                                    ; preds = %_Z13verify_sortedIPdEvT_S1_.exit120
  br i1 %18, label %bb.nph205, label %bb47

bb30:                                             ; preds = %bb31.loopexit, %_Z13verify_sortedIPdEvT_S1_.exit82
  %i.7202 = phi i32 [ %152, %_Z13verify_sortedIPdEvT_S1_.exit82 ], [ 0, %bb31.loopexit ] ; <i32> [#uses=1]
  call void @llvm.memmove.i32(i8* %16, i8* %10, i32 %22, i32 8) nounwind
  call fastcc void @_Z9quicksortIPd24inline_less_than_functorEvT_S2_T0_(double* %17, double* %29)
  br label %bb2.i80

bb.i75:                                           ; preds = %bb2.i80
  %tmp259 = add i32 %tmp258, 8                    ; <i32> [#uses=1]
  %scevgep260 = getelementptr i8* %16, i32 %tmp259 ; <i8*> [#uses=1]
  %first_addr.0.i79 = bitcast i8* %scevgep260 to double* ; <double*> [#uses=1]
  %scevgep262 = getelementptr i8* %16, i32 %tmp258 ; <i8*> [#uses=1]
  %prev.0.i74 = bitcast i8* %scevgep262 to double* ; <double*> [#uses=1]
  %147 = load double* %first_addr.0.i79, align 8  ; <double> [#uses=1]
  %148 = load double* %prev.0.i74, align 8        ; <double> [#uses=1]
  %149 = fcmp olt double %147, %148               ; <i1> [#uses=1]
  br i1 %149, label %bb1.i76, label %bb2.i80

bb1.i76:                                          ; preds = %bb.i75
  %150 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIPdEvT_S1_.exit82

bb2.i80:                                          ; preds = %bb.i75, %bb30
  %indvar.i77 = phi i32 [ 0, %bb30 ], [ %tmp.i78, %bb.i75 ] ; <i32> [#uses=2]
  %tmp.i78 = add i32 %indvar.i77, 1               ; <i32> [#uses=2]
  %tmp258 = shl i32 %indvar.i77, 3                ; <i32> [#uses=2]
  %151 = icmp eq i32 %tmp.i78, %iftmp.87.0        ; <i1> [#uses=1]
  br i1 %151, label %_Z13verify_sortedIPdEvT_S1_.exit82, label %bb.i75

_Z13verify_sortedIPdEvT_S1_.exit82:               ; preds = %bb2.i80, %bb1.i76
  %152 = add nsw i32 %i.7202, 1                   ; <i32> [#uses=2]
  %exitcond264 = icmp eq i32 %152, %iftmp.86.0    ; <i1> [#uses=1]
  br i1 %exitcond264, label %bb34.loopexit, label %bb30

bb31.loopexit:                                    ; preds = %_Z13verify_sortedIPdEvT_S1_.exit97
  br i1 %18, label %bb30, label %bb47

bb33:                                             ; preds = %bb34.loopexit, %_Z13verify_sortedIPdEvT_S1_.exit59
  %i.8200 = phi i32 [ %196, %_Z13verify_sortedIPdEvT_S1_.exit59 ], [ 0, %bb34.loopexit ] ; <i32> [#uses=1]
  call void @llvm.memmove.i32(i8* %16, i8* %10, i32 %22, i32 8) nounwind
  br i1 %72, label %bb2.i57, label %bb.i63

bb.i63:                                           ; preds = %bb33
  br i1 %74, label %_ZSt4__lgIiET_S0_.exit.i72, label %bb.i.i67

bb.i.i67:                                         ; preds = %bb.i.i67, %bb.i63
  %__n_addr.02.i.i64 = phi i32 [ %155, %bb.i.i67 ], [ %73, %bb.i63 ] ; <i32> [#uses=1]
  %153 = phi i32 [ %154, %bb.i.i67 ], [ 0, %bb.i63 ] ; <i32> [#uses=2]
  %154 = add i32 %153, 1                          ; <i32> [#uses=1]
  %155 = ashr i32 %__n_addr.02.i.i64, 1           ; <i32> [#uses=2]
  %phitmp.i.i66 = icmp eq i32 %155, 1             ; <i1> [#uses=1]
  br i1 %phitmp.i.i66, label %_ZSt4__lgIiET_S0_.exit.loopexit.i70, label %bb.i.i67

_ZSt4__lgIiET_S0_.exit.loopexit.i70:              ; preds = %bb.i.i67
  %tmp.i.i68 = shl i32 %153, 1                    ; <i32> [#uses=1]
  %phitmp.i69 = add i32 %tmp.i.i68, 2             ; <i32> [#uses=1]
  br label %_ZSt4__lgIiET_S0_.exit.i72

_ZSt4__lgIiET_S0_.exit.i72:                       ; preds = %_ZSt4__lgIiET_S0_.exit.loopexit.i70, %bb.i63
  %__k.0.lcssa.i.i71 = phi i32 [ %phitmp.i69, %_ZSt4__lgIiET_S0_.exit.loopexit.i70 ], [ 0, %bb.i63 ] ; <i32> [#uses=1]
  call fastcc void @_ZSt16__introsort_loopIPdi24inline_less_than_functorEvT_S2_T0_T1_(double* %17, double* %29, i32 %__k.0.lcssa.i.i71) nounwind
  br i1 %75, label %bb1.i.i120, label %bb1.i159

bb1.i.i120:                                       ; preds = %bb5.backedge.i.i139, %_ZSt4__lgIiET_S0_.exit.i72
  %156 = phi i32 [ %tmp81.i117, %bb5.backedge.i.i139 ], [ 0, %_ZSt4__lgIiET_S0_.exit.i72 ] ; <i32> [#uses=5]
  %tmp81.i117 = add i32 %156, 1                   ; <i32> [#uses=4]
  %tmp79.i118 = add i32 %156, -1                  ; <i32> [#uses=1]
  %__i.08.i.i119 = getelementptr double* %17, i32 %tmp81.i117 ; <double*> [#uses=3]
  %157 = load double* %__i.08.i.i119, align 8     ; <double> [#uses=5]
  %158 = load double* %17, align 8                ; <double> [#uses=1]
  %159 = fcmp olt double %157, %158               ; <i1> [#uses=1]
  br i1 %159, label %bb2.i.i125, label %bb3.i.i127

bb2.i.i125:                                       ; preds = %bb1.i.i120
  %tmp86.i121 = add i32 %156, 2                   ; <i32> [#uses=1]
  %160 = ptrtoint double* %__i.08.i.i119 to i32   ; <i32> [#uses=1]
  %161 = sub i32 %160, %31                        ; <i32> [#uses=2]
  %162 = ashr i32 %161, 3                         ; <i32> [#uses=1]
  %163 = and i32 %161, -8                         ; <i32> [#uses=1]
  %__i.0.sum.i.i122 = sub i32 %tmp86.i121, %162   ; <i32> [#uses=1]
  %scevgep.i.i123 = getelementptr double* %17, i32 %__i.0.sum.i.i122 ; <double*> [#uses=1]
  %scevgep18.i.i124 = bitcast double* %scevgep.i.i123 to i8* ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %scevgep18.i.i124, i8* %16, i32 %163, i32 8) nounwind
  store double %157, double* %17, align 8
  br label %bb5.backedge.i.i139

bb3.i.i127:                                       ; preds = %bb1.i.i120
  %__first.pn6.i.i126 = getelementptr double* %17, i32 %156 ; <double*> [#uses=1]
  %164 = load double* %__first.pn6.i.i126, align 8 ; <double> [#uses=1]
  %165 = fcmp ogt double %164, %157               ; <i1> [#uses=1]
  br i1 %165, label %bb.i.i.i136, label %_ZSt25__unguarded_linear_insertIPdd24inline_less_than_functorEvT_T0_T1_.exit.i.i

bb.i.i.i136:                                      ; preds = %bb.i.i.i136, %bb3.i.i127
  %indvar.i.i.i128 = phi i32 [ %indvar.next.i.i.i135, %bb.i.i.i136 ], [ 0, %bb3.i.i127 ] ; <i32> [#uses=4]
  %tmp80.i129 = sub i32 %tmp79.i118, %indvar.i.i.i128 ; <i32> [#uses=1]
  %__next.0.i.i.i130 = getelementptr double* %17, i32 %tmp80.i129 ; <double*> [#uses=1]
  %tmp82.i131 = sub i32 %tmp81.i117, %indvar.i.i.i128 ; <i32> [#uses=1]
  %__last_addr.02.i.i.i132 = getelementptr double* %17, i32 %tmp82.i131 ; <double*> [#uses=1]
  %tmp83.i133 = sub i32 %156, %indvar.i.i.i128    ; <i32> [#uses=1]
  %__next.04.i.i.i134 = getelementptr double* %17, i32 %tmp83.i133 ; <double*> [#uses=2]
  %166 = load double* %__next.04.i.i.i134, align 8 ; <double> [#uses=1]
  store double %166, double* %__last_addr.02.i.i.i132, align 8
  %167 = load double* %__next.0.i.i.i130, align 8 ; <double> [#uses=1]
  %168 = fcmp ogt double %167, %157               ; <i1> [#uses=1]
  %indvar.next.i.i.i135 = add i32 %indvar.i.i.i128, 1 ; <i32> [#uses=1]
  br i1 %168, label %bb.i.i.i136, label %_ZSt25__unguarded_linear_insertIPdd24inline_less_than_functorEvT_T0_T1_.exit.i.i

_ZSt25__unguarded_linear_insertIPdd24inline_less_than_functorEvT_T0_T1_.exit.i.i: ; preds = %bb.i.i.i136, %bb3.i.i127
  %__last_addr.0.lcssa.i.i.i137 = phi double* [ %__i.08.i.i119, %bb3.i.i127 ], [ %__next.04.i.i.i134, %bb.i.i.i136 ] ; <double*> [#uses=1]
  store double %157, double* %__last_addr.0.lcssa.i.i.i137, align 8
  br label %bb5.backedge.i.i139

bb5.backedge.i.i139:                              ; preds = %_ZSt25__unguarded_linear_insertIPdd24inline_less_than_functorEvT_T0_T1_.exit.i.i, %bb2.i.i125
  %exitcond.i138 = icmp eq i32 %tmp81.i117, 15    ; <i1> [#uses=1]
  br i1 %exitcond.i138, label %_ZSt16__insertion_sortIPd24inline_less_than_functorEvT_S2_T0_.exit.i, label %bb1.i.i120

_ZSt16__insertion_sortIPd24inline_less_than_functorEvT_S2_T0_.exit.i: ; preds = %bb5.backedge.i.i139
  br i1 %78, label %bb2.i57, label %bb.i.i148

bb.i.i148:                                        ; preds = %_ZSt25__unguarded_linear_insertIPdd24inline_less_than_functorEvT_T0_T1_.exit.i47.i, %_ZSt16__insertion_sortIPd24inline_less_than_functorEvT_S2_T0_.exit.i
  %169 = phi i32 [ %tmp12.i37.i147, %_ZSt25__unguarded_linear_insertIPdd24inline_less_than_functorEvT_T0_T1_.exit.i47.i ], [ 0, %_ZSt16__insertion_sortIPd24inline_less_than_functorEvT_S2_T0_.exit.i ] ; <i32> [#uses=5]
  %tmp72.i140 = add i32 %169, 16                  ; <i32> [#uses=2]
  %tmp70.i141 = add i32 %169, 14                  ; <i32> [#uses=1]
  %tmp68.i142 = add i32 %169, 15                  ; <i32> [#uses=2]
  %__next.03.i.i.i143 = getelementptr double* %17, i32 %tmp68.i142 ; <double*> [#uses=1]
  %tmp77.i144 = add i32 %169, 17                  ; <i32> [#uses=1]
  %__i.04.i.i146 = getelementptr double* %17, i32 %tmp72.i140 ; <double*> [#uses=2]
  %tmp12.i37.i147 = add i32 %169, 1               ; <i32> [#uses=1]
  %170 = load double* %__i.04.i.i146, align 8     ; <double> [#uses=3]
  %171 = load double* %__next.03.i.i.i143, align 8 ; <double> [#uses=1]
  %172 = fcmp ogt double %171, %170               ; <i1> [#uses=1]
  br i1 %172, label %bb.i.i45.i157, label %_ZSt25__unguarded_linear_insertIPdd24inline_less_than_functorEvT_T0_T1_.exit.i47.i

bb.i.i45.i157:                                    ; preds = %bb.i.i45.i157, %bb.i.i148
  %indvar.i.i39.i149 = phi i32 [ %indvar.next.i.i44.i156, %bb.i.i45.i157 ], [ 0, %bb.i.i148 ] ; <i32> [#uses=4]
  %tmp69.i150 = sub i32 %tmp68.i142, %indvar.i.i39.i149 ; <i32> [#uses=1]
  %__next.04.i.i40.i151 = getelementptr double* %17, i32 %tmp69.i150 ; <double*> [#uses=2]
  %tmp71.i152 = sub i32 %tmp70.i141, %indvar.i.i39.i149 ; <i32> [#uses=1]
  %__next.0.i.i41.i153 = getelementptr double* %17, i32 %tmp71.i152 ; <double*> [#uses=1]
  %tmp73.i154 = sub i32 %tmp72.i140, %indvar.i.i39.i149 ; <i32> [#uses=1]
  %__last_addr.02.i.i43.i155 = getelementptr double* %17, i32 %tmp73.i154 ; <double*> [#uses=1]
  %173 = load double* %__next.04.i.i40.i151, align 8 ; <double> [#uses=1]
  store double %173, double* %__last_addr.02.i.i43.i155, align 8
  %174 = load double* %__next.0.i.i41.i153, align 8 ; <double> [#uses=1]
  %175 = fcmp ogt double %174, %170               ; <i1> [#uses=1]
  %indvar.next.i.i44.i156 = add i32 %indvar.i.i39.i149, 1 ; <i32> [#uses=1]
  br i1 %175, label %bb.i.i45.i157, label %_ZSt25__unguarded_linear_insertIPdd24inline_less_than_functorEvT_T0_T1_.exit.i47.i

_ZSt25__unguarded_linear_insertIPdd24inline_less_than_functorEvT_T0_T1_.exit.i47.i: ; preds = %bb.i.i45.i157, %bb.i.i148
  %__last_addr.0.lcssa.i.i46.i158 = phi double* [ %__i.04.i.i146, %bb.i.i148 ], [ %__next.04.i.i40.i151, %bb.i.i45.i157 ] ; <double*> [#uses=1]
  store double %170, double* %__last_addr.0.lcssa.i.i46.i158, align 8
  %176 = icmp eq i32 %tmp77.i144, %iftmp.87.0     ; <i1> [#uses=1]
  br i1 %176, label %bb2.i57, label %bb.i.i148

bb1.i159:                                         ; preds = %_ZSt4__lgIiET_S0_.exit.i72
  %brmerge190 = or i1 %72, %102                   ; <i1> [#uses=1]
  br i1 %brmerge190, label %bb2.i57, label %bb1.i14.i168

bb1.i14.i168:                                     ; preds = %bb5.backedge.i32.i185, %bb1.i159
  %177 = phi i32 [ %tmp59.i163, %bb5.backedge.i32.i185 ], [ 0, %bb1.i159 ] ; <i32> [#uses=5]
  %tmp59.i163 = add i32 %177, 1                   ; <i32> [#uses=3]
  %tmp57.i164 = add i32 %177, -1                  ; <i32> [#uses=1]
  %tmp64.i165 = add i32 %177, 2                   ; <i32> [#uses=2]
  %__i.08.i13.i167 = getelementptr double* %17, i32 %tmp59.i163 ; <double*> [#uses=3]
  %178 = load double* %__i.08.i13.i167, align 8   ; <double> [#uses=5]
  %179 = load double* %17, align 8                ; <double> [#uses=1]
  %180 = fcmp olt double %178, %179               ; <i1> [#uses=1]
  br i1 %180, label %bb2.i18.i172, label %bb3.i20.i174

bb2.i18.i172:                                     ; preds = %bb1.i14.i168
  %181 = ptrtoint double* %__i.08.i13.i167 to i32 ; <i32> [#uses=1]
  %182 = sub i32 %181, %31                        ; <i32> [#uses=2]
  %183 = ashr i32 %182, 3                         ; <i32> [#uses=1]
  %184 = and i32 %182, -8                         ; <i32> [#uses=1]
  %__i.0.sum.i15.i169 = sub i32 %tmp64.i165, %183 ; <i32> [#uses=1]
  %scevgep.i16.i170 = getelementptr double* %17, i32 %__i.0.sum.i15.i169 ; <double*> [#uses=1]
  %scevgep18.i17.i171 = bitcast double* %scevgep.i16.i170 to i8* ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %scevgep18.i17.i171, i8* %16, i32 %184, i32 8) nounwind
  store double %178, double* %17, align 8
  br label %bb5.backedge.i32.i185

bb3.i20.i174:                                     ; preds = %bb1.i14.i168
  %__first.pn6.i19.i173 = getelementptr double* %17, i32 %177 ; <double*> [#uses=1]
  %185 = load double* %__first.pn6.i19.i173, align 8 ; <double> [#uses=1]
  %186 = fcmp ogt double %185, %178               ; <i1> [#uses=1]
  br i1 %186, label %bb.i.i29.i183, label %_ZSt25__unguarded_linear_insertIPdd24inline_less_than_functorEvT_T0_T1_.exit.i31.i

bb.i.i29.i183:                                    ; preds = %bb.i.i29.i183, %bb3.i20.i174
  %indvar.i.i21.i175 = phi i32 [ %indvar.next.i.i28.i182, %bb.i.i29.i183 ], [ 0, %bb3.i20.i174 ] ; <i32> [#uses=4]
  %tmp58.i176 = sub i32 %tmp57.i164, %indvar.i.i21.i175 ; <i32> [#uses=1]
  %__next.0.i.i23.i177 = getelementptr double* %17, i32 %tmp58.i176 ; <double*> [#uses=1]
  %tmp60.i178 = sub i32 %tmp59.i163, %indvar.i.i21.i175 ; <i32> [#uses=1]
  %__last_addr.02.i.i27.i179 = getelementptr double* %17, i32 %tmp60.i178 ; <double*> [#uses=1]
  %tmp61.i180 = sub i32 %177, %indvar.i.i21.i175  ; <i32> [#uses=1]
  %__next.04.i.i25.i181 = getelementptr double* %17, i32 %tmp61.i180 ; <double*> [#uses=2]
  %187 = load double* %__next.04.i.i25.i181, align 8 ; <double> [#uses=1]
  store double %187, double* %__last_addr.02.i.i27.i179, align 8
  %188 = load double* %__next.0.i.i23.i177, align 8 ; <double> [#uses=1]
  %189 = fcmp ogt double %188, %178               ; <i1> [#uses=1]
  %indvar.next.i.i28.i182 = add i32 %indvar.i.i21.i175, 1 ; <i32> [#uses=1]
  br i1 %189, label %bb.i.i29.i183, label %_ZSt25__unguarded_linear_insertIPdd24inline_less_than_functorEvT_T0_T1_.exit.i31.i

_ZSt25__unguarded_linear_insertIPdd24inline_less_than_functorEvT_T0_T1_.exit.i31.i: ; preds = %bb.i.i29.i183, %bb3.i20.i174
  %__last_addr.0.lcssa.i.i30.i184 = phi double* [ %__i.08.i13.i167, %bb3.i20.i174 ], [ %__next.04.i.i25.i181, %bb.i.i29.i183 ] ; <double*> [#uses=1]
  store double %178, double* %__last_addr.0.lcssa.i.i30.i184, align 8
  br label %bb5.backedge.i32.i185

bb5.backedge.i32.i185:                            ; preds = %_ZSt25__unguarded_linear_insertIPdd24inline_less_than_functorEvT_T0_T1_.exit.i31.i, %bb2.i18.i172
  %190 = icmp eq i32 %tmp64.i165, %iftmp.87.0     ; <i1> [#uses=1]
  br i1 %190, label %bb2.i57, label %bb1.i14.i168

bb.i52:                                           ; preds = %bb2.i57
  %tmp251 = add i32 %tmp250, 8                    ; <i32> [#uses=1]
  %scevgep252 = getelementptr i8* %16, i32 %tmp251 ; <i8*> [#uses=1]
  %first_addr.0.i56 = bitcast i8* %scevgep252 to double* ; <double*> [#uses=1]
  %scevgep254 = getelementptr i8* %16, i32 %tmp250 ; <i8*> [#uses=1]
  %prev.0.i51 = bitcast i8* %scevgep254 to double* ; <double*> [#uses=1]
  %191 = load double* %first_addr.0.i56, align 8  ; <double> [#uses=1]
  %192 = load double* %prev.0.i51, align 8        ; <double> [#uses=1]
  %193 = fcmp olt double %191, %192               ; <i1> [#uses=1]
  br i1 %193, label %bb1.i53, label %bb2.i57

bb1.i53:                                          ; preds = %bb.i52
  %194 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIPdEvT_S1_.exit59

bb2.i57:                                          ; preds = %bb.i52, %bb5.backedge.i32.i185, %bb1.i159, %_ZSt25__unguarded_linear_insertIPdd24inline_less_than_functorEvT_T0_T1_.exit.i47.i, %_ZSt16__insertion_sortIPd24inline_less_than_functorEvT_S2_T0_.exit.i, %bb33
  %indvar.i54 = phi i32 [ %tmp.i55, %bb.i52 ], [ 0, %_ZSt25__unguarded_linear_insertIPdd24inline_less_than_functorEvT_T0_T1_.exit.i47.i ], [ 0, %_ZSt16__insertion_sortIPd24inline_less_than_functorEvT_S2_T0_.exit.i ], [ 0, %bb5.backedge.i32.i185 ], [ 0, %bb1.i159 ], [ 0, %bb33 ] ; <i32> [#uses=2]
  %tmp.i55 = add i32 %indvar.i54, 1               ; <i32> [#uses=2]
  %tmp250 = shl i32 %indvar.i54, 3                ; <i32> [#uses=2]
  %195 = icmp eq i32 %tmp.i55, %iftmp.87.0        ; <i1> [#uses=1]
  br i1 %195, label %_Z13verify_sortedIPdEvT_S1_.exit59, label %bb.i52

_Z13verify_sortedIPdEvT_S1_.exit59:               ; preds = %bb2.i57, %bb1.i53
  %196 = add nsw i32 %i.8200, 1                   ; <i32> [#uses=2]
  %exitcond256 = icmp eq i32 %196, %iftmp.86.0    ; <i1> [#uses=1]
  br i1 %exitcond256, label %bb37.loopexit, label %bb33

bb34.loopexit:                                    ; preds = %_Z13verify_sortedIPdEvT_S1_.exit82
  br i1 %18, label %bb33, label %bb47

bb36:                                             ; preds = %bb37.loopexit, %_Z13verify_sortedIPdEvT_S1_.exit50
  %i.9198 = phi i32 [ %202, %_Z13verify_sortedIPdEvT_S1_.exit50 ], [ 0, %bb37.loopexit ] ; <i32> [#uses=1]
  call void @llvm.memmove.i32(i8* %16, i8* %10, i32 %22, i32 8) nounwind
  call fastcc void @_Z9quicksortIPdSt4lessIdEEvT_S3_T0_(double* %17, double* %29)
  br label %bb2.i48

bb.i43:                                           ; preds = %bb2.i48
  %tmp243 = add i32 %tmp242, 8                    ; <i32> [#uses=1]
  %scevgep244 = getelementptr i8* %16, i32 %tmp243 ; <i8*> [#uses=1]
  %first_addr.0.i47 = bitcast i8* %scevgep244 to double* ; <double*> [#uses=1]
  %scevgep246 = getelementptr i8* %16, i32 %tmp242 ; <i8*> [#uses=1]
  %prev.0.i42 = bitcast i8* %scevgep246 to double* ; <double*> [#uses=1]
  %197 = load double* %first_addr.0.i47, align 8  ; <double> [#uses=1]
  %198 = load double* %prev.0.i42, align 8        ; <double> [#uses=1]
  %199 = fcmp olt double %197, %198               ; <i1> [#uses=1]
  br i1 %199, label %bb1.i44, label %bb2.i48

bb1.i44:                                          ; preds = %bb.i43
  %200 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIPdEvT_S1_.exit50

bb2.i48:                                          ; preds = %bb.i43, %bb36
  %indvar.i45 = phi i32 [ 0, %bb36 ], [ %tmp.i46, %bb.i43 ] ; <i32> [#uses=2]
  %tmp.i46 = add i32 %indvar.i45, 1               ; <i32> [#uses=2]
  %tmp242 = shl i32 %indvar.i45, 3                ; <i32> [#uses=2]
  %201 = icmp eq i32 %tmp.i46, %iftmp.87.0        ; <i1> [#uses=1]
  br i1 %201, label %_Z13verify_sortedIPdEvT_S1_.exit50, label %bb.i43

_Z13verify_sortedIPdEvT_S1_.exit50:               ; preds = %bb2.i48, %bb1.i44
  %202 = add nsw i32 %i.9198, 1                   ; <i32> [#uses=2]
  %exitcond248 = icmp eq i32 %202, %iftmp.86.0    ; <i1> [#uses=1]
  br i1 %exitcond248, label %bb40.loopexit, label %bb36

bb37.loopexit:                                    ; preds = %_Z13verify_sortedIPdEvT_S1_.exit59
  br i1 %18, label %bb36, label %bb47

bb39:                                             ; preds = %bb40.loopexit, %_Z13verify_sortedIPdEvT_S1_.exit29
  %i.10196 = phi i32 [ %246, %_Z13verify_sortedIPdEvT_S1_.exit29 ], [ 0, %bb40.loopexit ] ; <i32> [#uses=1]
  call void @llvm.memmove.i32(i8* %16, i8* %10, i32 %22, i32 8) nounwind
  br i1 %72, label %bb2.i27, label %bb.i31

bb.i31:                                           ; preds = %bb39
  br i1 %74, label %_ZSt4__lgIiET_S0_.exit.i40, label %bb.i.i35

bb.i.i35:                                         ; preds = %bb.i.i35, %bb.i31
  %__n_addr.02.i.i32 = phi i32 [ %205, %bb.i.i35 ], [ %73, %bb.i31 ] ; <i32> [#uses=1]
  %203 = phi i32 [ %204, %bb.i.i35 ], [ 0, %bb.i31 ] ; <i32> [#uses=2]
  %204 = add i32 %203, 1                          ; <i32> [#uses=1]
  %205 = ashr i32 %__n_addr.02.i.i32, 1           ; <i32> [#uses=2]
  %phitmp.i.i34 = icmp eq i32 %205, 1             ; <i1> [#uses=1]
  br i1 %phitmp.i.i34, label %_ZSt4__lgIiET_S0_.exit.loopexit.i38, label %bb.i.i35

_ZSt4__lgIiET_S0_.exit.loopexit.i38:              ; preds = %bb.i.i35
  %tmp.i.i36 = shl i32 %203, 1                    ; <i32> [#uses=1]
  %phitmp.i37 = add i32 %tmp.i.i36, 2             ; <i32> [#uses=1]
  br label %_ZSt4__lgIiET_S0_.exit.i40

_ZSt4__lgIiET_S0_.exit.i40:                       ; preds = %_ZSt4__lgIiET_S0_.exit.loopexit.i38, %bb.i31
  %__k.0.lcssa.i.i39 = phi i32 [ %phitmp.i37, %_ZSt4__lgIiET_S0_.exit.loopexit.i38 ], [ 0, %bb.i31 ] ; <i32> [#uses=1]
  call fastcc void @_ZSt16__introsort_loopIPdiSt4lessIdEEvT_S3_T0_T1_(double* %17, double* %29, i32 %__k.0.lcssa.i.i39) nounwind
  br i1 %75, label %bb1.i.i6, label %bb1.i27

bb1.i.i6:                                         ; preds = %bb5.backedge.i.i19, %_ZSt4__lgIiET_S0_.exit.i40
  %206 = phi i32 [ %tmp81.i, %bb5.backedge.i.i19 ], [ 0, %_ZSt4__lgIiET_S0_.exit.i40 ] ; <i32> [#uses=5]
  %tmp81.i = add i32 %206, 1                      ; <i32> [#uses=4]
  %tmp79.i = add i32 %206, -1                     ; <i32> [#uses=1]
  %__i.08.i.i = getelementptr double* %17, i32 %tmp81.i ; <double*> [#uses=3]
  %207 = load double* %__i.08.i.i, align 8        ; <double> [#uses=5]
  %208 = load double* %17, align 8                ; <double> [#uses=1]
  %209 = fcmp olt double %207, %208               ; <i1> [#uses=1]
  br i1 %209, label %bb2.i.i9, label %bb3.i.i10

bb2.i.i9:                                         ; preds = %bb1.i.i6
  %tmp86.i = add i32 %206, 2                      ; <i32> [#uses=1]
  %210 = ptrtoint double* %__i.08.i.i to i32      ; <i32> [#uses=1]
  %211 = sub i32 %210, %31                        ; <i32> [#uses=2]
  %212 = ashr i32 %211, 3                         ; <i32> [#uses=1]
  %213 = and i32 %211, -8                         ; <i32> [#uses=1]
  %__i.0.sum.i.i7 = sub i32 %tmp86.i, %212        ; <i32> [#uses=1]
  %scevgep.i.i8 = getelementptr double* %17, i32 %__i.0.sum.i.i7 ; <double*> [#uses=1]
  %scevgep18.i.i = bitcast double* %scevgep.i.i8 to i8* ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %scevgep18.i.i, i8* %16, i32 %213, i32 8) nounwind
  store double %207, double* %17, align 8
  br label %bb5.backedge.i.i19

bb3.i.i10:                                        ; preds = %bb1.i.i6
  %__first.pn6.i.i = getelementptr double* %17, i32 %206 ; <double*> [#uses=1]
  %214 = load double* %__first.pn6.i.i, align 8   ; <double> [#uses=1]
  %215 = fcmp ogt double %214, %207               ; <i1> [#uses=1]
  br i1 %215, label %bb.i.i.i16, label %_ZSt25__unguarded_linear_insertIPddSt4lessIdEEvT_T0_T1_.exit.i.i

bb.i.i.i16:                                       ; preds = %bb.i.i.i16, %bb3.i.i10
  %indvar.i.i.i11 = phi i32 [ %indvar.next.i.i.i15, %bb.i.i.i16 ], [ 0, %bb3.i.i10 ] ; <i32> [#uses=4]
  %tmp80.i = sub i32 %tmp79.i, %indvar.i.i.i11    ; <i32> [#uses=1]
  %__next.0.i.i.i12 = getelementptr double* %17, i32 %tmp80.i ; <double*> [#uses=1]
  %tmp82.i = sub i32 %tmp81.i, %indvar.i.i.i11    ; <i32> [#uses=1]
  %__last_addr.02.i.i.i13 = getelementptr double* %17, i32 %tmp82.i ; <double*> [#uses=1]
  %tmp83.i = sub i32 %206, %indvar.i.i.i11        ; <i32> [#uses=1]
  %__next.04.i.i.i14 = getelementptr double* %17, i32 %tmp83.i ; <double*> [#uses=2]
  %216 = load double* %__next.04.i.i.i14, align 8 ; <double> [#uses=1]
  store double %216, double* %__last_addr.02.i.i.i13, align 8
  %217 = load double* %__next.0.i.i.i12, align 8  ; <double> [#uses=1]
  %218 = fcmp ogt double %217, %207               ; <i1> [#uses=1]
  %indvar.next.i.i.i15 = add i32 %indvar.i.i.i11, 1 ; <i32> [#uses=1]
  br i1 %218, label %bb.i.i.i16, label %_ZSt25__unguarded_linear_insertIPddSt4lessIdEEvT_T0_T1_.exit.i.i

_ZSt25__unguarded_linear_insertIPddSt4lessIdEEvT_T0_T1_.exit.i.i: ; preds = %bb.i.i.i16, %bb3.i.i10
  %__last_addr.0.lcssa.i.i.i17 = phi double* [ %__i.08.i.i, %bb3.i.i10 ], [ %__next.04.i.i.i14, %bb.i.i.i16 ] ; <double*> [#uses=1]
  store double %207, double* %__last_addr.0.lcssa.i.i.i17, align 8
  br label %bb5.backedge.i.i19

bb5.backedge.i.i19:                               ; preds = %_ZSt25__unguarded_linear_insertIPddSt4lessIdEEvT_T0_T1_.exit.i.i, %bb2.i.i9
  %exitcond.i18 = icmp eq i32 %tmp81.i, 15        ; <i1> [#uses=1]
  br i1 %exitcond.i18, label %_ZSt16__insertion_sortIPdSt4lessIdEEvT_S3_T0_.exit.i, label %bb1.i.i6

_ZSt16__insertion_sortIPdSt4lessIdEEvT_S3_T0_.exit.i: ; preds = %bb5.backedge.i.i19
  br i1 %78, label %bb2.i27, label %bb.i.i23

bb.i.i23:                                         ; preds = %_ZSt25__unguarded_linear_insertIPddSt4lessIdEEvT_T0_T1_.exit.i47.i, %_ZSt16__insertion_sortIPdSt4lessIdEEvT_S3_T0_.exit.i
  %219 = phi i32 [ %tmp12.i37.i, %_ZSt25__unguarded_linear_insertIPddSt4lessIdEEvT_T0_T1_.exit.i47.i ], [ 0, %_ZSt16__insertion_sortIPdSt4lessIdEEvT_S3_T0_.exit.i ] ; <i32> [#uses=5]
  %tmp72.i20 = add i32 %219, 16                   ; <i32> [#uses=2]
  %tmp70.i21 = add i32 %219, 14                   ; <i32> [#uses=1]
  %tmp68.i = add i32 %219, 15                     ; <i32> [#uses=2]
  %__next.03.i.i.i22 = getelementptr double* %17, i32 %tmp68.i ; <double*> [#uses=1]
  %tmp77.i = add i32 %219, 17                     ; <i32> [#uses=1]
  %__i.04.i.i = getelementptr double* %17, i32 %tmp72.i20 ; <double*> [#uses=2]
  %tmp12.i37.i = add i32 %219, 1                  ; <i32> [#uses=1]
  %220 = load double* %__i.04.i.i, align 8        ; <double> [#uses=3]
  %221 = load double* %__next.03.i.i.i22, align 8 ; <double> [#uses=1]
  %222 = fcmp ogt double %221, %220               ; <i1> [#uses=1]
  br i1 %222, label %bb.i.i45.i, label %_ZSt25__unguarded_linear_insertIPddSt4lessIdEEvT_T0_T1_.exit.i47.i

bb.i.i45.i:                                       ; preds = %bb.i.i45.i, %bb.i.i23
  %indvar.i.i39.i = phi i32 [ %indvar.next.i.i44.i, %bb.i.i45.i ], [ 0, %bb.i.i23 ] ; <i32> [#uses=4]
  %tmp69.i24 = sub i32 %tmp68.i, %indvar.i.i39.i  ; <i32> [#uses=1]
  %__next.04.i.i40.i = getelementptr double* %17, i32 %tmp69.i24 ; <double*> [#uses=2]
  %tmp71.i25 = sub i32 %tmp70.i21, %indvar.i.i39.i ; <i32> [#uses=1]
  %__next.0.i.i41.i = getelementptr double* %17, i32 %tmp71.i25 ; <double*> [#uses=1]
  %tmp73.i26 = sub i32 %tmp72.i20, %indvar.i.i39.i ; <i32> [#uses=1]
  %__last_addr.02.i.i43.i = getelementptr double* %17, i32 %tmp73.i26 ; <double*> [#uses=1]
  %223 = load double* %__next.04.i.i40.i, align 8 ; <double> [#uses=1]
  store double %223, double* %__last_addr.02.i.i43.i, align 8
  %224 = load double* %__next.0.i.i41.i, align 8  ; <double> [#uses=1]
  %225 = fcmp ogt double %224, %220               ; <i1> [#uses=1]
  %indvar.next.i.i44.i = add i32 %indvar.i.i39.i, 1 ; <i32> [#uses=1]
  br i1 %225, label %bb.i.i45.i, label %_ZSt25__unguarded_linear_insertIPddSt4lessIdEEvT_T0_T1_.exit.i47.i

_ZSt25__unguarded_linear_insertIPddSt4lessIdEEvT_T0_T1_.exit.i47.i: ; preds = %bb.i.i45.i, %bb.i.i23
  %__last_addr.0.lcssa.i.i46.i = phi double* [ %__i.04.i.i, %bb.i.i23 ], [ %__next.04.i.i40.i, %bb.i.i45.i ] ; <double*> [#uses=1]
  store double %220, double* %__last_addr.0.lcssa.i.i46.i, align 8
  %226 = icmp eq i32 %tmp77.i, %iftmp.87.0        ; <i1> [#uses=1]
  br i1 %226, label %bb2.i27, label %bb.i.i23

bb1.i27:                                          ; preds = %_ZSt4__lgIiET_S0_.exit.i40
  %brmerge191 = or i1 %72, %102                   ; <i1> [#uses=1]
  br i1 %brmerge191, label %bb2.i27, label %bb1.i14.i

bb1.i14.i:                                        ; preds = %bb5.backedge.i32.i, %bb1.i27
  %227 = phi i32 [ %tmp59.i28, %bb5.backedge.i32.i ], [ 0, %bb1.i27 ] ; <i32> [#uses=5]
  %tmp59.i28 = add i32 %227, 1                    ; <i32> [#uses=3]
  %tmp57.i = add i32 %227, -1                     ; <i32> [#uses=1]
  %tmp64.i = add i32 %227, 2                      ; <i32> [#uses=2]
  %__i.08.i13.i = getelementptr double* %17, i32 %tmp59.i28 ; <double*> [#uses=3]
  %228 = load double* %__i.08.i13.i, align 8      ; <double> [#uses=5]
  %229 = load double* %17, align 8                ; <double> [#uses=1]
  %230 = fcmp olt double %228, %229               ; <i1> [#uses=1]
  br i1 %230, label %bb2.i18.i, label %bb3.i20.i

bb2.i18.i:                                        ; preds = %bb1.i14.i
  %231 = ptrtoint double* %__i.08.i13.i to i32    ; <i32> [#uses=1]
  %232 = sub i32 %231, %31                        ; <i32> [#uses=2]
  %233 = ashr i32 %232, 3                         ; <i32> [#uses=1]
  %234 = and i32 %232, -8                         ; <i32> [#uses=1]
  %__i.0.sum.i15.i = sub i32 %tmp64.i, %233       ; <i32> [#uses=1]
  %scevgep.i16.i = getelementptr double* %17, i32 %__i.0.sum.i15.i ; <double*> [#uses=1]
  %scevgep18.i17.i = bitcast double* %scevgep.i16.i to i8* ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %scevgep18.i17.i, i8* %16, i32 %234, i32 8) nounwind
  store double %228, double* %17, align 8
  br label %bb5.backedge.i32.i

bb3.i20.i:                                        ; preds = %bb1.i14.i
  %__first.pn6.i19.i = getelementptr double* %17, i32 %227 ; <double*> [#uses=1]
  %235 = load double* %__first.pn6.i19.i, align 8 ; <double> [#uses=1]
  %236 = fcmp ogt double %235, %228               ; <i1> [#uses=1]
  br i1 %236, label %bb.i.i29.i, label %_ZSt25__unguarded_linear_insertIPddSt4lessIdEEvT_T0_T1_.exit.i31.i

bb.i.i29.i:                                       ; preds = %bb.i.i29.i, %bb3.i20.i
  %indvar.i.i21.i = phi i32 [ %indvar.next.i.i28.i, %bb.i.i29.i ], [ 0, %bb3.i20.i ] ; <i32> [#uses=4]
  %tmp58.i29 = sub i32 %tmp57.i, %indvar.i.i21.i  ; <i32> [#uses=1]
  %__next.0.i.i23.i = getelementptr double* %17, i32 %tmp58.i29 ; <double*> [#uses=1]
  %tmp60.i30 = sub i32 %tmp59.i28, %indvar.i.i21.i ; <i32> [#uses=1]
  %__last_addr.02.i.i27.i = getelementptr double* %17, i32 %tmp60.i30 ; <double*> [#uses=1]
  %tmp61.i31 = sub i32 %227, %indvar.i.i21.i      ; <i32> [#uses=1]
  %__next.04.i.i25.i = getelementptr double* %17, i32 %tmp61.i31 ; <double*> [#uses=2]
  %237 = load double* %__next.04.i.i25.i, align 8 ; <double> [#uses=1]
  store double %237, double* %__last_addr.02.i.i27.i, align 8
  %238 = load double* %__next.0.i.i23.i, align 8  ; <double> [#uses=1]
  %239 = fcmp ogt double %238, %228               ; <i1> [#uses=1]
  %indvar.next.i.i28.i = add i32 %indvar.i.i21.i, 1 ; <i32> [#uses=1]
  br i1 %239, label %bb.i.i29.i, label %_ZSt25__unguarded_linear_insertIPddSt4lessIdEEvT_T0_T1_.exit.i31.i

_ZSt25__unguarded_linear_insertIPddSt4lessIdEEvT_T0_T1_.exit.i31.i: ; preds = %bb.i.i29.i, %bb3.i20.i
  %__last_addr.0.lcssa.i.i30.i = phi double* [ %__i.08.i13.i, %bb3.i20.i ], [ %__next.04.i.i25.i, %bb.i.i29.i ] ; <double*> [#uses=1]
  store double %228, double* %__last_addr.0.lcssa.i.i30.i, align 8
  br label %bb5.backedge.i32.i

bb5.backedge.i32.i:                               ; preds = %_ZSt25__unguarded_linear_insertIPddSt4lessIdEEvT_T0_T1_.exit.i31.i, %bb2.i18.i
  %240 = icmp eq i32 %tmp64.i, %iftmp.87.0        ; <i1> [#uses=1]
  br i1 %240, label %bb2.i27, label %bb1.i14.i

bb.i22:                                           ; preds = %bb2.i27
  %tmp235 = add i32 %tmp234, 8                    ; <i32> [#uses=1]
  %scevgep236 = getelementptr i8* %16, i32 %tmp235 ; <i8*> [#uses=1]
  %first_addr.0.i26 = bitcast i8* %scevgep236 to double* ; <double*> [#uses=1]
  %scevgep238 = getelementptr i8* %16, i32 %tmp234 ; <i8*> [#uses=1]
  %prev.0.i21 = bitcast i8* %scevgep238 to double* ; <double*> [#uses=1]
  %241 = load double* %first_addr.0.i26, align 8  ; <double> [#uses=1]
  %242 = load double* %prev.0.i21, align 8        ; <double> [#uses=1]
  %243 = fcmp olt double %241, %242               ; <i1> [#uses=1]
  br i1 %243, label %bb1.i23, label %bb2.i27

bb1.i23:                                          ; preds = %bb.i22
  %244 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIPdEvT_S1_.exit29

bb2.i27:                                          ; preds = %bb.i22, %bb5.backedge.i32.i, %bb1.i27, %_ZSt25__unguarded_linear_insertIPddSt4lessIdEEvT_T0_T1_.exit.i47.i, %_ZSt16__insertion_sortIPdSt4lessIdEEvT_S3_T0_.exit.i, %bb39
  %indvar.i24 = phi i32 [ %tmp.i25, %bb.i22 ], [ 0, %_ZSt25__unguarded_linear_insertIPddSt4lessIdEEvT_T0_T1_.exit.i47.i ], [ 0, %_ZSt16__insertion_sortIPdSt4lessIdEEvT_S3_T0_.exit.i ], [ 0, %bb5.backedge.i32.i ], [ 0, %bb1.i27 ], [ 0, %bb39 ] ; <i32> [#uses=2]
  %tmp.i25 = add i32 %indvar.i24, 1               ; <i32> [#uses=2]
  %tmp234 = shl i32 %indvar.i24, 3                ; <i32> [#uses=2]
  %245 = icmp eq i32 %tmp.i25, %iftmp.87.0        ; <i1> [#uses=1]
  br i1 %245, label %_Z13verify_sortedIPdEvT_S1_.exit29, label %bb.i22

_Z13verify_sortedIPdEvT_S1_.exit29:               ; preds = %bb2.i27, %bb1.i23
  %246 = add nsw i32 %i.10196, 1                  ; <i32> [#uses=2]
  %exitcond240 = icmp eq i32 %246, %iftmp.86.0    ; <i1> [#uses=1]
  br i1 %exitcond240, label %bb43.loopexit, label %bb39

bb40.loopexit:                                    ; preds = %_Z13verify_sortedIPdEvT_S1_.exit50
  br i1 %18, label %bb39, label %bb47

bb42:                                             ; preds = %bb43.loopexit, %_Z13verify_sortedIPdEvT_S1_.exit11
  %i.11194 = phi i32 [ %252, %_Z13verify_sortedIPdEvT_S1_.exit11 ], [ 0, %bb43.loopexit ] ; <i32> [#uses=1]
  call void @llvm.memmove.i32(i8* %16, i8* %10, i32 %22, i32 8) nounwind
  call fastcc void @_Z9quicksortIPdEvT_S1_(double* %17, double* %29)
  br label %bb2.i9

bb.i4:                                            ; preds = %bb2.i9
  %tmp227 = add i32 %tmp226, 8                    ; <i32> [#uses=1]
  %scevgep228 = getelementptr i8* %16, i32 %tmp227 ; <i8*> [#uses=1]
  %first_addr.0.i8 = bitcast i8* %scevgep228 to double* ; <double*> [#uses=1]
  %scevgep230 = getelementptr i8* %16, i32 %tmp226 ; <i8*> [#uses=1]
  %prev.0.i3 = bitcast i8* %scevgep230 to double* ; <double*> [#uses=1]
  %247 = load double* %first_addr.0.i8, align 8   ; <double> [#uses=1]
  %248 = load double* %prev.0.i3, align 8         ; <double> [#uses=1]
  %249 = fcmp olt double %247, %248               ; <i1> [#uses=1]
  br i1 %249, label %bb1.i5, label %bb2.i9

bb1.i5:                                           ; preds = %bb.i4
  %250 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIPdEvT_S1_.exit11

bb2.i9:                                           ; preds = %bb.i4, %bb42
  %indvar.i6 = phi i32 [ 0, %bb42 ], [ %tmp.i7, %bb.i4 ] ; <i32> [#uses=2]
  %tmp.i7 = add i32 %indvar.i6, 1                 ; <i32> [#uses=2]
  %tmp226 = shl i32 %indvar.i6, 3                 ; <i32> [#uses=2]
  %251 = icmp eq i32 %tmp.i7, %iftmp.87.0         ; <i1> [#uses=1]
  br i1 %251, label %_Z13verify_sortedIPdEvT_S1_.exit11, label %bb.i4

_Z13verify_sortedIPdEvT_S1_.exit11:               ; preds = %bb2.i9, %bb1.i5
  %252 = add nsw i32 %i.11194, 1                  ; <i32> [#uses=2]
  %exitcond232 = icmp eq i32 %252, %iftmp.86.0    ; <i1> [#uses=1]
  br i1 %exitcond232, label %bb46.loopexit, label %bb42

bb43.loopexit:                                    ; preds = %_Z13verify_sortedIPdEvT_S1_.exit29
  br i1 %18, label %bb42, label %bb47

bb45:                                             ; preds = %bb46.loopexit, %_Z13verify_sortedIPdEvT_S1_.exit
  %i.12193 = phi i32 [ %296, %_Z13verify_sortedIPdEvT_S1_.exit ], [ 0, %bb46.loopexit ] ; <i32> [#uses=1]
  call void @llvm.memmove.i32(i8* %16, i8* %10, i32 %22, i32 8) nounwind
  br i1 %72, label %bb2.i, label %bb.i1

bb.i1:                                            ; preds = %bb45
  br i1 %74, label %_ZSt4__lgIiET_S0_.exit.i, label %bb.i.i

bb.i.i:                                           ; preds = %bb.i.i, %bb.i1
  %__n_addr.02.i.i = phi i32 [ %255, %bb.i.i ], [ %73, %bb.i1 ] ; <i32> [#uses=1]
  %253 = phi i32 [ %254, %bb.i.i ], [ 0, %bb.i1 ] ; <i32> [#uses=2]
  %254 = add i32 %253, 1                          ; <i32> [#uses=1]
  %255 = ashr i32 %__n_addr.02.i.i, 1             ; <i32> [#uses=2]
  %phitmp.i.i = icmp eq i32 %255, 1               ; <i1> [#uses=1]
  br i1 %phitmp.i.i, label %_ZSt4__lgIiET_S0_.exit.loopexit.i, label %bb.i.i

_ZSt4__lgIiET_S0_.exit.loopexit.i:                ; preds = %bb.i.i
  %tmp.i.i = shl i32 %253, 1                      ; <i32> [#uses=1]
  %phitmp.i = add i32 %tmp.i.i, 2                 ; <i32> [#uses=1]
  br label %_ZSt4__lgIiET_S0_.exit.i

_ZSt4__lgIiET_S0_.exit.i:                         ; preds = %_ZSt4__lgIiET_S0_.exit.loopexit.i, %bb.i1
  %__k.0.lcssa.i.i = phi i32 [ %phitmp.i, %_ZSt4__lgIiET_S0_.exit.loopexit.i ], [ 0, %bb.i1 ] ; <i32> [#uses=1]
  call fastcc void @_ZSt16__introsort_loopIPdiEvT_S1_T0_(double* %17, double* %29, i32 %__k.0.lcssa.i.i) nounwind
  br i1 %75, label %bb1.i.i, label %bb1.i2

bb1.i.i:                                          ; preds = %bb5.backedge.i.i, %_ZSt4__lgIiET_S0_.exit.i
  %256 = phi i32 [ %tmp71.i, %bb5.backedge.i.i ], [ 0, %_ZSt4__lgIiET_S0_.exit.i ] ; <i32> [#uses=5]
  %tmp71.i = add i32 %256, 1                      ; <i32> [#uses=4]
  %tmp69.i = add i32 %256, -1                     ; <i32> [#uses=1]
  %__i.05.i.i = getelementptr double* %17, i32 %tmp71.i ; <double*> [#uses=3]
  %257 = load double* %__i.05.i.i, align 8        ; <double> [#uses=5]
  %258 = load double* %17, align 8                ; <double> [#uses=1]
  %259 = fcmp ogt double %258, %257               ; <i1> [#uses=1]
  br i1 %259, label %bb2.i.i, label %bb3.i.i

bb2.i.i:                                          ; preds = %bb1.i.i
  %tmp76.i = add i32 %256, 2                      ; <i32> [#uses=1]
  %260 = ptrtoint double* %__i.05.i.i to i32      ; <i32> [#uses=1]
  %261 = sub i32 %260, %31                        ; <i32> [#uses=2]
  %262 = ashr i32 %261, 3                         ; <i32> [#uses=1]
  %263 = and i32 %261, -8                         ; <i32> [#uses=1]
  %__i.0.sum.i.i = sub i32 %tmp76.i, %262         ; <i32> [#uses=1]
  %scevgep.i.i = getelementptr double* %17, i32 %__i.0.sum.i.i ; <double*> [#uses=1]
  %scevgep15.i.i = bitcast double* %scevgep.i.i to i8* ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %scevgep15.i.i, i8* %16, i32 %263, i32 8) nounwind
  store double %257, double* %17, align 8
  br label %bb5.backedge.i.i

bb3.i.i:                                          ; preds = %bb1.i.i
  %__first.pn3.i.i = getelementptr double* %17, i32 %256 ; <double*> [#uses=1]
  %264 = load double* %__first.pn3.i.i, align 8   ; <double> [#uses=1]
  %265 = fcmp ogt double %264, %257               ; <i1> [#uses=1]
  br i1 %265, label %bb.i.i.i, label %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i.i

bb.i.i.i:                                         ; preds = %bb.i.i.i, %bb3.i.i
  %indvar.i.i.i = phi i32 [ %indvar.next.i.i.i, %bb.i.i.i ], [ 0, %bb3.i.i ] ; <i32> [#uses=4]
  %tmp70.i = sub i32 %tmp69.i, %indvar.i.i.i      ; <i32> [#uses=1]
  %__next.0.i.i.i = getelementptr double* %17, i32 %tmp70.i ; <double*> [#uses=1]
  %tmp72.i = sub i32 %tmp71.i, %indvar.i.i.i      ; <i32> [#uses=1]
  %__last_addr.02.i.i.i = getelementptr double* %17, i32 %tmp72.i ; <double*> [#uses=1]
  %tmp73.i = sub i32 %256, %indvar.i.i.i          ; <i32> [#uses=1]
  %__next.04.i.i.i = getelementptr double* %17, i32 %tmp73.i ; <double*> [#uses=2]
  %266 = load double* %__next.04.i.i.i, align 8   ; <double> [#uses=1]
  store double %266, double* %__last_addr.02.i.i.i, align 8
  %267 = load double* %__next.0.i.i.i, align 8    ; <double> [#uses=1]
  %268 = fcmp ogt double %267, %257               ; <i1> [#uses=1]
  %indvar.next.i.i.i = add i32 %indvar.i.i.i, 1   ; <i32> [#uses=1]
  br i1 %268, label %bb.i.i.i, label %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i.i

_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i.i: ; preds = %bb.i.i.i, %bb3.i.i
  %__last_addr.0.lcssa.i.i.i = phi double* [ %__i.05.i.i, %bb3.i.i ], [ %__next.04.i.i.i, %bb.i.i.i ] ; <double*> [#uses=1]
  store double %257, double* %__last_addr.0.lcssa.i.i.i, align 8
  br label %bb5.backedge.i.i

bb5.backedge.i.i:                                 ; preds = %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i.i, %bb2.i.i
  %exitcond.i = icmp eq i32 %tmp71.i, 15          ; <i1> [#uses=1]
  br i1 %exitcond.i, label %_ZSt16__insertion_sortIPdEvT_S1_.exit.i, label %bb1.i.i

_ZSt16__insertion_sortIPdEvT_S1_.exit.i:          ; preds = %bb5.backedge.i.i
  br i1 %78, label %bb2.i, label %bb.i.i1

bb.i.i1:                                          ; preds = %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i39.i, %_ZSt16__insertion_sortIPdEvT_S1_.exit.i
  %269 = phi i32 [ %tmp9.i29.i, %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i39.i ], [ 0, %_ZSt16__insertion_sortIPdEvT_S1_.exit.i ] ; <i32> [#uses=5]
  %tmp62.i = add i32 %269, 16                     ; <i32> [#uses=2]
  %tmp60.i = add i32 %269, 14                     ; <i32> [#uses=1]
  %tmp58.i = add i32 %269, 15                     ; <i32> [#uses=2]
  %__next.03.i.i.i = getelementptr double* %17, i32 %tmp58.i ; <double*> [#uses=1]
  %tmp67.i = add i32 %269, 17                     ; <i32> [#uses=1]
  %__i.01.i.i = getelementptr double* %17, i32 %tmp62.i ; <double*> [#uses=2]
  %tmp9.i29.i = add i32 %269, 1                   ; <i32> [#uses=1]
  %270 = load double* %__i.01.i.i, align 8        ; <double> [#uses=3]
  %271 = load double* %__next.03.i.i.i, align 8   ; <double> [#uses=1]
  %272 = fcmp ogt double %271, %270               ; <i1> [#uses=1]
  br i1 %272, label %bb.i.i37.i, label %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i39.i

bb.i.i37.i:                                       ; preds = %bb.i.i37.i, %bb.i.i1
  %indvar.i.i31.i = phi i32 [ %indvar.next.i.i36.i, %bb.i.i37.i ], [ 0, %bb.i.i1 ] ; <i32> [#uses=4]
  %tmp59.i = sub i32 %tmp58.i, %indvar.i.i31.i    ; <i32> [#uses=1]
  %__next.04.i.i32.i = getelementptr double* %17, i32 %tmp59.i ; <double*> [#uses=2]
  %tmp61.i = sub i32 %tmp60.i, %indvar.i.i31.i    ; <i32> [#uses=1]
  %__next.0.i.i33.i = getelementptr double* %17, i32 %tmp61.i ; <double*> [#uses=1]
  %tmp63.i = sub i32 %tmp62.i, %indvar.i.i31.i    ; <i32> [#uses=1]
  %__last_addr.02.i.i35.i = getelementptr double* %17, i32 %tmp63.i ; <double*> [#uses=1]
  %273 = load double* %__next.04.i.i32.i, align 8 ; <double> [#uses=1]
  store double %273, double* %__last_addr.02.i.i35.i, align 8
  %274 = load double* %__next.0.i.i33.i, align 8  ; <double> [#uses=1]
  %275 = fcmp ogt double %274, %270               ; <i1> [#uses=1]
  %indvar.next.i.i36.i = add i32 %indvar.i.i31.i, 1 ; <i32> [#uses=1]
  br i1 %275, label %bb.i.i37.i, label %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i39.i

_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i39.i: ; preds = %bb.i.i37.i, %bb.i.i1
  %__last_addr.0.lcssa.i.i38.i = phi double* [ %__i.01.i.i, %bb.i.i1 ], [ %__next.04.i.i32.i, %bb.i.i37.i ] ; <double*> [#uses=1]
  store double %270, double* %__last_addr.0.lcssa.i.i38.i, align 8
  %276 = icmp eq i32 %tmp67.i, %iftmp.87.0        ; <i1> [#uses=1]
  br i1 %276, label %bb2.i, label %bb.i.i1

bb1.i2:                                           ; preds = %_ZSt4__lgIiET_S0_.exit.i
  %brmerge192 = or i1 %72, %102                   ; <i1> [#uses=1]
  br i1 %brmerge192, label %bb2.i, label %bb1.i9.i

bb1.i9.i:                                         ; preds = %bb5.backedge.i27.i, %bb1.i2
  %277 = phi i32 [ %tmp49.i, %bb5.backedge.i27.i ], [ 0, %bb1.i2 ] ; <i32> [#uses=5]
  %tmp49.i = add i32 %277, 1                      ; <i32> [#uses=3]
  %tmp47.i = add i32 %277, -1                     ; <i32> [#uses=1]
  %tmp54.i = add i32 %277, 2                      ; <i32> [#uses=2]
  %__i.05.i8.i = getelementptr double* %17, i32 %tmp49.i ; <double*> [#uses=3]
  %278 = load double* %__i.05.i8.i, align 8       ; <double> [#uses=5]
  %279 = load double* %17, align 8                ; <double> [#uses=1]
  %280 = fcmp ogt double %279, %278               ; <i1> [#uses=1]
  br i1 %280, label %bb2.i13.i, label %bb3.i15.i

bb2.i13.i:                                        ; preds = %bb1.i9.i
  %281 = ptrtoint double* %__i.05.i8.i to i32     ; <i32> [#uses=1]
  %282 = sub i32 %281, %31                        ; <i32> [#uses=2]
  %283 = ashr i32 %282, 3                         ; <i32> [#uses=1]
  %284 = and i32 %282, -8                         ; <i32> [#uses=1]
  %__i.0.sum.i10.i = sub i32 %tmp54.i, %283       ; <i32> [#uses=1]
  %scevgep.i11.i = getelementptr double* %17, i32 %__i.0.sum.i10.i ; <double*> [#uses=1]
  %scevgep15.i12.i = bitcast double* %scevgep.i11.i to i8* ; <i8*> [#uses=1]
  call void @llvm.memmove.i32(i8* %scevgep15.i12.i, i8* %16, i32 %284, i32 8) nounwind
  store double %278, double* %17, align 8
  br label %bb5.backedge.i27.i

bb3.i15.i:                                        ; preds = %bb1.i9.i
  %__first.pn3.i14.i = getelementptr double* %17, i32 %277 ; <double*> [#uses=1]
  %285 = load double* %__first.pn3.i14.i, align 8 ; <double> [#uses=1]
  %286 = fcmp ogt double %285, %278               ; <i1> [#uses=1]
  br i1 %286, label %bb.i.i24.i, label %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i26.i

bb.i.i24.i:                                       ; preds = %bb.i.i24.i, %bb3.i15.i
  %indvar.i.i16.i = phi i32 [ %indvar.next.i.i23.i, %bb.i.i24.i ], [ 0, %bb3.i15.i ] ; <i32> [#uses=4]
  %tmp48.i = sub i32 %tmp47.i, %indvar.i.i16.i    ; <i32> [#uses=1]
  %__next.0.i.i18.i = getelementptr double* %17, i32 %tmp48.i ; <double*> [#uses=1]
  %tmp50.i = sub i32 %tmp49.i, %indvar.i.i16.i    ; <i32> [#uses=1]
  %__last_addr.02.i.i22.i = getelementptr double* %17, i32 %tmp50.i ; <double*> [#uses=1]
  %tmp51.i = sub i32 %277, %indvar.i.i16.i        ; <i32> [#uses=1]
  %__next.04.i.i20.i = getelementptr double* %17, i32 %tmp51.i ; <double*> [#uses=2]
  %287 = load double* %__next.04.i.i20.i, align 8 ; <double> [#uses=1]
  store double %287, double* %__last_addr.02.i.i22.i, align 8
  %288 = load double* %__next.0.i.i18.i, align 8  ; <double> [#uses=1]
  %289 = fcmp ogt double %288, %278               ; <i1> [#uses=1]
  %indvar.next.i.i23.i = add i32 %indvar.i.i16.i, 1 ; <i32> [#uses=1]
  br i1 %289, label %bb.i.i24.i, label %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i26.i

_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i26.i: ; preds = %bb.i.i24.i, %bb3.i15.i
  %__last_addr.0.lcssa.i.i25.i = phi double* [ %__i.05.i8.i, %bb3.i15.i ], [ %__next.04.i.i20.i, %bb.i.i24.i ] ; <double*> [#uses=1]
  store double %278, double* %__last_addr.0.lcssa.i.i25.i, align 8
  br label %bb5.backedge.i27.i

bb5.backedge.i27.i:                               ; preds = %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i26.i, %bb2.i13.i
  %290 = icmp eq i32 %tmp54.i, %iftmp.87.0        ; <i1> [#uses=1]
  br i1 %290, label %bb2.i, label %bb1.i9.i

bb.i:                                             ; preds = %bb2.i
  %tmp221 = add i32 %tmp, 8                       ; <i32> [#uses=1]
  %scevgep = getelementptr i8* %16, i32 %tmp221   ; <i8*> [#uses=1]
  %first_addr.0.i = bitcast i8* %scevgep to double* ; <double*> [#uses=1]
  %scevgep223 = getelementptr i8* %16, i32 %tmp   ; <i8*> [#uses=1]
  %prev.0.i = bitcast i8* %scevgep223 to double*  ; <double*> [#uses=1]
  %291 = load double* %first_addr.0.i, align 8    ; <double> [#uses=1]
  %292 = load double* %prev.0.i, align 8          ; <double> [#uses=1]
  %293 = fcmp olt double %291, %292               ; <i1> [#uses=1]
  br i1 %293, label %bb1.i, label %bb2.i

bb1.i:                                            ; preds = %bb.i
  %294 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIPdEvT_S1_.exit

bb2.i:                                            ; preds = %bb.i, %bb5.backedge.i27.i, %bb1.i2, %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i39.i, %_ZSt16__insertion_sortIPdEvT_S1_.exit.i, %bb45
  %indvar.i = phi i32 [ %tmp.i, %bb.i ], [ 0, %_ZSt25__unguarded_linear_insertIPddEvT_T0_.exit.i39.i ], [ 0, %_ZSt16__insertion_sortIPdEvT_S1_.exit.i ], [ 0, %bb5.backedge.i27.i ], [ 0, %bb1.i2 ], [ 0, %bb45 ] ; <i32> [#uses=2]
  %tmp.i = add i32 %indvar.i, 1                   ; <i32> [#uses=2]
  %tmp = shl i32 %indvar.i, 3                     ; <i32> [#uses=2]
  %295 = icmp eq i32 %tmp.i, %iftmp.87.0          ; <i1> [#uses=1]
  br i1 %295, label %_Z13verify_sortedIPdEvT_S1_.exit, label %bb.i

_Z13verify_sortedIPdEvT_S1_.exit:                 ; preds = %bb2.i, %bb1.i
  %296 = add nsw i32 %i.12193, 1                  ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %296, %iftmp.86.0       ; <i1> [#uses=1]
  br i1 %exitcond, label %bb47, label %bb45

bb46.loopexit:                                    ; preds = %_Z13verify_sortedIPdEvT_S1_.exit11
  br i1 %18, label %bb45, label %bb47

bb47:                                             ; preds = %bb46.loopexit, %_Z13verify_sortedIPdEvT_S1_.exit, %bb43.loopexit, %bb40.loopexit, %bb37.loopexit, %bb34.loopexit, %bb31.loopexit, %bb28.loopexit, %bb25.loopexit, %bb22.loopexit, %bb19.loopexit, %bb16.loopexit, %bb13.loopexit, %bb8
  %297 = icmp eq i8* %16, null                    ; <i1> [#uses=1]
  br i1 %297, label %bb49, label %bb48

bb48:                                             ; preds = %bb47
  call void @_ZdaPv(i8* %16) nounwind
  br label %bb49

bb49:                                             ; preds = %bb48, %bb47
  %298 = icmp eq i8* %10, null                    ; <i1> [#uses=1]
  br i1 %298, label %bb51, label %bb50

bb50:                                             ; preds = %bb49
  call void @_ZdaPv(i8* %10) nounwind
  ret i32 0

bb51:                                             ; preds = %bb49
  ret i32 0
}

declare i32 @atoi(i8* nocapture) nounwind readonly

declare void @srand(i32) nounwind

declare i8* @_Znaj(i32)

declare i32 @rand() nounwind

declare void @qsort(i8*, i32, i32, i32 (i8*, i8*)* nocapture)

declare void @_ZdaPv(i8*) nounwind

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
