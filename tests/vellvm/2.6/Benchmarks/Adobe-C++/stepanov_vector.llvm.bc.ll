; ModuleID = 'stepanov_vector.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { i32, void ()* }
%struct..0._49 = type { i32 }
%struct..1__pthread_mutex_s = type { i32, i32, i32, i32, i32, %struct..0._49 }
%struct.FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct.FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct.FILE*, i32 }
%"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >" = type { double* }
%struct.one_result = type { double, i8* }
%struct.pthread_attr_t = type { i32, [32 x i8] }
%struct.pthread_mutex_t = type { %struct..1__pthread_mutex_s }
%"struct.std::_Vector_base<double,std::allocator<double> >" = type { %"struct.std::_Vector_base<double,std::allocator<double> >::_Vector_impl" }
%"struct.std::_Vector_base<double,std::allocator<double> >::_Vector_impl" = type { double*, double*, double* }
%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >" = type { %"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >" }
%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >" = type { [4 x i8], %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >" }
%"struct.std::reverse_iterator<std::reverse_iterator<double*> >" = type { [4 x i8], %"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >" }
%"struct.std::vector<double,std::allocator<double> >" = type { %"struct.std::_Vector_base<double,std::allocator<double> >" }

@data = internal global [2000 x double] zeroinitializer, align 32 ; <[2000 x double]*> [#uses=105]
@dataMaster = internal global [2000 x double] zeroinitializer, align 32 ; <[2000 x double]*> [#uses=12]
@.str = private constant [16 x i8] c"test %i failed\0A\00", align 1 ; <[16 x i8]*> [#uses=1]
@iterations = internal global i32 60000           ; <i32*> [#uses=54]
@.str1 = private constant [21 x i8] c"sort test %i failed\0A\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str2 = private constant [23 x i8] c"vector::_M_fill_insert\00", align 1 ; <[23 x i8]*> [#uses=1]
@llvm.global_ctors = appending global [0 x %0] zeroinitializer ; <[0 x %0]*> [#uses=0]

@_ZL20__gthrw_pthread_oncePiPFvvE = alias weak i32 (i32*, void ()*)* @pthread_once ; <i32 (i32*, void ()*)*> [#uses=0]
@_ZL27__gthrw_pthread_getspecificj = alias weak i8* (i32)* @pthread_getspecific ; <i8* (i32)*> [#uses=0]
@_ZL27__gthrw_pthread_setspecificjPKv = alias weak i32 (i32, i8*)* @pthread_setspecific ; <i32 (i32, i8*)*> [#uses=0]
@_ZL22__gthrw_pthread_createPmPK14pthread_attr_tPFPvS3_ES3_ = alias weak i32 (i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)* @pthread_create ; <i32 (i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)*> [#uses=0]
@_ZL22__gthrw_pthread_cancelm = alias weak i32 (i32)* @pthread_cancel ; <i32 (i32)*> [#uses=0]
@_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_lock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL29__gthrw_pthread_mutex_trylockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_trylock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t = alias weak i32 (%struct.pthread_mutex_t*)* @pthread_mutex_unlock ; <i32 (%struct.pthread_mutex_t*)*> [#uses=0]
@_ZL26__gthrw_pthread_mutex_initP15pthread_mutex_tPK19pthread_mutexattr_t = alias weak i32 (%struct.pthread_mutex_t*, %struct..0._49*)* @pthread_mutex_init ; <i32 (%struct.pthread_mutex_t*, %struct..0._49*)*> [#uses=0]
@_ZL26__gthrw_pthread_key_createPjPFvPvE = alias weak i32 (i32*, void (i8*)*)* @pthread_key_create ; <i32 (i32*, void (i8*)*)*> [#uses=0]
@_ZL26__gthrw_pthread_key_deletej = alias weak i32 (i32)* @pthread_key_delete ; <i32 (i32)*> [#uses=0]
@_ZL30__gthrw_pthread_mutexattr_initP19pthread_mutexattr_t = alias weak i32 (%struct..0._49*)* @pthread_mutexattr_init ; <i32 (%struct..0._49*)*> [#uses=0]
@_ZL33__gthrw_pthread_mutexattr_settypeP19pthread_mutexattr_ti = alias weak i32 (%struct..0._49*, i32)* @pthread_mutexattr_settype ; <i32 (%struct..0._49*, i32)*> [#uses=0]
@_ZL33__gthrw_pthread_mutexattr_destroyP19pthread_mutexattr_t = alias weak i32 (%struct..0._49*)* @pthread_mutexattr_destroy ; <i32 (%struct..0._49*)*> [#uses=0]

define internal fastcc void @_ZN9benchmark9quicksortIPddEEvT_S2_(double* %begin, double* %end) nounwind {
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
  tail call fastcc void @_ZN9benchmark9quicksortIPddEEvT_S2_(double* %begin.tr, double* %right.0)
  %14 = ptrtoint double* %right.0 to i32          ; <i32> [#uses=1]
  %15 = sub i32 %0, %14                           ; <i32> [#uses=1]
  %16 = icmp sgt i32 %15, 15                      ; <i1> [#uses=1]
  br i1 %16, label %bb.i, label %_ZN9benchmark9quicksortIPddEEvT_S2_.exit

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
  tail call fastcc void @_ZN9benchmark9quicksortIPddEEvT_S2_(double* %right.0, double* %right.0.i) nounwind
  br label %tailrecurse

_ZN9benchmark9quicksortIPddEEvT_S2_.exit:         ; preds = %bb7
  ret void

return:                                           ; preds = %tailrecurse
  ret void
}

define internal fastcc void @_ZN9benchmark9quicksortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEvT_S8_(double* %begin.0, double* %end.0) nounwind {
entry:
  %0 = ptrtoint double* %end.0 to i32             ; <i32> [#uses=2]
  %1 = ptrtoint double* %begin.0 to i32           ; <i32> [#uses=1]
  %2 = sub i32 %0, %1                             ; <i32> [#uses=1]
  %3 = ashr i32 %2, 3                             ; <i32> [#uses=1]
  %4 = icmp sgt i32 %3, 1                         ; <i1> [#uses=1]
  br i1 %4, label %bb, label %return

bb:                                               ; preds = %_ZN9benchmark9quicksortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEvT_S8_.exit, %entry
  %begin.0.tr4 = phi double* [ %right.0.0, %_ZN9benchmark9quicksortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEvT_S8_.exit ], [ %begin.0, %entry ] ; <double*> [#uses=4]
  %5 = load double* %begin.0.tr4, align 8         ; <double> [#uses=5]
  br label %bb1.outer

bb1.outer:                                        ; preds = %bb14, %bb
  %.rle16 = phi double [ %7, %bb14 ], [ %5, %bb ] ; <double> [#uses=1]
  %6 = phi double [ %7, %bb14 ], [ %5, %bb ]      ; <double> [#uses=1]
  %right.0.0.ph = phi double* [ %end.0, %bb ], [ %scevgep12, %bb14 ] ; <double*> [#uses=2]
  %left.0.1.ph = phi double* [ %begin.0.tr4, %bb ], [ %left.0.0.lcssa, %bb14 ] ; <double*> [#uses=3]
  br label %bb1

bb1:                                              ; preds = %bb1, %bb1.outer
  %indvar7 = phi i32 [ 0, %bb1.outer ], [ %indvar.next8, %bb1 ] ; <i32> [#uses=3]
  %tmp11 = xor i32 %indvar7, -1                   ; <i32> [#uses=1]
  %scevgep12 = getelementptr double* %right.0.0.ph, i32 %tmp11 ; <double*> [#uses=5]
  %7 = load double* %scevgep12, align 8           ; <double> [#uses=4]
  %8 = fcmp ogt double %7, %5                     ; <i1> [#uses=1]
  %indvar.next8 = add i32 %indvar7, 1             ; <i32> [#uses=1]
  br i1 %8, label %bb1, label %bb3

bb3:                                              ; preds = %bb1
  %9 = icmp ult double* %left.0.1.ph, %scevgep12  ; <i1> [#uses=1]
  br i1 %9, label %bb8.preheader, label %bb15

bb8.preheader:                                    ; preds = %bb3
  %10 = fcmp olt double %6, %5                    ; <i1> [#uses=1]
  br i1 %10, label %bb7, label %bb10

bb7:                                              ; preds = %bb7, %bb8.preheader
  %indvar = phi i32 [ %tmp, %bb7 ], [ 0, %bb8.preheader ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=2]
  %scevgep = getelementptr double* %left.0.1.ph, i32 %tmp ; <double*> [#uses=2]
  %11 = load double* %scevgep, align 8            ; <double> [#uses=2]
  %12 = fcmp olt double %11, %5                   ; <i1> [#uses=1]
  br i1 %12, label %bb7, label %bb10

bb10:                                             ; preds = %bb7, %bb8.preheader
  %13 = phi double [ %.rle16, %bb8.preheader ], [ %11, %bb7 ] ; <double> [#uses=1]
  %left.0.0.lcssa = phi double* [ %left.0.1.ph, %bb8.preheader ], [ %scevgep, %bb7 ] ; <double*> [#uses=3]
  %14 = icmp ult double* %left.0.0.lcssa, %scevgep12 ; <i1> [#uses=1]
  br i1 %14, label %bb14, label %bb15

bb14:                                             ; preds = %bb10
  store double %13, double* %scevgep12, align 8
  store double %7, double* %left.0.0.lcssa, align 8
  br label %bb1.outer

bb15:                                             ; preds = %bb10, %bb3
  %tmp9 = sub i32 0, %indvar7                     ; <i32> [#uses=1]
  %right.0.0 = getelementptr double* %right.0.0.ph, i32 %tmp9 ; <double*> [#uses=3]
  %15 = ptrtoint double* %right.0.0 to i32        ; <i32> [#uses=3]
  %16 = ptrtoint double* %begin.0.tr4 to i32      ; <i32> [#uses=1]
  %17 = sub i32 %15, %16                          ; <i32> [#uses=1]
  %18 = ashr i32 %17, 3                           ; <i32> [#uses=1]
  %19 = icmp sgt i32 %18, 1                       ; <i1> [#uses=1]
  br i1 %19, label %bb.i, label %_ZN9benchmark9quicksortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEvT_S8_.exit

bb.i:                                             ; preds = %bb15.i, %bb15
  %begin.0.tr4.i = phi double* [ %right.0.0.i, %bb15.i ], [ %begin.0.tr4, %bb15 ] ; <double*> [#uses=3]
  %20 = load double* %begin.0.tr4.i, align 8      ; <double> [#uses=5]
  br label %bb1.outer.i

bb1.outer.i:                                      ; preds = %bb14.i, %bb.i
  %.rle16.i = phi double [ %22, %bb14.i ], [ %20, %bb.i ] ; <double> [#uses=1]
  %21 = phi double [ %22, %bb14.i ], [ %20, %bb.i ] ; <double> [#uses=1]
  %right.0.0.ph.i = phi double* [ %right.0.0, %bb.i ], [ %scevgep12.i, %bb14.i ] ; <double*> [#uses=2]
  %left.0.1.ph.i = phi double* [ %begin.0.tr4.i, %bb.i ], [ %left.0.0.lcssa.i, %bb14.i ] ; <double*> [#uses=3]
  br label %bb1.i

bb1.i:                                            ; preds = %bb1.i, %bb1.outer.i
  %indvar7.i = phi i32 [ 0, %bb1.outer.i ], [ %indvar.next8.i, %bb1.i ] ; <i32> [#uses=3]
  %tmp11.i = xor i32 %indvar7.i, -1               ; <i32> [#uses=1]
  %scevgep12.i = getelementptr double* %right.0.0.ph.i, i32 %tmp11.i ; <double*> [#uses=5]
  %22 = load double* %scevgep12.i, align 8        ; <double> [#uses=4]
  %23 = fcmp ogt double %22, %20                  ; <i1> [#uses=1]
  %indvar.next8.i = add i32 %indvar7.i, 1         ; <i32> [#uses=1]
  br i1 %23, label %bb1.i, label %bb3.i

bb3.i:                                            ; preds = %bb1.i
  %24 = icmp ult double* %left.0.1.ph.i, %scevgep12.i ; <i1> [#uses=1]
  br i1 %24, label %bb8.preheader.i, label %bb15.i

bb8.preheader.i:                                  ; preds = %bb3.i
  %25 = fcmp olt double %21, %20                  ; <i1> [#uses=1]
  br i1 %25, label %bb7.i, label %bb10.i

bb7.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %indvar.i = phi i32 [ %tmp.i, %bb7.i ], [ 0, %bb8.preheader.i ] ; <i32> [#uses=1]
  %tmp.i = add i32 %indvar.i, 1                   ; <i32> [#uses=2]
  %scevgep.i = getelementptr double* %left.0.1.ph.i, i32 %tmp.i ; <double*> [#uses=2]
  %26 = load double* %scevgep.i, align 8          ; <double> [#uses=2]
  %27 = fcmp olt double %26, %20                  ; <i1> [#uses=1]
  br i1 %27, label %bb7.i, label %bb10.i

bb10.i:                                           ; preds = %bb7.i, %bb8.preheader.i
  %28 = phi double [ %.rle16.i, %bb8.preheader.i ], [ %26, %bb7.i ] ; <double> [#uses=1]
  %left.0.0.lcssa.i = phi double* [ %left.0.1.ph.i, %bb8.preheader.i ], [ %scevgep.i, %bb7.i ] ; <double*> [#uses=3]
  %29 = icmp ult double* %left.0.0.lcssa.i, %scevgep12.i ; <i1> [#uses=1]
  br i1 %29, label %bb14.i, label %bb15.i

bb14.i:                                           ; preds = %bb10.i
  store double %28, double* %scevgep12.i, align 8
  store double %22, double* %left.0.0.lcssa.i, align 8
  br label %bb1.outer.i

bb15.i:                                           ; preds = %bb10.i, %bb3.i
  %tmp9.i = sub i32 0, %indvar7.i                 ; <i32> [#uses=1]
  %right.0.0.i = getelementptr double* %right.0.0.ph.i, i32 %tmp9.i ; <double*> [#uses=3]
  tail call fastcc void @_ZN9benchmark9quicksortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEvT_S8_(double* %begin.0.tr4.i, double* %right.0.0.i) nounwind
  %30 = ptrtoint double* %right.0.0.i to i32      ; <i32> [#uses=1]
  %31 = sub i32 %15, %30                          ; <i32> [#uses=1]
  %32 = ashr i32 %31, 3                           ; <i32> [#uses=1]
  %33 = icmp sgt i32 %32, 1                       ; <i1> [#uses=1]
  br i1 %33, label %bb.i, label %_ZN9benchmark9quicksortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEvT_S8_.exit

_ZN9benchmark9quicksortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEvT_S8_.exit: ; preds = %bb15.i, %bb15
  %34 = sub i32 %0, %15                           ; <i32> [#uses=1]
  %35 = ashr i32 %34, 3                           ; <i32> [#uses=1]
  %36 = icmp sgt i32 %35, 1                       ; <i1> [#uses=1]
  br i1 %36, label %bb, label %return

return:                                           ; preds = %_ZN9benchmark9quicksortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEvT_S8_.exit, %entry
  ret void
}

define internal fastcc void @_ZN9benchmark8heapsortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEvT_S8_(double* %begin.0, double* %end.0) nounwind {
entry:
  %0 = ptrtoint double* %end.0 to i32             ; <i32> [#uses=1]
  %1 = ptrtoint double* %begin.0 to i32           ; <i32> [#uses=1]
  %2 = sub i32 %0, %1                             ; <i32> [#uses=1]
  %3 = ashr i32 %2, 3                             ; <i32> [#uses=5]
  %4 = sdiv i32 %3, 2                             ; <i32> [#uses=3]
  %storemerge24 = add i32 %4, -1                  ; <i32> [#uses=2]
  %5 = icmp slt i32 %storemerge24, 0              ; <i1> [#uses=1]
  br i1 %5, label %bb7.loopexit, label %bb.nph26

bb.nph26:                                         ; preds = %entry
  %tmp33 = add i32 %4, -2                         ; <i32> [#uses=1]
  %tmp38 = shl i32 %4, 1                          ; <i32> [#uses=1]
  br label %bb

bb:                                               ; preds = %_ZN9benchmark7sift_inIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEviT_iT0_.exit18, %bb.nph26
  %indvar30 = phi i32 [ 0, %bb.nph26 ], [ %indvar.next31, %_ZN9benchmark7sift_inIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEviT_iT0_.exit18 ] ; <i32> [#uses=4]
  %storemerge = sub i32 %tmp33, %indvar30         ; <i32> [#uses=1]
  %storemerge25 = sub i32 %storemerge24, %indvar30 ; <i32> [#uses=4]
  %tmp37 = mul i32 %indvar30, -2                  ; <i32> [#uses=1]
  %storemerge4.i = add i32 %tmp37, %tmp38         ; <i32> [#uses=3]
  %scevgep40 = getelementptr double* %begin.0, i32 %storemerge25 ; <double*> [#uses=1]
  %6 = load double* %scevgep40, align 8           ; <double> [#uses=2]
  %7 = icmp slt i32 %storemerge4.i, %3            ; <i1> [#uses=1]
  br i1 %7, label %bb.i6, label %bb4.i9

bb.i6:                                            ; preds = %bb.i6, %bb
  %storemerge5.i2 = phi i32 [ %phitmp.i5, %bb.i6 ], [ %storemerge4.i, %bb ] ; <i32> [#uses=3]
  %free.02.i3 = phi i32 [ %16, %bb.i6 ], [ %storemerge25, %bb ] ; <i32> [#uses=1]
  %8 = add i32 %storemerge5.i2, -1                ; <i32> [#uses=1]
  %9 = getelementptr inbounds double* %begin.0, i32 %8 ; <double*> [#uses=1]
  %10 = load double* %9, align 8                  ; <double> [#uses=1]
  %11 = getelementptr inbounds double* %begin.0, i32 %storemerge5.i2 ; <double*> [#uses=1]
  %12 = load double* %11, align 8                 ; <double> [#uses=1]
  %13 = fcmp olt double %10, %12                  ; <i1> [#uses=1]
  %14 = zext i1 %13 to i32                        ; <i32> [#uses=1]
  %i.0.i4 = or i32 %14, %storemerge5.i2           ; <i32> [#uses=2]
  %15 = getelementptr inbounds double* %begin.0, i32 %free.02.i3 ; <double*> [#uses=1]
  %16 = add i32 %i.0.i4, -1                       ; <i32> [#uses=3]
  %17 = getelementptr inbounds double* %begin.0, i32 %16 ; <double*> [#uses=1]
  %18 = load double* %17, align 8                 ; <double> [#uses=1]
  store double %18, double* %15, align 8
  %phitmp.i5 = shl i32 %i.0.i4, 1                 ; <i32> [#uses=3]
  %19 = icmp slt i32 %phitmp.i5, %3               ; <i1> [#uses=1]
  br i1 %19, label %bb.i6, label %bb4.i9

bb4.i9:                                           ; preds = %bb.i6, %bb
  %storemerge.lcssa.i7 = phi i32 [ %storemerge4.i, %bb ], [ %phitmp.i5, %bb.i6 ] ; <i32> [#uses=2]
  %free.0.lcssa.i8 = phi i32 [ %storemerge25, %bb ], [ %16, %bb.i6 ] ; <i32> [#uses=3]
  %20 = icmp eq i32 %storemerge.lcssa.i7, %3      ; <i1> [#uses=1]
  br i1 %20, label %bb5.i10, label %bb8.i16

bb5.i10:                                          ; preds = %bb4.i9
  %21 = getelementptr inbounds double* %begin.0, i32 %free.0.lcssa.i8 ; <double*> [#uses=1]
  %22 = add i32 %storemerge.lcssa.i7, -1          ; <i32> [#uses=3]
  %23 = getelementptr inbounds double* %begin.0, i32 %22 ; <double*> [#uses=1]
  %24 = load double* %23, align 8                 ; <double> [#uses=1]
  store double %24, double* %21, align 8
  br label %bb8.i16

bb7.i11:                                          ; preds = %bb9.i17
  %25 = getelementptr inbounds double* %begin.0, i32 %free.2.i12 ; <double*> [#uses=1]
  store double %28, double* %25, align 8
  br label %bb8.i16

bb8.i16:                                          ; preds = %bb7.i11, %bb5.i10, %bb4.i9
  %free.2.i12 = phi i32 [ %storemerge1.i15, %bb7.i11 ], [ %22, %bb5.i10 ], [ %free.0.lcssa.i8, %bb4.i9 ] ; <i32> [#uses=3]
  %storemerge1.in.in.i13 = phi i32 [ %storemerge1.i15, %bb7.i11 ], [ %22, %bb5.i10 ], [ %free.0.lcssa.i8, %bb4.i9 ] ; <i32> [#uses=1]
  %storemerge1.in.i14 = add i32 %storemerge1.in.in.i13, -1 ; <i32> [#uses=1]
  %storemerge1.i15 = sdiv i32 %storemerge1.in.i14, 2 ; <i32> [#uses=3]
  %26 = icmp sgt i32 %free.2.i12, %storemerge25   ; <i1> [#uses=1]
  br i1 %26, label %bb9.i17, label %_ZN9benchmark7sift_inIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEviT_iT0_.exit18

bb9.i17:                                          ; preds = %bb8.i16
  %27 = getelementptr inbounds double* %begin.0, i32 %storemerge1.i15 ; <double*> [#uses=1]
  %28 = load double* %27, align 8                 ; <double> [#uses=2]
  %29 = fcmp uge double %28, %6                   ; <i1> [#uses=1]
  br i1 %29, label %_ZN9benchmark7sift_inIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEviT_iT0_.exit18, label %bb7.i11

_ZN9benchmark7sift_inIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEviT_iT0_.exit18: ; preds = %bb9.i17, %bb8.i16
  %30 = getelementptr inbounds double* %begin.0, i32 %free.2.i12 ; <double*> [#uses=1]
  store double %6, double* %30, align 8
  %31 = icmp slt i32 %storemerge, 0               ; <i1> [#uses=1]
  %indvar.next31 = add i32 %indvar30, 1           ; <i32> [#uses=1]
  br i1 %31, label %bb7.loopexit, label %bb

bb4:                                              ; preds = %bb7.loopexit, %_ZN9benchmark7sift_inIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEviT_iT0_.exit
  %indvar = phi i32 [ %indvar.next, %_ZN9benchmark7sift_inIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEviT_iT0_.exit ], [ 0, %bb7.loopexit ] ; <i32> [#uses=2]
  %storemerge121 = sub i32 %storemerge120, %indvar ; <i32> [#uses=4]
  %scevgep = getelementptr double* %begin.0, i32 %storemerge121 ; <double*> [#uses=2]
  %32 = load double* %scevgep, align 8            ; <double> [#uses=2]
  %33 = load double* %begin.0, align 8            ; <double> [#uses=1]
  store double %33, double* %scevgep, align 8
  %34 = icmp sgt i32 %storemerge121, 2            ; <i1> [#uses=1]
  br i1 %34, label %bb.i, label %bb4.i

bb.i:                                             ; preds = %bb.i, %bb4
  %storemerge5.i = phi i32 [ %phitmp.i, %bb.i ], [ 2, %bb4 ] ; <i32> [#uses=3]
  %free.02.i = phi i32 [ %43, %bb.i ], [ 0, %bb4 ] ; <i32> [#uses=1]
  %35 = add i32 %storemerge5.i, -1                ; <i32> [#uses=1]
  %36 = getelementptr inbounds double* %begin.0, i32 %35 ; <double*> [#uses=1]
  %37 = load double* %36, align 8                 ; <double> [#uses=1]
  %38 = getelementptr inbounds double* %begin.0, i32 %storemerge5.i ; <double*> [#uses=1]
  %39 = load double* %38, align 8                 ; <double> [#uses=1]
  %40 = fcmp olt double %37, %39                  ; <i1> [#uses=1]
  %41 = zext i1 %40 to i32                        ; <i32> [#uses=1]
  %i.0.i = or i32 %41, %storemerge5.i             ; <i32> [#uses=2]
  %42 = getelementptr inbounds double* %begin.0, i32 %free.02.i ; <double*> [#uses=1]
  %43 = add i32 %i.0.i, -1                        ; <i32> [#uses=3]
  %44 = getelementptr inbounds double* %begin.0, i32 %43 ; <double*> [#uses=1]
  %45 = load double* %44, align 8                 ; <double> [#uses=1]
  store double %45, double* %42, align 8
  %phitmp.i = shl i32 %i.0.i, 1                   ; <i32> [#uses=3]
  %46 = icmp slt i32 %phitmp.i, %storemerge121    ; <i1> [#uses=1]
  br i1 %46, label %bb.i, label %bb4.i

bb4.i:                                            ; preds = %bb.i, %bb4
  %storemerge.lcssa.i = phi i32 [ 2, %bb4 ], [ %phitmp.i, %bb.i ] ; <i32> [#uses=2]
  %free.0.lcssa.i = phi i32 [ 0, %bb4 ], [ %43, %bb.i ] ; <i32> [#uses=3]
  %47 = icmp eq i32 %storemerge.lcssa.i, %storemerge121 ; <i1> [#uses=1]
  br i1 %47, label %bb5.i, label %bb8.i

bb5.i:                                            ; preds = %bb4.i
  %48 = getelementptr inbounds double* %begin.0, i32 %free.0.lcssa.i ; <double*> [#uses=1]
  %49 = add i32 %storemerge.lcssa.i, -1           ; <i32> [#uses=3]
  %50 = getelementptr inbounds double* %begin.0, i32 %49 ; <double*> [#uses=1]
  %51 = load double* %50, align 8                 ; <double> [#uses=1]
  store double %51, double* %48, align 8
  br label %bb8.i

bb7.i:                                            ; preds = %bb9.i
  %52 = getelementptr inbounds double* %begin.0, i32 %free.2.i ; <double*> [#uses=1]
  store double %55, double* %52, align 8
  br label %bb8.i

bb8.i:                                            ; preds = %bb7.i, %bb5.i, %bb4.i
  %free.2.i = phi i32 [ %storemerge1.i, %bb7.i ], [ %49, %bb5.i ], [ %free.0.lcssa.i, %bb4.i ] ; <i32> [#uses=3]
  %storemerge1.in.in.i = phi i32 [ %storemerge1.i, %bb7.i ], [ %49, %bb5.i ], [ %free.0.lcssa.i, %bb4.i ] ; <i32> [#uses=1]
  %storemerge1.in.i = add i32 %storemerge1.in.in.i, -1 ; <i32> [#uses=1]
  %storemerge1.i = sdiv i32 %storemerge1.in.i, 2  ; <i32> [#uses=3]
  %53 = icmp sgt i32 %free.2.i, 0                 ; <i1> [#uses=1]
  br i1 %53, label %bb9.i, label %_ZN9benchmark7sift_inIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEviT_iT0_.exit

bb9.i:                                            ; preds = %bb8.i
  %54 = getelementptr inbounds double* %begin.0, i32 %storemerge1.i ; <double*> [#uses=1]
  %55 = load double* %54, align 8                 ; <double> [#uses=2]
  %56 = fcmp uge double %55, %32                  ; <i1> [#uses=1]
  br i1 %56, label %_ZN9benchmark7sift_inIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEviT_iT0_.exit, label %bb7.i

_ZN9benchmark7sift_inIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEviT_iT0_.exit: ; preds = %bb9.i, %bb8.i
  %57 = getelementptr inbounds double* %begin.0, i32 %free.2.i ; <double*> [#uses=1]
  store double %32, double* %57, align 8
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, %storemerge120 ; <i1> [#uses=1]
  br i1 %exitcond, label %return, label %bb4

bb7.loopexit:                                     ; preds = %_ZN9benchmark7sift_inIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEviT_iT0_.exit18, %entry
  %storemerge120 = add i32 %3, -1                 ; <i32> [#uses=3]
  %58 = icmp sgt i32 %storemerge120, 0            ; <i1> [#uses=1]
  br i1 %58, label %bb4, label %return

return:                                           ; preds = %bb7.loopexit, %_ZN9benchmark7sift_inIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEviT_iT0_.exit
  ret void
}

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_Unwind_Resume_or_Rethrow(i8*)

define internal fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIPdEdEEvT_S4_(%"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"* noalias nocapture %begin, %"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"* noalias nocapture %end) nounwind {
entry:
  %0 = alloca %"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >", align 8 ; <%"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"*> [#uses=2]
  %1 = alloca %"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >", align 8 ; <%"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"*> [#uses=2]
  %2 = alloca %"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >", align 8 ; <%"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"*> [#uses=2]
  %3 = alloca %"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >", align 8 ; <%"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"*> [#uses=2]
  %4 = getelementptr inbounds %"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"* %begin, i32 0, i32 0 ; <double**> [#uses=2]
  %5 = load double** %4, align 4                  ; <double*> [#uses=3]
  %6 = ptrtoint double* %5 to i32                 ; <i32> [#uses=1]
  %7 = getelementptr inbounds %"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"* %end, i32 0, i32 0 ; <double**> [#uses=2]
  %8 = load double** %7, align 4                  ; <double*> [#uses=2]
  %9 = ptrtoint double* %8 to i32                 ; <i32> [#uses=1]
  %10 = sub i32 %6, %9                            ; <i32> [#uses=1]
  %11 = ashr i32 %10, 3                           ; <i32> [#uses=1]
  %12 = icmp sgt i32 %11, 1                       ; <i1> [#uses=1]
  br i1 %12, label %bb, label %return

bb:                                               ; preds = %entry
  %13 = getelementptr inbounds double* %5, i32 -1 ; <double*> [#uses=1]
  %14 = load double* %13, align 8                 ; <double> [#uses=3]
  br label %bb1.outer

bb1.outer:                                        ; preds = %bb14, %bb
  %left.0.1.ph = phi double* [ %5, %bb ], [ %left.0.0.lcssa, %bb14 ] ; <double*> [#uses=5]
  %right.0.0.ph = phi double* [ %8, %bb ], [ %scevgep12, %bb14 ] ; <double*> [#uses=2]
  br label %bb1

bb1:                                              ; preds = %bb1, %bb1.outer
  %indvar8 = phi i32 [ 0, %bb1.outer ], [ %tmp11, %bb1 ] ; <i32> [#uses=2]
  %right.0.0 = getelementptr double* %right.0.0.ph, i32 %indvar8 ; <double*> [#uses=4]
  %tmp11 = add i32 %indvar8, 1                    ; <i32> [#uses=2]
  %15 = load double* %right.0.0, align 8          ; <double> [#uses=2]
  %16 = fcmp ogt double %15, %14                  ; <i1> [#uses=1]
  br i1 %16, label %bb1, label %bb3

bb3:                                              ; preds = %bb1
  %scevgep12 = getelementptr double* %right.0.0.ph, i32 %tmp11 ; <double*> [#uses=3]
  %17 = icmp ult double* %scevgep12, %left.0.1.ph ; <i1> [#uses=1]
  br i1 %17, label %bb8.preheader, label %bb15

bb8.preheader:                                    ; preds = %bb3
  %18 = getelementptr inbounds double* %left.0.1.ph, i32 -1 ; <double*> [#uses=1]
  %19 = load double* %18, align 8                 ; <double> [#uses=1]
  %20 = fcmp olt double %19, %14                  ; <i1> [#uses=1]
  br i1 %20, label %bb7, label %bb10

bb7:                                              ; preds = %bb7, %bb8.preheader
  %indvar = phi i32 [ %indvar.next, %bb7 ], [ 0, %bb8.preheader ] ; <i32> [#uses=3]
  %tmp4 = sub i32 -2, %indvar                     ; <i32> [#uses=1]
  %scevgep = getelementptr double* %left.0.1.ph, i32 %tmp4 ; <double*> [#uses=1]
  %21 = load double* %scevgep, align 8            ; <double> [#uses=1]
  %22 = fcmp olt double %21, %14                  ; <i1> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br i1 %22, label %bb7, label %bb10.loopexit

bb10.loopexit:                                    ; preds = %bb7
  %tmp5 = xor i32 %indvar, -1                     ; <i32> [#uses=1]
  %scevgep6 = getelementptr double* %left.0.1.ph, i32 %tmp5 ; <double*> [#uses=1]
  br label %bb10

bb10:                                             ; preds = %bb10.loopexit, %bb8.preheader
  %left.0.0.lcssa = phi double* [ %left.0.1.ph, %bb8.preheader ], [ %scevgep6, %bb10.loopexit ] ; <double*> [#uses=3]
  %23 = icmp ult double* %scevgep12, %left.0.0.lcssa ; <i1> [#uses=1]
  br i1 %23, label %bb14, label %bb15

bb14:                                             ; preds = %bb10
  %24 = getelementptr inbounds double* %left.0.0.lcssa, i32 -1 ; <double*> [#uses=2]
  %25 = load double* %24, align 8                 ; <double> [#uses=1]
  store double %25, double* %right.0.0, align 8
  store double %15, double* %24, align 8
  br label %bb1.outer

bb15:                                             ; preds = %bb10, %bb3
  %26 = getelementptr inbounds %"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"* %3, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %right.0.0, double** %26, align 8
  %27 = load double** %4, align 4                 ; <double*> [#uses=1]
  %28 = getelementptr inbounds %"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"* %2, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %27, double** %28, align 8
  call fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIPdEdEEvT_S4_(%"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"* noalias %2, %"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"* noalias %3)
  %29 = load double** %7, align 4                 ; <double*> [#uses=1]
  %30 = getelementptr inbounds %"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"* %1, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %29, double** %30, align 8
  %31 = getelementptr inbounds %"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"* %0, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %right.0.0, double** %31, align 8
  call fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIPdEdEEvT_S4_(%"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"* noalias %0, %"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"* noalias %1)
  ret void

return:                                           ; preds = %entry
  ret void
}

define internal fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_(%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias nocapture %begin, %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias nocapture %end) nounwind {
entry:
  %0 = alloca %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >", align 8 ; <%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"*> [#uses=2]
  %1 = alloca %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >", align 8 ; <%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"*> [#uses=2]
  %2 = alloca %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >", align 8 ; <%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"*> [#uses=2]
  %3 = alloca %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >", align 8 ; <%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"*> [#uses=2]
  %4 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %end, i32 0, i32 0, i32 0 ; <double**> [#uses=2]
  %5 = load double** %4, align 4                  ; <double*> [#uses=2]
  %6 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %begin, i32 0, i32 0, i32 0 ; <double**> [#uses=2]
  %7 = load double** %6, align 4                  ; <double*> [#uses=3]
  %8 = ptrtoint double* %7 to i32                 ; <i32> [#uses=1]
  %9 = ptrtoint double* %5 to i32                 ; <i32> [#uses=1]
  %10 = sub i32 %8, %9                            ; <i32> [#uses=1]
  %11 = ashr i32 %10, 3                           ; <i32> [#uses=1]
  %12 = icmp sgt i32 %11, 1                       ; <i1> [#uses=1]
  br i1 %12, label %bb, label %return

bb:                                               ; preds = %entry
  %13 = getelementptr inbounds double* %7, i32 -1 ; <double*> [#uses=1]
  %14 = load double* %13, align 8                 ; <double> [#uses=3]
  br label %bb1.outer

bb1.outer:                                        ; preds = %bb14, %bb
  %left.0.0.1.ph = phi double* [ %7, %bb ], [ %left.0.0.0.lcssa, %bb14 ] ; <double*> [#uses=5]
  %right.0.0.0.ph = phi double* [ %5, %bb ], [ %scevgep12, %bb14 ] ; <double*> [#uses=2]
  br label %bb1

bb1:                                              ; preds = %bb1, %bb1.outer
  %indvar8 = phi i32 [ 0, %bb1.outer ], [ %tmp11, %bb1 ] ; <i32> [#uses=2]
  %right.0.0.0 = getelementptr double* %right.0.0.0.ph, i32 %indvar8 ; <double*> [#uses=4]
  %tmp11 = add i32 %indvar8, 1                    ; <i32> [#uses=2]
  %15 = load double* %right.0.0.0, align 8        ; <double> [#uses=2]
  %16 = fcmp ogt double %15, %14                  ; <i1> [#uses=1]
  br i1 %16, label %bb1, label %bb3

bb3:                                              ; preds = %bb1
  %scevgep12 = getelementptr double* %right.0.0.0.ph, i32 %tmp11 ; <double*> [#uses=3]
  %17 = icmp ult double* %scevgep12, %left.0.0.1.ph ; <i1> [#uses=1]
  br i1 %17, label %bb8.preheader, label %bb15

bb8.preheader:                                    ; preds = %bb3
  %18 = getelementptr inbounds double* %left.0.0.1.ph, i32 -1 ; <double*> [#uses=1]
  %19 = load double* %18, align 8                 ; <double> [#uses=1]
  %20 = fcmp olt double %19, %14                  ; <i1> [#uses=1]
  br i1 %20, label %bb7, label %bb10

bb7:                                              ; preds = %bb7, %bb8.preheader
  %indvar = phi i32 [ %indvar.next, %bb7 ], [ 0, %bb8.preheader ] ; <i32> [#uses=3]
  %tmp4 = sub i32 -2, %indvar                     ; <i32> [#uses=1]
  %scevgep = getelementptr double* %left.0.0.1.ph, i32 %tmp4 ; <double*> [#uses=1]
  %21 = load double* %scevgep, align 8            ; <double> [#uses=1]
  %22 = fcmp olt double %21, %14                  ; <i1> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br i1 %22, label %bb7, label %bb10.loopexit

bb10.loopexit:                                    ; preds = %bb7
  %tmp5 = xor i32 %indvar, -1                     ; <i32> [#uses=1]
  %scevgep6 = getelementptr double* %left.0.0.1.ph, i32 %tmp5 ; <double*> [#uses=1]
  br label %bb10

bb10:                                             ; preds = %bb10.loopexit, %bb8.preheader
  %left.0.0.0.lcssa = phi double* [ %left.0.0.1.ph, %bb8.preheader ], [ %scevgep6, %bb10.loopexit ] ; <double*> [#uses=3]
  %23 = icmp ult double* %scevgep12, %left.0.0.0.lcssa ; <i1> [#uses=1]
  br i1 %23, label %bb14, label %bb15

bb14:                                             ; preds = %bb10
  %24 = getelementptr inbounds double* %left.0.0.0.lcssa, i32 -1 ; <double*> [#uses=2]
  %25 = load double* %24, align 8                 ; <double> [#uses=1]
  store double %25, double* %right.0.0.0, align 8
  store double %15, double* %24, align 8
  br label %bb1.outer

bb15:                                             ; preds = %bb10, %bb3
  %26 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %3, i32 0, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %right.0.0.0, double** %26, align 8
  %27 = load double** %6, align 4                 ; <double*> [#uses=1]
  %28 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %2, i32 0, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %27, double** %28, align 8
  call fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_(%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %2, %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %3)
  %29 = load double** %4, align 4                 ; <double*> [#uses=1]
  %30 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %1, i32 0, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %29, double** %30, align 8
  %31 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %0, i32 0, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %right.0.0.0, double** %31, align 8
  call fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_(%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %0, %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %1)
  ret void

return:                                           ; preds = %entry
  ret void
}

define internal fastcc void @_ZN9benchmark8heapsortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_(%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias nocapture %begin, double* %end.0.0.0.val) nounwind {
entry:
  %0 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %begin, i32 0, i32 0, i32 0 ; <double**> [#uses=3]
  %1 = load double** %0, align 4                  ; <double*> [#uses=11]
  %2 = ptrtoint double* %1 to i32                 ; <i32> [#uses=1]
  %3 = ptrtoint double* %end.0.0.0.val to i32     ; <i32> [#uses=1]
  %4 = sub i32 %2, %3                             ; <i32> [#uses=1]
  %5 = ashr i32 %4, 3                             ; <i32> [#uses=6]
  %6 = sdiv i32 %5, 2                             ; <i32> [#uses=3]
  %j.07 = add i32 %6, -1                          ; <i32> [#uses=2]
  %7 = icmp slt i32 %j.07, 0                      ; <i1> [#uses=1]
  br i1 %7, label %bb5.loopexit, label %bb.nph9

bb.nph9:                                          ; preds = %entry
  %tmp18 = add i32 %6, -2                         ; <i32> [#uses=1]
  br label %bb

bb:                                               ; preds = %_ZN9benchmark7sift_inISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEviT_iT0_.exit26, %bb.nph9
  %indvar15 = phi i32 [ 0, %bb.nph9 ], [ %indvar.next16, %_ZN9benchmark7sift_inISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEviT_iT0_.exit26 ] ; <i32> [#uses=4]
  %j.08 = sub i32 %j.07, %indvar15                ; <i32> [#uses=4]
  %tmp23 = sub i32 %indvar15, %6                  ; <i32> [#uses=1]
  %scevgep24 = getelementptr double* %1, i32 %tmp23 ; <double*> [#uses=1]
  %8 = load double* %scevgep24, align 8           ; <double> [#uses=2]
  %9 = shl i32 %j.08, 1                           ; <i32> [#uses=1]
  %i.112.i = add i32 %9, 2                        ; <i32> [#uses=3]
  %10 = icmp slt i32 %i.112.i, %5                 ; <i1> [#uses=1]
  br i1 %10, label %bb.i9, label %bb4.i12

bb.i9:                                            ; preds = %bb.i9, %bb
  %i.113.i1 = phi i32 [ %phitmp.i8, %bb.i9 ], [ %i.112.i, %bb ] ; <i32> [#uses=3]
  %free.010.i2 = phi i32 [ %20, %bb.i9 ], [ %j.08, %bb ] ; <i32> [#uses=1]
  %.sum3.i3 = sub i32 0, %i.113.i1                ; <i32> [#uses=1]
  %11 = getelementptr inbounds double* %1, i32 %.sum3.i3 ; <double*> [#uses=1]
  %12 = load double* %11, align 8                 ; <double> [#uses=1]
  %.sum2.i4 = xor i32 %i.113.i1, -1               ; <i32> [#uses=1]
  %13 = getelementptr inbounds double* %1, i32 %.sum2.i4 ; <double*> [#uses=1]
  %14 = load double* %13, align 8                 ; <double> [#uses=1]
  %15 = fcmp olt double %12, %14                  ; <i1> [#uses=1]
  %16 = zext i1 %15 to i32                        ; <i32> [#uses=1]
  %i.0.i5 = or i32 %16, %i.113.i1                 ; <i32> [#uses=3]
  %.sum1.i6 = xor i32 %free.010.i2, -1            ; <i32> [#uses=1]
  %17 = getelementptr inbounds double* %1, i32 %.sum1.i6 ; <double*> [#uses=1]
  %.sum.i7 = sub i32 0, %i.0.i5                   ; <i32> [#uses=1]
  %18 = getelementptr inbounds double* %1, i32 %.sum.i7 ; <double*> [#uses=1]
  %19 = load double* %18, align 8                 ; <double> [#uses=1]
  store double %19, double* %17, align 8
  %20 = add i32 %i.0.i5, -1                       ; <i32> [#uses=2]
  %phitmp.i8 = shl i32 %i.0.i5, 1                 ; <i32> [#uses=3]
  %21 = icmp slt i32 %phitmp.i8, %5               ; <i1> [#uses=1]
  br i1 %21, label %bb.i9, label %bb4.i12

bb4.i12:                                          ; preds = %bb.i9, %bb
  %i.1.lcssa.i10 = phi i32 [ %i.112.i, %bb ], [ %phitmp.i8, %bb.i9 ] ; <i32> [#uses=3]
  %free.0.lcssa.i11 = phi i32 [ %j.08, %bb ], [ %20, %bb.i9 ] ; <i32> [#uses=3]
  %22 = icmp eq i32 %i.1.lcssa.i10, %5            ; <i1> [#uses=1]
  br i1 %22, label %bb5.i15, label %bb8.i22

bb5.i15:                                          ; preds = %bb4.i12
  %.sum5.i13 = xor i32 %free.0.lcssa.i11, -1      ; <i32> [#uses=1]
  %23 = getelementptr inbounds double* %1, i32 %.sum5.i13 ; <double*> [#uses=1]
  %.sum4.i14 = sub i32 0, %i.1.lcssa.i10          ; <i32> [#uses=1]
  %24 = getelementptr inbounds double* %1, i32 %.sum4.i14 ; <double*> [#uses=1]
  %25 = load double* %24, align 8                 ; <double> [#uses=1]
  store double %25, double* %23, align 8
  %26 = add i32 %i.1.lcssa.i10, -1                ; <i32> [#uses=2]
  br label %bb8.i22

bb7.i17:                                          ; preds = %bb9.i24
  %.sum7.i16 = xor i32 %free.2.i18, -1            ; <i32> [#uses=1]
  %27 = getelementptr inbounds double* %1, i32 %.sum7.i16 ; <double*> [#uses=1]
  store double %30, double* %27, align 8
  br label %bb8.i22

bb8.i22:                                          ; preds = %bb7.i17, %bb5.i15, %bb4.i12
  %free.2.i18 = phi i32 [ %i.2.i21, %bb7.i17 ], [ %26, %bb5.i15 ], [ %free.0.lcssa.i11, %bb4.i12 ] ; <i32> [#uses=3]
  %i.2.in.in.i19 = phi i32 [ %i.2.i21, %bb7.i17 ], [ %26, %bb5.i15 ], [ %free.0.lcssa.i11, %bb4.i12 ] ; <i32> [#uses=1]
  %i.2.in.i20 = add i32 %i.2.in.in.i19, -1        ; <i32> [#uses=1]
  %i.2.i21 = sdiv i32 %i.2.in.i20, 2              ; <i32> [#uses=3]
  %28 = icmp sgt i32 %free.2.i18, %j.08           ; <i1> [#uses=1]
  br i1 %28, label %bb9.i24, label %_ZN9benchmark7sift_inISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEviT_iT0_.exit26

bb9.i24:                                          ; preds = %bb8.i22
  %.sum8.i23 = xor i32 %i.2.i21, -1               ; <i32> [#uses=1]
  %29 = getelementptr inbounds double* %1, i32 %.sum8.i23 ; <double*> [#uses=1]
  %30 = load double* %29, align 8                 ; <double> [#uses=2]
  %31 = fcmp uge double %30, %8                   ; <i1> [#uses=1]
  br i1 %31, label %_ZN9benchmark7sift_inISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEviT_iT0_.exit26, label %bb7.i17

_ZN9benchmark7sift_inISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEviT_iT0_.exit26: ; preds = %bb9.i24, %bb8.i22
  %.sum9.i25 = xor i32 %free.2.i18, -1            ; <i32> [#uses=1]
  %32 = getelementptr inbounds double* %1, i32 %.sum9.i25 ; <double*> [#uses=1]
  store double %8, double* %32, align 8
  %j.0 = sub i32 %tmp18, %indvar15                ; <i32> [#uses=1]
  %33 = icmp slt i32 %j.0, 0                      ; <i1> [#uses=1]
  %indvar.next16 = add i32 %indvar15, 1           ; <i32> [#uses=1]
  br i1 %33, label %bb5.loopexit, label %bb

bb4:                                              ; preds = %bb5.loopexit, %_ZN9benchmark7sift_inISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEviT_iT0_.exit
  %indvar = phi i32 [ %indvar.next, %_ZN9benchmark7sift_inISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEviT_iT0_.exit ], [ 0, %bb5.loopexit ] ; <i32> [#uses=3]
  %j.15 = sub i32 %j.14, %indvar                  ; <i32> [#uses=3]
  %tmp13 = sub i32 %indvar, %5                    ; <i32> [#uses=1]
  %34 = load double** %0, align 4                 ; <double*> [#uses=2]
  %scevgep14 = getelementptr double* %34, i32 %tmp13 ; <double*> [#uses=2]
  %35 = load double* %scevgep14, align 8          ; <double> [#uses=2]
  %36 = getelementptr inbounds double* %34, i32 -1 ; <double*> [#uses=1]
  %37 = load double* %36, align 8                 ; <double> [#uses=1]
  store double %37, double* %scevgep14, align 8
  %38 = load double** %0, align 4                 ; <double*> [#uses=9]
  %39 = icmp sgt i32 %j.15, 2                     ; <i1> [#uses=1]
  br i1 %39, label %bb.i, label %bb4.i

bb.i:                                             ; preds = %bb.i, %bb4
  %i.113.i = phi i32 [ %phitmp.i, %bb.i ], [ 2, %bb4 ] ; <i32> [#uses=3]
  %free.010.i = phi i32 [ %49, %bb.i ], [ 0, %bb4 ] ; <i32> [#uses=1]
  %.sum3.i = sub i32 0, %i.113.i                  ; <i32> [#uses=1]
  %40 = getelementptr inbounds double* %38, i32 %.sum3.i ; <double*> [#uses=1]
  %41 = load double* %40, align 8                 ; <double> [#uses=1]
  %.sum2.i = xor i32 %i.113.i, -1                 ; <i32> [#uses=1]
  %42 = getelementptr inbounds double* %38, i32 %.sum2.i ; <double*> [#uses=1]
  %43 = load double* %42, align 8                 ; <double> [#uses=1]
  %44 = fcmp olt double %41, %43                  ; <i1> [#uses=1]
  %45 = zext i1 %44 to i32                        ; <i32> [#uses=1]
  %i.0.i = or i32 %45, %i.113.i                   ; <i32> [#uses=3]
  %.sum1.i = xor i32 %free.010.i, -1              ; <i32> [#uses=1]
  %46 = getelementptr inbounds double* %38, i32 %.sum1.i ; <double*> [#uses=1]
  %.sum.i = sub i32 0, %i.0.i                     ; <i32> [#uses=1]
  %47 = getelementptr inbounds double* %38, i32 %.sum.i ; <double*> [#uses=1]
  %48 = load double* %47, align 8                 ; <double> [#uses=1]
  store double %48, double* %46, align 8
  %49 = add i32 %i.0.i, -1                        ; <i32> [#uses=2]
  %phitmp.i = shl i32 %i.0.i, 1                   ; <i32> [#uses=3]
  %50 = icmp slt i32 %phitmp.i, %j.15             ; <i1> [#uses=1]
  br i1 %50, label %bb.i, label %bb4.i

bb4.i:                                            ; preds = %bb.i, %bb4
  %i.1.lcssa.i = phi i32 [ 2, %bb4 ], [ %phitmp.i, %bb.i ] ; <i32> [#uses=3]
  %free.0.lcssa.i = phi i32 [ 0, %bb4 ], [ %49, %bb.i ] ; <i32> [#uses=3]
  %51 = icmp eq i32 %i.1.lcssa.i, %j.15           ; <i1> [#uses=1]
  br i1 %51, label %bb5.i, label %bb8.i

bb5.i:                                            ; preds = %bb4.i
  %.sum5.i = xor i32 %free.0.lcssa.i, -1          ; <i32> [#uses=1]
  %52 = getelementptr inbounds double* %38, i32 %.sum5.i ; <double*> [#uses=1]
  %.sum4.i = sub i32 0, %i.1.lcssa.i              ; <i32> [#uses=1]
  %53 = getelementptr inbounds double* %38, i32 %.sum4.i ; <double*> [#uses=1]
  %54 = load double* %53, align 8                 ; <double> [#uses=1]
  store double %54, double* %52, align 8
  %55 = add i32 %i.1.lcssa.i, -1                  ; <i32> [#uses=2]
  br label %bb8.i

bb7.i:                                            ; preds = %bb9.i
  %.sum7.i = xor i32 %free.2.i, -1                ; <i32> [#uses=1]
  %56 = getelementptr inbounds double* %38, i32 %.sum7.i ; <double*> [#uses=1]
  store double %59, double* %56, align 8
  br label %bb8.i

bb8.i:                                            ; preds = %bb7.i, %bb5.i, %bb4.i
  %free.2.i = phi i32 [ %i.2.i, %bb7.i ], [ %55, %bb5.i ], [ %free.0.lcssa.i, %bb4.i ] ; <i32> [#uses=3]
  %i.2.in.in.i = phi i32 [ %i.2.i, %bb7.i ], [ %55, %bb5.i ], [ %free.0.lcssa.i, %bb4.i ] ; <i32> [#uses=1]
  %i.2.in.i = add i32 %i.2.in.in.i, -1            ; <i32> [#uses=1]
  %i.2.i = sdiv i32 %i.2.in.i, 2                  ; <i32> [#uses=3]
  %57 = icmp sgt i32 %free.2.i, 0                 ; <i1> [#uses=1]
  br i1 %57, label %bb9.i, label %_ZN9benchmark7sift_inISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEviT_iT0_.exit

bb9.i:                                            ; preds = %bb8.i
  %.sum8.i = xor i32 %i.2.i, -1                   ; <i32> [#uses=1]
  %58 = getelementptr inbounds double* %38, i32 %.sum8.i ; <double*> [#uses=1]
  %59 = load double* %58, align 8                 ; <double> [#uses=2]
  %60 = fcmp uge double %59, %35                  ; <i1> [#uses=1]
  br i1 %60, label %_ZN9benchmark7sift_inISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEviT_iT0_.exit, label %bb7.i

_ZN9benchmark7sift_inISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEviT_iT0_.exit: ; preds = %bb9.i, %bb8.i
  %.sum9.i = xor i32 %free.2.i, -1                ; <i32> [#uses=1]
  %61 = getelementptr inbounds double* %38, i32 %.sum9.i ; <double*> [#uses=1]
  store double %35, double* %61, align 8
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, %j.14     ; <i1> [#uses=1]
  br i1 %exitcond, label %return, label %bb4

bb5.loopexit:                                     ; preds = %_ZN9benchmark7sift_inISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEviT_iT0_.exit26, %entry
  %j.14 = add i32 %5, -1                          ; <i32> [#uses=3]
  %62 = icmp sgt i32 %j.14, 0                     ; <i1> [#uses=1]
  br i1 %62, label %bb4, label %return

return:                                           ; preds = %bb5.loopexit, %_ZN9benchmark7sift_inISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEviT_iT0_.exit
  ret void
}

define internal fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIS1_IPdEEdEEvT_S5_(%"struct.std::reverse_iterator<std::reverse_iterator<double*> >"* noalias nocapture %begin, %"struct.std::reverse_iterator<std::reverse_iterator<double*> >"* noalias nocapture %end) nounwind {
entry:
  %0 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<double*> >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<double*> >"*> [#uses=2]
  %1 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<double*> >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<double*> >"*> [#uses=2]
  %2 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<double*> >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<double*> >"*> [#uses=2]
  %3 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<double*> >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<double*> >"*> [#uses=2]
  %4 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<double*> >"* %end, i32 0, i32 1, i32 0 ; <double**> [#uses=2]
  %5 = load double** %4, align 4                  ; <double*> [#uses=2]
  %6 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<double*> >"* %begin, i32 0, i32 1, i32 0 ; <double**> [#uses=2]
  %7 = load double** %6, align 4                  ; <double*> [#uses=3]
  %8 = ptrtoint double* %5 to i32                 ; <i32> [#uses=1]
  %9 = ptrtoint double* %7 to i32                 ; <i32> [#uses=1]
  %10 = sub i32 %8, %9                            ; <i32> [#uses=1]
  %11 = ashr i32 %10, 3                           ; <i32> [#uses=1]
  %12 = icmp sgt i32 %11, 1                       ; <i1> [#uses=1]
  br i1 %12, label %bb, label %return

bb:                                               ; preds = %entry
  %13 = load double* %7, align 8                  ; <double> [#uses=5]
  br label %bb1.outer

bb1.outer:                                        ; preds = %bb14, %bb
  %.rle14 = phi double [ %15, %bb14 ], [ %13, %bb ] ; <double> [#uses=1]
  %14 = phi double [ %15, %bb14 ], [ %13, %bb ]   ; <double> [#uses=1]
  %left.1.0.1.ph = phi double* [ %7, %bb ], [ %left.1.0.0.lcssa, %bb14 ] ; <double*> [#uses=3]
  %right.1.0.0.ph = phi double* [ %5, %bb ], [ %scevgep10, %bb14 ] ; <double*> [#uses=2]
  br label %bb1

bb1:                                              ; preds = %bb1, %bb1.outer
  %indvar5 = phi i32 [ 0, %bb1.outer ], [ %indvar.next6, %bb1 ] ; <i32> [#uses=3]
  %tmp9 = xor i32 %indvar5, -1                    ; <i32> [#uses=1]
  %scevgep10 = getelementptr double* %right.1.0.0.ph, i32 %tmp9 ; <double*> [#uses=5]
  %15 = load double* %scevgep10, align 8          ; <double> [#uses=4]
  %16 = fcmp ogt double %15, %13                  ; <i1> [#uses=1]
  %indvar.next6 = add i32 %indvar5, 1             ; <i32> [#uses=1]
  br i1 %16, label %bb1, label %bb3

bb3:                                              ; preds = %bb1
  %17 = icmp ult double* %left.1.0.1.ph, %scevgep10 ; <i1> [#uses=1]
  br i1 %17, label %bb8.preheader, label %bb15

bb8.preheader:                                    ; preds = %bb3
  %18 = fcmp olt double %14, %13                  ; <i1> [#uses=1]
  br i1 %18, label %bb7, label %bb10

bb7:                                              ; preds = %bb7, %bb8.preheader
  %indvar = phi i32 [ %tmp, %bb7 ], [ 0, %bb8.preheader ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=2]
  %scevgep = getelementptr double* %left.1.0.1.ph, i32 %tmp ; <double*> [#uses=2]
  %19 = load double* %scevgep, align 8            ; <double> [#uses=2]
  %20 = fcmp olt double %19, %13                  ; <i1> [#uses=1]
  br i1 %20, label %bb7, label %bb10

bb10:                                             ; preds = %bb7, %bb8.preheader
  %21 = phi double [ %.rle14, %bb8.preheader ], [ %19, %bb7 ] ; <double> [#uses=1]
  %left.1.0.0.lcssa = phi double* [ %left.1.0.1.ph, %bb8.preheader ], [ %scevgep, %bb7 ] ; <double*> [#uses=3]
  %22 = icmp ult double* %left.1.0.0.lcssa, %scevgep10 ; <i1> [#uses=1]
  br i1 %22, label %bb14, label %bb15

bb14:                                             ; preds = %bb10
  store double %21, double* %scevgep10, align 8
  store double %15, double* %left.1.0.0.lcssa, align 8
  br label %bb1.outer

bb15:                                             ; preds = %bb10, %bb3
  %tmp7 = sub i32 0, %indvar5                     ; <i32> [#uses=1]
  %right.1.0.0 = getelementptr double* %right.1.0.0.ph, i32 %tmp7 ; <double*> [#uses=2]
  %23 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<double*> >"* %3, i32 0, i32 1, i32 0 ; <double**> [#uses=1]
  store double* %right.1.0.0, double** %23, align 4
  %24 = load double** %6, align 4                 ; <double*> [#uses=1]
  %25 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<double*> >"* %2, i32 0, i32 1, i32 0 ; <double**> [#uses=1]
  store double* %24, double** %25, align 4
  call fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIS1_IPdEEdEEvT_S5_(%"struct.std::reverse_iterator<std::reverse_iterator<double*> >"* noalias %2, %"struct.std::reverse_iterator<std::reverse_iterator<double*> >"* noalias %3)
  %26 = load double** %4, align 4                 ; <double*> [#uses=1]
  %27 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<double*> >"* %1, i32 0, i32 1, i32 0 ; <double**> [#uses=1]
  store double* %26, double** %27, align 4
  %28 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<double*> >"* %0, i32 0, i32 1, i32 0 ; <double**> [#uses=1]
  store double* %right.1.0.0, double** %28, align 4
  call fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIS1_IPdEEdEEvT_S5_(%"struct.std::reverse_iterator<std::reverse_iterator<double*> >"* noalias %0, %"struct.std::reverse_iterator<std::reverse_iterator<double*> >"* noalias %1)
  ret void

return:                                           ; preds = %entry
  ret void
}

define internal fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_(%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias nocapture %begin, %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias nocapture %end) nounwind {
entry:
  %0 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"*> [#uses=2]
  %1 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"*> [#uses=2]
  %2 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"*> [#uses=2]
  %3 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"*> [#uses=2]
  %4 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %end, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=2]
  %5 = load double** %4, align 4                  ; <double*> [#uses=2]
  %6 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %begin, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=2]
  %7 = load double** %6, align 4                  ; <double*> [#uses=3]
  %8 = ptrtoint double* %5 to i32                 ; <i32> [#uses=1]
  %9 = ptrtoint double* %7 to i32                 ; <i32> [#uses=1]
  %10 = sub i32 %8, %9                            ; <i32> [#uses=1]
  %11 = ashr i32 %10, 3                           ; <i32> [#uses=1]
  %12 = icmp sgt i32 %11, 1                       ; <i1> [#uses=1]
  br i1 %12, label %bb, label %return

bb:                                               ; preds = %entry
  %13 = load double* %7, align 8                  ; <double> [#uses=5]
  br label %bb1.outer

bb1.outer:                                        ; preds = %bb14, %bb
  %.rle14 = phi double [ %15, %bb14 ], [ %13, %bb ] ; <double> [#uses=1]
  %14 = phi double [ %15, %bb14 ], [ %13, %bb ]   ; <double> [#uses=1]
  %left.1.0.0.1.ph = phi double* [ %7, %bb ], [ %left.1.0.0.0.lcssa, %bb14 ] ; <double*> [#uses=3]
  %right.1.0.0.0.ph = phi double* [ %5, %bb ], [ %scevgep10, %bb14 ] ; <double*> [#uses=2]
  br label %bb1

bb1:                                              ; preds = %bb1, %bb1.outer
  %indvar5 = phi i32 [ 0, %bb1.outer ], [ %indvar.next6, %bb1 ] ; <i32> [#uses=3]
  %tmp9 = xor i32 %indvar5, -1                    ; <i32> [#uses=1]
  %scevgep10 = getelementptr double* %right.1.0.0.0.ph, i32 %tmp9 ; <double*> [#uses=5]
  %15 = load double* %scevgep10, align 8          ; <double> [#uses=4]
  %16 = fcmp ogt double %15, %13                  ; <i1> [#uses=1]
  %indvar.next6 = add i32 %indvar5, 1             ; <i32> [#uses=1]
  br i1 %16, label %bb1, label %bb3

bb3:                                              ; preds = %bb1
  %17 = icmp ult double* %left.1.0.0.1.ph, %scevgep10 ; <i1> [#uses=1]
  br i1 %17, label %bb8.preheader, label %bb15

bb8.preheader:                                    ; preds = %bb3
  %18 = fcmp olt double %14, %13                  ; <i1> [#uses=1]
  br i1 %18, label %bb7, label %bb10

bb7:                                              ; preds = %bb7, %bb8.preheader
  %indvar = phi i32 [ %tmp, %bb7 ], [ 0, %bb8.preheader ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=2]
  %scevgep = getelementptr double* %left.1.0.0.1.ph, i32 %tmp ; <double*> [#uses=2]
  %19 = load double* %scevgep, align 8            ; <double> [#uses=2]
  %20 = fcmp olt double %19, %13                  ; <i1> [#uses=1]
  br i1 %20, label %bb7, label %bb10

bb10:                                             ; preds = %bb7, %bb8.preheader
  %21 = phi double [ %.rle14, %bb8.preheader ], [ %19, %bb7 ] ; <double> [#uses=1]
  %left.1.0.0.0.lcssa = phi double* [ %left.1.0.0.1.ph, %bb8.preheader ], [ %scevgep, %bb7 ] ; <double*> [#uses=3]
  %22 = icmp ult double* %left.1.0.0.0.lcssa, %scevgep10 ; <i1> [#uses=1]
  br i1 %22, label %bb14, label %bb15

bb14:                                             ; preds = %bb10
  store double %21, double* %scevgep10, align 8
  store double %15, double* %left.1.0.0.0.lcssa, align 8
  br label %bb1.outer

bb15:                                             ; preds = %bb10, %bb3
  %tmp7 = sub i32 0, %indvar5                     ; <i32> [#uses=1]
  %right.1.0.0.0 = getelementptr double* %right.1.0.0.0.ph, i32 %tmp7 ; <double*> [#uses=2]
  %23 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %3, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %right.1.0.0.0, double** %23, align 4
  %24 = load double** %6, align 4                 ; <double*> [#uses=1]
  %25 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %2, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %24, double** %25, align 4
  call fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_(%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %2, %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %3)
  %26 = load double** %4, align 4                 ; <double*> [#uses=1]
  %27 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %1, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %26, double** %27, align 4
  %28 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %0, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %right.1.0.0.0, double** %28, align 4
  call fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_(%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %0, %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %1)
  ret void

return:                                           ; preds = %entry
  ret void
}

define internal fastcc void @_ZN9benchmark8heapsortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_(%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias nocapture %begin, double* %end.0.1.0.0.val) nounwind {
entry:
  %0 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %begin, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=4]
  %1 = load double** %0, align 4                  ; <double*> [#uses=1]
  %2 = ptrtoint double* %end.0.1.0.0.val to i32   ; <i32> [#uses=1]
  %3 = ptrtoint double* %1 to i32                 ; <i32> [#uses=1]
  %4 = sub i32 %2, %3                             ; <i32> [#uses=1]
  %5 = ashr i32 %4, 3                             ; <i32> [#uses=5]
  %6 = sdiv i32 %5, 2                             ; <i32> [#uses=3]
  %j.028 = add i32 %6, -1                         ; <i32> [#uses=2]
  %7 = icmp slt i32 %j.028, 0                     ; <i1> [#uses=1]
  br i1 %7, label %bb5.loopexit, label %bb.nph30

bb.nph30:                                         ; preds = %entry
  %tmp38 = add i32 %6, -2                         ; <i32> [#uses=1]
  %tmp43 = shl i32 %6, 1                          ; <i32> [#uses=1]
  br label %bb

bb:                                               ; preds = %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEviT_iT0_.exit21, %bb.nph30
  %indvar35 = phi i32 [ 0, %bb.nph30 ], [ %indvar.next36, %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEviT_iT0_.exit21 ] ; <i32> [#uses=4]
  %j.0 = sub i32 %tmp38, %indvar35                ; <i32> [#uses=1]
  %j.029 = sub i32 %j.028, %indvar35              ; <i32> [#uses=4]
  %tmp42 = mul i32 %indvar35, -2                  ; <i32> [#uses=1]
  %i.13.i = add i32 %tmp42, %tmp43                ; <i32> [#uses=3]
  %8 = load double** %0, align 4                  ; <double*> [#uses=10]
  %scevgep45 = getelementptr double* %8, i32 %j.029 ; <double*> [#uses=1]
  %9 = load double* %scevgep45, align 8           ; <double> [#uses=2]
  %10 = icmp slt i32 %i.13.i, %5                  ; <i1> [#uses=1]
  br i1 %10, label %bb.i6, label %bb4.i9

bb.i6:                                            ; preds = %bb.i6, %bb
  %i.14.i2 = phi i32 [ %phitmp.i5, %bb.i6 ], [ %i.13.i, %bb ] ; <i32> [#uses=3]
  %free.01.i3 = phi i32 [ %19, %bb.i6 ], [ %j.029, %bb ] ; <i32> [#uses=1]
  %11 = add i32 %i.14.i2, -1                      ; <i32> [#uses=1]
  %12 = getelementptr inbounds double* %8, i32 %11 ; <double*> [#uses=1]
  %13 = load double* %12, align 8                 ; <double> [#uses=1]
  %14 = getelementptr inbounds double* %8, i32 %i.14.i2 ; <double*> [#uses=1]
  %15 = load double* %14, align 8                 ; <double> [#uses=1]
  %16 = fcmp olt double %13, %15                  ; <i1> [#uses=1]
  %17 = zext i1 %16 to i32                        ; <i32> [#uses=1]
  %i.0.i4 = or i32 %17, %i.14.i2                  ; <i32> [#uses=2]
  %18 = getelementptr inbounds double* %8, i32 %free.01.i3 ; <double*> [#uses=1]
  %19 = add i32 %i.0.i4, -1                       ; <i32> [#uses=3]
  %20 = getelementptr inbounds double* %8, i32 %19 ; <double*> [#uses=1]
  %21 = load double* %20, align 8                 ; <double> [#uses=1]
  store double %21, double* %18, align 8
  %phitmp.i5 = shl i32 %i.0.i4, 1                 ; <i32> [#uses=3]
  %22 = icmp slt i32 %phitmp.i5, %5               ; <i1> [#uses=1]
  br i1 %22, label %bb.i6, label %bb4.i9

bb4.i9:                                           ; preds = %bb.i6, %bb
  %i.1.lcssa.i7 = phi i32 [ %i.13.i, %bb ], [ %phitmp.i5, %bb.i6 ] ; <i32> [#uses=2]
  %free.0.lcssa.i8 = phi i32 [ %j.029, %bb ], [ %19, %bb.i6 ] ; <i32> [#uses=3]
  %23 = icmp eq i32 %i.1.lcssa.i7, %5             ; <i1> [#uses=1]
  br i1 %23, label %bb5.i10, label %bb8.i19

bb5.i10:                                          ; preds = %bb4.i9
  %24 = getelementptr inbounds double* %8, i32 %free.0.lcssa.i8 ; <double*> [#uses=1]
  %25 = add i32 %i.1.lcssa.i7, -1                 ; <i32> [#uses=3]
  %26 = getelementptr inbounds double* %8, i32 %25 ; <double*> [#uses=1]
  %27 = load double* %26, align 8                 ; <double> [#uses=1]
  store double %27, double* %24, align 8
  br label %bb8.i19

bb7.i14:                                          ; preds = %bb9.i20
  %28 = getelementptr inbounds double* %8, i32 %free.2.i15 ; <double*> [#uses=1]
  store double %31, double* %28, align 8
  br label %bb8.i19

bb8.i19:                                          ; preds = %bb7.i14, %bb5.i10, %bb4.i9
  %free.2.i15 = phi i32 [ %i.2.i18, %bb7.i14 ], [ %25, %bb5.i10 ], [ %free.0.lcssa.i8, %bb4.i9 ] ; <i32> [#uses=3]
  %i.2.in.in.i16 = phi i32 [ %i.2.i18, %bb7.i14 ], [ %25, %bb5.i10 ], [ %free.0.lcssa.i8, %bb4.i9 ] ; <i32> [#uses=1]
  %i.2.in.i17 = add i32 %i.2.in.in.i16, -1        ; <i32> [#uses=1]
  %i.2.i18 = sdiv i32 %i.2.in.i17, 2              ; <i32> [#uses=3]
  %29 = icmp sgt i32 %free.2.i15, %j.029          ; <i1> [#uses=1]
  br i1 %29, label %bb9.i20, label %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEviT_iT0_.exit21

bb9.i20:                                          ; preds = %bb8.i19
  %30 = getelementptr inbounds double* %8, i32 %i.2.i18 ; <double*> [#uses=1]
  %31 = load double* %30, align 8                 ; <double> [#uses=2]
  %32 = fcmp uge double %31, %9                   ; <i1> [#uses=1]
  br i1 %32, label %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEviT_iT0_.exit21, label %bb7.i14

_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEviT_iT0_.exit21: ; preds = %bb9.i20, %bb8.i19
  %33 = getelementptr inbounds double* %8, i32 %free.2.i15 ; <double*> [#uses=1]
  store double %9, double* %33, align 8
  %34 = icmp slt i32 %j.0, 0                      ; <i1> [#uses=1]
  %indvar.next36 = add i32 %indvar35, 1           ; <i32> [#uses=1]
  br i1 %34, label %bb5.loopexit, label %bb

bb4:                                              ; preds = %bb5.loopexit, %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEviT_iT0_.exit
  %indvar = phi i32 [ %indvar.next, %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEviT_iT0_.exit ], [ 0, %bb5.loopexit ] ; <i32> [#uses=2]
  %j.125 = sub i32 %j.124, %indvar                ; <i32> [#uses=4]
  %35 = load double** %0, align 4                 ; <double*> [#uses=2]
  %scevgep33 = getelementptr double* %35, i32 %j.125 ; <double*> [#uses=2]
  %36 = load double* %scevgep33, align 8          ; <double> [#uses=2]
  %37 = load double* %35, align 8                 ; <double> [#uses=1]
  store double %37, double* %scevgep33, align 8
  %38 = load double** %0, align 4                 ; <double*> [#uses=9]
  %39 = icmp sgt i32 %j.125, 2                    ; <i1> [#uses=1]
  br i1 %39, label %bb.i, label %bb4.i

bb.i:                                             ; preds = %bb.i, %bb4
  %i.14.i = phi i32 [ %phitmp.i, %bb.i ], [ 2, %bb4 ] ; <i32> [#uses=3]
  %free.01.i = phi i32 [ %48, %bb.i ], [ 0, %bb4 ] ; <i32> [#uses=1]
  %40 = add i32 %i.14.i, -1                       ; <i32> [#uses=1]
  %41 = getelementptr inbounds double* %38, i32 %40 ; <double*> [#uses=1]
  %42 = load double* %41, align 8                 ; <double> [#uses=1]
  %43 = getelementptr inbounds double* %38, i32 %i.14.i ; <double*> [#uses=1]
  %44 = load double* %43, align 8                 ; <double> [#uses=1]
  %45 = fcmp olt double %42, %44                  ; <i1> [#uses=1]
  %46 = zext i1 %45 to i32                        ; <i32> [#uses=1]
  %i.0.i = or i32 %46, %i.14.i                    ; <i32> [#uses=2]
  %47 = getelementptr inbounds double* %38, i32 %free.01.i ; <double*> [#uses=1]
  %48 = add i32 %i.0.i, -1                        ; <i32> [#uses=3]
  %49 = getelementptr inbounds double* %38, i32 %48 ; <double*> [#uses=1]
  %50 = load double* %49, align 8                 ; <double> [#uses=1]
  store double %50, double* %47, align 8
  %phitmp.i = shl i32 %i.0.i, 1                   ; <i32> [#uses=3]
  %51 = icmp slt i32 %phitmp.i, %j.125            ; <i1> [#uses=1]
  br i1 %51, label %bb.i, label %bb4.i

bb4.i:                                            ; preds = %bb.i, %bb4
  %i.1.lcssa.i = phi i32 [ 2, %bb4 ], [ %phitmp.i, %bb.i ] ; <i32> [#uses=2]
  %free.0.lcssa.i = phi i32 [ 0, %bb4 ], [ %48, %bb.i ] ; <i32> [#uses=3]
  %52 = icmp eq i32 %i.1.lcssa.i, %j.125          ; <i1> [#uses=1]
  br i1 %52, label %bb5.i, label %bb8.i

bb5.i:                                            ; preds = %bb4.i
  %53 = getelementptr inbounds double* %38, i32 %free.0.lcssa.i ; <double*> [#uses=1]
  %54 = add i32 %i.1.lcssa.i, -1                  ; <i32> [#uses=3]
  %55 = getelementptr inbounds double* %38, i32 %54 ; <double*> [#uses=1]
  %56 = load double* %55, align 8                 ; <double> [#uses=1]
  store double %56, double* %53, align 8
  br label %bb8.i

bb7.i:                                            ; preds = %bb9.i
  %57 = getelementptr inbounds double* %38, i32 %free.2.i ; <double*> [#uses=1]
  store double %60, double* %57, align 8
  br label %bb8.i

bb8.i:                                            ; preds = %bb7.i, %bb5.i, %bb4.i
  %free.2.i = phi i32 [ %i.2.i, %bb7.i ], [ %54, %bb5.i ], [ %free.0.lcssa.i, %bb4.i ] ; <i32> [#uses=3]
  %i.2.in.in.i = phi i32 [ %i.2.i, %bb7.i ], [ %54, %bb5.i ], [ %free.0.lcssa.i, %bb4.i ] ; <i32> [#uses=1]
  %i.2.in.i = add i32 %i.2.in.in.i, -1            ; <i32> [#uses=1]
  %i.2.i = sdiv i32 %i.2.in.i, 2                  ; <i32> [#uses=3]
  %58 = icmp sgt i32 %free.2.i, 0                 ; <i1> [#uses=1]
  br i1 %58, label %bb9.i, label %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEviT_iT0_.exit

bb9.i:                                            ; preds = %bb8.i
  %59 = getelementptr inbounds double* %38, i32 %i.2.i ; <double*> [#uses=1]
  %60 = load double* %59, align 8                 ; <double> [#uses=2]
  %61 = fcmp uge double %60, %36                  ; <i1> [#uses=1]
  br i1 %61, label %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEviT_iT0_.exit, label %bb7.i

_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEviT_iT0_.exit: ; preds = %bb9.i, %bb8.i
  %62 = getelementptr inbounds double* %38, i32 %free.2.i ; <double*> [#uses=1]
  store double %36, double* %62, align 8
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, %j.124    ; <i1> [#uses=1]
  br i1 %exitcond, label %return, label %bb4

bb5.loopexit:                                     ; preds = %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEviT_iT0_.exit21, %entry
  %j.124 = add i32 %5, -1                         ; <i32> [#uses=3]
  %63 = icmp sgt i32 %j.124, 0                    ; <i1> [#uses=1]
  br i1 %63, label %bb4, label %return

return:                                           ; preds = %bb5.loopexit, %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEviT_iT0_.exit
  ret void
}

declare i32 @printf(i8* noalias nocapture, ...) nounwind

define internal fastcc void @_Z19test_insertion_sortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEvT_S9_S9_S9_T0_PKc(%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias nocapture %firstSource, %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias nocapture %lastSource, %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias nocapture %firstDest, %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias nocapture %lastDest) nounwind {
entry:
  %0 = load i32* @iterations, align 4             ; <i32> [#uses=1]
  %1 = icmp sgt i32 %0, 0                         ; <i1> [#uses=1]
  br i1 %1, label %bb.nph, label %return

bb.nph:                                           ; preds = %entry
  %2 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %firstDest, i32 0, i32 0, i32 0 ; <double**> [#uses=3]
  %3 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %lastSource, i32 0, i32 0, i32 0 ; <double**> [#uses=1]
  %4 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %firstSource, i32 0, i32 0, i32 0 ; <double**> [#uses=1]
  %5 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %lastDest, i32 0, i32 0, i32 0 ; <double**> [#uses=2]
  %.pre = load double** %2, align 4               ; <double*> [#uses=1]
  br label %bb

bb:                                               ; preds = %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit, %bb.nph
  %6 = phi double* [ %.pre, %bb.nph ], [ %21, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit ] ; <double*> [#uses=1]
  %i.09 = phi i32 [ 0, %bb.nph ], [ %tmp24, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit ] ; <i32> [#uses=1]
  %tmp24 = add i32 %i.09, 1                       ; <i32> [#uses=2]
  %7 = load double** %3, align 4                  ; <double*> [#uses=2]
  %8 = load double** %4, align 4                  ; <double*> [#uses=2]
  %9 = icmp eq double* %8, %7                     ; <i1> [#uses=1]
  br i1 %9, label %_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit, label %bb.i3

bb.i3:                                            ; preds = %bb.i3, %bb
  %indvar = phi i32 [ %indvar.next, %bb.i3 ], [ 0, %bb ] ; <i32> [#uses=2]
  %tmp17 = xor i32 %indvar, -1                    ; <i32> [#uses=2]
  %scevgep = getelementptr double* %6, i32 %tmp17 ; <double*> [#uses=1]
  %scevgep18 = getelementptr double* %8, i32 %tmp17 ; <double*> [#uses=2]
  %10 = load double* %scevgep18, align 8          ; <double> [#uses=1]
  store double %10, double* %scevgep, align 8
  %11 = icmp eq double* %scevgep18, %7            ; <i1> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br i1 %11, label %_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit, label %bb.i3

_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit: ; preds = %bb.i3, %bb
  %12 = load double** %5, align 4                 ; <double*> [#uses=3]
  %13 = load double** %2, align 4                 ; <double*> [#uses=7]
  %p.0.0.04.i = getelementptr inbounds double* %13, i32 -1 ; <double*> [#uses=1]
  %14 = icmp eq double* %p.0.0.04.i, %12          ; <i1> [#uses=1]
  br i1 %14, label %_ZN9benchmark13insertionSortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_.exit, label %bb.i1

bb.i1:                                            ; preds = %bb12.i, %_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit
  %indvar6.i = phi i32 [ %sum25, %bb12.i ], [ 0, %_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit ] ; <i32> [#uses=3]
  %sum25 = add i32 %indvar6.i, 1                  ; <i32> [#uses=2]
  %sum = add i32 %indvar6.i, 2                    ; <i32> [#uses=1]
  %tmp10 = sub i32 -2, %indvar6.i                 ; <i32> [#uses=1]
  %p.0.0.0.i = getelementptr double* %13, i32 %tmp10 ; <double*> [#uses=2]
  %15 = load double* %p.0.0.0.i, align 8          ; <double> [#uses=2]
  br label %bb3.i

bb2.i:                                            ; preds = %bb7.i
  store double %17, double* %scevgep.i, align 8
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br label %bb3.i

bb3.i:                                            ; preds = %bb2.i, %bb.i1
  %indvar.i = phi i32 [ 0, %bb.i1 ], [ %indvar.next.i, %bb2.i ] ; <i32> [#uses=3]
  %tmp11 = sub i32 %indvar.i, %sum                ; <i32> [#uses=1]
  %scevgep.i = getelementptr double* %13, i32 %tmp11 ; <double*> [#uses=1]
  %tmp9.i = sub i32 %indvar.i, %sum25             ; <i32> [#uses=2]
  %prev.0.0.0.i = getelementptr double* %13, i32 %tmp9.i ; <double*> [#uses=2]
  %16 = icmp eq double* %prev.0.0.0.i, %13        ; <i1> [#uses=1]
  br i1 %16, label %bb12.i, label %bb7.i

bb7.i:                                            ; preds = %bb3.i
  %17 = load double* %prev.0.0.0.i, align 8       ; <double> [#uses=2]
  %18 = fcmp ule double %17, %15                  ; <i1> [#uses=1]
  br i1 %18, label %bb12.i, label %bb2.i

bb12.i:                                           ; preds = %bb7.i, %bb3.i
  %prev.0.0.0.sum.i = add i32 %tmp9.i, -1         ; <i32> [#uses=1]
  %19 = getelementptr inbounds double* %13, i32 %prev.0.0.0.sum.i ; <double*> [#uses=1]
  store double %15, double* %19, align 8
  %20 = icmp eq double* %p.0.0.0.i, %12           ; <i1> [#uses=1]
  br i1 %20, label %_ZN9benchmark13insertionSortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_.exit.loopexit, label %bb.i1

_ZN9benchmark13insertionSortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_.exit.loopexit: ; preds = %bb12.i
  %.pre29 = load double** %5, align 4             ; <double*> [#uses=1]
  %.pre30 = load double** %2, align 4             ; <double*> [#uses=1]
  br label %_ZN9benchmark13insertionSortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_.exit

_ZN9benchmark13insertionSortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_.exit: ; preds = %_ZN9benchmark13insertionSortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_.exit.loopexit, %_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit
  %21 = phi double* [ %.pre30, %_ZN9benchmark13insertionSortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_.exit.loopexit ], [ %13, %_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit ] ; <double*> [#uses=3]
  %22 = phi double* [ %.pre29, %_ZN9benchmark13insertionSortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_.exit.loopexit ], [ %12, %_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit ] ; <double*> [#uses=1]
  br label %bb3.i.i

bb.i.i:                                           ; preds = %bb3.i.i
  %tmp22 = sub i32 -2, %indvar.i.i                ; <i32> [#uses=1]
  %scevgep4.i = getelementptr double* %21, i32 %tmp22 ; <double*> [#uses=1]
  %23 = load double* %scevgep4.i, align 8         ; <double> [#uses=1]
  %24 = load double* %scevgep.i.i, align 8        ; <double> [#uses=1]
  %25 = fcmp olt double %23, %24                  ; <i1> [#uses=1]
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=1]
  br i1 %25, label %bb.i, label %bb3.i.i

bb3.i.i:                                          ; preds = %bb.i.i, %_ZN9benchmark13insertionSortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_.exit
  %indvar.i.i = phi i32 [ 0, %_ZN9benchmark13insertionSortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_.exit ], [ %indvar.next.i.i, %bb.i.i ] ; <i32> [#uses=3]
  %tmp20 = xor i32 %indvar.i.i, -1                ; <i32> [#uses=1]
  %scevgep.i.i = getelementptr double* %21, i32 %tmp20 ; <double*> [#uses=2]
  %26 = icmp eq double* %scevgep.i.i, %22         ; <i1> [#uses=1]
  br i1 %26, label %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit, label %bb.i.i

bb.i:                                             ; preds = %bb.i.i
  %27 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit

_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit: ; preds = %bb.i, %bb3.i.i
  %28 = load i32* @iterations, align 4            ; <i32> [#uses=1]
  %29 = icmp slt i32 %tmp24, %28                  ; <i1> [#uses=1]
  br i1 %29, label %bb, label %return

return:                                           ; preds = %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit, %entry
  ret void
}

define internal fastcc void @_Z19test_insertion_sortISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEvT_SA_SA_SA_T0_PKc(%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias nocapture %firstSource, %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias nocapture %lastSource, %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias nocapture %firstDest, %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias nocapture %lastDest) nounwind {
entry:
  %0 = load i32* @iterations, align 4             ; <i32> [#uses=1]
  %1 = icmp sgt i32 %0, 0                         ; <i1> [#uses=1]
  br i1 %1, label %bb.nph, label %return

bb.nph:                                           ; preds = %entry
  %2 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %firstDest, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=3]
  %3 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %lastSource, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=1]
  %4 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %firstSource, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=1]
  %5 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %lastDest, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=2]
  %.pre = load double** %2, align 4               ; <double*> [#uses=1]
  br label %bb

bb:                                               ; preds = %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit, %bb.nph
  %6 = phi double* [ %.pre, %bb.nph ], [ %21, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit ] ; <double*> [#uses=1]
  %i.010 = phi i32 [ 0, %bb.nph ], [ %tmp21, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit ] ; <i32> [#uses=1]
  %tmp21 = add i32 %i.010, 1                      ; <i32> [#uses=2]
  %7 = load double** %3, align 4                  ; <double*> [#uses=2]
  %8 = load double** %4, align 4                  ; <double*> [#uses=3]
  %9 = icmp eq double* %8, %7                     ; <i1> [#uses=1]
  br i1 %9, label %_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit, label %bb.i4

bb.i4:                                            ; preds = %bb.i4, %bb
  %indvar = phi i32 [ %tmp16, %bb.i4 ], [ 0, %bb ] ; <i32> [#uses=3]
  %.1.0.0.0 = getelementptr double* %6, i32 %indvar ; <double*> [#uses=1]
  %scevgep = getelementptr double* %8, i32 %indvar ; <double*> [#uses=1]
  %tmp16 = add i32 %indvar, 1                     ; <i32> [#uses=2]
  %scevgep17 = getelementptr double* %8, i32 %tmp16 ; <double*> [#uses=1]
  %10 = load double* %scevgep, align 8            ; <double> [#uses=1]
  store double %10, double* %.1.0.0.0, align 8
  %11 = icmp eq double* %scevgep17, %7            ; <i1> [#uses=1]
  br i1 %11, label %_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit, label %bb.i4

_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit: ; preds = %bb.i4, %bb
  %12 = load double** %5, align 4                 ; <double*> [#uses=3]
  %13 = load double** %2, align 4                 ; <double*> [#uses=7]
  %p.1.0.0.04.i = getelementptr inbounds double* %13, i32 1 ; <double*> [#uses=1]
  %14 = icmp eq double* %p.1.0.0.04.i, %12        ; <i1> [#uses=1]
  br i1 %14, label %_ZN9benchmark13insertionSortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_.exit, label %bb.i1

bb.i1:                                            ; preds = %bb12.i, %_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit
  %15 = phi i32 [ %tmp12, %bb12.i ], [ 0, %_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit ] ; <i32> [#uses=3]
  %tmp12 = add i32 %15, 1                         ; <i32> [#uses=3]
  %tmp15 = add i32 %15, 2                         ; <i32> [#uses=1]
  %p.1.0.0.0.i = getelementptr double* %13, i32 %tmp15 ; <double*> [#uses=1]
  %p.1.0.0.05.i = getelementptr double* %13, i32 %tmp12 ; <double*> [#uses=1]
  %16 = load double* %p.1.0.0.05.i, align 8       ; <double> [#uses=2]
  br label %bb3.i

bb2.i:                                            ; preds = %bb7.i
  store double %18, double* %j.1.0.0.0.i, align 8
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br label %bb3.i

bb3.i:                                            ; preds = %bb2.i, %bb.i1
  %indvar.i = phi i32 [ 0, %bb.i1 ], [ %indvar.next.i, %bb2.i ] ; <i32> [#uses=3]
  %tmp13 = sub i32 %tmp12, %indvar.i              ; <i32> [#uses=1]
  %j.1.0.0.0.i = getelementptr double* %13, i32 %tmp13 ; <double*> [#uses=3]
  %17 = icmp eq double* %j.1.0.0.0.i, %13         ; <i1> [#uses=1]
  br i1 %17, label %bb12.i, label %bb7.i

bb7.i:                                            ; preds = %bb3.i
  %tmp11 = sub i32 %15, %indvar.i                 ; <i32> [#uses=1]
  %scevgep.i2 = getelementptr double* %13, i32 %tmp11 ; <double*> [#uses=1]
  %18 = load double* %scevgep.i2, align 8         ; <double> [#uses=2]
  %19 = fcmp ule double %18, %16                  ; <i1> [#uses=1]
  br i1 %19, label %bb12.i, label %bb2.i

bb12.i:                                           ; preds = %bb7.i, %bb3.i
  store double %16, double* %j.1.0.0.0.i, align 8
  %20 = icmp eq double* %p.1.0.0.0.i, %12         ; <i1> [#uses=1]
  br i1 %20, label %_ZN9benchmark13insertionSortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_.exit.loopexit, label %bb.i1

_ZN9benchmark13insertionSortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_.exit.loopexit: ; preds = %bb12.i
  %.pre24 = load double** %5, align 4             ; <double*> [#uses=1]
  %.pre25 = load double** %2, align 4             ; <double*> [#uses=1]
  br label %_ZN9benchmark13insertionSortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_.exit

_ZN9benchmark13insertionSortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_.exit: ; preds = %_ZN9benchmark13insertionSortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_.exit.loopexit, %_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit
  %21 = phi double* [ %.pre25, %_ZN9benchmark13insertionSortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_.exit.loopexit ], [ %13, %_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit ] ; <double*> [#uses=3]
  %22 = phi double* [ %.pre24, %_ZN9benchmark13insertionSortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_.exit.loopexit ], [ %12, %_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit ] ; <double*> [#uses=1]
  br label %bb3.i.i

bb.i.i:                                           ; preds = %bb3.i.i
  %prev.1.0.0.0.i.i = getelementptr double* %21, i32 %indvar.i.i ; <double*> [#uses=1]
  %23 = load double* %scevgep.i, align 8          ; <double> [#uses=1]
  %24 = load double* %prev.1.0.0.0.i.i, align 8   ; <double> [#uses=1]
  %25 = fcmp olt double %23, %24                  ; <i1> [#uses=1]
  br i1 %25, label %bb.i, label %bb3.i.i

bb3.i.i:                                          ; preds = %bb.i.i, %_ZN9benchmark13insertionSortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_.exit
  %indvar.i.i = phi i32 [ 0, %_ZN9benchmark13insertionSortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_.exit ], [ %tmp18, %bb.i.i ] ; <i32> [#uses=2]
  %tmp18 = add i32 %indvar.i.i, 1                 ; <i32> [#uses=2]
  %scevgep.i = getelementptr double* %21, i32 %tmp18 ; <double*> [#uses=2]
  %26 = icmp eq double* %scevgep.i, %22           ; <i1> [#uses=1]
  br i1 %26, label %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit, label %bb.i.i

bb.i:                                             ; preds = %bb.i.i
  %27 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit

_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit: ; preds = %bb.i, %bb3.i.i
  %28 = load i32* @iterations, align 4            ; <i32> [#uses=1]
  %29 = icmp slt i32 %tmp21, %28                  ; <i1> [#uses=1]
  br i1 %29, label %bb, label %return

return:                                           ; preds = %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit, %entry
  ret void
}

declare void @llvm.memmove.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind

declare void @_ZSt17__throw_bad_allocv() noreturn

declare i8* @_Znwj(i32)

declare void @_ZdlPv(i8*) nounwind

define internal fastcc void @_ZNSt6vectorIdSaIdEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPdS1_EEjRKd(%"struct.std::vector<double,std::allocator<double> >"* nocapture %this, double* nocapture %__x) {
bb:
  %0 = getelementptr inbounds %"struct.std::vector<double,std::allocator<double> >"* %this, i32 0, i32 0, i32 0, i32 2 ; <double**> [#uses=2]
  %1 = load double** %0, align 4                  ; <double*> [#uses=1]
  %2 = ptrtoint double* %1 to i32                 ; <i32> [#uses=1]
  %3 = getelementptr inbounds %"struct.std::vector<double,std::allocator<double> >"* %this, i32 0, i32 0, i32 0, i32 1 ; <double**> [#uses=9]
  %4 = load double** %3, align 4                  ; <double*> [#uses=8]
  %5 = ptrtoint double* %4 to i32                 ; <i32> [#uses=5]
  %6 = sub i32 %2, %5                             ; <i32> [#uses=1]
  %7 = ashr i32 %6, 3                             ; <i32> [#uses=1]
  %8 = icmp ult i32 %7, 2000                      ; <i1> [#uses=1]
  br i1 %8, label %bb16, label %bb1

bb1:                                              ; preds = %bb
  %9 = load double* %__x, align 8                 ; <double> [#uses=3]
  %10 = ashr i32 %5, 3                            ; <i32> [#uses=5]
  %11 = icmp ugt i32 %10, 2000                    ; <i1> [#uses=1]
  br i1 %11, label %bb4, label %bb5

bb4:                                              ; preds = %bb1
  %12 = getelementptr inbounds double* %4, i32 -2000 ; <double*> [#uses=2]
  %13 = ptrtoint double* %12 to i32               ; <i32> [#uses=3]
  %14 = sub i32 %5, %13                           ; <i32> [#uses=1]
  %15 = bitcast double* %4 to i8*                 ; <i8*> [#uses=1]
  %16 = bitcast double* %12 to i8*                ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %15, i8* %16, i32 %14, i32 8) nounwind
  %17 = load double** %3, align 4                 ; <double*> [#uses=1]
  %18 = getelementptr inbounds double* %17, i32 2000 ; <double*> [#uses=1]
  store double* %18, double** %3, align 4
  %19 = ashr i32 %13, 3                           ; <i32> [#uses=1]
  %20 = and i32 %13, -8                           ; <i32> [#uses=1]
  %21 = sub i32 0, %19                            ; <i32> [#uses=1]
  %22 = getelementptr inbounds double* %4, i32 %21 ; <double*> [#uses=1]
  %23 = bitcast double* %22 to i8*                ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %23, i8* null, i32 %20, i32 8) nounwind
  br label %bb.i.i15

bb.i.i15:                                         ; preds = %bb.i.i15, %bb4
  %indvar.i.i11 = phi i32 [ 0, %bb4 ], [ %tmp.i12, %bb.i.i15 ] ; <i32> [#uses=2]
  %__first_addr.01.i.i14 = getelementptr double* null, i32 %indvar.i.i11 ; <double*> [#uses=1]
  %tmp.i12 = add i32 %indvar.i.i11, 1             ; <i32> [#uses=2]
  store double %9, double* %__first_addr.01.i.i14, align 8
  %exitcond24 = icmp eq i32 %tmp.i12, 2000        ; <i1> [#uses=1]
  br i1 %exitcond24, label %_ZSt4fillIPddEvT_S1_RKT0_.exit16, label %bb.i.i15

_ZSt4fillIPddEvT_S1_RKT0_.exit16:                 ; preds = %bb.i.i15
  ret void

bb5:                                              ; preds = %bb1
  %24 = icmp eq i32 %10, 2000                     ; <i1> [#uses=1]
  br i1 %24, label %bb15, label %bb.i.i.i.i.i9.preheader

bb.i.i.i.i.i9.preheader:                          ; preds = %bb5
  %tmp22 = sub i32 2000, %10                      ; <i32> [#uses=1]
  br label %bb.i.i.i.i.i9

bb.i.i.i.i.i9:                                    ; preds = %bb.i.i.i.i.i9, %bb.i.i.i.i.i9.preheader
  %indvar.i.i.i.i.i5 = phi i32 [ 0, %bb.i.i.i.i.i9.preheader ], [ %indvar.next.i.i.i.i.i7, %bb.i.i.i.i.i9 ] ; <i32> [#uses=2]
  %__first_addr.02.i.i.i.i.i6 = getelementptr double* %4, i32 %indvar.i.i.i.i.i5 ; <double*> [#uses=1]
  store double %9, double* %__first_addr.02.i.i.i.i.i6, align 8
  %indvar.next.i.i.i.i.i7 = add i32 %indvar.i.i.i.i.i5, 1 ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next.i.i.i.i.i7, %tmp22 ; <i1> [#uses=1]
  br i1 %exitcond, label %bb15.loopexit, label %bb.i.i.i.i.i9

bb15.loopexit:                                    ; preds = %bb.i.i.i.i.i9
  %.pre = load double** %3, align 4               ; <double*> [#uses=1]
  br label %bb15

bb15:                                             ; preds = %bb15.loopexit, %bb5
  %25 = phi double* [ %.pre, %bb15.loopexit ], [ %4, %bb5 ] ; <double*> [#uses=1]
  %26 = sub i32 2000, %10                         ; <i32> [#uses=1]
  %27 = getelementptr inbounds double* %25, i32 %26 ; <double*> [#uses=2]
  store double* %27, double** %3, align 4
  %28 = bitcast double* %27 to i8*                ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %28, i8* null, i32 %5, i32 8) nounwind
  %29 = load double** %3, align 4                 ; <double*> [#uses=1]
  %30 = getelementptr inbounds double* %29, i32 %10 ; <double*> [#uses=1]
  store double* %30, double** %3, align 4
  %31 = icmp eq double* %4, null                  ; <i1> [#uses=1]
  br i1 %31, label %_ZSt4fillIPddEvT_S1_RKT0_.exit, label %bb.i.i4

bb.i.i4:                                          ; preds = %bb.i.i4, %bb15
  %indvar.i.i = phi i32 [ %tmp23, %bb.i.i4 ], [ 0, %bb15 ] ; <i32> [#uses=2]
  %tmp23 = add i32 %indvar.i.i, 1                 ; <i32> [#uses=2]
  %scevgep.i.i = getelementptr double* null, i32 %tmp23 ; <double*> [#uses=1]
  %__first_addr.01.i.i = getelementptr double* null, i32 %indvar.i.i ; <double*> [#uses=1]
  store double %9, double* %__first_addr.01.i.i, align 8
  %32 = icmp eq double* %scevgep.i.i, %4          ; <i1> [#uses=1]
  br i1 %32, label %_ZSt4fillIPddEvT_S1_RKT0_.exit, label %bb.i.i4

_ZSt4fillIPddEvT_S1_RKT0_.exit:                   ; preds = %bb.i.i4, %bb15
  ret void

bb16:                                             ; preds = %bb
  %33 = getelementptr inbounds %"struct.std::vector<double,std::allocator<double> >"* %this, i32 0, i32 0, i32 0, i32 0 ; <double**> [#uses=4]
  %34 = load double** %33, align 4                ; <double*> [#uses=1]
  %35 = ptrtoint double* %34 to i32               ; <i32> [#uses=1]
  %36 = sub i32 %5, %35                           ; <i32> [#uses=1]
  %37 = ashr i32 %36, 3                           ; <i32> [#uses=5]
  %38 = sub i32 536870911, %37                    ; <i32> [#uses=1]
  %39 = icmp ult i32 %38, 2000                    ; <i1> [#uses=1]
  br i1 %39, label %bb17, label %bb18

bb17:                                             ; preds = %bb16
  tail call void @_ZSt20__throw_length_errorPKc(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0)) noreturn
  unreachable

bb18:                                             ; preds = %bb16
  %40 = icmp ult i32 %37, 2000                    ; <i1> [#uses=1]
  %41 = select i1 %40, i32 2000, i32 %37          ; <i32> [#uses=1]
  %42 = add i32 %41, %37                          ; <i32> [#uses=3]
  %43 = icmp ult i32 %42, %37                     ; <i1> [#uses=1]
  br i1 %43, label %invcont21, label %bb20

bb20:                                             ; preds = %bb18
  %44 = icmp ugt i32 %42, 536870911               ; <i1> [#uses=1]
  br i1 %44, label %bb.i.i, label %invcont21

bb.i.i:                                           ; preds = %bb20
  tail call void @_ZSt17__throw_bad_allocv() noreturn
  unreachable

invcont21:                                        ; preds = %bb20, %bb18
  %__len.0.reg2mem.0 = phi i32 [ 536870911, %bb18 ], [ %42, %bb20 ] ; <i32> [#uses=2]
  %45 = shl i32 %__len.0.reg2mem.0, 3             ; <i32> [#uses=1]
  %46 = tail call i8* @_Znwj(i32 %45)             ; <i8*> [#uses=3]
  %47 = bitcast i8* %46 to double*                ; <double*> [#uses=4]
  %48 = load double** %33, align 4                ; <double*> [#uses=2]
  %49 = ptrtoint double* %48 to i32               ; <i32> [#uses=1]
  %50 = sub i32 0, %49                            ; <i32> [#uses=2]
  %51 = bitcast double* %48 to i8*                ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %46, i8* %51, i32 %50, i32 8) nounwind
  %52 = ashr i32 %50, 3                           ; <i32> [#uses=2]
  %53 = load double* %__x, align 8                ; <double> [#uses=1]
  br label %bb.i.i.i.i.i

bb.i.i.i.i.i:                                     ; preds = %bb.i.i.i.i.i, %invcont21
  %indvar.i.i.i.i.i = phi i32 [ 0, %invcont21 ], [ %indvar.next.i.i.i.i.i, %bb.i.i.i.i.i ] ; <i32> [#uses=2]
  %tmp2630 = add i32 %indvar.i.i.i.i.i, %52       ; <i32> [#uses=1]
  %tmp28 = shl i32 %tmp2630, 3                    ; <i32> [#uses=1]
  %scevgep = getelementptr i8* %46, i32 %tmp28    ; <i8*> [#uses=1]
  %__first_addr.02.i.i.i.i.i = bitcast i8* %scevgep to double* ; <double*> [#uses=1]
  store double %53, double* %__first_addr.02.i.i.i.i.i, align 8
  %indvar.next.i.i.i.i.i = add i32 %indvar.i.i.i.i.i, 1 ; <i32> [#uses=2]
  %exitcond25 = icmp eq i32 %indvar.next.i.i.i.i.i, 2000 ; <i1> [#uses=1]
  br i1 %exitcond25, label %bb52, label %bb.i.i.i.i.i

bb52:                                             ; preds = %bb.i.i.i.i.i
  %.sum = add i32 %52, 2000                       ; <i32> [#uses=2]
  %54 = getelementptr inbounds double* %47, i32 %.sum ; <double*> [#uses=1]
  %55 = load double** %3, align 4                 ; <double*> [#uses=1]
  %56 = ptrtoint double* %55 to i32               ; <i32> [#uses=2]
  %57 = bitcast double* %54 to i8*                ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %57, i8* null, i32 %56, i32 8) nounwind
  %58 = ashr i32 %56, 3                           ; <i32> [#uses=1]
  %.sum17 = add i32 %58, %.sum                    ; <i32> [#uses=1]
  %59 = getelementptr inbounds double* %47, i32 %.sum17 ; <double*> [#uses=1]
  %60 = load double** %33, align 4                ; <double*> [#uses=2]
  %61 = icmp eq double* %60, null                 ; <i1> [#uses=1]
  br i1 %61, label %_ZNSt12_Vector_baseIdSaIdEE13_M_deallocateEPdj.exit, label %bb.i

bb.i:                                             ; preds = %bb52
  %62 = bitcast double* %60 to i8*                ; <i8*> [#uses=1]
  tail call void @_ZdlPv(i8* %62) nounwind
  br label %_ZNSt12_Vector_baseIdSaIdEE13_M_deallocateEPdj.exit

_ZNSt12_Vector_baseIdSaIdEE13_M_deallocateEPdj.exit: ; preds = %bb.i, %bb52
  store double* %47, double** %33, align 4
  store double* %59, double** %3, align 4
  %63 = getelementptr inbounds double* %47, i32 %__len.0.reg2mem.0 ; <double*> [#uses=1]
  store double* %63, double** %0, align 4
  ret void
}

declare void @_ZSt20__throw_length_errorPKc(i8*) noreturn

declare i32 @rand() nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) {
entry:
  %__x_addr.i353 = alloca double, align 8         ; <double*> [#uses=2]
  %__x_addr.i = alloca double, align 8            ; <double*> [#uses=2]
  %0 = alloca %"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >", align 8 ; <%"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"*> [#uses=2]
  %1 = alloca %"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >", align 8 ; <%"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"*> [#uses=2]
  %2 = alloca %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >", align 8 ; <%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"*> [#uses=3]
  %3 = alloca %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >", align 8 ; <%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"*> [#uses=3]
  %4 = alloca %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >", align 8 ; <%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"*> [#uses=3]
  %5 = alloca %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >", align 8 ; <%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"*> [#uses=3]
  %6 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<double*> >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<double*> >"*> [#uses=2]
  %7 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<double*> >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<double*> >"*> [#uses=2]
  %8 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"*> [#uses=3]
  %9 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"*> [#uses=3]
  %10 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"*> [#uses=3]
  %11 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"*> [#uses=3]
  %12 = alloca %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >", align 8 ; <%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"*> [#uses=3]
  %13 = alloca %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >", align 8 ; <%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"*> [#uses=3]
  %14 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"*> [#uses=3]
  %15 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"*> [#uses=3]
  %vec_dataMaster = alloca %"struct.std::vector<double,std::allocator<double> >", align 8 ; <%"struct.std::vector<double,std::allocator<double> >"*> [#uses=4]
  %vec_data = alloca %"struct.std::vector<double,std::allocator<double> >", align 8 ; <%"struct.std::vector<double,std::allocator<double> >"*> [#uses=4]
  %16 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"*> [#uses=2]
  %17 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"*> [#uses=2]
  %18 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"*> [#uses=2]
  %19 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"*> [#uses=2]
  %20 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"*> [#uses=2]
  %21 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"*> [#uses=2]
  %22 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"*> [#uses=2]
  %23 = alloca %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >", align 8 ; <%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"*> [#uses=2]
  %24 = alloca %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >", align 8 ; <%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"*> [#uses=2]
  %25 = alloca %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >", align 8 ; <%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"*> [#uses=2]
  %26 = alloca %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >", align 8 ; <%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"*> [#uses=2]
  %27 = alloca %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >", align 8 ; <%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"*> [#uses=2]
  %28 = alloca %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >", align 8 ; <%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"*> [#uses=2]
  %29 = alloca %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >", align 8 ; <%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"*> [#uses=2]
  %30 = alloca %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >", align 8 ; <%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"*> [#uses=2]
  %31 = alloca %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >", align 8 ; <%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"*> [#uses=2]
  %32 = icmp sgt i32 %argc, 1                     ; <i1> [#uses=1]
  br i1 %32, label %bb, label %bb1

bb:                                               ; preds = %entry
  %33 = getelementptr inbounds i8** %argv, i32 1  ; <i8**> [#uses=1]
  %34 = load i8** %33, align 4                    ; <i8*> [#uses=1]
  %35 = call i32 @atoi(i8* %34) nounwind readonly ; <i32> [#uses=1]
  store i32 %35, i32* @iterations, align 4
  br label %bb1

bb1:                                              ; preds = %bb, %entry
  %36 = icmp sgt i32 %argc, 2                     ; <i1> [#uses=1]
  br i1 %36, label %bb2, label %bb3

bb2:                                              ; preds = %bb1
  %37 = getelementptr inbounds i8** %argv, i32 2  ; <i8**> [#uses=1]
  %38 = load i8** %37, align 4                    ; <i8*> [#uses=1]
  %39 = call double @atof(i8* %38) nounwind readonly ; <double> [#uses=1]
  br label %bb3

bb3:                                              ; preds = %bb2, %bb1
  %init_value.0 = phi double [ %39, %bb2 ], [ 3.000000e+00, %bb1 ] ; <double> [#uses=11]
  %40 = fptosi double %init_value.0 to i32        ; <i32> [#uses=1]
  %41 = add nsw i32 %40, 123                      ; <i32> [#uses=1]
  call void @srand(i32 %41) nounwind
  br label %bb.i

bb.i:                                             ; preds = %bb.i, %bb3
  %indvar.i = phi i32 [ 0, %bb3 ], [ %tmp627, %bb.i ] ; <i32> [#uses=2]
  %tmp627 = add i32 %indvar.i, 1                  ; <i32> [#uses=2]
  %first_addr.01.i = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i ; <double*> [#uses=1]
  store double %init_value.0, double* %first_addr.01.i, align 8
  %scevgep.i.idx.mask = and i32 %tmp627, 536870911 ; <i32> [#uses=1]
  %42 = icmp eq i32 %scevgep.i.idx.mask, 2000     ; <i1> [#uses=1]
  br i1 %42, label %_ZN9benchmark4fillIPddEEvT_S2_T0_.exit, label %bb.i

_ZN9benchmark4fillIPddEEvT_S2_T0_.exit:           ; preds = %bb.i
  %43 = getelementptr inbounds %"struct.std::vector<double,std::allocator<double> >"* %vec_data, i32 0, i32 0, i32 0, i32 0 ; <double**> [#uses=11]
  store double* null, double** %43, align 8
  %44 = getelementptr inbounds %"struct.std::vector<double,std::allocator<double> >"* %vec_data, i32 0, i32 0, i32 0, i32 1 ; <double**> [#uses=9]
  store double* null, double** %44, align 4
  %45 = getelementptr inbounds %"struct.std::vector<double,std::allocator<double> >"* %vec_data, i32 0, i32 0, i32 0, i32 2 ; <double**> [#uses=1]
  store double* null, double** %45, align 8
  store double 0.000000e+00, double* %__x_addr.i, align 8
  invoke fastcc void @_ZNSt6vectorIdSaIdEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPdS1_EEjRKd(%"struct.std::vector<double,std::allocator<double> >"* %vec_data, double* %__x_addr.i)
          to label %invcont5 unwind label %lpad

invcont5:                                         ; preds = %_ZN9benchmark4fillIPddEEvT_S2_T0_.exit
  %46 = load double** %44, align 4                ; <double*> [#uses=4]
  %47 = load double** %43, align 8                ; <double*> [#uses=5]
  %48 = icmp eq double* %47, %46                  ; <i1> [#uses=1]
  br i1 %48, label %invcont16, label %bb.i296

bb.i296:                                          ; preds = %bb.i296, %invcont5
  %indvar.i293 = phi i32 [ %tmp628, %bb.i296 ], [ 0, %invcont5 ] ; <i32> [#uses=2]
  %tmp628 = add i32 %indvar.i293, 1               ; <i32> [#uses=2]
  %scevgep.i295 = getelementptr double* %47, i32 %tmp628 ; <double*> [#uses=1]
  %first_addr.0.01.i = getelementptr double* %47, i32 %indvar.i293 ; <double*> [#uses=1]
  store double %init_value.0, double* %first_addr.0.01.i, align 8
  %49 = icmp eq double* %scevgep.i295, %46        ; <i1> [#uses=1]
  br i1 %49, label %invcont16.loopexit, label %bb.i296

invcont16.loopexit:                               ; preds = %bb.i296
  %.pre = load double** %44, align 4              ; <double*> [#uses=2]
  %.pre745 = load double** %43, align 8           ; <double*> [#uses=2]
  br label %invcont16

invcont16:                                        ; preds = %invcont16.loopexit, %invcont5
  %.rle158 = phi double* [ %.pre745, %invcont16.loopexit ], [ %47, %invcont5 ] ; <double*> [#uses=5]
  %.rle154 = phi double* [ %.pre, %invcont16.loopexit ], [ %46, %invcont5 ] ; <double*> [#uses=4]
  %50 = phi double* [ %.pre745, %invcont16.loopexit ], [ %47, %invcont5 ] ; <double*> [#uses=47]
  %51 = phi double* [ %.pre, %invcont16.loopexit ], [ %46, %invcont5 ] ; <double*> [#uses=39]
  %52 = load i32* @iterations, align 4            ; <i32> [#uses=2]
  %53 = icmp sgt i32 %52, 0                       ; <i1> [#uses=1]
  br i1 %53, label %bb.nph.i445, label %invcont19

bb.nph.i445:                                      ; preds = %invcont16
  %54 = fmul double %init_value.0, 2.000000e+03   ; <double> [#uses=1]
  br label %bb.i453

bb.i453:                                          ; preds = %_Z9check_sumd.exit.i460, %bb.nph.i445
  %i.02.i451 = phi i32 [ 0, %bb.nph.i445 ], [ %tmp4.i452, %_Z9check_sumd.exit.i460 ] ; <i32> [#uses=1]
  %tmp4.i452 = add i32 %i.02.i451, 1              ; <i32> [#uses=2]
  br label %bb.i.i458

bb.i.i458:                                        ; preds = %bb.i.i458, %bb.i453
  %indvar.i.i454 = phi i32 [ 0, %bb.i453 ], [ %tmp630, %bb.i.i458 ] ; <i32> [#uses=2]
  %result_addr.01.i.i455 = phi double [ 0.000000e+00, %bb.i453 ], [ %56, %bb.i.i458 ] ; <double> [#uses=1]
  %tmp630 = add i32 %indvar.i.i454, 1             ; <i32> [#uses=2]
  %first_addr.02.i.i = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i454 ; <double*> [#uses=1]
  %55 = load double* %first_addr.02.i.i, align 8  ; <double> [#uses=1]
  %56 = fadd double %55, %result_addr.01.i.i455   ; <double> [#uses=2]
  %scevgep.i.i457.idx.mask = and i32 %tmp630, 536870911 ; <i32> [#uses=1]
  %57 = icmp eq i32 %scevgep.i.i457.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %57, label %_ZN9benchmark10accumulateIPddEET0_T_S3_S2_.exit.i, label %bb.i.i458

_ZN9benchmark10accumulateIPddEET0_T_S3_S2_.exit.i: ; preds = %bb.i.i458
  %58 = fcmp une double %54, %56                  ; <i1> [#uses=1]
  br i1 %58, label %bb.i1.i459, label %_Z9check_sumd.exit.i460

bb.i1.i459:                                       ; preds = %_ZN9benchmark10accumulateIPddEET0_T_S3_S2_.exit.i
  %59 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z9check_sumd.exit.i460

_Z9check_sumd.exit.i460:                          ; preds = %bb.i1.i459, %_ZN9benchmark10accumulateIPddEET0_T_S3_S2_.exit.i
  %60 = load i32* @iterations, align 4            ; <i32> [#uses=2]
  %61 = icmp slt i32 %tmp4.i452, %60              ; <i1> [#uses=1]
  br i1 %61, label %bb.i453, label %invcont19

invcont19:                                        ; preds = %_Z9check_sumd.exit.i460, %invcont16
  %62 = phi i32 [ %52, %invcont16 ], [ %60, %_Z9check_sumd.exit.i460 ] ; <i32> [#uses=2]
  %63 = icmp sgt i32 %62, 0                       ; <i1> [#uses=1]
  br i1 %63, label %bb.nph.i436, label %invcont24

bb.nph.i436:                                      ; preds = %invcont19
  %64 = icmp eq double* %.rle158, %.rle154        ; <i1> [#uses=1]
  %65 = fmul double %init_value.0, 2.000000e+03   ; <double> [#uses=2]
  br i1 %64, label %bb.us.i.preheader, label %bb.i439

bb.us.i.preheader:                                ; preds = %bb.nph.i436
  %66 = fcmp une double %65, 0.000000e+00         ; <i1> [#uses=1]
  br label %bb.us.i

bb.us.i:                                          ; preds = %_Z9check_sumd.exit.us.i, %bb.us.i.preheader
  %i.02.us.i = phi i32 [ %tmp.i437, %_Z9check_sumd.exit.us.i ], [ 0, %bb.us.i.preheader ] ; <i32> [#uses=1]
  %tmp.i437 = add i32 %i.02.us.i, 1               ; <i32> [#uses=2]
  br i1 %66, label %bb.i1.us.i, label %_Z9check_sumd.exit.us.i

_Z9check_sumd.exit.us.i:                          ; preds = %bb.i1.us.i, %bb.us.i
  %67 = load i32* @iterations, align 4            ; <i32> [#uses=2]
  %68 = icmp slt i32 %tmp.i437, %67               ; <i1> [#uses=1]
  br i1 %68, label %bb.us.i, label %invcont24

bb.i1.us.i:                                       ; preds = %bb.us.i
  %69 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z9check_sumd.exit.us.i

bb.i439:                                          ; preds = %_Z9check_sumd.exit.i444, %bb.nph.i436
  %i.02.i = phi i32 [ %tmp4.i438, %_Z9check_sumd.exit.i444 ], [ 0, %bb.nph.i436 ] ; <i32> [#uses=1]
  %tmp4.i438 = add i32 %i.02.i, 1                 ; <i32> [#uses=2]
  br label %bb.i.i442

bb.i.i442:                                        ; preds = %bb.i.i442, %bb.i439
  %indvar.i.i440 = phi i32 [ 0, %bb.i439 ], [ %tmp633, %bb.i.i442 ] ; <i32> [#uses=2]
  %result_addr.02.i.i = phi double [ 0.000000e+00, %bb.i439 ], [ %71, %bb.i.i442 ] ; <double> [#uses=1]
  %tmp633 = add i32 %indvar.i.i440, 1             ; <i32> [#uses=2]
  %scevgep.i.i441 = getelementptr double* %.rle158, i32 %tmp633 ; <double*> [#uses=1]
  %first_addr.0.01.i.i = getelementptr double* %.rle158, i32 %indvar.i.i440 ; <double*> [#uses=1]
  %70 = load double* %first_addr.0.01.i.i, align 8 ; <double> [#uses=1]
  %71 = fadd double %70, %result_addr.02.i.i      ; <double> [#uses=2]
  %72 = icmp eq double* %scevgep.i.i441, %.rle154 ; <i1> [#uses=1]
  br i1 %72, label %_ZN9benchmark10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEET0_T_S9_S8_.exit.i, label %bb.i.i442

_ZN9benchmark10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEET0_T_S9_S8_.exit.i: ; preds = %bb.i.i442
  %73 = fcmp une double %65, %71                  ; <i1> [#uses=1]
  br i1 %73, label %bb.i1.i443, label %_Z9check_sumd.exit.i444

bb.i1.i443:                                       ; preds = %_ZN9benchmark10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEET0_T_S9_S8_.exit.i
  %74 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z9check_sumd.exit.i444

_Z9check_sumd.exit.i444:                          ; preds = %bb.i1.i443, %_ZN9benchmark10accumulateIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEET0_T_S9_S8_.exit.i
  %75 = load i32* @iterations, align 4            ; <i32> [#uses=2]
  %76 = icmp slt i32 %tmp4.i438, %75              ; <i1> [#uses=1]
  br i1 %76, label %bb.i439, label %invcont24

invcont24:                                        ; preds = %_Z9check_sumd.exit.i444, %_Z9check_sumd.exit.us.i, %invcont19
  %77 = phi i32 [ %62, %invcont19 ], [ %67, %_Z9check_sumd.exit.us.i ], [ %75, %_Z9check_sumd.exit.i444 ] ; <i32> [#uses=2]
  %78 = icmp sgt i32 %77, 0                       ; <i1> [#uses=1]
  br i1 %78, label %bb.i426.preheader, label %invcont27

bb.i426.preheader:                                ; preds = %invcont24
  %79 = fmul double %init_value.0, 2.000000e+03   ; <double> [#uses=1]
  br label %bb.i426

bb.i426:                                          ; preds = %_Z9check_sumd.exit.i435, %bb.i426.preheader
  %i.03.i424 = phi i32 [ 0, %bb.i426.preheader ], [ %tmp5.i425, %_Z9check_sumd.exit.i435 ] ; <i32> [#uses=1]
  %tmp5.i425 = add i32 %i.03.i424, 1              ; <i32> [#uses=2]
  br label %bb.i1.i432

bb.i1.i432:                                       ; preds = %bb.i1.i432, %bb.i426
  %indvar.i427 = phi i32 [ 0, %bb.i426 ], [ %indvar.next.i431, %bb.i1.i432 ] ; <i32> [#uses=2]
  %result_addr.01.i.i428 = phi double [ 0.000000e+00, %bb.i426 ], [ %81, %bb.i1.i432 ] ; <double> [#uses=1]
  %tmp741 = xor i32 %indvar.i427, -1              ; <i32> [#uses=1]
  %scevgep.i430 = getelementptr [2000 x double]* @data, i32 1, i32 %tmp741 ; <double*> [#uses=2]
  %80 = load double* %scevgep.i430, align 8       ; <double> [#uses=1]
  %81 = fadd double %80, %result_addr.01.i.i428   ; <double> [#uses=2]
  %82 = icmp eq double* %scevgep.i430, getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0) ; <i1> [#uses=1]
  %indvar.next.i431 = add i32 %indvar.i427, 1     ; <i32> [#uses=1]
  br i1 %82, label %_ZN9benchmark10accumulateISt16reverse_iteratorIPdEdEET0_T_S5_S4_.exit.i, label %bb.i1.i432

_ZN9benchmark10accumulateISt16reverse_iteratorIPdEdEET0_T_S5_S4_.exit.i: ; preds = %bb.i1.i432
  %83 = fcmp une double %79, %81                  ; <i1> [#uses=1]
  br i1 %83, label %bb.i.i434, label %_Z9check_sumd.exit.i435

bb.i.i434:                                        ; preds = %_ZN9benchmark10accumulateISt16reverse_iteratorIPdEdEET0_T_S5_S4_.exit.i
  %84 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z9check_sumd.exit.i435

_Z9check_sumd.exit.i435:                          ; preds = %bb.i.i434, %_ZN9benchmark10accumulateISt16reverse_iteratorIPdEdEET0_T_S5_S4_.exit.i
  %85 = load i32* @iterations, align 4            ; <i32> [#uses=2]
  %86 = icmp slt i32 %tmp5.i425, %85              ; <i1> [#uses=1]
  br i1 %86, label %bb.i426, label %invcont27

invcont27:                                        ; preds = %_Z9check_sumd.exit.i435, %invcont24
  %87 = phi i32 [ %77, %invcont24 ], [ %85, %_Z9check_sumd.exit.i435 ] ; <i32> [#uses=2]
  %88 = icmp sgt i32 %87, 0                       ; <i1> [#uses=1]
  br i1 %88, label %bb.i411.preheader, label %invcont28

bb.i411.preheader:                                ; preds = %invcont27
  %89 = icmp eq double* %.rle154, %.rle158        ; <i1> [#uses=1]
  %90 = fmul double %init_value.0, 2.000000e+03   ; <double> [#uses=2]
  br i1 %89, label %bb.i411.us.preheader, label %bb.i411

bb.i411.us.preheader:                             ; preds = %bb.i411.preheader
  %91 = fcmp une double %90, 0.000000e+00         ; <i1> [#uses=1]
  br label %bb.i411.us

bb.i411.us:                                       ; preds = %_Z9check_sumd.exit.i421.us, %bb.i411.us.preheader
  %i.03.i409.us = phi i32 [ %tmp5.i410.us, %_Z9check_sumd.exit.i421.us ], [ 0, %bb.i411.us.preheader ] ; <i32> [#uses=1]
  %tmp5.i410.us = add i32 %i.03.i409.us, 1        ; <i32> [#uses=2]
  br i1 %91, label %bb.i.i420.us, label %_Z9check_sumd.exit.i421.us

_Z9check_sumd.exit.i421.us:                       ; preds = %bb.i.i420.us, %bb.i411.us
  %92 = load i32* @iterations, align 4            ; <i32> [#uses=2]
  %93 = icmp slt i32 %tmp5.i410.us, %92           ; <i1> [#uses=1]
  br i1 %93, label %bb.i411.us, label %invcont28

bb.i.i420.us:                                     ; preds = %bb.i411.us
  %94 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z9check_sumd.exit.i421.us

bb.i411:                                          ; preds = %_Z9check_sumd.exit.i421, %bb.i411.preheader
  %i.03.i409 = phi i32 [ %tmp5.i410, %_Z9check_sumd.exit.i421 ], [ 0, %bb.i411.preheader ] ; <i32> [#uses=1]
  %tmp5.i410 = add i32 %i.03.i409, 1              ; <i32> [#uses=2]
  br label %bb.i1.i417

bb.i1.i417:                                       ; preds = %bb.i1.i417, %bb.i411
  %indvar.i412 = phi i32 [ 0, %bb.i411 ], [ %indvar.next.i416, %bb.i1.i417 ] ; <i32> [#uses=2]
  %result_addr.01.i.i413 = phi double [ 0.000000e+00, %bb.i411 ], [ %96, %bb.i1.i417 ] ; <double> [#uses=1]
  %tmp737 = xor i32 %indvar.i412, -1              ; <i32> [#uses=1]
  %scevgep.i415 = getelementptr double* %.rle154, i32 %tmp737 ; <double*> [#uses=2]
  %95 = load double* %scevgep.i415, align 8       ; <double> [#uses=1]
  %96 = fadd double %95, %result_addr.01.i.i413   ; <double> [#uses=2]
  %97 = icmp eq double* %scevgep.i415, %.rle158   ; <i1> [#uses=1]
  %indvar.next.i416 = add i32 %indvar.i412, 1     ; <i32> [#uses=1]
  br i1 %97, label %_ZN9benchmark10accumulateISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEET0_T_SB_SA_.exit.i419, label %bb.i1.i417

_ZN9benchmark10accumulateISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEET0_T_SB_SA_.exit.i419: ; preds = %bb.i1.i417
  %98 = fcmp une double %90, %96                  ; <i1> [#uses=1]
  br i1 %98, label %bb.i.i420, label %_Z9check_sumd.exit.i421

bb.i.i420:                                        ; preds = %_ZN9benchmark10accumulateISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEET0_T_SB_SA_.exit.i419
  %99 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z9check_sumd.exit.i421

_Z9check_sumd.exit.i421:                          ; preds = %bb.i.i420, %_ZN9benchmark10accumulateISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEET0_T_SB_SA_.exit.i419
  %100 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %101 = icmp slt i32 %tmp5.i410, %100            ; <i1> [#uses=1]
  br i1 %101, label %bb.i411, label %invcont28

invcont28:                                        ; preds = %_Z9check_sumd.exit.i421, %_Z9check_sumd.exit.i421.us, %invcont27
  %102 = phi i32 [ %87, %invcont27 ], [ %92, %_Z9check_sumd.exit.i421.us ], [ %100, %_Z9check_sumd.exit.i421 ] ; <i32> [#uses=2]
  %103 = icmp sgt i32 %102, 0                     ; <i1> [#uses=1]
  br i1 %103, label %bb.i398.preheader, label %invcont29

bb.i398.preheader:                                ; preds = %invcont28
  %104 = icmp eq double* %51, %50                 ; <i1> [#uses=1]
  %105 = fmul double %init_value.0, 2.000000e+03  ; <double> [#uses=2]
  br i1 %104, label %bb.i398.us.preheader, label %bb.i398

bb.i398.us.preheader:                             ; preds = %bb.i398.preheader
  %106 = fcmp une double %105, 0.000000e+00       ; <i1> [#uses=1]
  br label %bb.i398.us

bb.i398.us:                                       ; preds = %_Z9check_sumd.exit.i407.us, %bb.i398.us.preheader
  %i.03.i396.us = phi i32 [ %tmp5.i397.us, %_Z9check_sumd.exit.i407.us ], [ 0, %bb.i398.us.preheader ] ; <i32> [#uses=1]
  %tmp5.i397.us = add i32 %i.03.i396.us, 1        ; <i32> [#uses=2]
  br i1 %106, label %bb.i.i406.us, label %_Z9check_sumd.exit.i407.us

_Z9check_sumd.exit.i407.us:                       ; preds = %bb.i.i406.us, %bb.i398.us
  %107 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %108 = icmp slt i32 %tmp5.i397.us, %107         ; <i1> [#uses=1]
  br i1 %108, label %bb.i398.us, label %invcont29

bb.i.i406.us:                                     ; preds = %bb.i398.us
  %109 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z9check_sumd.exit.i407.us

bb.i398:                                          ; preds = %_Z9check_sumd.exit.i407, %bb.i398.preheader
  %i.03.i396 = phi i32 [ %tmp5.i397, %_Z9check_sumd.exit.i407 ], [ 0, %bb.i398.preheader ] ; <i32> [#uses=1]
  %tmp5.i397 = add i32 %i.03.i396, 1              ; <i32> [#uses=2]
  br label %bb.i1.i404

bb.i1.i404:                                       ; preds = %bb.i1.i404, %bb.i398
  %indvar.i399 = phi i32 [ 0, %bb.i398 ], [ %indvar.next.i403, %bb.i1.i404 ] ; <i32> [#uses=2]
  %result_addr.01.i.i400 = phi double [ 0.000000e+00, %bb.i398 ], [ %111, %bb.i1.i404 ] ; <double> [#uses=1]
  %tmp733 = xor i32 %indvar.i399, -1              ; <i32> [#uses=1]
  %scevgep.i402 = getelementptr double* %51, i32 %tmp733 ; <double*> [#uses=2]
  %110 = load double* %scevgep.i402, align 8      ; <double> [#uses=1]
  %111 = fadd double %110, %result_addr.01.i.i400 ; <double> [#uses=2]
  %112 = icmp eq double* %scevgep.i402, %50       ; <i1> [#uses=1]
  %indvar.next.i403 = add i32 %indvar.i399, 1     ; <i32> [#uses=1]
  br i1 %112, label %_ZN9benchmark10accumulateISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEET0_T_SB_SA_.exit.i, label %bb.i1.i404

_ZN9benchmark10accumulateISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEET0_T_SB_SA_.exit.i: ; preds = %bb.i1.i404
  %113 = fcmp une double %105, %111               ; <i1> [#uses=1]
  br i1 %113, label %bb.i.i406, label %_Z9check_sumd.exit.i407

bb.i.i406:                                        ; preds = %_ZN9benchmark10accumulateISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEET0_T_SB_SA_.exit.i
  %114 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z9check_sumd.exit.i407

_Z9check_sumd.exit.i407:                          ; preds = %bb.i.i406, %_ZN9benchmark10accumulateISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEET0_T_SB_SA_.exit.i
  %115 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %116 = icmp slt i32 %tmp5.i397, %115            ; <i1> [#uses=1]
  br i1 %116, label %bb.i398, label %invcont29

invcont29:                                        ; preds = %_Z9check_sumd.exit.i407, %_Z9check_sumd.exit.i407.us, %invcont28
  %117 = phi i32 [ %102, %invcont28 ], [ %107, %_Z9check_sumd.exit.i407.us ], [ %115, %_Z9check_sumd.exit.i407 ] ; <i32> [#uses=2]
  %118 = icmp sgt i32 %117, 0                     ; <i1> [#uses=1]
  br i1 %118, label %bb.i385.preheader, label %invcont30

bb.i385.preheader:                                ; preds = %invcont29
  %119 = fmul double %init_value.0, 2.000000e+03  ; <double> [#uses=1]
  br label %bb.i385

bb.i385:                                          ; preds = %_Z9check_sumd.exit.i394, %bb.i385.preheader
  %i.03.i383 = phi i32 [ 0, %bb.i385.preheader ], [ %tmp5.i384, %_Z9check_sumd.exit.i394 ] ; <i32> [#uses=1]
  %tmp5.i384 = add i32 %i.03.i383, 1              ; <i32> [#uses=2]
  br label %bb.i1.i391

bb.i1.i391:                                       ; preds = %bb.i1.i391, %bb.i385
  %indvar.i386 = phi i32 [ 0, %bb.i385 ], [ %tmp729, %bb.i1.i391 ] ; <i32> [#uses=2]
  %result_addr.01.i.i387 = phi double [ 0.000000e+00, %bb.i385 ], [ %121, %bb.i1.i391 ] ; <double> [#uses=1]
  %tmp729 = add i32 %indvar.i386, 1               ; <i32> [#uses=2]
  %scevgep.i388 = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i386 ; <double*> [#uses=1]
  %120 = load double* %scevgep.i388, align 8      ; <double> [#uses=1]
  %121 = fadd double %120, %result_addr.01.i.i387 ; <double> [#uses=2]
  %scevgep4.i390.idx.mask = and i32 %tmp729, 536870911 ; <i32> [#uses=1]
  %122 = icmp eq i32 %scevgep4.i390.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %122, label %_ZN9benchmark10accumulateISt16reverse_iteratorIS1_IPdEEdEET0_T_S6_S5_.exit.i, label %bb.i1.i391

_ZN9benchmark10accumulateISt16reverse_iteratorIS1_IPdEEdEET0_T_S6_S5_.exit.i: ; preds = %bb.i1.i391
  %123 = fcmp une double %119, %121               ; <i1> [#uses=1]
  br i1 %123, label %bb.i.i393, label %_Z9check_sumd.exit.i394

bb.i.i393:                                        ; preds = %_ZN9benchmark10accumulateISt16reverse_iteratorIS1_IPdEEdEET0_T_S6_S5_.exit.i
  %124 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z9check_sumd.exit.i394

_Z9check_sumd.exit.i394:                          ; preds = %bb.i.i393, %_ZN9benchmark10accumulateISt16reverse_iteratorIS1_IPdEEdEET0_T_S6_S5_.exit.i
  %125 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %126 = icmp slt i32 %tmp5.i384, %125            ; <i1> [#uses=1]
  br i1 %126, label %bb.i385, label %invcont30

invcont30:                                        ; preds = %_Z9check_sumd.exit.i394, %invcont29
  %127 = phi i32 [ %117, %invcont29 ], [ %125, %_Z9check_sumd.exit.i394 ] ; <i32> [#uses=2]
  %128 = icmp sgt i32 %127, 0                     ; <i1> [#uses=1]
  br i1 %128, label %bb.i370.preheader, label %invcont31

bb.i370.preheader:                                ; preds = %invcont30
  %129 = icmp eq double* %50, %51                 ; <i1> [#uses=1]
  %130 = fmul double %init_value.0, 2.000000e+03  ; <double> [#uses=2]
  br i1 %129, label %bb.i370.us.preheader, label %bb.i370

bb.i370.us.preheader:                             ; preds = %bb.i370.preheader
  %131 = fcmp une double %130, 0.000000e+00       ; <i1> [#uses=1]
  br label %bb.i370.us

bb.i370.us:                                       ; preds = %_Z9check_sumd.exit.i380.us, %bb.i370.us.preheader
  %i.03.i368.us = phi i32 [ %tmp5.i369.us, %_Z9check_sumd.exit.i380.us ], [ 0, %bb.i370.us.preheader ] ; <i32> [#uses=1]
  %tmp5.i369.us = add i32 %i.03.i368.us, 1        ; <i32> [#uses=2]
  br i1 %131, label %bb.i.i379.us, label %_Z9check_sumd.exit.i380.us

_Z9check_sumd.exit.i380.us:                       ; preds = %bb.i.i379.us, %bb.i370.us
  %132 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %133 = icmp slt i32 %tmp5.i369.us, %132         ; <i1> [#uses=1]
  br i1 %133, label %bb.i370.us, label %invcont31

bb.i.i379.us:                                     ; preds = %bb.i370.us
  %134 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z9check_sumd.exit.i380.us

bb.i370:                                          ; preds = %_Z9check_sumd.exit.i380, %bb.i370.preheader
  %i.03.i368 = phi i32 [ %tmp5.i369, %_Z9check_sumd.exit.i380 ], [ 0, %bb.i370.preheader ] ; <i32> [#uses=1]
  %tmp5.i369 = add i32 %i.03.i368, 1              ; <i32> [#uses=2]
  br label %bb.i1.i376

bb.i1.i376:                                       ; preds = %bb.i1.i376, %bb.i370
  %indvar.i371 = phi i32 [ 0, %bb.i370 ], [ %tmp726, %bb.i1.i376 ] ; <i32> [#uses=2]
  %result_addr.01.i.i372 = phi double [ 0.000000e+00, %bb.i370 ], [ %136, %bb.i1.i376 ] ; <double> [#uses=1]
  %tmp726 = add i32 %indvar.i371, 1               ; <i32> [#uses=2]
  %scevgep4.i375 = getelementptr double* %50, i32 %tmp726 ; <double*> [#uses=1]
  %scevgep.i373 = getelementptr double* %50, i32 %indvar.i371 ; <double*> [#uses=1]
  %135 = load double* %scevgep.i373, align 8      ; <double> [#uses=1]
  %136 = fadd double %135, %result_addr.01.i.i372 ; <double> [#uses=2]
  %137 = icmp eq double* %scevgep4.i375, %51      ; <i1> [#uses=1]
  br i1 %137, label %_ZN9benchmark10accumulateISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEET0_T_SC_SB_.exit.i378, label %bb.i1.i376

_ZN9benchmark10accumulateISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEET0_T_SC_SB_.exit.i378: ; preds = %bb.i1.i376
  %138 = fcmp une double %130, %136               ; <i1> [#uses=1]
  br i1 %138, label %bb.i.i379, label %_Z9check_sumd.exit.i380

bb.i.i379:                                        ; preds = %_ZN9benchmark10accumulateISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEET0_T_SC_SB_.exit.i378
  %139 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z9check_sumd.exit.i380

_Z9check_sumd.exit.i380:                          ; preds = %bb.i.i379, %_ZN9benchmark10accumulateISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEET0_T_SC_SB_.exit.i378
  %140 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %141 = icmp slt i32 %tmp5.i369, %140            ; <i1> [#uses=1]
  br i1 %141, label %bb.i370, label %invcont31

invcont31:                                        ; preds = %_Z9check_sumd.exit.i380, %_Z9check_sumd.exit.i380.us, %invcont30
  %142 = phi i32 [ %127, %invcont30 ], [ %132, %_Z9check_sumd.exit.i380.us ], [ %140, %_Z9check_sumd.exit.i380 ] ; <i32> [#uses=2]
  %143 = icmp sgt i32 %142, 0                     ; <i1> [#uses=1]
  br i1 %143, label %bb.i361.preheader, label %invcont33

bb.i361.preheader:                                ; preds = %invcont31
  %144 = icmp eq double* %50, %51                 ; <i1> [#uses=1]
  %145 = fmul double %init_value.0, 2.000000e+03  ; <double> [#uses=2]
  br i1 %144, label %bb.i361.us.preheader, label %bb.i361

bb.i361.us.preheader:                             ; preds = %bb.i361.preheader
  %146 = fcmp une double %145, 0.000000e+00       ; <i1> [#uses=1]
  br label %bb.i361.us

bb.i361.us:                                       ; preds = %_Z9check_sumd.exit.i.us, %bb.i361.us.preheader
  %i.03.i359.us = phi i32 [ %tmp5.i360.us, %_Z9check_sumd.exit.i.us ], [ 0, %bb.i361.us.preheader ] ; <i32> [#uses=1]
  %tmp5.i360.us = add i32 %i.03.i359.us, 1        ; <i32> [#uses=2]
  br i1 %146, label %bb.i.i366.us, label %_Z9check_sumd.exit.i.us

_Z9check_sumd.exit.i.us:                          ; preds = %bb.i.i366.us, %bb.i361.us
  %147 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %148 = icmp slt i32 %tmp5.i360.us, %147         ; <i1> [#uses=1]
  br i1 %148, label %bb.i361.us, label %invcont33

bb.i.i366.us:                                     ; preds = %bb.i361.us
  %149 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z9check_sumd.exit.i.us

bb.i361:                                          ; preds = %_Z9check_sumd.exit.i, %bb.i361.preheader
  %i.03.i359 = phi i32 [ %tmp5.i360, %_Z9check_sumd.exit.i ], [ 0, %bb.i361.preheader ] ; <i32> [#uses=1]
  %tmp5.i360 = add i32 %i.03.i359, 1              ; <i32> [#uses=2]
  br label %bb.i1.i365

bb.i1.i365:                                       ; preds = %bb.i1.i365, %bb.i361
  %indvar.i362 = phi i32 [ 0, %bb.i361 ], [ %tmp723, %bb.i1.i365 ] ; <i32> [#uses=2]
  %result_addr.01.i.i = phi double [ 0.000000e+00, %bb.i361 ], [ %151, %bb.i1.i365 ] ; <double> [#uses=1]
  %tmp723 = add i32 %indvar.i362, 1               ; <i32> [#uses=2]
  %scevgep4.i = getelementptr double* %50, i32 %tmp723 ; <double*> [#uses=1]
  %scevgep.i363 = getelementptr double* %50, i32 %indvar.i362 ; <double*> [#uses=1]
  %150 = load double* %scevgep.i363, align 8      ; <double> [#uses=1]
  %151 = fadd double %150, %result_addr.01.i.i    ; <double> [#uses=2]
  %152 = icmp eq double* %scevgep4.i, %51         ; <i1> [#uses=1]
  br i1 %152, label %_ZN9benchmark10accumulateISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEET0_T_SC_SB_.exit.i, label %bb.i1.i365

_ZN9benchmark10accumulateISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEET0_T_SC_SB_.exit.i: ; preds = %bb.i1.i365
  %153 = fcmp une double %145, %151               ; <i1> [#uses=1]
  br i1 %153, label %bb.i.i366, label %_Z9check_sumd.exit.i

bb.i.i366:                                        ; preds = %_ZN9benchmark10accumulateISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEET0_T_SC_SB_.exit.i
  %154 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z9check_sumd.exit.i

_Z9check_sumd.exit.i:                             ; preds = %bb.i.i366, %_ZN9benchmark10accumulateISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEET0_T_SC_SB_.exit.i
  %155 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %156 = icmp slt i32 %tmp5.i360, %155            ; <i1> [#uses=1]
  br i1 %156, label %bb.i361, label %invcont33

invcont33:                                        ; preds = %_Z9check_sumd.exit.i, %_Z9check_sumd.exit.i.us, %invcont31
  %157 = phi i32 [ %142, %invcont31 ], [ %147, %_Z9check_sumd.exit.i.us ], [ %155, %_Z9check_sumd.exit.i ] ; <i32> [#uses=1]
  %158 = sdiv i32 %157, 1000                      ; <i32> [#uses=1]
  store i32 %158, i32* @iterations, align 4
  %159 = getelementptr inbounds %"struct.std::vector<double,std::allocator<double> >"* %vec_dataMaster, i32 0, i32 0, i32 0, i32 0 ; <double**> [#uses=10]
  store double* null, double** %159, align 8
  %160 = getelementptr inbounds %"struct.std::vector<double,std::allocator<double> >"* %vec_dataMaster, i32 0, i32 0, i32 0, i32 1 ; <double**> [#uses=7]
  store double* null, double** %160, align 4
  %161 = getelementptr inbounds %"struct.std::vector<double,std::allocator<double> >"* %vec_dataMaster, i32 0, i32 0, i32 0, i32 2 ; <double**> [#uses=1]
  store double* null, double** %161, align 8
  store double 0.000000e+00, double* %__x_addr.i353, align 8
  invoke fastcc void @_ZNSt6vectorIdSaIdEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPdS1_EEjRKd(%"struct.std::vector<double,std::allocator<double> >"* %vec_dataMaster, double* %__x_addr.i353)
          to label %bb.i352 unwind label %lpad132

bb.i352:                                          ; preds = %bb.i352, %invcont33
  %indvar.i348 = phi i32 [ %tmp635, %bb.i352 ], [ 0, %invcont33 ] ; <i32> [#uses=2]
  %tmp635 = add i32 %indvar.i348, 1               ; <i32> [#uses=2]
  %first_addr.01.i349 = getelementptr [2000 x double]* @dataMaster, i32 0, i32 %indvar.i348 ; <double*> [#uses=1]
  %162 = call i32 @rand() nounwind                ; <i32> [#uses=1]
  %163 = sitofp i32 %162 to double                ; <double> [#uses=1]
  store double %163, double* %first_addr.01.i349, align 8
  %scevgep.i351.idx.mask = and i32 %tmp635, 536870911 ; <i32> [#uses=1]
  %164 = icmp eq i32 %scevgep.i351.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %164, label %invcont35, label %bb.i352

invcont35:                                        ; preds = %bb.i352
  %165 = load double** %159, align 8              ; <double*> [#uses=1]
  br label %bb.i347

bb.i347:                                          ; preds = %bb.i347, %invcont35
  %indvar.i344 = phi i32 [ 0, %invcont35 ], [ %tmp636, %bb.i347 ] ; <i32> [#uses=3]
  %tmp636 = add i32 %indvar.i344, 1               ; <i32> [#uses=2]
  %firstDest_addr.0.01.i = getelementptr double* %165, i32 %indvar.i344 ; <double*> [#uses=1]
  %firstSource_addr.02.i = getelementptr [2000 x double]* @dataMaster, i32 0, i32 %indvar.i344 ; <double*> [#uses=1]
  %166 = load double* %firstSource_addr.02.i, align 8 ; <double> [#uses=1]
  store double %166, double* %firstDest_addr.0.01.i, align 8
  %scevgep.i346.idx.mask = and i32 %tmp636, 536870911 ; <i32> [#uses=1]
  %167 = icmp eq i32 %scevgep.i346.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %167, label %invcont46, label %bb.i347

invcont46:                                        ; preds = %bb.i347
  %.pre754 = load double** %159, align 8          ; <double*> [#uses=22]
  %168 = load double** %160, align 4              ; <double*> [#uses=17]
  %169 = load i32* @iterations, align 4           ; <i32> [#uses=3]
  %170 = icmp sgt i32 %169, 0                     ; <i1> [#uses=1]
  br i1 %170, label %bb.i320, label %invcont51

bb.i320:                                          ; preds = %_Z13verify_sortedIPdEvT_S1_.exit.i343, %invcont46
  %i.07.i318 = phi i32 [ %tmp15.i319, %_Z13verify_sortedIPdEvT_S1_.exit.i343 ], [ 0, %invcont46 ] ; <i32> [#uses=1]
  %tmp15.i319 = add i32 %i.07.i318, 1             ; <i32> [#uses=2]
  br label %bb.i.i326

bb.i.i326:                                        ; preds = %bb.i.i326, %bb.i320
  %indvar.i.i321 = phi i32 [ 0, %bb.i320 ], [ %tmp719, %bb.i.i326 ] ; <i32> [#uses=3]
  %tmp719 = add i32 %indvar.i.i321, 1             ; <i32> [#uses=2]
  %firstSource_addr.02.i.i325 = getelementptr [2000 x double]* @dataMaster, i32 0, i32 %indvar.i.i321 ; <double*> [#uses=1]
  %firstDest_addr.01.i.i324 = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i321 ; <double*> [#uses=1]
  %171 = load double* %firstSource_addr.02.i.i325, align 8 ; <double> [#uses=1]
  store double %171, double* %firstDest_addr.01.i.i324, align 8
  %scevgep.i.i323.idx.mask = and i32 %tmp719, 536870911 ; <i32> [#uses=1]
  %172 = icmp eq i32 %scevgep.i.i323.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %172, label %bb.i3.i329, label %bb.i.i326

bb.i3.i329:                                       ; preds = %bb7.i.i, %bb.i.i326
  %173 = phi i32 [ %tmp715, %bb7.i.i ], [ 0, %bb.i.i326 ] ; <i32> [#uses=3]
  %tmp715 = add i32 %173, 1                       ; <i32> [#uses=3]
  %tmp718 = add i32 %173, 2                       ; <i32> [#uses=1]
  %p.04.i.i = getelementptr [2000 x double]* @data, i32 0, i32 %tmp715 ; <double*> [#uses=1]
  %174 = load double* %p.04.i.i, align 8          ; <double> [#uses=2]
  br label %bb2.i.i334

bb1.i.i331:                                       ; preds = %bb3.i.i
  store double %176, double* %j.0.i.i, align 8
  %indvar.next.i.i330 = add i32 %indvar.i4.i332, 1 ; <i32> [#uses=1]
  br label %bb2.i.i334

bb2.i.i334:                                       ; preds = %bb1.i.i331, %bb.i3.i329
  %indvar.i4.i332 = phi i32 [ 0, %bb.i3.i329 ], [ %indvar.next.i.i330, %bb1.i.i331 ] ; <i32> [#uses=3]
  %tmp716 = sub i32 %tmp715, %indvar.i4.i332      ; <i32> [#uses=1]
  %j.0.i.i = getelementptr [2000 x double]* @data, i32 0, i32 %tmp716 ; <double*> [#uses=3]
  %175 = icmp eq double* %j.0.i.i, getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0) ; <i1> [#uses=1]
  br i1 %175, label %bb7.i.i, label %bb3.i.i

bb3.i.i:                                          ; preds = %bb2.i.i334
  %tmp714 = sub i32 %173, %indvar.i4.i332         ; <i32> [#uses=1]
  %scevgep.i5.i335 = getelementptr [2000 x double]* @data, i32 0, i32 %tmp714 ; <double*> [#uses=1]
  %176 = load double* %scevgep.i5.i335, align 8   ; <double> [#uses=2]
  %177 = fcmp ule double %176, %174               ; <i1> [#uses=1]
  br i1 %177, label %bb7.i.i, label %bb1.i.i331

bb7.i.i:                                          ; preds = %bb3.i.i, %bb2.i.i334
  store double %174, double* %j.0.i.i, align 8
  %p.0.i.i.idx.mask = and i32 %tmp718, 536870911  ; <i32> [#uses=1]
  %178 = icmp eq i32 %p.0.i.i.idx.mask, 2000      ; <i1> [#uses=1]
  br i1 %178, label %bb2.i.i.i341, label %bb.i3.i329

bb.i.i.i337:                                      ; preds = %bb2.i.i.i341
  %prev.0.i.i.i336 = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i.i338 ; <double*> [#uses=1]
  %179 = load double* %first_addr.0.i.i.i340, align 8 ; <double> [#uses=1]
  %180 = load double* %prev.0.i.i.i336, align 8   ; <double> [#uses=1]
  %181 = fcmp olt double %179, %180               ; <i1> [#uses=1]
  br i1 %181, label %bb.i2.i342, label %bb2.i.i.i341

bb2.i.i.i341:                                     ; preds = %bb.i.i.i337, %bb7.i.i
  %indvar.i.i.i338 = phi i32 [ %tmp720, %bb.i.i.i337 ], [ 0, %bb7.i.i ] ; <i32> [#uses=2]
  %tmp720 = add i32 %indvar.i.i.i338, 1           ; <i32> [#uses=2]
  %first_addr.0.i.i.i340 = getelementptr [2000 x double]* @data, i32 0, i32 %tmp720 ; <double*> [#uses=2]
  %182 = icmp eq double* %first_addr.0.i.i.i340, getelementptr ([2000 x double]* @data, i32 1, i32 0) ; <i1> [#uses=1]
  br i1 %182, label %_Z13verify_sortedIPdEvT_S1_.exit.i343, label %bb.i.i.i337

bb.i2.i342:                                       ; preds = %bb.i.i.i337
  %183 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIPdEvT_S1_.exit.i343

_Z13verify_sortedIPdEvT_S1_.exit.i343:            ; preds = %bb.i2.i342, %bb2.i.i.i341
  %184 = load i32* @iterations, align 4           ; <i32> [#uses=3]
  %185 = icmp slt i32 %tmp15.i319, %184           ; <i1> [#uses=1]
  br i1 %185, label %bb.i320, label %invcont51

invcont51:                                        ; preds = %_Z13verify_sortedIPdEvT_S1_.exit.i343, %invcont46
  %.rle189 = phi i32 [ %169, %invcont46 ], [ %184, %_Z13verify_sortedIPdEvT_S1_.exit.i343 ] ; <i32> [#uses=1]
  %186 = phi i32 [ %169, %invcont46 ], [ %184, %_Z13verify_sortedIPdEvT_S1_.exit.i343 ] ; <i32> [#uses=1]
  %187 = load double** %44, align 4               ; <double*> [#uses=3]
  %188 = load double** %43, align 8               ; <double*> [#uses=9]
  %189 = icmp sgt i32 %186, 0                     ; <i1> [#uses=1]
  br i1 %189, label %bb.nph.i297, label %invcont70

bb.nph.i297:                                      ; preds = %invcont51
  %190 = icmp eq double* %.pre754, %168           ; <i1> [#uses=1]
  %p.0.04.i.i = getelementptr inbounds double* %188, i32 1 ; <double*> [#uses=1]
  %191 = icmp eq double* %p.0.04.i.i, %187        ; <i1> [#uses=1]
  br label %bb.i298

bb.i298:                                          ; preds = %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i316, %bb.nph.i297
  %i.07.i = phi i32 [ 0, %bb.nph.i297 ], [ %tmp15.i, %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i316 ] ; <i32> [#uses=1]
  %tmp15.i = add i32 %i.07.i, 1                   ; <i32> [#uses=2]
  br i1 %190, label %_ZN9benchmark4copyIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEES7_EEvT_S8_T0_.exit.i305, label %bb.i.i304

bb.i.i304:                                        ; preds = %bb.i.i304, %bb.i298
  %indvar.i.i299 = phi i32 [ %tmp710, %bb.i.i304 ], [ 0, %bb.i298 ] ; <i32> [#uses=3]
  %tmp710 = add i32 %indvar.i.i299, 1             ; <i32> [#uses=2]
  %scevgep.i.i301 = getelementptr double* %.pre754, i32 %tmp710 ; <double*> [#uses=1]
  %firstSource_addr.0.02.i.i303 = getelementptr double* %.pre754, i32 %indvar.i.i299 ; <double*> [#uses=1]
  %firstDest_addr.0.01.i.i302 = getelementptr double* %188, i32 %indvar.i.i299 ; <double*> [#uses=1]
  %192 = load double* %firstSource_addr.0.02.i.i303, align 8 ; <double> [#uses=1]
  store double %192, double* %firstDest_addr.0.01.i.i302, align 8
  %193 = icmp eq double* %scevgep.i.i301, %168    ; <i1> [#uses=1]
  br i1 %193, label %_ZN9benchmark4copyIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEES7_EEvT_S8_T0_.exit.i305, label %bb.i.i304

_ZN9benchmark4copyIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEES7_EEvT_S8_T0_.exit.i305: ; preds = %bb.i.i304, %bb.i298
  br i1 %191, label %bb2.i.i.i314, label %bb.i3.i

bb.i3.i:                                          ; preds = %bb11.i.i, %_ZN9benchmark4copyIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEES7_EEvT_S8_T0_.exit.i305
  %194 = phi i32 [ %tmp706, %bb11.i.i ], [ 0, %_ZN9benchmark4copyIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEES7_EEvT_S8_T0_.exit.i305 ] ; <i32> [#uses=3]
  %tmp706 = add i32 %194, 1                       ; <i32> [#uses=3]
  %tmp709 = add i32 %194, 2                       ; <i32> [#uses=1]
  %p.0.0.i.i = getelementptr double* %188, i32 %tmp709 ; <double*> [#uses=1]
  %p.0.05.i.i = getelementptr double* %188, i32 %tmp706 ; <double*> [#uses=1]
  %195 = load double* %p.0.05.i.i, align 8        ; <double> [#uses=2]
  br label %bb2.i.i

bb1.i.i:                                          ; preds = %bb6.i.i
  store double %197, double* %j.0.0.i.i, align 8
  %indvar.next.i.i = add i32 %indvar.i4.i, 1      ; <i32> [#uses=1]
  br label %bb2.i.i

bb2.i.i:                                          ; preds = %bb1.i.i, %bb.i3.i
  %indvar.i4.i = phi i32 [ 0, %bb.i3.i ], [ %indvar.next.i.i, %bb1.i.i ] ; <i32> [#uses=3]
  %tmp707 = sub i32 %tmp706, %indvar.i4.i         ; <i32> [#uses=1]
  %j.0.0.i.i = getelementptr double* %188, i32 %tmp707 ; <double*> [#uses=3]
  %196 = icmp eq double* %j.0.0.i.i, %188         ; <i1> [#uses=1]
  br i1 %196, label %bb11.i.i, label %bb6.i.i

bb6.i.i:                                          ; preds = %bb2.i.i
  %tmp705 = sub i32 %194, %indvar.i4.i            ; <i32> [#uses=1]
  %scevgep.i5.i = getelementptr double* %188, i32 %tmp705 ; <double*> [#uses=1]
  %197 = load double* %scevgep.i5.i, align 8      ; <double> [#uses=2]
  %198 = fcmp ule double %197, %195               ; <i1> [#uses=1]
  br i1 %198, label %bb11.i.i, label %bb1.i.i

bb11.i.i:                                         ; preds = %bb6.i.i, %bb2.i.i
  store double %195, double* %j.0.0.i.i, align 8
  %199 = icmp eq double* %p.0.0.i.i, %187         ; <i1> [#uses=1]
  br i1 %199, label %bb2.i.i.i314, label %bb.i3.i

bb.i.i.i311:                                      ; preds = %bb2.i.i.i314
  %prev.0.0.i.i.i310 = getelementptr double* %188, i32 %indvar.i.i.i312 ; <double*> [#uses=1]
  %200 = load double* %first_addr.0.0.i.i.i313, align 8 ; <double> [#uses=1]
  %201 = load double* %prev.0.0.i.i.i310, align 8 ; <double> [#uses=1]
  %202 = fcmp olt double %200, %201               ; <i1> [#uses=1]
  br i1 %202, label %bb.i2.i315, label %bb2.i.i.i314

bb2.i.i.i314:                                     ; preds = %bb.i.i.i311, %bb11.i.i, %_ZN9benchmark4copyIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEES7_EEvT_S8_T0_.exit.i305
  %indvar.i.i.i312 = phi i32 [ %tmp711, %bb.i.i.i311 ], [ 0, %bb11.i.i ], [ 0, %_ZN9benchmark4copyIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEES7_EEvT_S8_T0_.exit.i305 ] ; <i32> [#uses=2]
  %tmp711 = add i32 %indvar.i.i.i312, 1           ; <i32> [#uses=2]
  %first_addr.0.0.i.i.i313 = getelementptr double* %188, i32 %tmp711 ; <double*> [#uses=2]
  %203 = icmp eq double* %first_addr.0.0.i.i.i313, %187 ; <i1> [#uses=1]
  br i1 %203, label %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i316, label %bb.i.i.i311

bb.i2.i315:                                       ; preds = %bb.i.i.i311
  %204 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i316

_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i316: ; preds = %bb.i2.i315, %bb2.i.i.i314
  %205 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %206 = icmp slt i32 %tmp15.i, %205              ; <i1> [#uses=1]
  br i1 %206, label %bb.i298, label %invcont70

invcont70:                                        ; preds = %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i316, %invcont51
  %207 = phi i32 [ %.rle189, %invcont51 ], [ %205, %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i316 ] ; <i32> [#uses=1]
  %208 = icmp sgt i32 %207, 0                     ; <i1> [#uses=1]
  br i1 %208, label %bb.i3.i5.preheader, label %_Z19test_insertion_sortISt16reverse_iteratorIPdEdEvT_S3_S3_S3_T0_PKc.exit

bb.i3.i5.preheader:                               ; preds = %_Z13verify_sortedISt16reverse_iteratorIPdEEvT_S3_.exit.i24, %invcont70
  %i.09.i = phi i32 [ %tmp24.i, %_Z13verify_sortedISt16reverse_iteratorIPdEEvT_S3_.exit.i24 ], [ 0, %invcont70 ] ; <i32> [#uses=1]
  %tmp24.i = add i32 %i.09.i, 1                   ; <i32> [#uses=2]
  br label %bb.i3.i5

bb.i3.i5:                                         ; preds = %bb.i3.i5, %bb.i3.i5.preheader
  %indvar.i3 = phi i32 [ %indvar.next.i4, %bb.i3.i5 ], [ 0, %bb.i3.i5.preheader ] ; <i32> [#uses=2]
  %tmp17.i = xor i32 %indvar.i3, -1               ; <i32> [#uses=2]
  %scevgep.i = getelementptr [2000 x double]* @data, i32 1, i32 %tmp17.i ; <double*> [#uses=1]
  %scevgep18.i = getelementptr [2000 x double]* @dataMaster, i32 1, i32 %tmp17.i ; <double*> [#uses=2]
  %209 = load double* %scevgep18.i, align 8       ; <double> [#uses=1]
  store double %209, double* %scevgep.i, align 8
  %210 = icmp eq double* %scevgep18.i, getelementptr inbounds ([2000 x double]* @dataMaster, i32 0, i32 0) ; <i1> [#uses=1]
  %indvar.next.i4 = add i32 %indvar.i3, 1         ; <i32> [#uses=1]
  br i1 %210, label %bb.i1.i10, label %bb.i3.i5

bb.i1.i10:                                        ; preds = %bb12.i.i, %bb.i3.i5
  %indvar6.i.i = phi i32 [ %sum25.i, %bb12.i.i ], [ 0, %bb.i3.i5 ] ; <i32> [#uses=3]
  %sum25.i = add i32 %indvar6.i.i, 1              ; <i32> [#uses=3]
  %sum.i = add i32 %indvar6.i.i, 2                ; <i32> [#uses=1]
  %tmp10.i8 = sub i32 -2, %indvar6.i.i            ; <i32> [#uses=1]
  %p.0.0.i.i9 = getelementptr [2000 x double]* @data, i32 1, i32 %tmp10.i8 ; <double*> [#uses=2]
  %211 = load double* %p.0.0.i.i9, align 8        ; <double> [#uses=2]
  br label %bb3.i.i15

bb2.i.i12:                                        ; preds = %bb7.i.i16
  store double %213, double* %scevgep.i.i14, align 8
  %indvar.next.i.i11 = add i32 %indvar.i.i13, 1   ; <i32> [#uses=1]
  br label %bb3.i.i15

bb3.i.i15:                                        ; preds = %bb2.i.i12, %bb.i1.i10
  %indvar.i.i13 = phi i32 [ 0, %bb.i1.i10 ], [ %indvar.next.i.i11, %bb2.i.i12 ] ; <i32> [#uses=4]
  %tmp11.i = sub i32 %indvar.i.i13, %sum.i        ; <i32> [#uses=1]
  %scevgep.i.i14 = getelementptr [2000 x double]* @data, i32 1, i32 %tmp11.i ; <double*> [#uses=1]
  %tmp9.i.i = sub i32 %indvar.i.i13, %sum25.i     ; <i32> [#uses=2]
  %212 = icmp eq i32 %indvar.i.i13, %sum25.i      ; <i1> [#uses=1]
  br i1 %212, label %bb12.i.i, label %bb7.i.i16

bb7.i.i16:                                        ; preds = %bb3.i.i15
  %prev.0.0.i.i = getelementptr [2000 x double]* @data, i32 1, i32 %tmp9.i.i ; <double*> [#uses=1]
  %213 = load double* %prev.0.0.i.i, align 8      ; <double> [#uses=2]
  %214 = fcmp ule double %213, %211               ; <i1> [#uses=1]
  br i1 %214, label %bb12.i.i, label %bb2.i.i12

bb12.i.i:                                         ; preds = %bb7.i.i16, %bb3.i.i15
  %prev.0.0.sum.i.i = add i32 %tmp9.i.i, -1       ; <i32> [#uses=1]
  %215 = getelementptr [2000 x double]* @data, i32 1, i32 %prev.0.0.sum.i.i ; <double*> [#uses=1]
  store double %211, double* %215, align 8
  %216 = icmp eq double* %p.0.0.i.i9, getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0) ; <i1> [#uses=1]
  br i1 %216, label %bb3.i.i.i22, label %bb.i1.i10

bb.i.i.i19:                                       ; preds = %bb3.i.i.i22
  %tmp22.i = sub i32 -2, %indvar.i.i.i20          ; <i32> [#uses=1]
  %scevgep4.i.i17 = getelementptr [2000 x double]* @data, i32 1, i32 %tmp22.i ; <double*> [#uses=1]
  %217 = load double* %scevgep4.i.i17, align 8    ; <double> [#uses=1]
  %218 = load double* %scevgep.i.i.i21, align 8   ; <double> [#uses=1]
  %219 = fcmp olt double %217, %218               ; <i1> [#uses=1]
  %indvar.next.i.i.i18 = add i32 %indvar.i.i.i20, 1 ; <i32> [#uses=1]
  br i1 %219, label %bb.i.i23, label %bb3.i.i.i22

bb3.i.i.i22:                                      ; preds = %bb.i.i.i19, %bb12.i.i
  %indvar.i.i.i20 = phi i32 [ %indvar.next.i.i.i18, %bb.i.i.i19 ], [ 0, %bb12.i.i ] ; <i32> [#uses=3]
  %tmp20.i = xor i32 %indvar.i.i.i20, -1          ; <i32> [#uses=1]
  %scevgep.i.i.i21 = getelementptr [2000 x double]* @data, i32 1, i32 %tmp20.i ; <double*> [#uses=2]
  %220 = icmp eq double* %scevgep.i.i.i21, getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0) ; <i1> [#uses=1]
  br i1 %220, label %_Z13verify_sortedISt16reverse_iteratorIPdEEvT_S3_.exit.i24, label %bb.i.i.i19

bb.i.i23:                                         ; preds = %bb.i.i.i19
  %221 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIPdEEvT_S3_.exit.i24

_Z13verify_sortedISt16reverse_iteratorIPdEEvT_S3_.exit.i24: ; preds = %bb.i.i23, %bb3.i.i.i22
  %222 = load i32* @iterations, align 4           ; <i32> [#uses=1]
  %223 = icmp slt i32 %tmp24.i, %222              ; <i1> [#uses=1]
  br i1 %223, label %bb.i3.i5.preheader, label %_Z19test_insertion_sortISt16reverse_iteratorIPdEdEvT_S3_S3_S3_T0_PKc.exit

_Z19test_insertion_sortISt16reverse_iteratorIPdEdEvT_S3_S3_S3_T0_PKc.exit: ; preds = %_Z13verify_sortedISt16reverse_iteratorIPdEEvT_S3_.exit.i24, %invcont70
  %224 = load double** %43, align 8               ; <double*> [#uses=1]
  %225 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %31, i32 0, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %224, double** %225, align 8
  %226 = load double** %44, align 4               ; <double*> [#uses=1]
  %227 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %30, i32 0, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %226, double** %227, align 8
  %228 = load double** %159, align 8              ; <double*> [#uses=1]
  %229 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %29, i32 0, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %228, double** %229, align 8
  %230 = load double** %160, align 4              ; <double*> [#uses=1]
  %231 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %28, i32 0, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %230, double** %231, align 8
  call fastcc void @_Z19test_insertion_sortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEvT_S9_S9_S9_T0_PKc(%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %28, %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %29, %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %30, %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %31)
  %232 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %27, i32 0, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %50, double** %232, align 8
  %233 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %26, i32 0, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %51, double** %233, align 8
  %234 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %25, i32 0, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %.pre754, double** %234, align 8
  %235 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %24, i32 0, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %168, double** %235, align 8
  call fastcc void @_Z19test_insertion_sortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEvT_S9_S9_S9_T0_PKc(%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %24, %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %25, %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %26, %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %27)
  %236 = load i32* @iterations, align 4           ; <i32> [#uses=1]
  %237 = icmp sgt i32 %236, 0                     ; <i1> [#uses=1]
  br i1 %237, label %bb.i4.i.preheader, label %_Z19test_insertion_sortISt16reverse_iteratorIS0_IPdEEdEvT_S4_S4_S4_T0_PKc.exit

bb.i4.i.preheader:                                ; preds = %_Z13verify_sortedISt16reverse_iteratorIS0_IPdEEEvT_S4_.exit.i48, %_Z19test_insertion_sortISt16reverse_iteratorIPdEdEvT_S3_S3_S3_T0_PKc.exit
  %i.010.i = phi i32 [ %tmp21.i, %_Z13verify_sortedISt16reverse_iteratorIS0_IPdEEEvT_S4_.exit.i48 ], [ 0, %_Z19test_insertion_sortISt16reverse_iteratorIPdEdEvT_S3_S3_S3_T0_PKc.exit ] ; <i32> [#uses=1]
  %tmp21.i = add i32 %i.010.i, 1                  ; <i32> [#uses=2]
  br label %bb.i4.i

bb.i4.i:                                          ; preds = %bb.i4.i, %bb.i4.i.preheader
  %indvar.i28 = phi i32 [ %tmp16.i, %bb.i4.i ], [ 0, %bb.i4.i.preheader ] ; <i32> [#uses=3]
  %.1.0.0.i29 = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i28 ; <double*> [#uses=1]
  %scevgep.i30 = getelementptr [2000 x double]* @dataMaster, i32 0, i32 %indvar.i28 ; <double*> [#uses=1]
  %tmp16.i = add i32 %indvar.i28, 1               ; <i32> [#uses=2]
  %238 = load double* %scevgep.i30, align 8       ; <double> [#uses=1]
  store double %238, double* %.1.0.0.i29, align 8
  %scevgep17.i.idx.mask = and i32 %tmp16.i, 536870911 ; <i32> [#uses=1]
  %239 = icmp eq i32 %scevgep17.i.idx.mask, 2000  ; <i1> [#uses=1]
  br i1 %239, label %bb.i1.i33, label %bb.i4.i

bb.i1.i33:                                        ; preds = %bb12.i.i41, %bb.i4.i
  %240 = phi i32 [ %tmp12.i, %bb12.i.i41 ], [ 0, %bb.i4.i ] ; <i32> [#uses=3]
  %tmp12.i = add i32 %240, 1                      ; <i32> [#uses=3]
  %tmp15.i32 = add i32 %240, 2                    ; <i32> [#uses=1]
  %p.1.0.05.i.i = getelementptr [2000 x double]* @data, i32 0, i32 %tmp12.i ; <double*> [#uses=1]
  %241 = load double* %p.1.0.05.i.i, align 8      ; <double> [#uses=2]
  br label %bb3.i.i38

bb2.i.i35:                                        ; preds = %bb7.i.i40
  store double %243, double* %j.1.0.0.i.i, align 8
  %indvar.next.i.i34 = add i32 %indvar.i.i36, 1   ; <i32> [#uses=1]
  br label %bb3.i.i38

bb3.i.i38:                                        ; preds = %bb2.i.i35, %bb.i1.i33
  %indvar.i.i36 = phi i32 [ 0, %bb.i1.i33 ], [ %indvar.next.i.i34, %bb2.i.i35 ] ; <i32> [#uses=3]
  %tmp13.i37 = sub i32 %tmp12.i, %indvar.i.i36    ; <i32> [#uses=1]
  %j.1.0.0.i.i = getelementptr [2000 x double]* @data, i32 0, i32 %tmp13.i37 ; <double*> [#uses=3]
  %242 = icmp eq double* %j.1.0.0.i.i, getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0) ; <i1> [#uses=1]
  br i1 %242, label %bb12.i.i41, label %bb7.i.i40

bb7.i.i40:                                        ; preds = %bb3.i.i38
  %tmp11.i39 = sub i32 %240, %indvar.i.i36        ; <i32> [#uses=1]
  %scevgep.i2.i = getelementptr [2000 x double]* @data, i32 0, i32 %tmp11.i39 ; <double*> [#uses=1]
  %243 = load double* %scevgep.i2.i, align 8      ; <double> [#uses=2]
  %244 = fcmp ule double %243, %241               ; <i1> [#uses=1]
  br i1 %244, label %bb12.i.i41, label %bb2.i.i35

bb12.i.i41:                                       ; preds = %bb7.i.i40, %bb3.i.i38
  store double %241, double* %j.1.0.0.i.i, align 8
  %p.1.0.0.i.i.idx.mask = and i32 %tmp15.i32, 536870911 ; <i32> [#uses=1]
  %245 = icmp eq i32 %p.1.0.0.i.i.idx.mask, 2000  ; <i1> [#uses=1]
  br i1 %245, label %bb3.i.i.i46, label %bb.i1.i33

bb.i.i.i43:                                       ; preds = %bb3.i.i.i46
  %prev.1.0.0.i.i.i42 = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i.i44 ; <double*> [#uses=1]
  %246 = load double* %scevgep.i.i45, align 8     ; <double> [#uses=1]
  %247 = load double* %prev.1.0.0.i.i.i42, align 8 ; <double> [#uses=1]
  %248 = fcmp olt double %246, %247               ; <i1> [#uses=1]
  br i1 %248, label %bb.i.i47, label %bb3.i.i.i46

bb3.i.i.i46:                                      ; preds = %bb.i.i.i43, %bb12.i.i41
  %indvar.i.i.i44 = phi i32 [ %tmp18.i, %bb.i.i.i43 ], [ 0, %bb12.i.i41 ] ; <i32> [#uses=2]
  %tmp18.i = add i32 %indvar.i.i.i44, 1           ; <i32> [#uses=2]
  %scevgep.i.i45 = getelementptr [2000 x double]* @data, i32 0, i32 %tmp18.i ; <double*> [#uses=2]
  %249 = icmp eq double* %scevgep.i.i45, getelementptr ([2000 x double]* @data, i32 1, i32 0) ; <i1> [#uses=1]
  br i1 %249, label %_Z13verify_sortedISt16reverse_iteratorIS0_IPdEEEvT_S4_.exit.i48, label %bb.i.i.i43

bb.i.i47:                                         ; preds = %bb.i.i.i43
  %250 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIS0_IPdEEEvT_S4_.exit.i48

_Z13verify_sortedISt16reverse_iteratorIS0_IPdEEEvT_S4_.exit.i48: ; preds = %bb.i.i47, %bb3.i.i.i46
  %251 = load i32* @iterations, align 4           ; <i32> [#uses=1]
  %252 = icmp slt i32 %tmp21.i, %251              ; <i1> [#uses=1]
  br i1 %252, label %bb.i4.i.preheader, label %_Z19test_insertion_sortISt16reverse_iteratorIS0_IPdEEdEvT_S4_S4_S4_T0_PKc.exit

_Z19test_insertion_sortISt16reverse_iteratorIS0_IPdEEdEvT_S4_S4_S4_T0_PKc.exit: ; preds = %_Z13verify_sortedISt16reverse_iteratorIS0_IPdEEEvT_S4_.exit.i48, %_Z19test_insertion_sortISt16reverse_iteratorIPdEdEvT_S3_S3_S3_T0_PKc.exit
  %253 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %23, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %51, double** %253, align 4
  %254 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %22, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %50, double** %254, align 4
  %255 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %21, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %168, double** %255, align 4
  %256 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %20, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %.pre754, double** %256, align 4
  call fastcc void @_Z19test_insertion_sortISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEvT_SA_SA_SA_T0_PKc(%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %20, %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %21, %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %22, %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %23)
  %257 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %19, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %51, double** %257, align 4
  %258 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %18, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %50, double** %258, align 4
  %259 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %17, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %168, double** %259, align 4
  %260 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %16, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=1]
  store double* %.pre754, double** %260, align 4
  call fastcc void @_Z19test_insertion_sortISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEvT_SA_SA_SA_T0_PKc(%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %16, %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %17, %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %18, %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %19)
  %261 = load i32* @iterations, align 4           ; <i32> [#uses=1]
  %262 = shl i32 %261, 3                          ; <i32> [#uses=3]
  store i32 %262, i32* @iterations, align 4
  %263 = icmp sgt i32 %262, 0                     ; <i1> [#uses=1]
  br i1 %263, label %bb.i276, label %invcont75

bb.i276:                                          ; preds = %_Z13verify_sortedIPdEvT_S1_.exit.i291, %_Z19test_insertion_sortISt16reverse_iteratorIS0_IPdEEdEvT_S4_S4_S4_T0_PKc.exit
  %i.03.i274 = phi i32 [ %tmp5.i275, %_Z13verify_sortedIPdEvT_S1_.exit.i291 ], [ 0, %_Z19test_insertion_sortISt16reverse_iteratorIS0_IPdEEdEvT_S4_S4_S4_T0_PKc.exit ] ; <i32> [#uses=1]
  %tmp5.i275 = add i32 %i.03.i274, 1              ; <i32> [#uses=2]
  br label %bb.i.i282

bb.i.i282:                                        ; preds = %bb.i.i282, %bb.i276
  %indvar.i.i277 = phi i32 [ 0, %bb.i276 ], [ %tmp701, %bb.i.i282 ] ; <i32> [#uses=3]
  %tmp701 = add i32 %indvar.i.i277, 1             ; <i32> [#uses=2]
  %firstSource_addr.02.i.i281 = getelementptr [2000 x double]* @dataMaster, i32 0, i32 %indvar.i.i277 ; <double*> [#uses=1]
  %firstDest_addr.01.i.i280 = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i277 ; <double*> [#uses=1]
  %264 = load double* %firstSource_addr.02.i.i281, align 8 ; <double> [#uses=1]
  store double %264, double* %firstDest_addr.01.i.i280, align 8
  %scevgep.i.i279.idx.mask = and i32 %tmp701, 536870911 ; <i32> [#uses=1]
  %265 = icmp eq i32 %scevgep.i.i279.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %265, label %_ZN9benchmark4copyIPdS1_EEvT_S2_T0_.exit.i283, label %bb.i.i282

_ZN9benchmark4copyIPdS1_EEvT_S2_T0_.exit.i283:    ; preds = %bb.i.i282
  call fastcc void @_ZN9benchmark9quicksortIPddEEvT_S2_(double* getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0), double* getelementptr ([2000 x double]* @data, i32 1, i32 0)) nounwind
  br label %bb2.i.i.i289

bb.i.i.i285:                                      ; preds = %bb2.i.i.i289
  %prev.0.i.i.i284 = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i.i286 ; <double*> [#uses=1]
  %266 = load double* %first_addr.0.i.i.i288, align 8 ; <double> [#uses=1]
  %267 = load double* %prev.0.i.i.i284, align 8   ; <double> [#uses=1]
  %268 = fcmp olt double %266, %267               ; <i1> [#uses=1]
  br i1 %268, label %bb.i2.i290, label %bb2.i.i.i289

bb2.i.i.i289:                                     ; preds = %bb.i.i.i285, %_ZN9benchmark4copyIPdS1_EEvT_S2_T0_.exit.i283
  %indvar.i.i.i286 = phi i32 [ 0, %_ZN9benchmark4copyIPdS1_EEvT_S2_T0_.exit.i283 ], [ %tmp702, %bb.i.i.i285 ] ; <i32> [#uses=2]
  %tmp702 = add i32 %indvar.i.i.i286, 1           ; <i32> [#uses=2]
  %first_addr.0.i.i.i288 = getelementptr [2000 x double]* @data, i32 0, i32 %tmp702 ; <double*> [#uses=2]
  %269 = icmp eq double* %first_addr.0.i.i.i288, getelementptr ([2000 x double]* @data, i32 1, i32 0) ; <i1> [#uses=1]
  br i1 %269, label %_Z13verify_sortedIPdEvT_S1_.exit.i291, label %bb.i.i.i285

bb.i2.i290:                                       ; preds = %bb.i.i.i285
  %270 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIPdEvT_S1_.exit.i291

_Z13verify_sortedIPdEvT_S1_.exit.i291:            ; preds = %bb.i2.i290, %bb2.i.i.i289
  %271 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %272 = icmp slt i32 %tmp5.i275, %271            ; <i1> [#uses=1]
  br i1 %272, label %bb.i276, label %invcont75

invcont75:                                        ; preds = %_Z13verify_sortedIPdEvT_S1_.exit.i291, %_Z19test_insertion_sortISt16reverse_iteratorIS0_IPdEEdEvT_S4_S4_S4_T0_PKc.exit
  %273 = phi i32 [ %262, %_Z19test_insertion_sortISt16reverse_iteratorIS0_IPdEEdEvT_S4_S4_S4_T0_PKc.exit ], [ %271, %_Z13verify_sortedIPdEvT_S1_.exit.i291 ] ; <i32> [#uses=2]
  %274 = load double** %44, align 4               ; <double*> [#uses=4]
  %275 = load double** %43, align 8               ; <double*> [#uses=7]
  %276 = load double** %160, align 4              ; <double*> [#uses=2]
  %277 = load double** %159, align 8              ; <double*> [#uses=3]
  %278 = icmp sgt i32 %273, 0                     ; <i1> [#uses=1]
  br i1 %278, label %bb.nph.i254, label %invcont84

bb.nph.i254:                                      ; preds = %invcont75
  %279 = icmp eq double* %277, %276               ; <i1> [#uses=1]
  br i1 %279, label %bb.i257.us, label %bb.i257

bb.i257.us:                                       ; preds = %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i272.us, %bb.nph.i254
  %i.03.i255.us = phi i32 [ %tmp5.i256.us, %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i272.us ], [ 0, %bb.nph.i254 ] ; <i32> [#uses=1]
  %tmp5.i256.us = add i32 %i.03.i255.us, 1        ; <i32> [#uses=2]
  call fastcc void @_ZN9benchmark9quicksortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEvT_S8_(double* %275, double* %274) nounwind
  br label %bb2.i.i.i270.us

_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i272.us: ; preds = %bb2.i.i.i270.us, %bb.i2.i271.us
  %280 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %281 = icmp slt i32 %tmp5.i256.us, %280         ; <i1> [#uses=1]
  br i1 %281, label %bb.i257.us, label %invcont84

bb.i2.i271.us:                                    ; preds = %bb.i.i.i266.us
  %282 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i272.us

bb.i.i.i266.us:                                   ; preds = %bb2.i.i.i270.us
  %prev.0.0.i.i.i265.us = getelementptr double* %275, i32 %indvar.i.i.i267.us ; <double*> [#uses=1]
  %283 = load double* %first_addr.0.0.i.i.i269.us, align 8 ; <double> [#uses=1]
  %284 = load double* %prev.0.0.i.i.i265.us, align 8 ; <double> [#uses=1]
  %285 = fcmp olt double %283, %284               ; <i1> [#uses=1]
  br i1 %285, label %bb.i2.i271.us, label %bb2.i.i.i270.us

bb2.i.i.i270.us:                                  ; preds = %bb.i.i.i266.us, %bb.i257.us
  %indvar.i.i.i267.us = phi i32 [ 0, %bb.i257.us ], [ %tmp585, %bb.i.i.i266.us ] ; <i32> [#uses=2]
  %tmp585 = add i32 %indvar.i.i.i267.us, 1        ; <i32> [#uses=2]
  %first_addr.0.0.i.i.i269.us = getelementptr double* %275, i32 %tmp585 ; <double*> [#uses=2]
  %286 = icmp eq double* %first_addr.0.0.i.i.i269.us, %274 ; <i1> [#uses=1]
  br i1 %286, label %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i272.us, label %bb.i.i.i266.us

bb.i257:                                          ; preds = %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i272, %bb.nph.i254
  %i.03.i255 = phi i32 [ %tmp5.i256, %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i272 ], [ 0, %bb.nph.i254 ] ; <i32> [#uses=1]
  %tmp5.i256 = add i32 %i.03.i255, 1              ; <i32> [#uses=2]
  br label %bb.i.i263

bb.i.i263:                                        ; preds = %bb.i.i263, %bb.i257
  %indvar.i.i258 = phi i32 [ 0, %bb.i257 ], [ %tmp698, %bb.i.i263 ] ; <i32> [#uses=3]
  %tmp698 = add i32 %indvar.i.i258, 1             ; <i32> [#uses=2]
  %scevgep.i.i260 = getelementptr double* %277, i32 %tmp698 ; <double*> [#uses=1]
  %firstSource_addr.0.02.i.i262 = getelementptr double* %277, i32 %indvar.i.i258 ; <double*> [#uses=1]
  %firstDest_addr.0.01.i.i261 = getelementptr double* %275, i32 %indvar.i.i258 ; <double*> [#uses=1]
  %287 = load double* %firstSource_addr.0.02.i.i262, align 8 ; <double> [#uses=1]
  store double %287, double* %firstDest_addr.0.01.i.i261, align 8
  %288 = icmp eq double* %scevgep.i.i260, %276    ; <i1> [#uses=1]
  br i1 %288, label %_ZN9benchmark4copyIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEES7_EEvT_S8_T0_.exit.i264, label %bb.i.i263

_ZN9benchmark4copyIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEES7_EEvT_S8_T0_.exit.i264: ; preds = %bb.i.i263
  call fastcc void @_ZN9benchmark9quicksortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEvT_S8_(double* %275, double* %274) nounwind
  br label %bb2.i.i.i270

bb.i.i.i266:                                      ; preds = %bb2.i.i.i270
  %prev.0.0.i.i.i265 = getelementptr double* %275, i32 %indvar.i.i.i267 ; <double*> [#uses=1]
  %289 = load double* %first_addr.0.0.i.i.i269, align 8 ; <double> [#uses=1]
  %290 = load double* %prev.0.0.i.i.i265, align 8 ; <double> [#uses=1]
  %291 = fcmp olt double %289, %290               ; <i1> [#uses=1]
  br i1 %291, label %bb.i2.i271, label %bb2.i.i.i270

bb2.i.i.i270:                                     ; preds = %bb.i.i.i266, %_ZN9benchmark4copyIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEES7_EEvT_S8_T0_.exit.i264
  %indvar.i.i.i267 = phi i32 [ 0, %_ZN9benchmark4copyIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEES7_EEvT_S8_T0_.exit.i264 ], [ %tmp699, %bb.i.i.i266 ] ; <i32> [#uses=2]
  %tmp699 = add i32 %indvar.i.i.i267, 1           ; <i32> [#uses=2]
  %first_addr.0.0.i.i.i269 = getelementptr double* %275, i32 %tmp699 ; <double*> [#uses=2]
  %292 = icmp eq double* %first_addr.0.0.i.i.i269, %274 ; <i1> [#uses=1]
  br i1 %292, label %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i272, label %bb.i.i.i266

bb.i2.i271:                                       ; preds = %bb.i.i.i266
  %293 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i272

_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i272: ; preds = %bb.i2.i271, %bb2.i.i.i270
  %294 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %295 = icmp slt i32 %tmp5.i256, %294            ; <i1> [#uses=1]
  br i1 %295, label %bb.i257, label %invcont84

invcont84:                                        ; preds = %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i272, %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i272.us, %invcont75
  %296 = phi i32 [ %273, %invcont75 ], [ %280, %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i272.us ], [ %294, %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i272 ] ; <i32> [#uses=2]
  %297 = icmp sgt i32 %296, 0                     ; <i1> [#uses=1]
  br i1 %297, label %bb.nph.i233, label %invcont89

bb.nph.i233:                                      ; preds = %invcont84
  %298 = getelementptr inbounds %"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"* %1, i32 0, i32 0 ; <double**> [#uses=1]
  %299 = getelementptr inbounds %"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"* %0, i32 0, i32 0 ; <double**> [#uses=1]
  br label %bb.i236

bb.i236:                                          ; preds = %_Z13verify_sortedISt16reverse_iteratorIPdEEvT_S3_.exit.i253, %bb.nph.i233
  %i.05.i234 = phi i32 [ 0, %bb.nph.i233 ], [ %tmp13.i235, %_Z13verify_sortedISt16reverse_iteratorIPdEEvT_S3_.exit.i253 ] ; <i32> [#uses=1]
  %tmp13.i235 = add i32 %i.05.i234, 1             ; <i32> [#uses=2]
  br label %bb.i1.i242

bb.i1.i242:                                       ; preds = %bb.i1.i242, %bb.i236
  %indvar.i237 = phi i32 [ 0, %bb.i236 ], [ %indvar.next.i241, %bb.i1.i242 ] ; <i32> [#uses=2]
  %tmp693 = xor i32 %indvar.i237, -1              ; <i32> [#uses=2]
  %scevgep7.i240 = getelementptr [2000 x double]* @dataMaster, i32 1, i32 %tmp693 ; <double*> [#uses=2]
  %scevgep.i239 = getelementptr [2000 x double]* @data, i32 1, i32 %tmp693 ; <double*> [#uses=1]
  %300 = load double* %scevgep7.i240, align 8     ; <double> [#uses=1]
  store double %300, double* %scevgep.i239, align 8
  %301 = icmp eq double* %scevgep7.i240, getelementptr inbounds ([2000 x double]* @dataMaster, i32 0, i32 0) ; <i1> [#uses=1]
  %indvar.next.i241 = add i32 %indvar.i237, 1     ; <i32> [#uses=1]
  br i1 %301, label %_ZN9benchmark4copyISt16reverse_iteratorIPdES3_EEvT_S4_T0_.exit.i243, label %bb.i1.i242

_ZN9benchmark4copyISt16reverse_iteratorIPdES3_EEvT_S4_T0_.exit.i243: ; preds = %bb.i1.i242
  store double* getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0), double** %298, align 8
  store double* getelementptr ([2000 x double]* @data, i32 1, i32 0), double** %299, align 8
  call fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIPdEdEEvT_S4_(%"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"* noalias %0, %"struct.__gnu_cxx::__normal_iterator<double*,std::vector<double, std::allocator<double> > >"* noalias %1) nounwind
  br label %bb3.i.i.i251

bb.i.i.i247:                                      ; preds = %bb3.i.i.i251
  %tmp696 = sub i32 -2, %indvar.i.i.i248          ; <i32> [#uses=1]
  %scevgep4.i.i245 = getelementptr [2000 x double]* @data, i32 1, i32 %tmp696 ; <double*> [#uses=1]
  %302 = load double* %scevgep4.i.i245, align 8   ; <double> [#uses=1]
  %303 = load double* %scevgep.i.i.i250, align 8  ; <double> [#uses=1]
  %304 = fcmp olt double %302, %303               ; <i1> [#uses=1]
  %indvar.next.i.i.i246 = add i32 %indvar.i.i.i248, 1 ; <i32> [#uses=1]
  br i1 %304, label %bb.i.i252, label %bb3.i.i.i251

bb3.i.i.i251:                                     ; preds = %bb.i.i.i247, %_ZN9benchmark4copyISt16reverse_iteratorIPdES3_EEvT_S4_T0_.exit.i243
  %indvar.i.i.i248 = phi i32 [ 0, %_ZN9benchmark4copyISt16reverse_iteratorIPdES3_EEvT_S4_T0_.exit.i243 ], [ %indvar.next.i.i.i246, %bb.i.i.i247 ] ; <i32> [#uses=3]
  %tmp695 = xor i32 %indvar.i.i.i248, -1          ; <i32> [#uses=1]
  %scevgep.i.i.i250 = getelementptr [2000 x double]* @data, i32 1, i32 %tmp695 ; <double*> [#uses=2]
  %305 = icmp eq double* %scevgep.i.i.i250, getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0) ; <i1> [#uses=1]
  br i1 %305, label %_Z13verify_sortedISt16reverse_iteratorIPdEEvT_S3_.exit.i253, label %bb.i.i.i247

bb.i.i252:                                        ; preds = %bb.i.i.i247
  %306 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIPdEEvT_S3_.exit.i253

_Z13verify_sortedISt16reverse_iteratorIPdEEvT_S3_.exit.i253: ; preds = %bb.i.i252, %bb3.i.i.i251
  %307 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %308 = icmp slt i32 %tmp13.i235, %307           ; <i1> [#uses=1]
  br i1 %308, label %bb.i236, label %invcont89

invcont89:                                        ; preds = %_Z13verify_sortedISt16reverse_iteratorIPdEEvT_S3_.exit.i253, %invcont84
  %309 = phi i32 [ %296, %invcont84 ], [ %307, %_Z13verify_sortedISt16reverse_iteratorIPdEEvT_S3_.exit.i253 ] ; <i32> [#uses=2]
  %310 = load double** %43, align 8               ; <double*> [#uses=4]
  %311 = load double** %44, align 4               ; <double*> [#uses=7]
  %312 = load double** %159, align 8              ; <double*> [#uses=2]
  %313 = load double** %160, align 4              ; <double*> [#uses=2]
  %314 = icmp sgt i32 %309, 0                     ; <i1> [#uses=1]
  br i1 %314, label %bb.nph.i210, label %invcont90

bb.nph.i210:                                      ; preds = %invcont89
  %315 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %3, i32 0, i32 0, i32 0 ; <double**> [#uses=2]
  %316 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %2, i32 0, i32 0, i32 0 ; <double**> [#uses=2]
  %317 = icmp eq double* %313, %312               ; <i1> [#uses=1]
  br i1 %317, label %bb.i213.us, label %bb.i213

bb.i213.us:                                       ; preds = %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i230.us, %bb.nph.i210
  %i.05.i211.us = phi i32 [ %tmp13.i212.us, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i230.us ], [ 0, %bb.nph.i210 ] ; <i32> [#uses=1]
  %tmp13.i212.us = add i32 %i.05.i211.us, 1       ; <i32> [#uses=2]
  store double* %310, double** %315, align 8
  store double* %311, double** %316, align 8
  call fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_(%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %2, %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %3) nounwind
  br label %bb3.i.i.i228.us

_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i230.us: ; preds = %bb3.i.i.i228.us, %bb.i.i229.us
  %318 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %319 = icmp slt i32 %tmp13.i212.us, %318        ; <i1> [#uses=1]
  br i1 %319, label %bb.i213.us, label %invcont90

bb.i.i229.us:                                     ; preds = %bb.i.i.i224.us
  %320 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i230.us

bb.i.i.i224.us:                                   ; preds = %bb3.i.i.i228.us
  %tmp593 = sub i32 -2, %indvar.i.i.i225.us       ; <i32> [#uses=1]
  %scevgep4.i.i222.us = getelementptr double* %311, i32 %tmp593 ; <double*> [#uses=1]
  %321 = load double* %scevgep4.i.i222.us, align 8 ; <double> [#uses=1]
  %322 = load double* %scevgep.i.i.i227.us, align 8 ; <double> [#uses=1]
  %323 = fcmp olt double %321, %322               ; <i1> [#uses=1]
  %indvar.next.i.i.i223.us = add i32 %indvar.i.i.i225.us, 1 ; <i32> [#uses=1]
  br i1 %323, label %bb.i.i229.us, label %bb3.i.i.i228.us

bb3.i.i.i228.us:                                  ; preds = %bb.i.i.i224.us, %bb.i213.us
  %indvar.i.i.i225.us = phi i32 [ 0, %bb.i213.us ], [ %indvar.next.i.i.i223.us, %bb.i.i.i224.us ] ; <i32> [#uses=3]
  %tmp592 = xor i32 %indvar.i.i.i225.us, -1       ; <i32> [#uses=1]
  %scevgep.i.i.i227.us = getelementptr double* %311, i32 %tmp592 ; <double*> [#uses=2]
  %324 = icmp eq double* %scevgep.i.i.i227.us, %310 ; <i1> [#uses=1]
  br i1 %324, label %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i230.us, label %bb.i.i.i224.us

bb.i213:                                          ; preds = %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i230, %bb.nph.i210
  %i.05.i211 = phi i32 [ %tmp13.i212, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i230 ], [ 0, %bb.nph.i210 ] ; <i32> [#uses=1]
  %tmp13.i212 = add i32 %i.05.i211, 1             ; <i32> [#uses=2]
  br label %bb.i1.i219

bb.i1.i219:                                       ; preds = %bb.i1.i219, %bb.i213
  %indvar.i214 = phi i32 [ 0, %bb.i213 ], [ %indvar.next.i218, %bb.i1.i219 ] ; <i32> [#uses=2]
  %tmp687 = xor i32 %indvar.i214, -1              ; <i32> [#uses=2]
  %scevgep7.i217 = getelementptr double* %313, i32 %tmp687 ; <double*> [#uses=2]
  %scevgep.i216 = getelementptr double* %311, i32 %tmp687 ; <double*> [#uses=1]
  %325 = load double* %scevgep7.i217, align 8     ; <double> [#uses=1]
  store double %325, double* %scevgep.i216, align 8
  %326 = icmp eq double* %scevgep7.i217, %312     ; <i1> [#uses=1]
  %indvar.next.i218 = add i32 %indvar.i214, 1     ; <i32> [#uses=1]
  br i1 %326, label %_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit.i220, label %bb.i1.i219

_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit.i220: ; preds = %bb.i1.i219
  store double* %310, double** %315, align 8
  store double* %311, double** %316, align 8
  call fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_(%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %2, %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %3) nounwind
  br label %bb3.i.i.i228

bb.i.i.i224:                                      ; preds = %bb3.i.i.i228
  %tmp690 = sub i32 -2, %indvar.i.i.i225          ; <i32> [#uses=1]
  %scevgep4.i.i222 = getelementptr double* %311, i32 %tmp690 ; <double*> [#uses=1]
  %327 = load double* %scevgep4.i.i222, align 8   ; <double> [#uses=1]
  %328 = load double* %scevgep.i.i.i227, align 8  ; <double> [#uses=1]
  %329 = fcmp olt double %327, %328               ; <i1> [#uses=1]
  %indvar.next.i.i.i223 = add i32 %indvar.i.i.i225, 1 ; <i32> [#uses=1]
  br i1 %329, label %bb.i.i229, label %bb3.i.i.i228

bb3.i.i.i228:                                     ; preds = %bb.i.i.i224, %_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit.i220
  %indvar.i.i.i225 = phi i32 [ 0, %_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit.i220 ], [ %indvar.next.i.i.i223, %bb.i.i.i224 ] ; <i32> [#uses=3]
  %tmp689 = xor i32 %indvar.i.i.i225, -1          ; <i32> [#uses=1]
  %scevgep.i.i.i227 = getelementptr double* %311, i32 %tmp689 ; <double*> [#uses=2]
  %330 = icmp eq double* %scevgep.i.i.i227, %310  ; <i1> [#uses=1]
  br i1 %330, label %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i230, label %bb.i.i.i224

bb.i.i229:                                        ; preds = %bb.i.i.i224
  %331 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i230

_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i230: ; preds = %bb.i.i229, %bb3.i.i.i228
  %332 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %333 = icmp slt i32 %tmp13.i212, %332           ; <i1> [#uses=1]
  br i1 %333, label %bb.i213, label %invcont90

invcont90:                                        ; preds = %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i230, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i230.us, %invcont89
  %334 = phi i32 [ %309, %invcont89 ], [ %318, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i230.us ], [ %332, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i230 ] ; <i32> [#uses=2]
  %335 = icmp sgt i32 %334, 0                     ; <i1> [#uses=1]
  br i1 %335, label %bb.nph.i188, label %invcont91

bb.nph.i188:                                      ; preds = %invcont90
  %336 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %5, i32 0, i32 0, i32 0 ; <double**> [#uses=2]
  %337 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %4, i32 0, i32 0, i32 0 ; <double**> [#uses=2]
  %338 = icmp eq double* %168, %.pre754           ; <i1> [#uses=1]
  br i1 %338, label %bb.i191.us, label %bb.i191

bb.i191.us:                                       ; preds = %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i208.us, %bb.nph.i188
  %i.05.i189.us = phi i32 [ %tmp13.i190.us, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i208.us ], [ 0, %bb.nph.i188 ] ; <i32> [#uses=1]
  %tmp13.i190.us = add i32 %i.05.i189.us, 1       ; <i32> [#uses=2]
  store double* %50, double** %336, align 8
  store double* %51, double** %337, align 8
  call fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_(%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %4, %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %5) nounwind
  br label %bb3.i.i.i206.us

_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i208.us: ; preds = %bb3.i.i.i206.us, %bb.i.i207.us
  %339 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %340 = icmp slt i32 %tmp13.i190.us, %339        ; <i1> [#uses=1]
  br i1 %340, label %bb.i191.us, label %invcont91

bb.i.i207.us:                                     ; preds = %bb.i.i.i202.us
  %341 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i208.us

bb.i.i.i202.us:                                   ; preds = %bb3.i.i.i206.us
  %tmp597 = sub i32 -2, %indvar.i.i.i203.us       ; <i32> [#uses=1]
  %scevgep4.i.i200.us = getelementptr double* %51, i32 %tmp597 ; <double*> [#uses=1]
  %342 = load double* %scevgep4.i.i200.us, align 8 ; <double> [#uses=1]
  %343 = load double* %scevgep.i.i.i205.us, align 8 ; <double> [#uses=1]
  %344 = fcmp olt double %342, %343               ; <i1> [#uses=1]
  %indvar.next.i.i.i201.us = add i32 %indvar.i.i.i203.us, 1 ; <i32> [#uses=1]
  br i1 %344, label %bb.i.i207.us, label %bb3.i.i.i206.us

bb3.i.i.i206.us:                                  ; preds = %bb.i.i.i202.us, %bb.i191.us
  %indvar.i.i.i203.us = phi i32 [ 0, %bb.i191.us ], [ %indvar.next.i.i.i201.us, %bb.i.i.i202.us ] ; <i32> [#uses=3]
  %tmp596 = xor i32 %indvar.i.i.i203.us, -1       ; <i32> [#uses=1]
  %scevgep.i.i.i205.us = getelementptr double* %51, i32 %tmp596 ; <double*> [#uses=2]
  %345 = icmp eq double* %scevgep.i.i.i205.us, %50 ; <i1> [#uses=1]
  br i1 %345, label %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i208.us, label %bb.i.i.i202.us

bb.i191:                                          ; preds = %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i208, %bb.nph.i188
  %i.05.i189 = phi i32 [ %tmp13.i190, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i208 ], [ 0, %bb.nph.i188 ] ; <i32> [#uses=1]
  %tmp13.i190 = add i32 %i.05.i189, 1             ; <i32> [#uses=2]
  br label %bb.i1.i197

bb.i1.i197:                                       ; preds = %bb.i1.i197, %bb.i191
  %indvar.i192 = phi i32 [ 0, %bb.i191 ], [ %indvar.next.i196, %bb.i1.i197 ] ; <i32> [#uses=2]
  %tmp681 = xor i32 %indvar.i192, -1              ; <i32> [#uses=2]
  %scevgep7.i195 = getelementptr double* %168, i32 %tmp681 ; <double*> [#uses=2]
  %scevgep.i194 = getelementptr double* %51, i32 %tmp681 ; <double*> [#uses=1]
  %346 = load double* %scevgep7.i195, align 8     ; <double> [#uses=1]
  store double %346, double* %scevgep.i194, align 8
  %347 = icmp eq double* %scevgep7.i195, %.pre754 ; <i1> [#uses=1]
  %indvar.next.i196 = add i32 %indvar.i192, 1     ; <i32> [#uses=1]
  br i1 %347, label %_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit.i198, label %bb.i1.i197

_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit.i198: ; preds = %bb.i1.i197
  store double* %50, double** %336, align 8
  store double* %51, double** %337, align 8
  call fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_(%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %4, %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %5) nounwind
  br label %bb3.i.i.i206

bb.i.i.i202:                                      ; preds = %bb3.i.i.i206
  %tmp684 = sub i32 -2, %indvar.i.i.i203          ; <i32> [#uses=1]
  %scevgep4.i.i200 = getelementptr double* %51, i32 %tmp684 ; <double*> [#uses=1]
  %348 = load double* %scevgep4.i.i200, align 8   ; <double> [#uses=1]
  %349 = load double* %scevgep.i.i.i205, align 8  ; <double> [#uses=1]
  %350 = fcmp olt double %348, %349               ; <i1> [#uses=1]
  %indvar.next.i.i.i201 = add i32 %indvar.i.i.i203, 1 ; <i32> [#uses=1]
  br i1 %350, label %bb.i.i207, label %bb3.i.i.i206

bb3.i.i.i206:                                     ; preds = %bb.i.i.i202, %_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit.i198
  %indvar.i.i.i203 = phi i32 [ 0, %_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit.i198 ], [ %indvar.next.i.i.i201, %bb.i.i.i202 ] ; <i32> [#uses=3]
  %tmp683 = xor i32 %indvar.i.i.i203, -1          ; <i32> [#uses=1]
  %scevgep.i.i.i205 = getelementptr double* %51, i32 %tmp683 ; <double*> [#uses=2]
  %351 = icmp eq double* %scevgep.i.i.i205, %50   ; <i1> [#uses=1]
  br i1 %351, label %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i208, label %bb.i.i.i202

bb.i.i207:                                        ; preds = %bb.i.i.i202
  %352 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i208

_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i208: ; preds = %bb.i.i207, %bb3.i.i.i206
  %353 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %354 = icmp slt i32 %tmp13.i190, %353           ; <i1> [#uses=1]
  br i1 %354, label %bb.i191, label %invcont91

invcont91:                                        ; preds = %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i208, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i208.us, %invcont90
  %355 = phi i32 [ %334, %invcont90 ], [ %339, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i208.us ], [ %353, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i208 ] ; <i32> [#uses=2]
  %356 = icmp sgt i32 %355, 0                     ; <i1> [#uses=1]
  br i1 %356, label %bb.nph.i168, label %invcont92

bb.nph.i168:                                      ; preds = %invcont91
  %357 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<double*> >"* %7, i32 0, i32 1, i32 0 ; <double**> [#uses=1]
  %358 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<double*> >"* %6, i32 0, i32 1, i32 0 ; <double**> [#uses=1]
  br label %bb.i171

bb.i171:                                          ; preds = %_Z13verify_sortedISt16reverse_iteratorIS0_IPdEEEvT_S4_.exit.i186, %bb.nph.i168
  %i.05.i169 = phi i32 [ 0, %bb.nph.i168 ], [ %tmp10.i170, %_Z13verify_sortedISt16reverse_iteratorIS0_IPdEEEvT_S4_.exit.i186 ] ; <i32> [#uses=1]
  %tmp10.i170 = add i32 %i.05.i169, 1             ; <i32> [#uses=2]
  br label %bb.i1.i177

bb.i1.i177:                                       ; preds = %bb.i1.i177, %bb.i171
  %indvar.i172 = phi i32 [ 0, %bb.i171 ], [ %tmp677, %bb.i1.i177 ] ; <i32> [#uses=3]
  %tmp677 = add i32 %indvar.i172, 1               ; <i32> [#uses=2]
  %scevgep.i174 = getelementptr [2000 x double]* @dataMaster, i32 0, i32 %indvar.i172 ; <double*> [#uses=1]
  %.1.0.0.i173 = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i172 ; <double*> [#uses=1]
  %359 = load double* %scevgep.i174, align 8      ; <double> [#uses=1]
  store double %359, double* %.1.0.0.i173, align 8
  %scevgep6.i176.idx.mask = and i32 %tmp677, 536870911 ; <i32> [#uses=1]
  %360 = icmp eq i32 %scevgep6.i176.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %360, label %_ZN9benchmark4copyISt16reverse_iteratorIS1_IPdEES4_EEvT_S5_T0_.exit.i178, label %bb.i1.i177

_ZN9benchmark4copyISt16reverse_iteratorIS1_IPdEES4_EEvT_S5_T0_.exit.i178: ; preds = %bb.i1.i177
  store double* getelementptr ([2000 x double]* @data, i32 1, i32 0), double** %357, align 4
  store double* getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0), double** %358, align 4
  call fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIS1_IPdEEdEEvT_S5_(%"struct.std::reverse_iterator<std::reverse_iterator<double*> >"* noalias %6, %"struct.std::reverse_iterator<std::reverse_iterator<double*> >"* noalias %7) nounwind
  br label %bb3.i.i.i184

bb.i.i.i180:                                      ; preds = %bb3.i.i.i184
  %prev.1.0.0.i.i.i179 = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i.i181 ; <double*> [#uses=1]
  %361 = load double* %scevgep.i.i183, align 8    ; <double> [#uses=1]
  %362 = load double* %prev.1.0.0.i.i.i179, align 8 ; <double> [#uses=1]
  %363 = fcmp olt double %361, %362               ; <i1> [#uses=1]
  br i1 %363, label %bb.i.i185, label %bb3.i.i.i184

bb3.i.i.i184:                                     ; preds = %bb.i.i.i180, %_ZN9benchmark4copyISt16reverse_iteratorIS1_IPdEES4_EEvT_S5_T0_.exit.i178
  %indvar.i.i.i181 = phi i32 [ 0, %_ZN9benchmark4copyISt16reverse_iteratorIS1_IPdEES4_EEvT_S5_T0_.exit.i178 ], [ %tmp678, %bb.i.i.i180 ] ; <i32> [#uses=2]
  %tmp678 = add i32 %indvar.i.i.i181, 1           ; <i32> [#uses=2]
  %scevgep.i.i183 = getelementptr [2000 x double]* @data, i32 0, i32 %tmp678 ; <double*> [#uses=2]
  %364 = icmp eq double* %scevgep.i.i183, getelementptr ([2000 x double]* @data, i32 1, i32 0) ; <i1> [#uses=1]
  br i1 %364, label %_Z13verify_sortedISt16reverse_iteratorIS0_IPdEEEvT_S4_.exit.i186, label %bb.i.i.i180

bb.i.i185:                                        ; preds = %bb.i.i.i180
  %365 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIS0_IPdEEEvT_S4_.exit.i186

_Z13verify_sortedISt16reverse_iteratorIS0_IPdEEEvT_S4_.exit.i186: ; preds = %bb.i.i185, %bb3.i.i.i184
  %366 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %367 = icmp slt i32 %tmp10.i170, %366           ; <i1> [#uses=1]
  br i1 %367, label %bb.i171, label %invcont92

invcont92:                                        ; preds = %_Z13verify_sortedISt16reverse_iteratorIS0_IPdEEEvT_S4_.exit.i186, %invcont91
  %368 = phi i32 [ %355, %invcont91 ], [ %366, %_Z13verify_sortedISt16reverse_iteratorIS0_IPdEEEvT_S4_.exit.i186 ] ; <i32> [#uses=2]
  %369 = icmp sgt i32 %368, 0                     ; <i1> [#uses=1]
  br i1 %369, label %bb.nph.i147, label %invcont93

bb.nph.i147:                                      ; preds = %invcont92
  %370 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %9, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=2]
  %371 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %8, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=2]
  %372 = icmp eq double* %.pre754, %168           ; <i1> [#uses=1]
  br i1 %372, label %bb.i150.us, label %bb.i150

bb.i150.us:                                       ; preds = %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i165.us, %bb.nph.i147
  %i.05.i148.us = phi i32 [ %tmp10.i149.us, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i165.us ], [ 0, %bb.nph.i147 ] ; <i32> [#uses=1]
  %tmp10.i149.us = add i32 %i.05.i148.us, 1       ; <i32> [#uses=2]
  store double* %51, double** %370, align 4
  store double* %50, double** %371, align 4
  call fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_(%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %8, %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %9) nounwind
  br label %bb3.i.i.i163.us

_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i165.us: ; preds = %bb3.i.i.i163.us, %bb.i.i164.us
  %373 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %374 = icmp slt i32 %tmp10.i149.us, %373        ; <i1> [#uses=1]
  br i1 %374, label %bb.i150.us, label %invcont93

bb.i.i164.us:                                     ; preds = %bb.i.i.i159.us
  %375 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i165.us

bb.i.i.i159.us:                                   ; preds = %bb3.i.i.i163.us
  %prev.1.0.0.0.i.i.i158.us = getelementptr double* %50, i32 %indvar.i.i.i160.us ; <double*> [#uses=1]
  %376 = load double* %scevgep.i.i162.us, align 8 ; <double> [#uses=1]
  %377 = load double* %prev.1.0.0.0.i.i.i158.us, align 8 ; <double> [#uses=1]
  %378 = fcmp olt double %376, %377               ; <i1> [#uses=1]
  br i1 %378, label %bb.i.i164.us, label %bb3.i.i.i163.us

bb3.i.i.i163.us:                                  ; preds = %bb.i.i.i159.us, %bb.i150.us
  %indvar.i.i.i160.us = phi i32 [ 0, %bb.i150.us ], [ %tmp601, %bb.i.i.i159.us ] ; <i32> [#uses=2]
  %tmp601 = add i32 %indvar.i.i.i160.us, 1        ; <i32> [#uses=2]
  %scevgep.i.i162.us = getelementptr double* %50, i32 %tmp601 ; <double*> [#uses=2]
  %379 = icmp eq double* %scevgep.i.i162.us, %51  ; <i1> [#uses=1]
  br i1 %379, label %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i165.us, label %bb.i.i.i159.us

bb.i150:                                          ; preds = %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i165, %bb.nph.i147
  %i.05.i148 = phi i32 [ %tmp10.i149, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i165 ], [ 0, %bb.nph.i147 ] ; <i32> [#uses=1]
  %tmp10.i149 = add i32 %i.05.i148, 1             ; <i32> [#uses=2]
  br label %bb.i1.i156

bb.i1.i156:                                       ; preds = %bb.i1.i156, %bb.i150
  %indvar.i151 = phi i32 [ 0, %bb.i150 ], [ %tmp674, %bb.i1.i156 ] ; <i32> [#uses=3]
  %tmp674 = add i32 %indvar.i151, 1               ; <i32> [#uses=2]
  %scevgep6.i155 = getelementptr double* %.pre754, i32 %tmp674 ; <double*> [#uses=1]
  %scevgep.i153 = getelementptr double* %.pre754, i32 %indvar.i151 ; <double*> [#uses=1]
  %.1.0.0.0.i152 = getelementptr double* %50, i32 %indvar.i151 ; <double*> [#uses=1]
  %380 = load double* %scevgep.i153, align 8      ; <double> [#uses=1]
  store double %380, double* %.1.0.0.0.i152, align 8
  %381 = icmp eq double* %scevgep6.i155, %168     ; <i1> [#uses=1]
  br i1 %381, label %_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit.i157, label %bb.i1.i156

_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit.i157: ; preds = %bb.i1.i156
  store double* %51, double** %370, align 4
  store double* %50, double** %371, align 4
  call fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_(%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %8, %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %9) nounwind
  br label %bb3.i.i.i163

bb.i.i.i159:                                      ; preds = %bb3.i.i.i163
  %prev.1.0.0.0.i.i.i158 = getelementptr double* %50, i32 %indvar.i.i.i160 ; <double*> [#uses=1]
  %382 = load double* %scevgep.i.i162, align 8    ; <double> [#uses=1]
  %383 = load double* %prev.1.0.0.0.i.i.i158, align 8 ; <double> [#uses=1]
  %384 = fcmp olt double %382, %383               ; <i1> [#uses=1]
  br i1 %384, label %bb.i.i164, label %bb3.i.i.i163

bb3.i.i.i163:                                     ; preds = %bb.i.i.i159, %_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit.i157
  %indvar.i.i.i160 = phi i32 [ 0, %_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit.i157 ], [ %tmp675, %bb.i.i.i159 ] ; <i32> [#uses=2]
  %tmp675 = add i32 %indvar.i.i.i160, 1           ; <i32> [#uses=2]
  %scevgep.i.i162 = getelementptr double* %50, i32 %tmp675 ; <double*> [#uses=2]
  %385 = icmp eq double* %scevgep.i.i162, %51     ; <i1> [#uses=1]
  br i1 %385, label %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i165, label %bb.i.i.i159

bb.i.i164:                                        ; preds = %bb.i.i.i159
  %386 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i165

_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i165: ; preds = %bb.i.i164, %bb3.i.i.i163
  %387 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %388 = icmp slt i32 %tmp10.i149, %387           ; <i1> [#uses=1]
  br i1 %388, label %bb.i150, label %invcont93

invcont93:                                        ; preds = %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i165, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i165.us, %invcont92
  %389 = phi i32 [ %368, %invcont92 ], [ %373, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i165.us ], [ %387, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i165 ] ; <i32> [#uses=3]
  %390 = icmp sgt i32 %389, 0                     ; <i1> [#uses=1]
  br i1 %390, label %bb.nph.i127, label %invcont94

bb.nph.i127:                                      ; preds = %invcont93
  %391 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %11, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=2]
  %392 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %10, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=2]
  %393 = icmp eq double* %.pre754, %168           ; <i1> [#uses=1]
  br i1 %393, label %bb.i130.us, label %bb.i130

bb.i130.us:                                       ; preds = %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i145.us, %bb.nph.i127
  %i.05.i128.us = phi i32 [ %tmp10.i129.us, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i145.us ], [ 0, %bb.nph.i127 ] ; <i32> [#uses=1]
  %tmp10.i129.us = add i32 %i.05.i128.us, 1       ; <i32> [#uses=2]
  store double* %51, double** %391, align 4
  store double* %50, double** %392, align 4
  call fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_(%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %10, %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %11) nounwind
  br label %bb3.i.i.i143.us

_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i145.us: ; preds = %bb3.i.i.i143.us, %bb.i.i144.us
  %394 = load i32* @iterations, align 4           ; <i32> [#uses=3]
  %395 = icmp slt i32 %tmp10.i129.us, %394        ; <i1> [#uses=1]
  br i1 %395, label %bb.i130.us, label %invcont94

bb.i.i144.us:                                     ; preds = %bb.i.i.i139.us
  %396 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i145.us

bb.i.i.i139.us:                                   ; preds = %bb3.i.i.i143.us
  %prev.1.0.0.0.i.i.i138.us = getelementptr double* %50, i32 %indvar.i.i.i140.us ; <double*> [#uses=1]
  %397 = load double* %scevgep.i.i142.us, align 8 ; <double> [#uses=1]
  %398 = load double* %prev.1.0.0.0.i.i.i138.us, align 8 ; <double> [#uses=1]
  %399 = fcmp olt double %397, %398               ; <i1> [#uses=1]
  br i1 %399, label %bb.i.i144.us, label %bb3.i.i.i143.us

bb3.i.i.i143.us:                                  ; preds = %bb.i.i.i139.us, %bb.i130.us
  %indvar.i.i.i140.us = phi i32 [ 0, %bb.i130.us ], [ %tmp603, %bb.i.i.i139.us ] ; <i32> [#uses=2]
  %tmp603 = add i32 %indvar.i.i.i140.us, 1        ; <i32> [#uses=2]
  %scevgep.i.i142.us = getelementptr double* %50, i32 %tmp603 ; <double*> [#uses=2]
  %400 = icmp eq double* %scevgep.i.i142.us, %51  ; <i1> [#uses=1]
  br i1 %400, label %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i145.us, label %bb.i.i.i139.us

bb.i130:                                          ; preds = %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i145, %bb.nph.i127
  %i.05.i128 = phi i32 [ %tmp10.i129, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i145 ], [ 0, %bb.nph.i127 ] ; <i32> [#uses=1]
  %tmp10.i129 = add i32 %i.05.i128, 1             ; <i32> [#uses=2]
  br label %bb.i1.i136

bb.i1.i136:                                       ; preds = %bb.i1.i136, %bb.i130
  %indvar.i131 = phi i32 [ 0, %bb.i130 ], [ %tmp670, %bb.i1.i136 ] ; <i32> [#uses=3]
  %tmp670 = add i32 %indvar.i131, 1               ; <i32> [#uses=2]
  %scevgep6.i135 = getelementptr double* %.pre754, i32 %tmp670 ; <double*> [#uses=1]
  %scevgep.i133 = getelementptr double* %.pre754, i32 %indvar.i131 ; <double*> [#uses=1]
  %.1.0.0.0.i132 = getelementptr double* %50, i32 %indvar.i131 ; <double*> [#uses=1]
  %401 = load double* %scevgep.i133, align 8      ; <double> [#uses=1]
  store double %401, double* %.1.0.0.0.i132, align 8
  %402 = icmp eq double* %scevgep6.i135, %168     ; <i1> [#uses=1]
  br i1 %402, label %_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit.i137, label %bb.i1.i136

_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit.i137: ; preds = %bb.i1.i136
  store double* %51, double** %391, align 4
  store double* %50, double** %392, align 4
  call fastcc void @_ZN9benchmark9quicksortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_(%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %10, %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %11) nounwind
  br label %bb3.i.i.i143

bb.i.i.i139:                                      ; preds = %bb3.i.i.i143
  %prev.1.0.0.0.i.i.i138 = getelementptr double* %50, i32 %indvar.i.i.i140 ; <double*> [#uses=1]
  %403 = load double* %scevgep.i.i142, align 8    ; <double> [#uses=1]
  %404 = load double* %prev.1.0.0.0.i.i.i138, align 8 ; <double> [#uses=1]
  %405 = fcmp olt double %403, %404               ; <i1> [#uses=1]
  br i1 %405, label %bb.i.i144, label %bb3.i.i.i143

bb3.i.i.i143:                                     ; preds = %bb.i.i.i139, %_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit.i137
  %indvar.i.i.i140 = phi i32 [ 0, %_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit.i137 ], [ %tmp671, %bb.i.i.i139 ] ; <i32> [#uses=2]
  %tmp671 = add i32 %indvar.i.i.i140, 1           ; <i32> [#uses=2]
  %scevgep.i.i142 = getelementptr double* %50, i32 %tmp671 ; <double*> [#uses=2]
  %406 = icmp eq double* %scevgep.i.i142, %51     ; <i1> [#uses=1]
  br i1 %406, label %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i145, label %bb.i.i.i139

bb.i.i144:                                        ; preds = %bb.i.i.i139
  %407 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i145

_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i145: ; preds = %bb.i.i144, %bb3.i.i.i143
  %408 = load i32* @iterations, align 4           ; <i32> [#uses=3]
  %409 = icmp slt i32 %tmp10.i129, %408           ; <i1> [#uses=1]
  br i1 %409, label %bb.i130, label %invcont94

invcont94:                                        ; preds = %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i145, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i145.us, %invcont93
  %.rle765 = phi i32 [ %389, %invcont93 ], [ %394, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i145.us ], [ %408, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i145 ] ; <i32> [#uses=1]
  %410 = phi i32 [ %389, %invcont93 ], [ %394, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i145.us ], [ %408, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i145 ] ; <i32> [#uses=1]
  %411 = icmp sgt i32 %410, 0                     ; <i1> [#uses=1]
  br i1 %411, label %bb.i116, label %invcont99

bb.i116:                                          ; preds = %_Z13verify_sortedIPdEvT_S1_.exit.i, %invcont94
  %i.03.i114 = phi i32 [ %tmp5.i115, %_Z13verify_sortedIPdEvT_S1_.exit.i ], [ 0, %invcont94 ] ; <i32> [#uses=1]
  %tmp5.i115 = add i32 %i.03.i114, 1              ; <i32> [#uses=2]
  br label %bb.i.i120

bb.i.i120:                                        ; preds = %bb.i.i120, %bb.i116
  %indvar.i.i117 = phi i32 [ 0, %bb.i116 ], [ %tmp667, %bb.i.i120 ] ; <i32> [#uses=3]
  %tmp667 = add i32 %indvar.i.i117, 1             ; <i32> [#uses=2]
  %firstSource_addr.02.i.i = getelementptr [2000 x double]* @dataMaster, i32 0, i32 %indvar.i.i117 ; <double*> [#uses=1]
  %firstDest_addr.01.i.i = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i117 ; <double*> [#uses=1]
  %412 = load double* %firstSource_addr.02.i.i, align 8 ; <double> [#uses=1]
  store double %412, double* %firstDest_addr.01.i.i, align 8
  %scevgep.i.i119.idx.mask = and i32 %tmp667, 536870911 ; <i32> [#uses=1]
  %413 = icmp eq i32 %scevgep.i.i119.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %413, label %_ZN9benchmark4copyIPdS1_EEvT_S2_T0_.exit.i, label %bb.i.i120

_ZN9benchmark4copyIPdS1_EEvT_S2_T0_.exit.i:       ; preds = %bb.i.i120
  br i1 icmp slt (i32 add (i32 sdiv (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 16), i32 -1), i32 0), label %bb5.loopexit.i, label %bb.i49

bb.i49:                                           ; preds = %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit.i, %_ZN9benchmark4copyIPdS1_EEvT_S2_T0_.exit.i
  %indvar29.i = phi i32 [ %indvar.next30.i, %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit.i ], [ 0, %_ZN9benchmark4copyIPdS1_EEvT_S2_T0_.exit.i ] ; <i32> [#uses=4]
  %j.0.i = sub i32 add (i32 sdiv (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 16), i32 -2), %indvar29.i ; <i32> [#uses=1]
  %j.024.i = sub i32 add (i32 sdiv (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 16), i32 -1), %indvar29.i ; <i32> [#uses=4]
  %scevgep36.i = getelementptr [2000 x double]* @data, i32 0, i32 %j.024.i ; <double*> [#uses=1]
  %tmp37.i = mul i32 %indvar29.i, -2              ; <i32> [#uses=1]
  %i.13.i.i = add i32 %tmp37.i, shl (i32 sdiv (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 16), i32 1) ; <i32> [#uses=3]
  %414 = load double* %scevgep36.i, align 8       ; <double> [#uses=2]
  %415 = icmp slt i32 %i.13.i.i, ashr (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 3) ; <i1> [#uses=1]
  br i1 %415, label %bb.i.i50, label %bb4.i.i

bb.i.i50:                                         ; preds = %bb.i.i50, %bb.i49
  %i.14.i.i = phi i32 [ %phitmp.i.i, %bb.i.i50 ], [ %i.13.i.i, %bb.i49 ] ; <i32> [#uses=3]
  %free.01.i.i = phi i32 [ %423, %bb.i.i50 ], [ %j.024.i, %bb.i49 ] ; <i32> [#uses=1]
  %416 = add i32 %i.14.i.i, -1                    ; <i32> [#uses=1]
  %417 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %416 ; <double*> [#uses=1]
  %418 = load double* %417, align 8               ; <double> [#uses=1]
  %419 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %i.14.i.i ; <double*> [#uses=1]
  %420 = load double* %419, align 8               ; <double> [#uses=1]
  %421 = fcmp olt double %418, %420               ; <i1> [#uses=1]
  %422 = zext i1 %421 to i32                      ; <i32> [#uses=1]
  %i.0.i.i = or i32 %422, %i.14.i.i               ; <i32> [#uses=2]
  %423 = add i32 %i.0.i.i, -1                     ; <i32> [#uses=3]
  %424 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %423 ; <double*> [#uses=1]
  %425 = load double* %424, align 8               ; <double> [#uses=1]
  %426 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.01.i.i ; <double*> [#uses=1]
  store double %425, double* %426, align 8
  %phitmp.i.i = shl i32 %i.0.i.i, 1               ; <i32> [#uses=3]
  %427 = icmp slt i32 %phitmp.i.i, ashr (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 3) ; <i1> [#uses=1]
  br i1 %427, label %bb.i.i50, label %bb4.i.i

bb4.i.i:                                          ; preds = %bb.i.i50, %bb.i49
  %i.1.lcssa.i.i = phi i32 [ %i.13.i.i, %bb.i49 ], [ %phitmp.i.i, %bb.i.i50 ] ; <i32> [#uses=2]
  %free.0.lcssa.i.i = phi i32 [ %j.024.i, %bb.i49 ], [ %423, %bb.i.i50 ] ; <i32> [#uses=3]
  %428 = icmp eq i32 %i.1.lcssa.i.i, ashr (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 3) ; <i1> [#uses=1]
  br i1 %428, label %bb5.i.i, label %bb8.i.i

bb5.i.i:                                          ; preds = %bb4.i.i
  %429 = add i32 %i.1.lcssa.i.i, -1               ; <i32> [#uses=3]
  %430 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %429 ; <double*> [#uses=1]
  %431 = load double* %430, align 8               ; <double> [#uses=1]
  %432 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.0.lcssa.i.i ; <double*> [#uses=1]
  store double %431, double* %432, align 8
  br label %bb8.i.i

bb7.i.i51:                                        ; preds = %bb9.i.i
  %433 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.2.i.i ; <double*> [#uses=1]
  store double %436, double* %433, align 8
  br label %bb8.i.i

bb8.i.i:                                          ; preds = %bb7.i.i51, %bb5.i.i, %bb4.i.i
  %free.2.i.i = phi i32 [ %i.2.i.i, %bb7.i.i51 ], [ %429, %bb5.i.i ], [ %free.0.lcssa.i.i, %bb4.i.i ] ; <i32> [#uses=3]
  %i.2.in.in.i.i = phi i32 [ %i.2.i.i, %bb7.i.i51 ], [ %429, %bb5.i.i ], [ %free.0.lcssa.i.i, %bb4.i.i ] ; <i32> [#uses=1]
  %i.2.in.i.i = add i32 %i.2.in.in.i.i, -1        ; <i32> [#uses=1]
  %i.2.i.i = sdiv i32 %i.2.in.i.i, 2              ; <i32> [#uses=3]
  %434 = icmp sgt i32 %free.2.i.i, %j.024.i       ; <i1> [#uses=1]
  br i1 %434, label %bb9.i.i, label %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit.i

bb9.i.i:                                          ; preds = %bb8.i.i
  %435 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %i.2.i.i ; <double*> [#uses=1]
  %436 = load double* %435, align 8               ; <double> [#uses=2]
  %437 = fcmp olt double %436, %414               ; <i1> [#uses=1]
  br i1 %437, label %bb7.i.i51, label %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit.i

_ZN9benchmark7sift_inIPddEEviT_iT0_.exit.i:       ; preds = %bb9.i.i, %bb8.i.i
  %438 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.2.i.i ; <double*> [#uses=1]
  store double %414, double* %438, align 8
  %439 = icmp slt i32 %j.0.i, 0                   ; <i1> [#uses=1]
  %indvar.next30.i = add i32 %indvar29.i, 1       ; <i32> [#uses=1]
  br i1 %439, label %bb5.loopexit.i, label %bb.i49

bb4.i:                                            ; preds = %bb5.loopexit.i, %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit17.i
  %indvar.i52 = phi i32 [ %indvar.next.i54, %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit17.i ], [ 0, %bb5.loopexit.i ] ; <i32> [#uses=2]
  %j.120.i = sub i32 add (i32 ashr (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 3), i32 -1), %indvar.i52 ; <i32> [#uses=4]
  %scevgep.i53 = getelementptr [2000 x double]* @data, i32 0, i32 %j.120.i ; <double*> [#uses=2]
  %440 = load double* %scevgep.i53, align 8       ; <double> [#uses=2]
  %441 = load double* getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0), align 32 ; <double> [#uses=1]
  store double %441, double* %scevgep.i53, align 8
  %442 = icmp sgt i32 %j.120.i, 2                 ; <i1> [#uses=1]
  br i1 %442, label %bb.i5.i, label %bb4.i8.i

bb.i5.i:                                          ; preds = %bb.i5.i, %bb4.i
  %i.14.i1.i = phi i32 [ %phitmp.i4.i, %bb.i5.i ], [ 2, %bb4.i ] ; <i32> [#uses=3]
  %free.01.i2.i = phi i32 [ %450, %bb.i5.i ], [ 0, %bb4.i ] ; <i32> [#uses=1]
  %443 = add i32 %i.14.i1.i, -1                   ; <i32> [#uses=1]
  %444 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %443 ; <double*> [#uses=1]
  %445 = load double* %444, align 8               ; <double> [#uses=1]
  %446 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %i.14.i1.i ; <double*> [#uses=1]
  %447 = load double* %446, align 16              ; <double> [#uses=1]
  %448 = fcmp olt double %445, %447               ; <i1> [#uses=1]
  %449 = zext i1 %448 to i32                      ; <i32> [#uses=1]
  %i.0.i3.i = or i32 %449, %i.14.i1.i             ; <i32> [#uses=2]
  %450 = add i32 %i.0.i3.i, -1                    ; <i32> [#uses=3]
  %451 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %450 ; <double*> [#uses=1]
  %452 = load double* %451, align 8               ; <double> [#uses=1]
  %453 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.01.i2.i ; <double*> [#uses=1]
  store double %452, double* %453, align 8
  %phitmp.i4.i = shl i32 %i.0.i3.i, 1             ; <i32> [#uses=3]
  %454 = icmp slt i32 %phitmp.i4.i, %j.120.i      ; <i1> [#uses=1]
  br i1 %454, label %bb.i5.i, label %bb4.i8.i

bb4.i8.i:                                         ; preds = %bb.i5.i, %bb4.i
  %i.1.lcssa.i6.i = phi i32 [ 2, %bb4.i ], [ %phitmp.i4.i, %bb.i5.i ] ; <i32> [#uses=2]
  %free.0.lcssa.i7.i = phi i32 [ 0, %bb4.i ], [ %450, %bb.i5.i ] ; <i32> [#uses=3]
  %455 = icmp eq i32 %i.1.lcssa.i6.i, %j.120.i    ; <i1> [#uses=1]
  br i1 %455, label %bb5.i9.i, label %bb8.i15.i

bb5.i9.i:                                         ; preds = %bb4.i8.i
  %456 = add i32 %i.1.lcssa.i6.i, -1              ; <i32> [#uses=3]
  %457 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %456 ; <double*> [#uses=1]
  %458 = load double* %457, align 8               ; <double> [#uses=1]
  %459 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.0.lcssa.i7.i ; <double*> [#uses=1]
  store double %458, double* %459, align 8
  br label %bb8.i15.i

bb7.i10.i:                                        ; preds = %bb9.i16.i
  %460 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.2.i11.i ; <double*> [#uses=1]
  store double %463, double* %460, align 8
  br label %bb8.i15.i

bb8.i15.i:                                        ; preds = %bb7.i10.i, %bb5.i9.i, %bb4.i8.i
  %free.2.i11.i = phi i32 [ %i.2.i14.i, %bb7.i10.i ], [ %456, %bb5.i9.i ], [ %free.0.lcssa.i7.i, %bb4.i8.i ] ; <i32> [#uses=3]
  %i.2.in.in.i12.i = phi i32 [ %i.2.i14.i, %bb7.i10.i ], [ %456, %bb5.i9.i ], [ %free.0.lcssa.i7.i, %bb4.i8.i ] ; <i32> [#uses=1]
  %i.2.in.i13.i = add i32 %i.2.in.in.i12.i, -1    ; <i32> [#uses=1]
  %i.2.i14.i = sdiv i32 %i.2.in.i13.i, 2          ; <i32> [#uses=3]
  %461 = icmp sgt i32 %free.2.i11.i, 0            ; <i1> [#uses=1]
  br i1 %461, label %bb9.i16.i, label %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit17.i

bb9.i16.i:                                        ; preds = %bb8.i15.i
  %462 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %i.2.i14.i ; <double*> [#uses=1]
  %463 = load double* %462, align 8               ; <double> [#uses=2]
  %464 = fcmp olt double %463, %440               ; <i1> [#uses=1]
  br i1 %464, label %bb7.i10.i, label %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit17.i

_ZN9benchmark7sift_inIPddEEviT_iT0_.exit17.i:     ; preds = %bb9.i16.i, %bb8.i15.i
  %465 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.2.i11.i ; <double*> [#uses=1]
  store double %440, double* %465, align 8
  %indvar.next.i54 = add i32 %indvar.i52, 1       ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %indvar.next.i54, add (i32 ashr (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 3), i32 -1) ; <i1> [#uses=1]
  br i1 %exitcond.i, label %bb2.i.i.i124, label %bb4.i

bb5.loopexit.i:                                   ; preds = %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit.i, %_ZN9benchmark4copyIPdS1_EEvT_S2_T0_.exit.i
  br i1 icmp sgt (i32 add (i32 ashr (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 3), i32 -1), i32 0), label %bb4.i, label %bb2.i.i.i124

bb.i.i.i121:                                      ; preds = %bb2.i.i.i124
  %prev.0.i.i.i = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i.i122 ; <double*> [#uses=1]
  %466 = load double* %first_addr.0.i.i.i, align 8 ; <double> [#uses=1]
  %467 = load double* %prev.0.i.i.i, align 8      ; <double> [#uses=1]
  %468 = fcmp olt double %466, %467               ; <i1> [#uses=1]
  br i1 %468, label %bb.i2.i125, label %bb2.i.i.i124

bb2.i.i.i124:                                     ; preds = %bb.i.i.i121, %bb5.loopexit.i, %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit17.i
  %indvar.i.i.i122 = phi i32 [ %tmp668, %bb.i.i.i121 ], [ 0, %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit17.i ], [ 0, %bb5.loopexit.i ] ; <i32> [#uses=2]
  %tmp668 = add i32 %indvar.i.i.i122, 1           ; <i32> [#uses=2]
  %first_addr.0.i.i.i = getelementptr [2000 x double]* @data, i32 0, i32 %tmp668 ; <double*> [#uses=2]
  %469 = icmp eq double* %first_addr.0.i.i.i, getelementptr ([2000 x double]* @data, i32 1, i32 0) ; <i1> [#uses=1]
  br i1 %469, label %_Z13verify_sortedIPdEvT_S1_.exit.i, label %bb.i.i.i121

bb.i2.i125:                                       ; preds = %bb.i.i.i121
  %470 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIPdEvT_S1_.exit.i

_Z13verify_sortedIPdEvT_S1_.exit.i:               ; preds = %bb.i2.i125, %bb2.i.i.i124
  %471 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %472 = icmp slt i32 %tmp5.i115, %471            ; <i1> [#uses=1]
  br i1 %472, label %bb.i116, label %invcont99

invcont99:                                        ; preds = %_Z13verify_sortedIPdEvT_S1_.exit.i, %invcont94
  %473 = phi i32 [ %.rle765, %invcont94 ], [ %471, %_Z13verify_sortedIPdEvT_S1_.exit.i ] ; <i32> [#uses=2]
  %474 = load double** %44, align 4               ; <double*> [#uses=4]
  %475 = load double** %43, align 8               ; <double*> [#uses=7]
  %476 = load double** %160, align 4              ; <double*> [#uses=2]
  %477 = load double** %159, align 8              ; <double*> [#uses=3]
  %478 = icmp sgt i32 %473, 0                     ; <i1> [#uses=1]
  br i1 %478, label %bb.nph.i106, label %invcont108

bb.nph.i106:                                      ; preds = %invcont99
  %479 = icmp eq double* %477, %476               ; <i1> [#uses=1]
  br i1 %479, label %bb.i107.us, label %bb.i107

bb.i107.us:                                       ; preds = %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i.us, %bb.nph.i106
  %i.03.i.us = phi i32 [ %tmp5.i.us, %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i.us ], [ 0, %bb.nph.i106 ] ; <i32> [#uses=1]
  %tmp5.i.us = add i32 %i.03.i.us, 1              ; <i32> [#uses=2]
  call fastcc void @_ZN9benchmark8heapsortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEvT_S8_(double* %475, double* %474) nounwind
  br label %bb2.i.i.i.us

_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i.us: ; preds = %bb2.i.i.i.us, %bb.i2.i.us
  %480 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %481 = icmp slt i32 %tmp5.i.us, %480            ; <i1> [#uses=1]
  br i1 %481, label %bb.i107.us, label %invcont108

bb.i2.i.us:                                       ; preds = %bb.i.i.i111.us
  %482 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i.us

bb.i.i.i111.us:                                   ; preds = %bb2.i.i.i.us
  %prev.0.0.i.i.i.us = getelementptr double* %475, i32 %indvar.i.i.i112.us ; <double*> [#uses=1]
  %483 = load double* %first_addr.0.0.i.i.i.us, align 8 ; <double> [#uses=1]
  %484 = load double* %prev.0.0.i.i.i.us, align 8 ; <double> [#uses=1]
  %485 = fcmp olt double %483, %484               ; <i1> [#uses=1]
  br i1 %485, label %bb.i2.i.us, label %bb2.i.i.i.us

bb2.i.i.i.us:                                     ; preds = %bb.i.i.i111.us, %bb.i107.us
  %indvar.i.i.i112.us = phi i32 [ 0, %bb.i107.us ], [ %tmp607, %bb.i.i.i111.us ] ; <i32> [#uses=2]
  %tmp607 = add i32 %indvar.i.i.i112.us, 1        ; <i32> [#uses=2]
  %first_addr.0.0.i.i.i.us = getelementptr double* %475, i32 %tmp607 ; <double*> [#uses=2]
  %486 = icmp eq double* %first_addr.0.0.i.i.i.us, %474 ; <i1> [#uses=1]
  br i1 %486, label %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i.us, label %bb.i.i.i111.us

bb.i107:                                          ; preds = %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i, %bb.nph.i106
  %i.03.i = phi i32 [ %tmp5.i, %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i ], [ 0, %bb.nph.i106 ] ; <i32> [#uses=1]
  %tmp5.i = add i32 %i.03.i, 1                    ; <i32> [#uses=2]
  br label %bb.i.i110

bb.i.i110:                                        ; preds = %bb.i.i110, %bb.i107
  %indvar.i.i = phi i32 [ 0, %bb.i107 ], [ %tmp664, %bb.i.i110 ] ; <i32> [#uses=3]
  %tmp664 = add i32 %indvar.i.i, 1                ; <i32> [#uses=2]
  %scevgep.i.i109 = getelementptr double* %477, i32 %tmp664 ; <double*> [#uses=1]
  %firstSource_addr.0.02.i.i = getelementptr double* %477, i32 %indvar.i.i ; <double*> [#uses=1]
  %firstDest_addr.0.01.i.i = getelementptr double* %475, i32 %indvar.i.i ; <double*> [#uses=1]
  %487 = load double* %firstSource_addr.0.02.i.i, align 8 ; <double> [#uses=1]
  store double %487, double* %firstDest_addr.0.01.i.i, align 8
  %488 = icmp eq double* %scevgep.i.i109, %476    ; <i1> [#uses=1]
  br i1 %488, label %_ZN9benchmark4copyIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEES7_EEvT_S8_T0_.exit.i, label %bb.i.i110

_ZN9benchmark4copyIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEES7_EEvT_S8_T0_.exit.i: ; preds = %bb.i.i110
  call fastcc void @_ZN9benchmark8heapsortIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEdEEvT_S8_(double* %475, double* %474) nounwind
  br label %bb2.i.i.i

bb.i.i.i111:                                      ; preds = %bb2.i.i.i
  %prev.0.0.i.i.i = getelementptr double* %475, i32 %indvar.i.i.i112 ; <double*> [#uses=1]
  %489 = load double* %first_addr.0.0.i.i.i, align 8 ; <double> [#uses=1]
  %490 = load double* %prev.0.0.i.i.i, align 8    ; <double> [#uses=1]
  %491 = fcmp olt double %489, %490               ; <i1> [#uses=1]
  br i1 %491, label %bb.i2.i, label %bb2.i.i.i

bb2.i.i.i:                                        ; preds = %bb.i.i.i111, %_ZN9benchmark4copyIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEES7_EEvT_S8_T0_.exit.i
  %indvar.i.i.i112 = phi i32 [ 0, %_ZN9benchmark4copyIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEES7_EEvT_S8_T0_.exit.i ], [ %tmp665, %bb.i.i.i111 ] ; <i32> [#uses=2]
  %tmp665 = add i32 %indvar.i.i.i112, 1           ; <i32> [#uses=2]
  %first_addr.0.0.i.i.i = getelementptr double* %475, i32 %tmp665 ; <double*> [#uses=2]
  %492 = icmp eq double* %first_addr.0.0.i.i.i, %474 ; <i1> [#uses=1]
  br i1 %492, label %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i, label %bb.i.i.i111

bb.i2.i:                                          ; preds = %bb.i.i.i111
  %493 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i

_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i: ; preds = %bb.i2.i, %bb2.i.i.i
  %494 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %495 = icmp slt i32 %tmp5.i, %494               ; <i1> [#uses=1]
  br i1 %495, label %bb.i107, label %invcont108

invcont108:                                       ; preds = %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i, %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i.us, %invcont99
  %496 = phi i32 [ %473, %invcont99 ], [ %480, %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i.us ], [ %494, %_Z13verify_sortedIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEvT_S7_.exit.i ] ; <i32> [#uses=2]
  %497 = icmp sgt i32 %496, 0                     ; <i1> [#uses=1]
  br i1 %497, label %bb.i90, label %invcont113

bb.i90:                                           ; preds = %_Z13verify_sortedISt16reverse_iteratorIPdEEvT_S3_.exit.i, %invcont108
  %i.05.i88 = phi i32 [ %tmp13.i89, %_Z13verify_sortedISt16reverse_iteratorIPdEEvT_S3_.exit.i ], [ 0, %invcont108 ] ; <i32> [#uses=1]
  %tmp13.i89 = add i32 %i.05.i88, 1               ; <i32> [#uses=2]
  br label %bb.i1.i96

bb.i1.i96:                                        ; preds = %bb.i1.i96, %bb.i90
  %indvar.i91 = phi i32 [ 0, %bb.i90 ], [ %indvar.next.i95, %bb.i1.i96 ] ; <i32> [#uses=2]
  %tmp659 = xor i32 %indvar.i91, -1               ; <i32> [#uses=2]
  %scevgep7.i94 = getelementptr [2000 x double]* @dataMaster, i32 1, i32 %tmp659 ; <double*> [#uses=2]
  %scevgep.i93 = getelementptr [2000 x double]* @data, i32 1, i32 %tmp659 ; <double*> [#uses=1]
  %498 = load double* %scevgep7.i94, align 8      ; <double> [#uses=1]
  store double %498, double* %scevgep.i93, align 8
  %499 = icmp eq double* %scevgep7.i94, getelementptr inbounds ([2000 x double]* @dataMaster, i32 0, i32 0) ; <i1> [#uses=1]
  %indvar.next.i95 = add i32 %indvar.i91, 1       ; <i32> [#uses=1]
  br i1 %499, label %bb.i56, label %bb.i1.i96

bb.i56:                                           ; preds = %_ZN9benchmark7sift_inISt16reverse_iteratorIPdEdEEviT_iT0_.exit26.i, %bb.i1.i96
  %indvar15.i = phi i32 [ %indvar.next16.i, %_ZN9benchmark7sift_inISt16reverse_iteratorIPdEdEEviT_iT0_.exit26.i ], [ 0, %bb.i1.i96 ] ; <i32> [#uses=4]
  %j.08.i = sub i32 999, %indvar15.i              ; <i32> [#uses=4]
  %tmp23.i = add i32 %indvar15.i, -1000           ; <i32> [#uses=1]
  %scevgep24.i = getelementptr [2000 x double]* @data, i32 1, i32 %tmp23.i ; <double*> [#uses=1]
  %500 = load double* %scevgep24.i, align 8       ; <double> [#uses=2]
  %501 = shl i32 %j.08.i, 1                       ; <i32> [#uses=1]
  %i.112.i.i = add i32 %501, 2                    ; <i32> [#uses=3]
  %502 = icmp slt i32 %i.112.i.i, 2000            ; <i1> [#uses=1]
  br i1 %502, label %bb.i9.i, label %bb4.i12.i

bb.i9.i:                                          ; preds = %bb.i9.i, %bb.i56
  %i.113.i1.i = phi i32 [ %phitmp.i8.i, %bb.i9.i ], [ %i.112.i.i, %bb.i56 ] ; <i32> [#uses=3]
  %free.010.i2.i = phi i32 [ %512, %bb.i9.i ], [ %j.08.i, %bb.i56 ] ; <i32> [#uses=1]
  %.sum3.i3.i = sub i32 0, %i.113.i1.i            ; <i32> [#uses=1]
  %503 = getelementptr [2000 x double]* @data, i32 1, i32 %.sum3.i3.i ; <double*> [#uses=1]
  %504 = load double* %503, align 8               ; <double> [#uses=1]
  %.sum2.i4.i = xor i32 %i.113.i1.i, -1           ; <i32> [#uses=1]
  %505 = getelementptr [2000 x double]* @data, i32 1, i32 %.sum2.i4.i ; <double*> [#uses=1]
  %506 = load double* %505, align 8               ; <double> [#uses=1]
  %507 = fcmp olt double %504, %506               ; <i1> [#uses=1]
  %508 = zext i1 %507 to i32                      ; <i32> [#uses=1]
  %i.0.i5.i = or i32 %508, %i.113.i1.i            ; <i32> [#uses=3]
  %.sum1.i6.i = xor i32 %free.010.i2.i, -1        ; <i32> [#uses=1]
  %509 = getelementptr [2000 x double]* @data, i32 1, i32 %.sum1.i6.i ; <double*> [#uses=1]
  %.sum.i7.i = sub i32 0, %i.0.i5.i               ; <i32> [#uses=1]
  %510 = getelementptr [2000 x double]* @data, i32 1, i32 %.sum.i7.i ; <double*> [#uses=1]
  %511 = load double* %510, align 8               ; <double> [#uses=1]
  store double %511, double* %509, align 8
  %512 = add i32 %i.0.i5.i, -1                    ; <i32> [#uses=2]
  %phitmp.i8.i = shl i32 %i.0.i5.i, 1             ; <i32> [#uses=3]
  %513 = icmp slt i32 %phitmp.i8.i, 2000          ; <i1> [#uses=1]
  br i1 %513, label %bb.i9.i, label %bb4.i12.i

bb4.i12.i:                                        ; preds = %bb.i9.i, %bb.i56
  %i.1.lcssa.i10.i = phi i32 [ %i.112.i.i, %bb.i56 ], [ %phitmp.i8.i, %bb.i9.i ] ; <i32> [#uses=3]
  %free.0.lcssa.i11.i = phi i32 [ %j.08.i, %bb.i56 ], [ %512, %bb.i9.i ] ; <i32> [#uses=3]
  %514 = icmp eq i32 %i.1.lcssa.i10.i, 2000       ; <i1> [#uses=1]
  br i1 %514, label %bb5.i15.i, label %bb8.i22.i

bb5.i15.i:                                        ; preds = %bb4.i12.i
  %.sum5.i13.i = xor i32 %free.0.lcssa.i11.i, -1  ; <i32> [#uses=1]
  %515 = getelementptr [2000 x double]* @data, i32 1, i32 %.sum5.i13.i ; <double*> [#uses=1]
  %.sum4.i14.i = sub i32 0, %i.1.lcssa.i10.i      ; <i32> [#uses=1]
  %516 = getelementptr [2000 x double]* @data, i32 1, i32 %.sum4.i14.i ; <double*> [#uses=1]
  %517 = load double* %516, align 8               ; <double> [#uses=1]
  store double %517, double* %515, align 8
  %518 = add i32 %i.1.lcssa.i10.i, -1             ; <i32> [#uses=2]
  br label %bb8.i22.i

bb7.i17.i:                                        ; preds = %bb9.i24.i
  %.sum7.i16.i = xor i32 %free.2.i18.i, -1        ; <i32> [#uses=1]
  %519 = getelementptr [2000 x double]* @data, i32 1, i32 %.sum7.i16.i ; <double*> [#uses=1]
  store double %522, double* %519, align 8
  br label %bb8.i22.i

bb8.i22.i:                                        ; preds = %bb7.i17.i, %bb5.i15.i, %bb4.i12.i
  %free.2.i18.i = phi i32 [ %i.2.i21.i, %bb7.i17.i ], [ %518, %bb5.i15.i ], [ %free.0.lcssa.i11.i, %bb4.i12.i ] ; <i32> [#uses=3]
  %i.2.in.in.i19.i = phi i32 [ %i.2.i21.i, %bb7.i17.i ], [ %518, %bb5.i15.i ], [ %free.0.lcssa.i11.i, %bb4.i12.i ] ; <i32> [#uses=1]
  %i.2.in.i20.i = add i32 %i.2.in.in.i19.i, -1    ; <i32> [#uses=1]
  %i.2.i21.i = sdiv i32 %i.2.in.i20.i, 2          ; <i32> [#uses=3]
  %520 = icmp sgt i32 %free.2.i18.i, %j.08.i      ; <i1> [#uses=1]
  br i1 %520, label %bb9.i24.i, label %_ZN9benchmark7sift_inISt16reverse_iteratorIPdEdEEviT_iT0_.exit26.i

bb9.i24.i:                                        ; preds = %bb8.i22.i
  %.sum8.i23.i = xor i32 %i.2.i21.i, -1           ; <i32> [#uses=1]
  %521 = getelementptr [2000 x double]* @data, i32 1, i32 %.sum8.i23.i ; <double*> [#uses=1]
  %522 = load double* %521, align 8               ; <double> [#uses=2]
  %523 = fcmp uge double %522, %500               ; <i1> [#uses=1]
  br i1 %523, label %_ZN9benchmark7sift_inISt16reverse_iteratorIPdEdEEviT_iT0_.exit26.i, label %bb7.i17.i

_ZN9benchmark7sift_inISt16reverse_iteratorIPdEdEEviT_iT0_.exit26.i: ; preds = %bb9.i24.i, %bb8.i22.i
  %.sum9.i25.i = xor i32 %free.2.i18.i, -1        ; <i32> [#uses=1]
  %524 = getelementptr [2000 x double]* @data, i32 1, i32 %.sum9.i25.i ; <double*> [#uses=1]
  store double %500, double* %524, align 8
  %j.0.i57 = sub i32 998, %indvar15.i             ; <i32> [#uses=1]
  %525 = icmp slt i32 %j.0.i57, 0                 ; <i1> [#uses=1]
  %indvar.next16.i = add i32 %indvar15.i, 1       ; <i32> [#uses=1]
  br i1 %525, label %bb4.i60, label %bb.i56

bb4.i60:                                          ; preds = %_ZN9benchmark7sift_inISt16reverse_iteratorIPdEdEEviT_iT0_.exit.i, %_ZN9benchmark7sift_inISt16reverse_iteratorIPdEdEEviT_iT0_.exit26.i
  %indvar.i58 = phi i32 [ %indvar.next.i75, %_ZN9benchmark7sift_inISt16reverse_iteratorIPdEdEEviT_iT0_.exit.i ], [ 0, %_ZN9benchmark7sift_inISt16reverse_iteratorIPdEdEEviT_iT0_.exit26.i ] ; <i32> [#uses=3]
  %j.15.i = sub i32 1999, %indvar.i58             ; <i32> [#uses=3]
  %tmp13.i59 = add i32 %indvar.i58, -2000         ; <i32> [#uses=1]
  %scevgep14.i = getelementptr [2000 x double]* @data, i32 1, i32 %tmp13.i59 ; <double*> [#uses=2]
  %526 = load double* %scevgep14.i, align 8       ; <double> [#uses=2]
  %527 = load double* getelementptr inbounds ([2000 x double]* @data, i32 0, i32 1999), align 8 ; <double> [#uses=1]
  store double %527, double* %scevgep14.i, align 8
  %528 = icmp sgt i32 %j.15.i, 2                  ; <i1> [#uses=1]
  br i1 %528, label %bb.i.i63, label %bb4.i.i66

bb.i.i63:                                         ; preds = %bb.i.i63, %bb4.i60
  %i.113.i.i = phi i32 [ %phitmp.i.i62, %bb.i.i63 ], [ 2, %bb4.i60 ] ; <i32> [#uses=3]
  %free.010.i.i = phi i32 [ %538, %bb.i.i63 ], [ 0, %bb4.i60 ] ; <i32> [#uses=1]
  %.sum3.i.i = sub i32 0, %i.113.i.i              ; <i32> [#uses=1]
  %529 = getelementptr [2000 x double]* @data, i32 1, i32 %.sum3.i.i ; <double*> [#uses=1]
  %530 = load double* %529, align 16              ; <double> [#uses=1]
  %.sum2.i.i = xor i32 %i.113.i.i, -1             ; <i32> [#uses=1]
  %531 = getelementptr [2000 x double]* @data, i32 1, i32 %.sum2.i.i ; <double*> [#uses=1]
  %532 = load double* %531, align 8               ; <double> [#uses=1]
  %533 = fcmp olt double %530, %532               ; <i1> [#uses=1]
  %534 = zext i1 %533 to i32                      ; <i32> [#uses=1]
  %i.0.i.i61 = or i32 %534, %i.113.i.i            ; <i32> [#uses=3]
  %.sum1.i.i = xor i32 %free.010.i.i, -1          ; <i32> [#uses=1]
  %535 = getelementptr [2000 x double]* @data, i32 1, i32 %.sum1.i.i ; <double*> [#uses=1]
  %.sum.i.i = sub i32 0, %i.0.i.i61               ; <i32> [#uses=1]
  %536 = getelementptr [2000 x double]* @data, i32 1, i32 %.sum.i.i ; <double*> [#uses=1]
  %537 = load double* %536, align 8               ; <double> [#uses=1]
  store double %537, double* %535, align 8
  %538 = add i32 %i.0.i.i61, -1                   ; <i32> [#uses=2]
  %phitmp.i.i62 = shl i32 %i.0.i.i61, 1           ; <i32> [#uses=3]
  %539 = icmp slt i32 %phitmp.i.i62, %j.15.i      ; <i1> [#uses=1]
  br i1 %539, label %bb.i.i63, label %bb4.i.i66

bb4.i.i66:                                        ; preds = %bb.i.i63, %bb4.i60
  %i.1.lcssa.i.i64 = phi i32 [ 2, %bb4.i60 ], [ %phitmp.i.i62, %bb.i.i63 ] ; <i32> [#uses=3]
  %free.0.lcssa.i.i65 = phi i32 [ 0, %bb4.i60 ], [ %538, %bb.i.i63 ] ; <i32> [#uses=3]
  %540 = icmp eq i32 %i.1.lcssa.i.i64, %j.15.i    ; <i1> [#uses=1]
  br i1 %540, label %bb5.i.i67, label %bb8.i.i73

bb5.i.i67:                                        ; preds = %bb4.i.i66
  %.sum5.i.i = xor i32 %free.0.lcssa.i.i65, -1    ; <i32> [#uses=1]
  %541 = getelementptr [2000 x double]* @data, i32 1, i32 %.sum5.i.i ; <double*> [#uses=1]
  %.sum4.i.i = sub i32 0, %i.1.lcssa.i.i64        ; <i32> [#uses=1]
  %542 = getelementptr [2000 x double]* @data, i32 1, i32 %.sum4.i.i ; <double*> [#uses=1]
  %543 = load double* %542, align 16              ; <double> [#uses=1]
  store double %543, double* %541, align 8
  %544 = add i32 %i.1.lcssa.i.i64, -1             ; <i32> [#uses=2]
  br label %bb8.i.i73

bb7.i.i68:                                        ; preds = %bb9.i.i74
  %.sum7.i.i = xor i32 %free.2.i.i69, -1          ; <i32> [#uses=1]
  %545 = getelementptr [2000 x double]* @data, i32 1, i32 %.sum7.i.i ; <double*> [#uses=1]
  store double %548, double* %545, align 8
  br label %bb8.i.i73

bb8.i.i73:                                        ; preds = %bb7.i.i68, %bb5.i.i67, %bb4.i.i66
  %free.2.i.i69 = phi i32 [ %i.2.i.i72, %bb7.i.i68 ], [ %544, %bb5.i.i67 ], [ %free.0.lcssa.i.i65, %bb4.i.i66 ] ; <i32> [#uses=3]
  %i.2.in.in.i.i70 = phi i32 [ %i.2.i.i72, %bb7.i.i68 ], [ %544, %bb5.i.i67 ], [ %free.0.lcssa.i.i65, %bb4.i.i66 ] ; <i32> [#uses=1]
  %i.2.in.i.i71 = add i32 %i.2.in.in.i.i70, -1    ; <i32> [#uses=1]
  %i.2.i.i72 = sdiv i32 %i.2.in.i.i71, 2          ; <i32> [#uses=3]
  %546 = icmp sgt i32 %free.2.i.i69, 0            ; <i1> [#uses=1]
  br i1 %546, label %bb9.i.i74, label %_ZN9benchmark7sift_inISt16reverse_iteratorIPdEdEEviT_iT0_.exit.i

bb9.i.i74:                                        ; preds = %bb8.i.i73
  %.sum8.i.i = xor i32 %i.2.i.i72, -1             ; <i32> [#uses=1]
  %547 = getelementptr [2000 x double]* @data, i32 1, i32 %.sum8.i.i ; <double*> [#uses=1]
  %548 = load double* %547, align 8               ; <double> [#uses=2]
  %549 = fcmp uge double %548, %526               ; <i1> [#uses=1]
  br i1 %549, label %_ZN9benchmark7sift_inISt16reverse_iteratorIPdEdEEviT_iT0_.exit.i, label %bb7.i.i68

_ZN9benchmark7sift_inISt16reverse_iteratorIPdEdEEviT_iT0_.exit.i: ; preds = %bb9.i.i74, %bb8.i.i73
  %.sum9.i.i = xor i32 %free.2.i.i69, -1          ; <i32> [#uses=1]
  %550 = getelementptr [2000 x double]* @data, i32 1, i32 %.sum9.i.i ; <double*> [#uses=1]
  store double %526, double* %550, align 8
  %indvar.next.i75 = add i32 %indvar.i58, 1       ; <i32> [#uses=2]
  %exitcond.i76 = icmp eq i32 %indvar.next.i75, 1999 ; <i1> [#uses=1]
  br i1 %exitcond.i76, label %bb3.i.i.i104, label %bb4.i60

bb.i.i.i100:                                      ; preds = %bb3.i.i.i104
  %tmp662 = sub i32 -2, %indvar.i.i.i101          ; <i32> [#uses=1]
  %scevgep4.i.i98 = getelementptr [2000 x double]* @data, i32 1, i32 %tmp662 ; <double*> [#uses=1]
  %551 = load double* %scevgep4.i.i98, align 8    ; <double> [#uses=1]
  %552 = load double* %scevgep.i.i.i103, align 8  ; <double> [#uses=1]
  %553 = fcmp olt double %551, %552               ; <i1> [#uses=1]
  %indvar.next.i.i.i99 = add i32 %indvar.i.i.i101, 1 ; <i32> [#uses=1]
  br i1 %553, label %bb.i.i105, label %bb3.i.i.i104

bb3.i.i.i104:                                     ; preds = %bb.i.i.i100, %_ZN9benchmark7sift_inISt16reverse_iteratorIPdEdEEviT_iT0_.exit.i
  %indvar.i.i.i101 = phi i32 [ %indvar.next.i.i.i99, %bb.i.i.i100 ], [ 0, %_ZN9benchmark7sift_inISt16reverse_iteratorIPdEdEEviT_iT0_.exit.i ] ; <i32> [#uses=3]
  %tmp661 = xor i32 %indvar.i.i.i101, -1          ; <i32> [#uses=1]
  %scevgep.i.i.i103 = getelementptr [2000 x double]* @data, i32 1, i32 %tmp661 ; <double*> [#uses=2]
  %554 = icmp eq double* %scevgep.i.i.i103, getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0) ; <i1> [#uses=1]
  br i1 %554, label %_Z13verify_sortedISt16reverse_iteratorIPdEEvT_S3_.exit.i, label %bb.i.i.i100

bb.i.i105:                                        ; preds = %bb.i.i.i100
  %555 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIPdEEvT_S3_.exit.i

_Z13verify_sortedISt16reverse_iteratorIPdEEvT_S3_.exit.i: ; preds = %bb.i.i105, %bb3.i.i.i104
  %556 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %557 = icmp slt i32 %tmp13.i89, %556            ; <i1> [#uses=1]
  br i1 %557, label %bb.i90, label %invcont113

invcont113:                                       ; preds = %_Z13verify_sortedISt16reverse_iteratorIPdEEvT_S3_.exit.i, %invcont108
  %558 = phi i32 [ %496, %invcont108 ], [ %556, %_Z13verify_sortedISt16reverse_iteratorIPdEEvT_S3_.exit.i ] ; <i32> [#uses=2]
  %559 = load double** %43, align 8               ; <double*> [#uses=4]
  %560 = load double** %44, align 4               ; <double*> [#uses=7]
  %561 = load double** %159, align 8              ; <double*> [#uses=2]
  %562 = load double** %160, align 4              ; <double*> [#uses=2]
  %563 = icmp sgt i32 %558, 0                     ; <i1> [#uses=1]
  br i1 %563, label %bb.nph.i64, label %invcont114

bb.nph.i64:                                       ; preds = %invcont113
  %564 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %12, i32 0, i32 0, i32 0 ; <double**> [#uses=2]
  %565 = icmp eq double* %562, %561               ; <i1> [#uses=1]
  br i1 %565, label %bb.i67.us, label %bb.i67

bb.i67.us:                                        ; preds = %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i84.us, %bb.nph.i64
  %i.05.i65.us = phi i32 [ %tmp13.i66.us, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i84.us ], [ 0, %bb.nph.i64 ] ; <i32> [#uses=1]
  %tmp13.i66.us = add i32 %i.05.i65.us, 1         ; <i32> [#uses=2]
  store double* %560, double** %564, align 8
  call fastcc void @_ZN9benchmark8heapsortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_(%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %12, double* %559) nounwind
  br label %bb3.i.i.i82.us

_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i84.us: ; preds = %bb3.i.i.i82.us, %bb.i.i83.us
  %566 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %567 = icmp slt i32 %tmp13.i66.us, %566         ; <i1> [#uses=1]
  br i1 %567, label %bb.i67.us, label %invcont114

bb.i.i83.us:                                      ; preds = %bb.i.i.i78.us
  %568 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i84.us

bb.i.i.i78.us:                                    ; preds = %bb3.i.i.i82.us
  %tmp615 = sub i32 -2, %indvar.i.i.i79.us        ; <i32> [#uses=1]
  %scevgep4.i.i76.us = getelementptr double* %560, i32 %tmp615 ; <double*> [#uses=1]
  %569 = load double* %scevgep4.i.i76.us, align 8 ; <double> [#uses=1]
  %570 = load double* %scevgep.i.i.i81.us, align 8 ; <double> [#uses=1]
  %571 = fcmp olt double %569, %570               ; <i1> [#uses=1]
  %indvar.next.i.i.i77.us = add i32 %indvar.i.i.i79.us, 1 ; <i32> [#uses=1]
  br i1 %571, label %bb.i.i83.us, label %bb3.i.i.i82.us

bb3.i.i.i82.us:                                   ; preds = %bb.i.i.i78.us, %bb.i67.us
  %indvar.i.i.i79.us = phi i32 [ 0, %bb.i67.us ], [ %indvar.next.i.i.i77.us, %bb.i.i.i78.us ] ; <i32> [#uses=3]
  %tmp614 = xor i32 %indvar.i.i.i79.us, -1        ; <i32> [#uses=1]
  %scevgep.i.i.i81.us = getelementptr double* %560, i32 %tmp614 ; <double*> [#uses=2]
  %572 = icmp eq double* %scevgep.i.i.i81.us, %559 ; <i1> [#uses=1]
  br i1 %572, label %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i84.us, label %bb.i.i.i78.us

bb.i67:                                           ; preds = %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i84, %bb.nph.i64
  %i.05.i65 = phi i32 [ %tmp13.i66, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i84 ], [ 0, %bb.nph.i64 ] ; <i32> [#uses=1]
  %tmp13.i66 = add i32 %i.05.i65, 1               ; <i32> [#uses=2]
  br label %bb.i1.i73

bb.i1.i73:                                        ; preds = %bb.i1.i73, %bb.i67
  %indvar.i68 = phi i32 [ 0, %bb.i67 ], [ %indvar.next.i72, %bb.i1.i73 ] ; <i32> [#uses=2]
  %tmp653 = xor i32 %indvar.i68, -1               ; <i32> [#uses=2]
  %scevgep7.i71 = getelementptr double* %562, i32 %tmp653 ; <double*> [#uses=2]
  %scevgep.i70 = getelementptr double* %560, i32 %tmp653 ; <double*> [#uses=1]
  %573 = load double* %scevgep7.i71, align 8      ; <double> [#uses=1]
  store double %573, double* %scevgep.i70, align 8
  %574 = icmp eq double* %scevgep7.i71, %561      ; <i1> [#uses=1]
  %indvar.next.i72 = add i32 %indvar.i68, 1       ; <i32> [#uses=1]
  br i1 %574, label %_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit.i74, label %bb.i1.i73

_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit.i74: ; preds = %bb.i1.i73
  store double* %560, double** %564, align 8
  call fastcc void @_ZN9benchmark8heapsortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_(%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %12, double* %559) nounwind
  br label %bb3.i.i.i82

bb.i.i.i78:                                       ; preds = %bb3.i.i.i82
  %tmp656 = sub i32 -2, %indvar.i.i.i79           ; <i32> [#uses=1]
  %scevgep4.i.i76 = getelementptr double* %560, i32 %tmp656 ; <double*> [#uses=1]
  %575 = load double* %scevgep4.i.i76, align 8    ; <double> [#uses=1]
  %576 = load double* %scevgep.i.i.i81, align 8   ; <double> [#uses=1]
  %577 = fcmp olt double %575, %576               ; <i1> [#uses=1]
  %indvar.next.i.i.i77 = add i32 %indvar.i.i.i79, 1 ; <i32> [#uses=1]
  br i1 %577, label %bb.i.i83, label %bb3.i.i.i82

bb3.i.i.i82:                                      ; preds = %bb.i.i.i78, %_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit.i74
  %indvar.i.i.i79 = phi i32 [ 0, %_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit.i74 ], [ %indvar.next.i.i.i77, %bb.i.i.i78 ] ; <i32> [#uses=3]
  %tmp655 = xor i32 %indvar.i.i.i79, -1           ; <i32> [#uses=1]
  %scevgep.i.i.i81 = getelementptr double* %560, i32 %tmp655 ; <double*> [#uses=2]
  %578 = icmp eq double* %scevgep.i.i.i81, %559   ; <i1> [#uses=1]
  br i1 %578, label %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i84, label %bb.i.i.i78

bb.i.i83:                                         ; preds = %bb.i.i.i78
  %579 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i84

_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i84: ; preds = %bb.i.i83, %bb3.i.i.i82
  %580 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %581 = icmp slt i32 %tmp13.i66, %580            ; <i1> [#uses=1]
  br i1 %581, label %bb.i67, label %invcont114

invcont114:                                       ; preds = %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i84, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i84.us, %invcont113
  %582 = phi i32 [ %558, %invcont113 ], [ %566, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i84.us ], [ %580, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i84 ] ; <i32> [#uses=2]
  %583 = icmp sgt i32 %582, 0                     ; <i1> [#uses=1]
  br i1 %583, label %bb.nph.i53, label %invcont115

bb.nph.i53:                                       ; preds = %invcont114
  %584 = getelementptr inbounds %"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* %13, i32 0, i32 0, i32 0 ; <double**> [#uses=2]
  %585 = icmp eq double* %168, %.pre754           ; <i1> [#uses=1]
  br i1 %585, label %bb.i55.us, label %bb.i55

bb.i55.us:                                        ; preds = %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i.us, %bb.nph.i53
  %i.05.i54.us = phi i32 [ %tmp13.i.us, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i.us ], [ 0, %bb.nph.i53 ] ; <i32> [#uses=1]
  %tmp13.i.us = add i32 %i.05.i54.us, 1           ; <i32> [#uses=2]
  store double* %51, double** %584, align 8
  call fastcc void @_ZN9benchmark8heapsortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_(%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %13, double* %50) nounwind
  br label %bb3.i.i.i61.us

_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i.us: ; preds = %bb3.i.i.i61.us, %bb.i.i62.us
  %586 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %587 = icmp slt i32 %tmp13.i.us, %586           ; <i1> [#uses=1]
  br i1 %587, label %bb.i55.us, label %invcont115

bb.i.i62.us:                                      ; preds = %bb.i.i.i59.us
  %588 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i.us

bb.i.i.i59.us:                                    ; preds = %bb3.i.i.i61.us
  %tmp619 = sub i32 -2, %indvar.i.i.i60.us        ; <i32> [#uses=1]
  %scevgep4.i.i.us = getelementptr double* %51, i32 %tmp619 ; <double*> [#uses=1]
  %589 = load double* %scevgep4.i.i.us, align 8   ; <double> [#uses=1]
  %590 = load double* %scevgep.i.i.i.us, align 8  ; <double> [#uses=1]
  %591 = fcmp olt double %589, %590               ; <i1> [#uses=1]
  %indvar.next.i.i.i.us = add i32 %indvar.i.i.i60.us, 1 ; <i32> [#uses=1]
  br i1 %591, label %bb.i.i62.us, label %bb3.i.i.i61.us

bb3.i.i.i61.us:                                   ; preds = %bb.i.i.i59.us, %bb.i55.us
  %indvar.i.i.i60.us = phi i32 [ 0, %bb.i55.us ], [ %indvar.next.i.i.i.us, %bb.i.i.i59.us ] ; <i32> [#uses=3]
  %tmp618 = xor i32 %indvar.i.i.i60.us, -1        ; <i32> [#uses=1]
  %scevgep.i.i.i.us = getelementptr double* %51, i32 %tmp618 ; <double*> [#uses=2]
  %592 = icmp eq double* %scevgep.i.i.i.us, %50   ; <i1> [#uses=1]
  br i1 %592, label %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i.us, label %bb.i.i.i59.us

bb.i55:                                           ; preds = %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i, %bb.nph.i53
  %i.05.i54 = phi i32 [ %tmp13.i, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i ], [ 0, %bb.nph.i53 ] ; <i32> [#uses=1]
  %tmp13.i = add i32 %i.05.i54, 1                 ; <i32> [#uses=2]
  br label %bb.i1.i58

bb.i1.i58:                                        ; preds = %bb.i1.i58, %bb.i55
  %indvar.i56 = phi i32 [ 0, %bb.i55 ], [ %indvar.next.i, %bb.i1.i58 ] ; <i32> [#uses=2]
  %tmp647 = xor i32 %indvar.i56, -1               ; <i32> [#uses=2]
  %scevgep7.i = getelementptr double* %168, i32 %tmp647 ; <double*> [#uses=2]
  %scevgep.i57 = getelementptr double* %51, i32 %tmp647 ; <double*> [#uses=1]
  %593 = load double* %scevgep7.i, align 8        ; <double> [#uses=1]
  store double %593, double* %scevgep.i57, align 8
  %594 = icmp eq double* %scevgep7.i, %.pre754    ; <i1> [#uses=1]
  %indvar.next.i = add i32 %indvar.i56, 1         ; <i32> [#uses=1]
  br i1 %594, label %_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit.i, label %bb.i1.i58

_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit.i: ; preds = %bb.i1.i58
  store double* %51, double** %584, align 8
  call fastcc void @_ZN9benchmark8heapsortISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEdEEvT_SA_(%"struct.std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > >"* noalias %13, double* %50) nounwind
  br label %bb3.i.i.i61

bb.i.i.i59:                                       ; preds = %bb3.i.i.i61
  %tmp650 = sub i32 -2, %indvar.i.i.i60           ; <i32> [#uses=1]
  %scevgep4.i.i = getelementptr double* %51, i32 %tmp650 ; <double*> [#uses=1]
  %595 = load double* %scevgep4.i.i, align 8      ; <double> [#uses=1]
  %596 = load double* %scevgep.i.i.i, align 8     ; <double> [#uses=1]
  %597 = fcmp olt double %595, %596               ; <i1> [#uses=1]
  %indvar.next.i.i.i = add i32 %indvar.i.i.i60, 1 ; <i32> [#uses=1]
  br i1 %597, label %bb.i.i62, label %bb3.i.i.i61

bb3.i.i.i61:                                      ; preds = %bb.i.i.i59, %_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit.i
  %indvar.i.i.i60 = phi i32 [ 0, %_ZN9benchmark4copyISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEES9_EEvT_SA_T0_.exit.i ], [ %indvar.next.i.i.i, %bb.i.i.i59 ] ; <i32> [#uses=3]
  %tmp649 = xor i32 %indvar.i.i.i60, -1           ; <i32> [#uses=1]
  %scevgep.i.i.i = getelementptr double* %51, i32 %tmp649 ; <double*> [#uses=2]
  %598 = icmp eq double* %scevgep.i.i.i, %50      ; <i1> [#uses=1]
  br i1 %598, label %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i, label %bb.i.i.i59

bb.i.i62:                                         ; preds = %bb.i.i.i59
  %599 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i

_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i: ; preds = %bb.i.i62, %bb3.i.i.i61
  %600 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %601 = icmp slt i32 %tmp13.i, %600              ; <i1> [#uses=1]
  br i1 %601, label %bb.i55, label %invcont115

invcont115:                                       ; preds = %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i.us, %invcont114
  %602 = phi i32 [ %582, %invcont114 ], [ %586, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i.us ], [ %600, %_Z13verify_sortedISt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEvT_S9_.exit.i ] ; <i32> [#uses=2]
  %603 = icmp sgt i32 %602, 0                     ; <i1> [#uses=1]
  br i1 %603, label %bb.i40, label %invcont116

bb.i40:                                           ; preds = %_Z13verify_sortedISt16reverse_iteratorIS0_IPdEEEvT_S4_.exit.i, %invcont115
  %i.05.i38 = phi i32 [ %tmp10.i39, %_Z13verify_sortedISt16reverse_iteratorIS0_IPdEEEvT_S4_.exit.i ], [ 0, %invcont115 ] ; <i32> [#uses=1]
  %tmp10.i39 = add i32 %i.05.i38, 1               ; <i32> [#uses=2]
  br label %bb.i1.i45

bb.i1.i45:                                        ; preds = %bb.i1.i45, %bb.i40
  %indvar.i41 = phi i32 [ 0, %bb.i40 ], [ %tmp643, %bb.i1.i45 ] ; <i32> [#uses=3]
  %tmp643 = add i32 %indvar.i41, 1                ; <i32> [#uses=2]
  %scevgep.i42 = getelementptr [2000 x double]* @dataMaster, i32 0, i32 %indvar.i41 ; <double*> [#uses=1]
  %.1.0.0.i = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i41 ; <double*> [#uses=1]
  %604 = load double* %scevgep.i42, align 8       ; <double> [#uses=1]
  store double %604, double* %.1.0.0.i, align 8
  %scevgep6.i44.idx.mask = and i32 %tmp643, 536870911 ; <i32> [#uses=1]
  %605 = icmp eq i32 %scevgep6.i44.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %605, label %bb.i80, label %bb.i1.i45

bb.i80:                                           ; preds = %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IPdEEdEEviT_iT0_.exit21.i, %bb.i1.i45
  %indvar35.i = phi i32 [ %indvar.next36.i, %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IPdEEdEEviT_iT0_.exit21.i ], [ 0, %bb.i1.i45 ] ; <i32> [#uses=4]
  %j.0.i78 = sub i32 998, %indvar35.i             ; <i32> [#uses=1]
  %j.029.i = sub i32 999, %indvar35.i             ; <i32> [#uses=4]
  %tmp42.i = mul i32 %indvar35.i, -2              ; <i32> [#uses=1]
  %i.13.i.i79 = add i32 %tmp42.i, 2000            ; <i32> [#uses=3]
  %scevgep45.i = getelementptr [2000 x double]* @data, i32 0, i32 %j.029.i ; <double*> [#uses=1]
  %606 = load double* %scevgep45.i, align 8       ; <double> [#uses=2]
  %607 = icmp slt i32 %i.13.i.i79, 2000           ; <i1> [#uses=1]
  br i1 %607, label %bb.i6.i, label %bb4.i9.i

bb.i6.i:                                          ; preds = %bb.i6.i, %bb.i80
  %i.14.i2.i = phi i32 [ %phitmp.i5.i, %bb.i6.i ], [ %i.13.i.i79, %bb.i80 ] ; <i32> [#uses=3]
  %free.01.i3.i = phi i32 [ %616, %bb.i6.i ], [ %j.029.i, %bb.i80 ] ; <i32> [#uses=1]
  %608 = add i32 %i.14.i2.i, -1                   ; <i32> [#uses=1]
  %609 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %608 ; <double*> [#uses=1]
  %610 = load double* %609, align 8               ; <double> [#uses=1]
  %611 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %i.14.i2.i ; <double*> [#uses=1]
  %612 = load double* %611, align 8               ; <double> [#uses=1]
  %613 = fcmp olt double %610, %612               ; <i1> [#uses=1]
  %614 = zext i1 %613 to i32                      ; <i32> [#uses=1]
  %i.0.i4.i = or i32 %614, %i.14.i2.i             ; <i32> [#uses=2]
  %615 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.01.i3.i ; <double*> [#uses=1]
  %616 = add i32 %i.0.i4.i, -1                    ; <i32> [#uses=3]
  %617 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %616 ; <double*> [#uses=1]
  %618 = load double* %617, align 8               ; <double> [#uses=1]
  store double %618, double* %615, align 8
  %phitmp.i5.i = shl i32 %i.0.i4.i, 1             ; <i32> [#uses=3]
  %619 = icmp slt i32 %phitmp.i5.i, 2000          ; <i1> [#uses=1]
  br i1 %619, label %bb.i6.i, label %bb4.i9.i

bb4.i9.i:                                         ; preds = %bb.i6.i, %bb.i80
  %i.1.lcssa.i7.i = phi i32 [ %i.13.i.i79, %bb.i80 ], [ %phitmp.i5.i, %bb.i6.i ] ; <i32> [#uses=2]
  %free.0.lcssa.i8.i = phi i32 [ %j.029.i, %bb.i80 ], [ %616, %bb.i6.i ] ; <i32> [#uses=3]
  %620 = icmp eq i32 %i.1.lcssa.i7.i, 2000        ; <i1> [#uses=1]
  br i1 %620, label %bb5.i10.i, label %bb8.i19.i

bb5.i10.i:                                        ; preds = %bb4.i9.i
  %621 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.0.lcssa.i8.i ; <double*> [#uses=1]
  %622 = add i32 %i.1.lcssa.i7.i, -1              ; <i32> [#uses=3]
  %623 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %622 ; <double*> [#uses=1]
  %624 = load double* %623, align 8               ; <double> [#uses=1]
  store double %624, double* %621, align 8
  br label %bb8.i19.i

bb7.i14.i:                                        ; preds = %bb9.i20.i
  %625 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.2.i15.i ; <double*> [#uses=1]
  store double %628, double* %625, align 8
  br label %bb8.i19.i

bb8.i19.i:                                        ; preds = %bb7.i14.i, %bb5.i10.i, %bb4.i9.i
  %free.2.i15.i = phi i32 [ %i.2.i18.i, %bb7.i14.i ], [ %622, %bb5.i10.i ], [ %free.0.lcssa.i8.i, %bb4.i9.i ] ; <i32> [#uses=3]
  %i.2.in.in.i16.i = phi i32 [ %i.2.i18.i, %bb7.i14.i ], [ %622, %bb5.i10.i ], [ %free.0.lcssa.i8.i, %bb4.i9.i ] ; <i32> [#uses=1]
  %i.2.in.i17.i = add i32 %i.2.in.in.i16.i, -1    ; <i32> [#uses=1]
  %i.2.i18.i = sdiv i32 %i.2.in.i17.i, 2          ; <i32> [#uses=3]
  %626 = icmp sgt i32 %free.2.i15.i, %j.029.i     ; <i1> [#uses=1]
  br i1 %626, label %bb9.i20.i, label %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IPdEEdEEviT_iT0_.exit21.i

bb9.i20.i:                                        ; preds = %bb8.i19.i
  %627 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %i.2.i18.i ; <double*> [#uses=1]
  %628 = load double* %627, align 8               ; <double> [#uses=2]
  %629 = fcmp uge double %628, %606               ; <i1> [#uses=1]
  br i1 %629, label %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IPdEEdEEviT_iT0_.exit21.i, label %bb7.i14.i

_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IPdEEdEEviT_iT0_.exit21.i: ; preds = %bb9.i20.i, %bb8.i19.i
  %630 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.2.i15.i ; <double*> [#uses=1]
  store double %606, double* %630, align 8
  %631 = icmp slt i32 %j.0.i78, 0                 ; <i1> [#uses=1]
  %indvar.next36.i = add i32 %indvar35.i, 1       ; <i32> [#uses=1]
  br i1 %631, label %bb4.i82, label %bb.i80

bb4.i82:                                          ; preds = %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IPdEEdEEviT_iT0_.exit.i, %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IPdEEdEEviT_iT0_.exit21.i
  %indvar.i81 = phi i32 [ %indvar.next.i99, %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IPdEEdEEviT_iT0_.exit.i ], [ 0, %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IPdEEdEEviT_iT0_.exit21.i ] ; <i32> [#uses=2]
  %j.125.i = sub i32 1999, %indvar.i81            ; <i32> [#uses=4]
  %scevgep33.i = getelementptr [2000 x double]* @data, i32 0, i32 %j.125.i ; <double*> [#uses=2]
  %632 = load double* %scevgep33.i, align 8       ; <double> [#uses=2]
  %633 = load double* getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0), align 32 ; <double> [#uses=1]
  store double %633, double* %scevgep33.i, align 8
  %634 = icmp sgt i32 %j.125.i, 2                 ; <i1> [#uses=1]
  br i1 %634, label %bb.i.i87, label %bb4.i.i90

bb.i.i87:                                         ; preds = %bb.i.i87, %bb4.i82
  %i.14.i.i83 = phi i32 [ %phitmp.i.i86, %bb.i.i87 ], [ 2, %bb4.i82 ] ; <i32> [#uses=3]
  %free.01.i.i84 = phi i32 [ %643, %bb.i.i87 ], [ 0, %bb4.i82 ] ; <i32> [#uses=1]
  %635 = add i32 %i.14.i.i83, -1                  ; <i32> [#uses=1]
  %636 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %635 ; <double*> [#uses=1]
  %637 = load double* %636, align 8               ; <double> [#uses=1]
  %638 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %i.14.i.i83 ; <double*> [#uses=1]
  %639 = load double* %638, align 16              ; <double> [#uses=1]
  %640 = fcmp olt double %637, %639               ; <i1> [#uses=1]
  %641 = zext i1 %640 to i32                      ; <i32> [#uses=1]
  %i.0.i.i85 = or i32 %641, %i.14.i.i83           ; <i32> [#uses=2]
  %642 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.01.i.i84 ; <double*> [#uses=1]
  %643 = add i32 %i.0.i.i85, -1                   ; <i32> [#uses=3]
  %644 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %643 ; <double*> [#uses=1]
  %645 = load double* %644, align 8               ; <double> [#uses=1]
  store double %645, double* %642, align 8
  %phitmp.i.i86 = shl i32 %i.0.i.i85, 1           ; <i32> [#uses=3]
  %646 = icmp slt i32 %phitmp.i.i86, %j.125.i     ; <i1> [#uses=1]
  br i1 %646, label %bb.i.i87, label %bb4.i.i90

bb4.i.i90:                                        ; preds = %bb.i.i87, %bb4.i82
  %i.1.lcssa.i.i88 = phi i32 [ 2, %bb4.i82 ], [ %phitmp.i.i86, %bb.i.i87 ] ; <i32> [#uses=2]
  %free.0.lcssa.i.i89 = phi i32 [ 0, %bb4.i82 ], [ %643, %bb.i.i87 ] ; <i32> [#uses=3]
  %647 = icmp eq i32 %i.1.lcssa.i.i88, %j.125.i   ; <i1> [#uses=1]
  br i1 %647, label %bb5.i.i91, label %bb8.i.i97

bb5.i.i91:                                        ; preds = %bb4.i.i90
  %648 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.0.lcssa.i.i89 ; <double*> [#uses=1]
  %649 = add i32 %i.1.lcssa.i.i88, -1             ; <i32> [#uses=3]
  %650 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %649 ; <double*> [#uses=1]
  %651 = load double* %650, align 8               ; <double> [#uses=1]
  store double %651, double* %648, align 8
  br label %bb8.i.i97

bb7.i.i92:                                        ; preds = %bb9.i.i98
  %652 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.2.i.i93 ; <double*> [#uses=1]
  store double %655, double* %652, align 8
  br label %bb8.i.i97

bb8.i.i97:                                        ; preds = %bb7.i.i92, %bb5.i.i91, %bb4.i.i90
  %free.2.i.i93 = phi i32 [ %i.2.i.i96, %bb7.i.i92 ], [ %649, %bb5.i.i91 ], [ %free.0.lcssa.i.i89, %bb4.i.i90 ] ; <i32> [#uses=3]
  %i.2.in.in.i.i94 = phi i32 [ %i.2.i.i96, %bb7.i.i92 ], [ %649, %bb5.i.i91 ], [ %free.0.lcssa.i.i89, %bb4.i.i90 ] ; <i32> [#uses=1]
  %i.2.in.i.i95 = add i32 %i.2.in.in.i.i94, -1    ; <i32> [#uses=1]
  %i.2.i.i96 = sdiv i32 %i.2.in.i.i95, 2          ; <i32> [#uses=3]
  %653 = icmp sgt i32 %free.2.i.i93, 0            ; <i1> [#uses=1]
  br i1 %653, label %bb9.i.i98, label %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IPdEEdEEviT_iT0_.exit.i

bb9.i.i98:                                        ; preds = %bb8.i.i97
  %654 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %i.2.i.i96 ; <double*> [#uses=1]
  %655 = load double* %654, align 8               ; <double> [#uses=2]
  %656 = fcmp uge double %655, %632               ; <i1> [#uses=1]
  br i1 %656, label %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IPdEEdEEviT_iT0_.exit.i, label %bb7.i.i92

_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IPdEEdEEviT_iT0_.exit.i: ; preds = %bb9.i.i98, %bb8.i.i97
  %657 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.2.i.i93 ; <double*> [#uses=1]
  store double %632, double* %657, align 8
  %indvar.next.i99 = add i32 %indvar.i81, 1       ; <i32> [#uses=2]
  %exitcond.i100 = icmp eq i32 %indvar.next.i99, 1999 ; <i1> [#uses=1]
  br i1 %exitcond.i100, label %bb3.i.i.i50, label %bb4.i82

bb.i.i.i46:                                       ; preds = %bb3.i.i.i50
  %prev.1.0.0.i.i.i = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i.i47 ; <double*> [#uses=1]
  %658 = load double* %scevgep.i.i49, align 8     ; <double> [#uses=1]
  %659 = load double* %prev.1.0.0.i.i.i, align 8  ; <double> [#uses=1]
  %660 = fcmp olt double %658, %659               ; <i1> [#uses=1]
  br i1 %660, label %bb.i.i51, label %bb3.i.i.i50

bb3.i.i.i50:                                      ; preds = %bb.i.i.i46, %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IPdEEdEEviT_iT0_.exit.i
  %indvar.i.i.i47 = phi i32 [ %tmp644, %bb.i.i.i46 ], [ 0, %_ZN9benchmark7sift_inISt16reverse_iteratorIS1_IPdEEdEEviT_iT0_.exit.i ] ; <i32> [#uses=2]
  %tmp644 = add i32 %indvar.i.i.i47, 1            ; <i32> [#uses=2]
  %scevgep.i.i49 = getelementptr [2000 x double]* @data, i32 0, i32 %tmp644 ; <double*> [#uses=2]
  %661 = icmp eq double* %scevgep.i.i49, getelementptr ([2000 x double]* @data, i32 1, i32 0) ; <i1> [#uses=1]
  br i1 %661, label %_Z13verify_sortedISt16reverse_iteratorIS0_IPdEEEvT_S4_.exit.i, label %bb.i.i.i46

bb.i.i51:                                         ; preds = %bb.i.i.i46
  %662 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIS0_IPdEEEvT_S4_.exit.i

_Z13verify_sortedISt16reverse_iteratorIS0_IPdEEEvT_S4_.exit.i: ; preds = %bb.i.i51, %bb3.i.i.i50
  %663 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %664 = icmp slt i32 %tmp10.i39, %663            ; <i1> [#uses=1]
  br i1 %664, label %bb.i40, label %invcont116

invcont116:                                       ; preds = %_Z13verify_sortedISt16reverse_iteratorIS0_IPdEEEvT_S4_.exit.i, %invcont115
  %665 = phi i32 [ %602, %invcont115 ], [ %663, %_Z13verify_sortedISt16reverse_iteratorIS0_IPdEEEvT_S4_.exit.i ] ; <i32> [#uses=2]
  %666 = icmp sgt i32 %665, 0                     ; <i1> [#uses=1]
  br i1 %666, label %bb.nph.i16, label %invcont117

bb.nph.i16:                                       ; preds = %invcont116
  %667 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %14, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=2]
  %668 = icmp eq double* %.pre754, %168           ; <i1> [#uses=1]
  br i1 %668, label %bb.i19.us, label %bb.i19

bb.i19.us:                                        ; preds = %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i34.us, %bb.nph.i16
  %i.05.i17.us = phi i32 [ %tmp10.i18.us, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i34.us ], [ 0, %bb.nph.i16 ] ; <i32> [#uses=1]
  %tmp10.i18.us = add i32 %i.05.i17.us, 1         ; <i32> [#uses=2]
  store double* %50, double** %667, align 4
  call fastcc void @_ZN9benchmark8heapsortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_(%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %14, double* %51) nounwind
  br label %bb3.i.i.i32.us

_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i34.us: ; preds = %bb3.i.i.i32.us, %bb.i.i33.us
  %669 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %670 = icmp slt i32 %tmp10.i18.us, %669         ; <i1> [#uses=1]
  br i1 %670, label %bb.i19.us, label %invcont117

bb.i.i33.us:                                      ; preds = %bb.i.i.i28.us
  %671 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i34.us

bb.i.i.i28.us:                                    ; preds = %bb3.i.i.i32.us
  %prev.1.0.0.0.i.i.i27.us = getelementptr double* %50, i32 %indvar.i.i.i29.us ; <double*> [#uses=1]
  %672 = load double* %scevgep.i.i31.us, align 8  ; <double> [#uses=1]
  %673 = load double* %prev.1.0.0.0.i.i.i27.us, align 8 ; <double> [#uses=1]
  %674 = fcmp olt double %672, %673               ; <i1> [#uses=1]
  br i1 %674, label %bb.i.i33.us, label %bb3.i.i.i32.us

bb3.i.i.i32.us:                                   ; preds = %bb.i.i.i28.us, %bb.i19.us
  %indvar.i.i.i29.us = phi i32 [ 0, %bb.i19.us ], [ %tmp623, %bb.i.i.i28.us ] ; <i32> [#uses=2]
  %tmp623 = add i32 %indvar.i.i.i29.us, 1         ; <i32> [#uses=2]
  %scevgep.i.i31.us = getelementptr double* %50, i32 %tmp623 ; <double*> [#uses=2]
  %675 = icmp eq double* %scevgep.i.i31.us, %51   ; <i1> [#uses=1]
  br i1 %675, label %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i34.us, label %bb.i.i.i28.us

bb.i19:                                           ; preds = %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i34, %bb.nph.i16
  %i.05.i17 = phi i32 [ %tmp10.i18, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i34 ], [ 0, %bb.nph.i16 ] ; <i32> [#uses=1]
  %tmp10.i18 = add i32 %i.05.i17, 1               ; <i32> [#uses=2]
  br label %bb.i1.i25

bb.i1.i25:                                        ; preds = %bb.i1.i25, %bb.i19
  %indvar.i20 = phi i32 [ 0, %bb.i19 ], [ %tmp640, %bb.i1.i25 ] ; <i32> [#uses=3]
  %tmp640 = add i32 %indvar.i20, 1                ; <i32> [#uses=2]
  %scevgep6.i24 = getelementptr double* %.pre754, i32 %tmp640 ; <double*> [#uses=1]
  %scevgep.i22 = getelementptr double* %.pre754, i32 %indvar.i20 ; <double*> [#uses=1]
  %.1.0.0.0.i21 = getelementptr double* %50, i32 %indvar.i20 ; <double*> [#uses=1]
  %676 = load double* %scevgep.i22, align 8       ; <double> [#uses=1]
  store double %676, double* %.1.0.0.0.i21, align 8
  %677 = icmp eq double* %scevgep6.i24, %168      ; <i1> [#uses=1]
  br i1 %677, label %_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit.i26, label %bb.i1.i25

_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit.i26: ; preds = %bb.i1.i25
  store double* %50, double** %667, align 4
  call fastcc void @_ZN9benchmark8heapsortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_(%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %14, double* %51) nounwind
  br label %bb3.i.i.i32

bb.i.i.i28:                                       ; preds = %bb3.i.i.i32
  %prev.1.0.0.0.i.i.i27 = getelementptr double* %50, i32 %indvar.i.i.i29 ; <double*> [#uses=1]
  %678 = load double* %scevgep.i.i31, align 8     ; <double> [#uses=1]
  %679 = load double* %prev.1.0.0.0.i.i.i27, align 8 ; <double> [#uses=1]
  %680 = fcmp olt double %678, %679               ; <i1> [#uses=1]
  br i1 %680, label %bb.i.i33, label %bb3.i.i.i32

bb3.i.i.i32:                                      ; preds = %bb.i.i.i28, %_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit.i26
  %indvar.i.i.i29 = phi i32 [ 0, %_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit.i26 ], [ %tmp641, %bb.i.i.i28 ] ; <i32> [#uses=2]
  %tmp641 = add i32 %indvar.i.i.i29, 1            ; <i32> [#uses=2]
  %scevgep.i.i31 = getelementptr double* %50, i32 %tmp641 ; <double*> [#uses=2]
  %681 = icmp eq double* %scevgep.i.i31, %51      ; <i1> [#uses=1]
  br i1 %681, label %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i34, label %bb.i.i.i28

bb.i.i33:                                         ; preds = %bb.i.i.i28
  %682 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i34

_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i34: ; preds = %bb.i.i33, %bb3.i.i.i32
  %683 = load i32* @iterations, align 4           ; <i32> [#uses=2]
  %684 = icmp slt i32 %tmp10.i18, %683            ; <i1> [#uses=1]
  br i1 %684, label %bb.i19, label %invcont117

invcont117:                                       ; preds = %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i34, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i34.us, %invcont116
  %685 = phi i32 [ %665, %invcont116 ], [ %669, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i34.us ], [ %683, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i34 ] ; <i32> [#uses=1]
  %686 = icmp sgt i32 %685, 0                     ; <i1> [#uses=1]
  br i1 %686, label %bb.nph.i, label %invcont118

bb.nph.i:                                         ; preds = %invcont117
  %687 = getelementptr inbounds %"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* %15, i32 0, i32 1, i32 0, i32 0 ; <double**> [#uses=2]
  %688 = icmp eq double* %.pre754, %168           ; <i1> [#uses=1]
  br i1 %688, label %bb.i10.us, label %bb.i10

bb.i10.us:                                        ; preds = %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i.us, %bb.nph.i
  %i.05.i.us = phi i32 [ %tmp10.i.us, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i.us ], [ 0, %bb.nph.i ] ; <i32> [#uses=1]
  %tmp10.i.us = add i32 %i.05.i.us, 1             ; <i32> [#uses=2]
  store double* %50, double** %687, align 4
  call fastcc void @_ZN9benchmark8heapsortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_(%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %15, double* %51) nounwind
  br label %bb3.i.i.i.us

_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i.us: ; preds = %bb3.i.i.i.us, %bb.i.i.us
  %689 = load i32* @iterations, align 4           ; <i32> [#uses=1]
  %690 = icmp slt i32 %tmp10.i.us, %689           ; <i1> [#uses=1]
  br i1 %690, label %bb.i10.us, label %invcont118

bb.i.i.us:                                        ; preds = %bb.i.i.i14.us
  %691 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i.us

bb.i.i.i14.us:                                    ; preds = %bb3.i.i.i.us
  %prev.1.0.0.0.i.i.i.us = getelementptr double* %50, i32 %indvar.i.i.i.us ; <double*> [#uses=1]
  %692 = load double* %scevgep.i.i.us, align 8    ; <double> [#uses=1]
  %693 = load double* %prev.1.0.0.0.i.i.i.us, align 8 ; <double> [#uses=1]
  %694 = fcmp olt double %692, %693               ; <i1> [#uses=1]
  br i1 %694, label %bb.i.i.us, label %bb3.i.i.i.us

bb3.i.i.i.us:                                     ; preds = %bb.i.i.i14.us, %bb.i10.us
  %indvar.i.i.i.us = phi i32 [ 0, %bb.i10.us ], [ %tmp625, %bb.i.i.i14.us ] ; <i32> [#uses=2]
  %tmp625 = add i32 %indvar.i.i.i.us, 1           ; <i32> [#uses=2]
  %scevgep.i.i.us = getelementptr double* %50, i32 %tmp625 ; <double*> [#uses=2]
  %695 = icmp eq double* %scevgep.i.i.us, %51     ; <i1> [#uses=1]
  br i1 %695, label %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i.us, label %bb.i.i.i14.us

bb.i10:                                           ; preds = %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i, %bb.nph.i
  %i.05.i = phi i32 [ %tmp10.i, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i ], [ 0, %bb.nph.i ] ; <i32> [#uses=1]
  %tmp10.i = add i32 %i.05.i, 1                   ; <i32> [#uses=2]
  br label %bb.i1.i

bb.i1.i:                                          ; preds = %bb.i1.i, %bb.i10
  %indvar.i11 = phi i32 [ 0, %bb.i10 ], [ %tmp637, %bb.i1.i ] ; <i32> [#uses=3]
  %tmp637 = add i32 %indvar.i11, 1                ; <i32> [#uses=2]
  %scevgep6.i = getelementptr double* %.pre754, i32 %tmp637 ; <double*> [#uses=1]
  %scevgep.i12 = getelementptr double* %.pre754, i32 %indvar.i11 ; <double*> [#uses=1]
  %.1.0.0.0.i = getelementptr double* %50, i32 %indvar.i11 ; <double*> [#uses=1]
  %696 = load double* %scevgep.i12, align 8       ; <double> [#uses=1]
  store double %696, double* %.1.0.0.0.i, align 8
  %697 = icmp eq double* %scevgep6.i, %168        ; <i1> [#uses=1]
  br i1 %697, label %_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit.i, label %bb.i1.i

_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit.i: ; preds = %bb.i1.i
  store double* %50, double** %687, align 4
  call fastcc void @_ZN9benchmark8heapsortISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEdEEvT_SB_(%"struct.std::reverse_iterator<std::reverse_iterator<__gnu_cxx::__normal_iterator<double*, std::vector<double, std::allocator<double> > > > >"* noalias %15, double* %51) nounwind
  br label %bb3.i.i.i

bb.i.i.i14:                                       ; preds = %bb3.i.i.i
  %prev.1.0.0.0.i.i.i = getelementptr double* %50, i32 %indvar.i.i.i ; <double*> [#uses=1]
  %698 = load double* %scevgep.i.i, align 8       ; <double> [#uses=1]
  %699 = load double* %prev.1.0.0.0.i.i.i, align 8 ; <double> [#uses=1]
  %700 = fcmp olt double %698, %699               ; <i1> [#uses=1]
  br i1 %700, label %bb.i.i, label %bb3.i.i.i

bb3.i.i.i:                                        ; preds = %bb.i.i.i14, %_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit.i
  %indvar.i.i.i = phi i32 [ 0, %_ZN9benchmark4copyISt16reverse_iteratorIS1_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEESA_EEvT_SB_T0_.exit.i ], [ %tmp638, %bb.i.i.i14 ] ; <i32> [#uses=2]
  %tmp638 = add i32 %indvar.i.i.i, 1              ; <i32> [#uses=2]
  %scevgep.i.i = getelementptr double* %50, i32 %tmp638 ; <double*> [#uses=2]
  %701 = icmp eq double* %scevgep.i.i, %51        ; <i1> [#uses=1]
  br i1 %701, label %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i, label %bb.i.i.i14

bb.i.i:                                           ; preds = %bb.i.i.i14
  %702 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i

_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i: ; preds = %bb.i.i, %bb3.i.i.i
  %703 = load i32* @iterations, align 4           ; <i32> [#uses=1]
  %704 = icmp slt i32 %tmp10.i, %703              ; <i1> [#uses=1]
  br i1 %704, label %bb.i10, label %invcont118

invcont118:                                       ; preds = %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i, %_Z13verify_sortedISt16reverse_iteratorIS0_IN9__gnu_cxx17__normal_iteratorIPdSt6vectorIdSaIdEEEEEEEvT_SA_.exit.i.us, %invcont117
  %705 = load double** %159, align 8              ; <double*> [#uses=2]
  %706 = icmp eq double* %705, null               ; <i1> [#uses=1]
  br i1 %706, label %bb128, label %bb.i.i.i7

bb.i.i.i7:                                        ; preds = %invcont118
  %707 = bitcast double* %705 to i8*              ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %707) nounwind
  br label %bb128

invcont126:                                       ; preds = %bb.i.i.i, %ppad
  call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0)
  unreachable

bb128:                                            ; preds = %bb.i.i.i7, %invcont118
  %708 = load double** %43, align 8               ; <double*> [#uses=2]
  %709 = icmp eq double* %708, null               ; <i1> [#uses=1]
  br i1 %709, label %_ZNSt6vectorIdSaIdEED1Ev.exit6, label %bb.i.i.i4

bb.i.i.i4:                                        ; preds = %bb128
  %710 = bitcast double* %708 to i8*              ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %710) nounwind
  ret i32 0

_ZNSt6vectorIdSaIdEED1Ev.exit6:                   ; preds = %bb128
  ret i32 0

lpad:                                             ; preds = %_ZN9benchmark4fillIPddEEvT_S2_T0_.exit
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=2]
  %eh_select131 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  br label %ppad

lpad132:                                          ; preds = %invcont33
  %eh_ptr133 = call i8* @llvm.eh.exception()      ; <i8*> [#uses=3]
  %eh_select135 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr133, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %711 = load double** %159, align 8              ; <double*> [#uses=2]
  %712 = icmp eq double* %711, null               ; <i1> [#uses=1]
  br i1 %712, label %ppad, label %bb.i.i.i1

bb.i.i.i1:                                        ; preds = %lpad132
  %713 = bitcast double* %711 to i8*              ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %713) nounwind
  br label %ppad

ppad:                                             ; preds = %bb.i.i.i1, %lpad132, %lpad
  %eh_exception.0 = phi i8* [ %eh_ptr, %lpad ], [ %eh_ptr133, %bb.i.i.i1 ], [ %eh_ptr133, %lpad132 ] ; <i8*> [#uses=1]
  %714 = load double** %43, align 8               ; <double*> [#uses=2]
  %715 = icmp eq double* %714, null               ; <i1> [#uses=1]
  br i1 %715, label %invcont126, label %bb.i.i.i

bb.i.i.i:                                         ; preds = %ppad
  %716 = bitcast double* %714 to i8*              ; <i8*> [#uses=1]
  call void @_ZdlPv(i8* %716) nounwind
  br label %invcont126
}

declare i32 @atoi(i8* nocapture) nounwind readonly

declare double @atof(i8* nocapture) nounwind readonly

declare void @srand(i32) nounwind

declare extern_weak i32 @pthread_once(i32*, void ()*)

declare extern_weak i8* @pthread_getspecific(i32)

declare extern_weak i32 @pthread_setspecific(i32, i8*)

declare extern_weak i32 @pthread_create(i32*, %struct.pthread_attr_t*, i8* (i8*)*, i8*)

declare extern_weak i32 @pthread_cancel(i32)

declare extern_weak i32 @pthread_mutex_lock(%struct.pthread_mutex_t*)

declare extern_weak i32 @pthread_mutex_trylock(%struct.pthread_mutex_t*)

declare extern_weak i32 @pthread_mutex_unlock(%struct.pthread_mutex_t*)

declare extern_weak i32 @pthread_mutex_init(%struct.pthread_mutex_t*, %struct..0._49*)

declare extern_weak i32 @pthread_key_create(i32*, void (i8*)*)

declare extern_weak i32 @pthread_key_delete(i32)

declare extern_weak i32 @pthread_mutexattr_init(%struct..0._49*)

declare extern_weak i32 @pthread_mutexattr_settype(%struct..0._49*, i32)

declare extern_weak i32 @pthread_mutexattr_destroy(%struct..0._49*)
