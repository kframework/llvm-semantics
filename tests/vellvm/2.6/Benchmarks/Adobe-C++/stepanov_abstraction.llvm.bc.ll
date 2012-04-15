; ModuleID = 'stepanov_abstraction.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%0 = type { i32, void ()* }
%struct.FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct.FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%"struct.PointerWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > > >" = type { %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* }
%"struct.PointerWrapper<ValueWrapper<double> >" = type { %"struct.ValueWrapper<double>"* }
%"struct.PointerWrapper<double>" = type { double* }
%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >" = type { %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > >" }
%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > >" = type { %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > >" }
%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > >" = type { %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > >" }
%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > >" = type { %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > >" }
%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > >" = type { %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > >" }
%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > >" = type { %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > >" }
%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > >" = type { %"struct.ValueWrapper<ValueWrapper<ValueWrapper<double> > >" }
%"struct.ValueWrapper<ValueWrapper<ValueWrapper<double> > >" = type { %"struct.ValueWrapper<ValueWrapper<double> >" }
%"struct.ValueWrapper<ValueWrapper<double> >" = type { %"struct.ValueWrapper<double>" }
%"struct.ValueWrapper<double>" = type { double }
%struct._IO_marker = type { %struct._IO_marker*, %struct.FILE*, i32 }
%struct.one_result = type { double, i8* }

@VData = internal global [2000 x %"struct.ValueWrapper<double>"] zeroinitializer, align 32 ; <[2000 x %"struct.ValueWrapper<double>"]*> [#uses=73]
@V10Data = internal global [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"] zeroinitializer, align 32 ; <[2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]*> [#uses=73]
@VDataMaster = internal global [2000 x %"struct.ValueWrapper<double>"] zeroinitializer, align 32 ; <[2000 x %"struct.ValueWrapper<double>"]*> [#uses=7]
@V10DataMaster = internal global [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"] zeroinitializer, align 32 ; <[2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]*> [#uses=7]
@data = internal global [2000 x double] zeroinitializer, align 32 ; <[2000 x double]*> [#uses=70]
@dataMaster = internal global [2000 x double] zeroinitializer, align 32 ; <[2000 x double]*> [#uses=9]
@.str = private constant [16 x i8] c"test %i failed\0A\00", align 1 ; <[16 x i8]*> [#uses=1]
@.str1 = private constant [21 x i8] c"sort test %i failed\0A\00", align 1 ; <[21 x i8]*> [#uses=1]
@llvm.global_ctors = appending global [0 x %0] zeroinitializer ; <[0 x %0]*> [#uses=0]

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

define internal fastcc void @_ZN9benchmark9quicksortIP12ValueWrapperIdES2_EEvT_S4_(%"struct.ValueWrapper<double>"* %begin, %"struct.ValueWrapper<double>"* %end) nounwind {
entry:
  %0 = ptrtoint %"struct.ValueWrapper<double>"* %end to i32 ; <i32> [#uses=2]
  br label %tailrecurse

tailrecurse:                                      ; preds = %bb8.i, %entry
  %begin.tr = phi %"struct.ValueWrapper<double>"* [ %begin, %entry ], [ %right.0.i, %bb8.i ] ; <%"struct.ValueWrapper<double>"*> [#uses=4]
  %1 = ptrtoint %"struct.ValueWrapper<double>"* %begin.tr to i32 ; <i32> [#uses=1]
  %2 = sub i32 %0, %1                             ; <i32> [#uses=1]
  %3 = icmp sgt i32 %2, 15                        ; <i1> [#uses=1]
  br i1 %3, label %bb, label %return

bb:                                               ; preds = %tailrecurse
  %4 = getelementptr inbounds %"struct.ValueWrapper<double>"* %begin.tr, i32 0, i32 0 ; <double*> [#uses=1]
  %5 = load double* %4, align 4                   ; <double> [#uses=3]
  br label %bb1.outer

bb1.outer:                                        ; preds = %bb7, %bb
  %right.0.ph = phi %"struct.ValueWrapper<double>"* [ %end, %bb ], [ %scevgep15, %bb7 ] ; <%"struct.ValueWrapper<double>"*> [#uses=4]
  %left.1.ph = phi %"struct.ValueWrapper<double>"* [ %begin.tr, %bb ], [ %left.0.lcssa, %bb7 ] ; <%"struct.ValueWrapper<double>"*> [#uses=5]
  br label %bb1

bb1:                                              ; preds = %bb1, %bb1.outer
  %indvar10 = phi i32 [ 0, %bb1.outer ], [ %indvar.next11, %bb1 ] ; <i32> [#uses=3]
  %tmp14 = xor i32 %indvar10, -1                  ; <i32> [#uses=2]
  %scevgep1516 = getelementptr inbounds %"struct.ValueWrapper<double>"* %right.0.ph, i32 %tmp14, i32 0 ; <double*> [#uses=2]
  %6 = load double* %scevgep1516, align 4         ; <double> [#uses=2]
  %7 = fcmp olt double %5, %6                     ; <i1> [#uses=1]
  %indvar.next11 = add i32 %indvar10, 1           ; <i32> [#uses=1]
  br i1 %7, label %bb1, label %bb2

bb2:                                              ; preds = %bb1
  %scevgep15 = getelementptr %"struct.ValueWrapper<double>"* %right.0.ph, i32 %tmp14 ; <%"struct.ValueWrapper<double>"*> [#uses=3]
  %8 = icmp ult %"struct.ValueWrapper<double>"* %left.1.ph, %scevgep15 ; <i1> [#uses=1]
  br i1 %8, label %bb4.preheader, label %bb8

bb4.preheader:                                    ; preds = %bb2
  %9 = getelementptr inbounds %"struct.ValueWrapper<double>"* %left.1.ph, i32 0, i32 0 ; <double*> [#uses=1]
  %10 = load double* %9, align 4                  ; <double> [#uses=1]
  %11 = fcmp olt double %10, %5                   ; <i1> [#uses=1]
  br i1 %11, label %bb3, label %bb6

bb3:                                              ; preds = %bb3, %bb4.preheader
  %indvar = phi i32 [ %tmp, %bb3 ], [ 0, %bb4.preheader ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=3]
  %scevgep8 = getelementptr inbounds %"struct.ValueWrapper<double>"* %left.1.ph, i32 %tmp, i32 0 ; <double*> [#uses=1]
  %12 = load double* %scevgep8, align 4           ; <double> [#uses=1]
  %13 = fcmp olt double %12, %5                   ; <i1> [#uses=1]
  br i1 %13, label %bb3, label %bb6.loopexit

bb6.loopexit:                                     ; preds = %bb3
  %scevgep = getelementptr %"struct.ValueWrapper<double>"* %left.1.ph, i32 %tmp ; <%"struct.ValueWrapper<double>"*> [#uses=1]
  br label %bb6

bb6:                                              ; preds = %bb6.loopexit, %bb4.preheader
  %left.0.lcssa = phi %"struct.ValueWrapper<double>"* [ %left.1.ph, %bb4.preheader ], [ %scevgep, %bb6.loopexit ] ; <%"struct.ValueWrapper<double>"*> [#uses=3]
  %14 = icmp ult %"struct.ValueWrapper<double>"* %left.0.lcssa, %scevgep15 ; <i1> [#uses=1]
  br i1 %14, label %bb7, label %bb8

bb7:                                              ; preds = %bb6
  %15 = getelementptr inbounds %"struct.ValueWrapper<double>"* %left.0.lcssa, i32 0, i32 0 ; <double*> [#uses=2]
  %16 = load double* %15, align 4                 ; <double> [#uses=1]
  store double %16, double* %scevgep1516, align 4
  store double %6, double* %15, align 4
  br label %bb1.outer

bb8:                                              ; preds = %bb6, %bb2
  %tmp12 = sub i32 0, %indvar10                   ; <i32> [#uses=2]
  %right.0 = getelementptr %"struct.ValueWrapper<double>"* %right.0.ph, i32 %tmp12 ; <%"struct.ValueWrapper<double>"*> [#uses=4]
  tail call fastcc void @_ZN9benchmark9quicksortIP12ValueWrapperIdES2_EEvT_S4_(%"struct.ValueWrapper<double>"* %begin.tr, %"struct.ValueWrapper<double>"* %right.0)
  %17 = ptrtoint %"struct.ValueWrapper<double>"* %right.0 to i32 ; <i32> [#uses=1]
  %18 = sub i32 %0, %17                           ; <i32> [#uses=1]
  %19 = icmp sgt i32 %18, 15                      ; <i1> [#uses=1]
  br i1 %19, label %bb.i, label %_ZN9benchmark9quicksortIP12ValueWrapperIdES2_EEvT_S4_.exit

bb.i:                                             ; preds = %bb8
  %20 = getelementptr inbounds %"struct.ValueWrapper<double>"* %right.0.ph, i32 %tmp12, i32 0 ; <double*> [#uses=1]
  %21 = load double* %20, align 4                 ; <double> [#uses=3]
  br label %bb1.i.outer

bb1.i.outer:                                      ; preds = %bb7.i, %bb.i
  %right.0.i.ph = phi %"struct.ValueWrapper<double>"* [ %end, %bb.i ], [ %scevgep29, %bb7.i ] ; <%"struct.ValueWrapper<double>"*> [#uses=3]
  %left.1.i.ph = phi %"struct.ValueWrapper<double>"* [ %right.0, %bb.i ], [ %left.0.i.lcssa, %bb7.i ] ; <%"struct.ValueWrapper<double>"*> [#uses=5]
  br label %bb1.i

bb1.i:                                            ; preds = %bb1.i, %bb1.i.outer
  %indvar24 = phi i32 [ 0, %bb1.i.outer ], [ %indvar.next25, %bb1.i ] ; <i32> [#uses=3]
  %tmp28 = xor i32 %indvar24, -1                  ; <i32> [#uses=2]
  %scevgep2930 = getelementptr inbounds %"struct.ValueWrapper<double>"* %right.0.i.ph, i32 %tmp28, i32 0 ; <double*> [#uses=2]
  %22 = load double* %scevgep2930, align 4        ; <double> [#uses=2]
  %23 = fcmp olt double %21, %22                  ; <i1> [#uses=1]
  %indvar.next25 = add i32 %indvar24, 1           ; <i32> [#uses=1]
  br i1 %23, label %bb1.i, label %bb2.i

bb2.i:                                            ; preds = %bb1.i
  %scevgep29 = getelementptr %"struct.ValueWrapper<double>"* %right.0.i.ph, i32 %tmp28 ; <%"struct.ValueWrapper<double>"*> [#uses=3]
  %24 = icmp ult %"struct.ValueWrapper<double>"* %left.1.i.ph, %scevgep29 ; <i1> [#uses=1]
  br i1 %24, label %bb4.i.preheader, label %bb8.i

bb4.i.preheader:                                  ; preds = %bb2.i
  %25 = getelementptr inbounds %"struct.ValueWrapper<double>"* %left.1.i.ph, i32 0, i32 0 ; <double*> [#uses=1]
  %26 = load double* %25, align 4                 ; <double> [#uses=1]
  %27 = fcmp olt double %26, %21                  ; <i1> [#uses=1]
  br i1 %27, label %bb3.i, label %bb6.i

bb3.i:                                            ; preds = %bb3.i, %bb4.i.preheader
  %indvar18 = phi i32 [ %tmp20, %bb3.i ], [ 0, %bb4.i.preheader ] ; <i32> [#uses=1]
  %tmp20 = add i32 %indvar18, 1                   ; <i32> [#uses=3]
  %scevgep2122 = getelementptr inbounds %"struct.ValueWrapper<double>"* %left.1.i.ph, i32 %tmp20, i32 0 ; <double*> [#uses=1]
  %28 = load double* %scevgep2122, align 4        ; <double> [#uses=1]
  %29 = fcmp olt double %28, %21                  ; <i1> [#uses=1]
  br i1 %29, label %bb3.i, label %bb6.i.loopexit

bb6.i.loopexit:                                   ; preds = %bb3.i
  %scevgep21 = getelementptr %"struct.ValueWrapper<double>"* %left.1.i.ph, i32 %tmp20 ; <%"struct.ValueWrapper<double>"*> [#uses=1]
  br label %bb6.i

bb6.i:                                            ; preds = %bb6.i.loopexit, %bb4.i.preheader
  %left.0.i.lcssa = phi %"struct.ValueWrapper<double>"* [ %left.1.i.ph, %bb4.i.preheader ], [ %scevgep21, %bb6.i.loopexit ] ; <%"struct.ValueWrapper<double>"*> [#uses=3]
  %30 = icmp ult %"struct.ValueWrapper<double>"* %left.0.i.lcssa, %scevgep29 ; <i1> [#uses=1]
  br i1 %30, label %bb7.i, label %bb8.i

bb7.i:                                            ; preds = %bb6.i
  %31 = getelementptr inbounds %"struct.ValueWrapper<double>"* %left.0.i.lcssa, i32 0, i32 0 ; <double*> [#uses=2]
  %32 = load double* %31, align 4                 ; <double> [#uses=1]
  store double %32, double* %scevgep2930, align 4
  store double %22, double* %31, align 4
  br label %bb1.i.outer

bb8.i:                                            ; preds = %bb6.i, %bb2.i
  %tmp26 = sub i32 0, %indvar24                   ; <i32> [#uses=1]
  %right.0.i = getelementptr %"struct.ValueWrapper<double>"* %right.0.i.ph, i32 %tmp26 ; <%"struct.ValueWrapper<double>"*> [#uses=2]
  tail call fastcc void @_ZN9benchmark9quicksortIP12ValueWrapperIdES2_EEvT_S4_(%"struct.ValueWrapper<double>"* %right.0, %"struct.ValueWrapper<double>"* %right.0.i) nounwind
  br label %tailrecurse

_ZN9benchmark9quicksortIP12ValueWrapperIdES2_EEvT_S4_.exit: ; preds = %bb8
  ret void

return:                                           ; preds = %tailrecurse
  ret void
}

define internal fastcc void @_ZN9benchmark9quicksortI14PointerWrapperIdEdEEvT_S3_(double* %begin.0, double* %end.0) nounwind {
entry:
  %0 = ptrtoint double* %end.0 to i32             ; <i32> [#uses=2]
  %1 = ptrtoint double* %begin.0 to i32           ; <i32> [#uses=1]
  %2 = sub i32 %0, %1                             ; <i32> [#uses=1]
  %3 = ashr i32 %2, 3                             ; <i32> [#uses=1]
  %4 = icmp sgt i32 %3, 1                         ; <i1> [#uses=1]
  br i1 %4, label %bb, label %return

bb:                                               ; preds = %_ZN9benchmark9quicksortI14PointerWrapperIdEdEEvT_S3_.exit, %entry
  %begin.0.tr4 = phi double* [ %right.0.0, %_ZN9benchmark9quicksortI14PointerWrapperIdEdEEvT_S3_.exit ], [ %begin.0, %entry ] ; <double*> [#uses=4]
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
  br i1 %19, label %bb.i, label %_ZN9benchmark9quicksortI14PointerWrapperIdEdEEvT_S3_.exit

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
  tail call fastcc void @_ZN9benchmark9quicksortI14PointerWrapperIdEdEEvT_S3_(double* %begin.0.tr4.i, double* %right.0.0.i) nounwind
  %30 = ptrtoint double* %right.0.0.i to i32      ; <i32> [#uses=1]
  %31 = sub i32 %15, %30                          ; <i32> [#uses=1]
  %32 = ashr i32 %31, 3                           ; <i32> [#uses=1]
  %33 = icmp sgt i32 %32, 1                       ; <i1> [#uses=1]
  br i1 %33, label %bb.i, label %_ZN9benchmark9quicksortI14PointerWrapperIdEdEEvT_S3_.exit

_ZN9benchmark9quicksortI14PointerWrapperIdEdEEvT_S3_.exit: ; preds = %bb15.i, %bb15
  %34 = sub i32 %0, %15                           ; <i32> [#uses=1]
  %35 = ashr i32 %34, 3                           ; <i32> [#uses=1]
  %36 = icmp sgt i32 %35, 1                       ; <i1> [#uses=1]
  br i1 %36, label %bb, label %return

return:                                           ; preds = %_ZN9benchmark9quicksortI14PointerWrapperIdEdEEvT_S3_.exit, %entry
  ret void
}

define internal fastcc void @_ZN9benchmark9quicksortI14PointerWrapperI12ValueWrapperIdEES3_EEvT_S5_(%"struct.ValueWrapper<double>"* %begin.0, %"struct.ValueWrapper<double>"* %end.0) nounwind {
entry:
  %0 = ptrtoint %"struct.ValueWrapper<double>"* %end.0 to i32 ; <i32> [#uses=2]
  %1 = ptrtoint %"struct.ValueWrapper<double>"* %begin.0 to i32 ; <i32> [#uses=1]
  %2 = sub i32 %0, %1                             ; <i32> [#uses=1]
  %3 = ashr i32 %2, 3                             ; <i32> [#uses=1]
  %4 = icmp sgt i32 %3, 1                         ; <i1> [#uses=1]
  br i1 %4, label %bb, label %return

bb:                                               ; preds = %_ZN9benchmark9quicksortI14PointerWrapperI12ValueWrapperIdEES3_EEvT_S5_.exit, %entry
  %begin.0.tr6 = phi %"struct.ValueWrapper<double>"* [ %right.0.0, %_ZN9benchmark9quicksortI14PointerWrapperI12ValueWrapperIdEES3_EEvT_S5_.exit ], [ %begin.0, %entry ] ; <%"struct.ValueWrapper<double>"*> [#uses=4]
  %5 = getelementptr inbounds %"struct.ValueWrapper<double>"* %begin.0.tr6, i32 0, i32 0 ; <double*> [#uses=1]
  %6 = load double* %5, align 4                   ; <double> [#uses=3]
  br label %bb1.outer

bb1.outer:                                        ; preds = %bb14, %bb
  %right.0.0.ph = phi %"struct.ValueWrapper<double>"* [ %end.0, %bb ], [ %scevgep15, %bb14 ] ; <%"struct.ValueWrapper<double>"*> [#uses=3]
  %left.0.1.ph = phi %"struct.ValueWrapper<double>"* [ %begin.0.tr6, %bb ], [ %left.0.0.lcssa, %bb14 ] ; <%"struct.ValueWrapper<double>"*> [#uses=5]
  br label %bb1

bb1:                                              ; preds = %bb1, %bb1.outer
  %indvar10 = phi i32 [ 0, %bb1.outer ], [ %indvar.next11, %bb1 ] ; <i32> [#uses=3]
  %tmp14 = xor i32 %indvar10, -1                  ; <i32> [#uses=2]
  %scevgep1516 = getelementptr inbounds %"struct.ValueWrapper<double>"* %right.0.0.ph, i32 %tmp14, i32 0 ; <double*> [#uses=2]
  %7 = load double* %scevgep1516, align 4         ; <double> [#uses=2]
  %8 = fcmp olt double %6, %7                     ; <i1> [#uses=1]
  %indvar.next11 = add i32 %indvar10, 1           ; <i32> [#uses=1]
  br i1 %8, label %bb1, label %bb3

bb3:                                              ; preds = %bb1
  %scevgep15 = getelementptr %"struct.ValueWrapper<double>"* %right.0.0.ph, i32 %tmp14 ; <%"struct.ValueWrapper<double>"*> [#uses=3]
  %9 = icmp ult %"struct.ValueWrapper<double>"* %left.0.1.ph, %scevgep15 ; <i1> [#uses=1]
  br i1 %9, label %bb8.preheader, label %bb15

bb8.preheader:                                    ; preds = %bb3
  %10 = getelementptr inbounds %"struct.ValueWrapper<double>"* %left.0.1.ph, i32 0, i32 0 ; <double*> [#uses=1]
  %11 = load double* %10, align 4                 ; <double> [#uses=1]
  %12 = fcmp olt double %11, %6                   ; <i1> [#uses=1]
  br i1 %12, label %bb7, label %bb10

bb7:                                              ; preds = %bb7, %bb8.preheader
  %indvar = phi i32 [ %tmp, %bb7 ], [ 0, %bb8.preheader ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=3]
  %scevgep8 = getelementptr inbounds %"struct.ValueWrapper<double>"* %left.0.1.ph, i32 %tmp, i32 0 ; <double*> [#uses=1]
  %13 = load double* %scevgep8, align 4           ; <double> [#uses=1]
  %14 = fcmp olt double %13, %6                   ; <i1> [#uses=1]
  br i1 %14, label %bb7, label %bb10.loopexit

bb10.loopexit:                                    ; preds = %bb7
  %scevgep = getelementptr %"struct.ValueWrapper<double>"* %left.0.1.ph, i32 %tmp ; <%"struct.ValueWrapper<double>"*> [#uses=1]
  br label %bb10

bb10:                                             ; preds = %bb10.loopexit, %bb8.preheader
  %left.0.0.lcssa = phi %"struct.ValueWrapper<double>"* [ %left.0.1.ph, %bb8.preheader ], [ %scevgep, %bb10.loopexit ] ; <%"struct.ValueWrapper<double>"*> [#uses=3]
  %15 = icmp ult %"struct.ValueWrapper<double>"* %left.0.0.lcssa, %scevgep15 ; <i1> [#uses=1]
  br i1 %15, label %bb14, label %bb15

bb14:                                             ; preds = %bb10
  %16 = getelementptr inbounds %"struct.ValueWrapper<double>"* %left.0.0.lcssa, i32 0, i32 0 ; <double*> [#uses=2]
  %17 = load double* %16, align 4                 ; <double> [#uses=1]
  store double %17, double* %scevgep1516, align 4
  store double %7, double* %16, align 4
  br label %bb1.outer

bb15:                                             ; preds = %bb10, %bb3
  %tmp12 = sub i32 0, %indvar10                   ; <i32> [#uses=1]
  %right.0.0 = getelementptr %"struct.ValueWrapper<double>"* %right.0.0.ph, i32 %tmp12 ; <%"struct.ValueWrapper<double>"*> [#uses=3]
  %18 = ptrtoint %"struct.ValueWrapper<double>"* %right.0.0 to i32 ; <i32> [#uses=3]
  %19 = ptrtoint %"struct.ValueWrapper<double>"* %begin.0.tr6 to i32 ; <i32> [#uses=1]
  %20 = sub i32 %18, %19                          ; <i32> [#uses=1]
  %21 = ashr i32 %20, 3                           ; <i32> [#uses=1]
  %22 = icmp sgt i32 %21, 1                       ; <i1> [#uses=1]
  br i1 %22, label %bb.i, label %_ZN9benchmark9quicksortI14PointerWrapperI12ValueWrapperIdEES3_EEvT_S5_.exit

bb.i:                                             ; preds = %bb15.i, %bb15
  %begin.0.tr6.i = phi %"struct.ValueWrapper<double>"* [ %right.0.0.i, %bb15.i ], [ %begin.0.tr6, %bb15 ] ; <%"struct.ValueWrapper<double>"*> [#uses=3]
  %23 = getelementptr inbounds %"struct.ValueWrapper<double>"* %begin.0.tr6.i, i32 0, i32 0 ; <double*> [#uses=1]
  %24 = load double* %23, align 4                 ; <double> [#uses=3]
  br label %bb1.outer.i

bb1.outer.i:                                      ; preds = %bb14.i, %bb.i
  %right.0.0.ph.i = phi %"struct.ValueWrapper<double>"* [ %right.0.0, %bb.i ], [ %scevgep15.i, %bb14.i ] ; <%"struct.ValueWrapper<double>"*> [#uses=3]
  %left.0.1.ph.i = phi %"struct.ValueWrapper<double>"* [ %begin.0.tr6.i, %bb.i ], [ %left.0.0.lcssa.i, %bb14.i ] ; <%"struct.ValueWrapper<double>"*> [#uses=5]
  br label %bb1.i

bb1.i:                                            ; preds = %bb1.i, %bb1.outer.i
  %indvar10.i = phi i32 [ 0, %bb1.outer.i ], [ %indvar.next11.i, %bb1.i ] ; <i32> [#uses=3]
  %tmp14.i = xor i32 %indvar10.i, -1              ; <i32> [#uses=2]
  %scevgep1516.i = getelementptr inbounds %"struct.ValueWrapper<double>"* %right.0.0.ph.i, i32 %tmp14.i, i32 0 ; <double*> [#uses=2]
  %25 = load double* %scevgep1516.i, align 4      ; <double> [#uses=2]
  %26 = fcmp olt double %24, %25                  ; <i1> [#uses=1]
  %indvar.next11.i = add i32 %indvar10.i, 1       ; <i32> [#uses=1]
  br i1 %26, label %bb1.i, label %bb3.i

bb3.i:                                            ; preds = %bb1.i
  %scevgep15.i = getelementptr %"struct.ValueWrapper<double>"* %right.0.0.ph.i, i32 %tmp14.i ; <%"struct.ValueWrapper<double>"*> [#uses=3]
  %27 = icmp ult %"struct.ValueWrapper<double>"* %left.0.1.ph.i, %scevgep15.i ; <i1> [#uses=1]
  br i1 %27, label %bb8.preheader.i, label %bb15.i

bb8.preheader.i:                                  ; preds = %bb3.i
  %28 = getelementptr inbounds %"struct.ValueWrapper<double>"* %left.0.1.ph.i, i32 0, i32 0 ; <double*> [#uses=1]
  %29 = load double* %28, align 4                 ; <double> [#uses=1]
  %30 = fcmp olt double %29, %24                  ; <i1> [#uses=1]
  br i1 %30, label %bb7.i, label %bb10.i

bb7.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %indvar.i = phi i32 [ %tmp.i, %bb7.i ], [ 0, %bb8.preheader.i ] ; <i32> [#uses=1]
  %tmp.i = add i32 %indvar.i, 1                   ; <i32> [#uses=3]
  %scevgep8.i = getelementptr inbounds %"struct.ValueWrapper<double>"* %left.0.1.ph.i, i32 %tmp.i, i32 0 ; <double*> [#uses=1]
  %31 = load double* %scevgep8.i, align 4         ; <double> [#uses=1]
  %32 = fcmp olt double %31, %24                  ; <i1> [#uses=1]
  br i1 %32, label %bb7.i, label %bb10.i.loopexit

bb10.i.loopexit:                                  ; preds = %bb7.i
  %scevgep.i = getelementptr %"struct.ValueWrapper<double>"* %left.0.1.ph.i, i32 %tmp.i ; <%"struct.ValueWrapper<double>"*> [#uses=1]
  br label %bb10.i

bb10.i:                                           ; preds = %bb10.i.loopexit, %bb8.preheader.i
  %left.0.0.lcssa.i = phi %"struct.ValueWrapper<double>"* [ %left.0.1.ph.i, %bb8.preheader.i ], [ %scevgep.i, %bb10.i.loopexit ] ; <%"struct.ValueWrapper<double>"*> [#uses=3]
  %33 = icmp ult %"struct.ValueWrapper<double>"* %left.0.0.lcssa.i, %scevgep15.i ; <i1> [#uses=1]
  br i1 %33, label %bb14.i, label %bb15.i

bb14.i:                                           ; preds = %bb10.i
  %34 = getelementptr inbounds %"struct.ValueWrapper<double>"* %left.0.0.lcssa.i, i32 0, i32 0 ; <double*> [#uses=2]
  %35 = load double* %34, align 4                 ; <double> [#uses=1]
  store double %35, double* %scevgep1516.i, align 4
  store double %25, double* %34, align 4
  br label %bb1.outer.i

bb15.i:                                           ; preds = %bb10.i, %bb3.i
  %tmp12.i = sub i32 0, %indvar10.i               ; <i32> [#uses=1]
  %right.0.0.i = getelementptr %"struct.ValueWrapper<double>"* %right.0.0.ph.i, i32 %tmp12.i ; <%"struct.ValueWrapper<double>"*> [#uses=3]
  tail call fastcc void @_ZN9benchmark9quicksortI14PointerWrapperI12ValueWrapperIdEES3_EEvT_S5_(%"struct.ValueWrapper<double>"* %begin.0.tr6.i, %"struct.ValueWrapper<double>"* %right.0.0.i) nounwind
  %36 = ptrtoint %"struct.ValueWrapper<double>"* %right.0.0.i to i32 ; <i32> [#uses=1]
  %37 = sub i32 %18, %36                          ; <i32> [#uses=1]
  %38 = ashr i32 %37, 3                           ; <i32> [#uses=1]
  %39 = icmp sgt i32 %38, 1                       ; <i1> [#uses=1]
  br i1 %39, label %bb.i, label %_ZN9benchmark9quicksortI14PointerWrapperI12ValueWrapperIdEES3_EEvT_S5_.exit

_ZN9benchmark9quicksortI14PointerWrapperI12ValueWrapperIdEES3_EEvT_S5_.exit: ; preds = %bb15.i, %bb15
  %40 = sub i32 %0, %18                           ; <i32> [#uses=1]
  %41 = ashr i32 %40, 3                           ; <i32> [#uses=1]
  %42 = icmp sgt i32 %41, 1                       ; <i1> [#uses=1]
  br i1 %42, label %bb, label %return

return:                                           ; preds = %_ZN9benchmark9quicksortI14PointerWrapperI12ValueWrapperIdEES3_EEvT_S5_.exit, %entry
  ret void
}

define internal fastcc void @_ZN9benchmark9quicksortIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEvT_SD_(%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %begin, %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %end) nounwind {
entry:
  %0 = ptrtoint %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %end to i32 ; <i32> [#uses=2]
  br label %tailrecurse

tailrecurse:                                      ; preds = %bb8.i, %entry
  %begin.tr = phi %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* [ %begin, %entry ], [ %right.0.i, %bb8.i ] ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=4]
  %1 = ptrtoint %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %begin.tr to i32 ; <i32> [#uses=1]
  %2 = sub i32 %0, %1                             ; <i32> [#uses=1]
  %3 = icmp sgt i32 %2, 15                        ; <i1> [#uses=1]
  br i1 %3, label %bb, label %return

bb:                                               ; preds = %tailrecurse
  %4 = getelementptr inbounds %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %begin.tr, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %5 = load double* %4, align 4                   ; <double> [#uses=3]
  br label %bb1.outer

bb1.outer:                                        ; preds = %bb7, %bb
  %right.0.ph = phi %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* [ %end, %bb ], [ %scevgep15, %bb7 ] ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=4]
  %left.1.ph = phi %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* [ %begin.tr, %bb ], [ %left.0.lcssa, %bb7 ] ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=5]
  br label %bb1

bb1:                                              ; preds = %bb1, %bb1.outer
  %indvar10 = phi i32 [ 0, %bb1.outer ], [ %indvar.next11, %bb1 ] ; <i32> [#uses=3]
  %tmp14 = xor i32 %indvar10, -1                  ; <i32> [#uses=2]
  %scevgep1516 = getelementptr inbounds %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %right.0.ph, i32 %tmp14, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=2]
  %6 = load double* %scevgep1516, align 4         ; <double> [#uses=2]
  %7 = fcmp olt double %5, %6                     ; <i1> [#uses=1]
  %indvar.next11 = add i32 %indvar10, 1           ; <i32> [#uses=1]
  br i1 %7, label %bb1, label %bb2

bb2:                                              ; preds = %bb1
  %scevgep15 = getelementptr %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %right.0.ph, i32 %tmp14 ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=3]
  %8 = icmp ult %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.1.ph, %scevgep15 ; <i1> [#uses=1]
  br i1 %8, label %bb4.preheader, label %bb8

bb4.preheader:                                    ; preds = %bb2
  %9 = getelementptr inbounds %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.1.ph, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %10 = load double* %9, align 4                  ; <double> [#uses=1]
  %11 = fcmp olt double %10, %5                   ; <i1> [#uses=1]
  br i1 %11, label %bb3, label %bb6

bb3:                                              ; preds = %bb3, %bb4.preheader
  %indvar = phi i32 [ %tmp, %bb3 ], [ 0, %bb4.preheader ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=3]
  %scevgep8 = getelementptr inbounds %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.1.ph, i32 %tmp, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %12 = load double* %scevgep8, align 4           ; <double> [#uses=1]
  %13 = fcmp olt double %12, %5                   ; <i1> [#uses=1]
  br i1 %13, label %bb3, label %bb6.loopexit

bb6.loopexit:                                     ; preds = %bb3
  %scevgep = getelementptr %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.1.ph, i32 %tmp ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=1]
  br label %bb6

bb6:                                              ; preds = %bb6.loopexit, %bb4.preheader
  %left.0.lcssa = phi %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* [ %left.1.ph, %bb4.preheader ], [ %scevgep, %bb6.loopexit ] ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=3]
  %14 = icmp ult %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.0.lcssa, %scevgep15 ; <i1> [#uses=1]
  br i1 %14, label %bb7, label %bb8

bb7:                                              ; preds = %bb6
  %15 = getelementptr inbounds %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.0.lcssa, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=2]
  %16 = load double* %15, align 4                 ; <double> [#uses=1]
  store double %16, double* %scevgep1516, align 4
  store double %6, double* %15, align 4
  br label %bb1.outer

bb8:                                              ; preds = %bb6, %bb2
  %tmp12 = sub i32 0, %indvar10                   ; <i32> [#uses=2]
  %right.0 = getelementptr %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %right.0.ph, i32 %tmp12 ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=4]
  tail call fastcc void @_ZN9benchmark9quicksortIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEvT_SD_(%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %begin.tr, %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %right.0)
  %17 = ptrtoint %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %right.0 to i32 ; <i32> [#uses=1]
  %18 = sub i32 %0, %17                           ; <i32> [#uses=1]
  %19 = icmp sgt i32 %18, 15                      ; <i1> [#uses=1]
  br i1 %19, label %bb.i, label %_ZN9benchmark9quicksortIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEvT_SD_.exit

bb.i:                                             ; preds = %bb8
  %20 = getelementptr inbounds %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %right.0.ph, i32 %tmp12, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %21 = load double* %20, align 4                 ; <double> [#uses=3]
  br label %bb1.i.outer

bb1.i.outer:                                      ; preds = %bb7.i, %bb.i
  %right.0.i.ph = phi %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* [ %end, %bb.i ], [ %scevgep29, %bb7.i ] ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=3]
  %left.1.i.ph = phi %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* [ %right.0, %bb.i ], [ %left.0.i.lcssa, %bb7.i ] ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=5]
  br label %bb1.i

bb1.i:                                            ; preds = %bb1.i, %bb1.i.outer
  %indvar24 = phi i32 [ 0, %bb1.i.outer ], [ %indvar.next25, %bb1.i ] ; <i32> [#uses=3]
  %tmp28 = xor i32 %indvar24, -1                  ; <i32> [#uses=2]
  %scevgep2930 = getelementptr inbounds %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %right.0.i.ph, i32 %tmp28, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=2]
  %22 = load double* %scevgep2930, align 4        ; <double> [#uses=2]
  %23 = fcmp olt double %21, %22                  ; <i1> [#uses=1]
  %indvar.next25 = add i32 %indvar24, 1           ; <i32> [#uses=1]
  br i1 %23, label %bb1.i, label %bb2.i

bb2.i:                                            ; preds = %bb1.i
  %scevgep29 = getelementptr %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %right.0.i.ph, i32 %tmp28 ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=3]
  %24 = icmp ult %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.1.i.ph, %scevgep29 ; <i1> [#uses=1]
  br i1 %24, label %bb4.i.preheader, label %bb8.i

bb4.i.preheader:                                  ; preds = %bb2.i
  %25 = getelementptr inbounds %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.1.i.ph, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %26 = load double* %25, align 4                 ; <double> [#uses=1]
  %27 = fcmp olt double %26, %21                  ; <i1> [#uses=1]
  br i1 %27, label %bb3.i, label %bb6.i

bb3.i:                                            ; preds = %bb3.i, %bb4.i.preheader
  %indvar18 = phi i32 [ %tmp20, %bb3.i ], [ 0, %bb4.i.preheader ] ; <i32> [#uses=1]
  %tmp20 = add i32 %indvar18, 1                   ; <i32> [#uses=3]
  %scevgep2122 = getelementptr inbounds %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.1.i.ph, i32 %tmp20, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %28 = load double* %scevgep2122, align 4        ; <double> [#uses=1]
  %29 = fcmp olt double %28, %21                  ; <i1> [#uses=1]
  br i1 %29, label %bb3.i, label %bb6.i.loopexit

bb6.i.loopexit:                                   ; preds = %bb3.i
  %scevgep21 = getelementptr %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.1.i.ph, i32 %tmp20 ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=1]
  br label %bb6.i

bb6.i:                                            ; preds = %bb6.i.loopexit, %bb4.i.preheader
  %left.0.i.lcssa = phi %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* [ %left.1.i.ph, %bb4.i.preheader ], [ %scevgep21, %bb6.i.loopexit ] ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=3]
  %30 = icmp ult %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.0.i.lcssa, %scevgep29 ; <i1> [#uses=1]
  br i1 %30, label %bb7.i, label %bb8.i

bb7.i:                                            ; preds = %bb6.i
  %31 = getelementptr inbounds %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.0.i.lcssa, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=2]
  %32 = load double* %31, align 4                 ; <double> [#uses=1]
  store double %32, double* %scevgep2930, align 4
  store double %22, double* %31, align 4
  br label %bb1.i.outer

bb8.i:                                            ; preds = %bb6.i, %bb2.i
  %tmp26 = sub i32 0, %indvar24                   ; <i32> [#uses=1]
  %right.0.i = getelementptr %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %right.0.i.ph, i32 %tmp26 ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=2]
  tail call fastcc void @_ZN9benchmark9quicksortIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEvT_SD_(%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %right.0, %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %right.0.i) nounwind
  br label %tailrecurse

_ZN9benchmark9quicksortIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEvT_SD_.exit: ; preds = %bb8
  ret void

return:                                           ; preds = %tailrecurse
  ret void
}

define internal fastcc void @_ZN9benchmark9quicksortI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEvT_SE_(%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %begin.0, %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %end.0) nounwind {
entry:
  %0 = ptrtoint %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %end.0 to i32 ; <i32> [#uses=2]
  %1 = ptrtoint %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %begin.0 to i32 ; <i32> [#uses=1]
  %2 = sub i32 %0, %1                             ; <i32> [#uses=1]
  %3 = ashr i32 %2, 3                             ; <i32> [#uses=1]
  %4 = icmp sgt i32 %3, 1                         ; <i1> [#uses=1]
  br i1 %4, label %bb, label %return

bb:                                               ; preds = %_ZN9benchmark9quicksortI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEvT_SE_.exit, %entry
  %begin.0.tr5 = phi %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* [ %right.0.0, %_ZN9benchmark9quicksortI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEvT_SE_.exit ], [ %begin.0, %entry ] ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=4]
  %5 = getelementptr inbounds %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %begin.0.tr5, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %6 = load double* %5, align 4                   ; <double> [#uses=3]
  br label %bb1.outer

bb1.outer:                                        ; preds = %bb14, %bb
  %right.0.0.ph = phi %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* [ %end.0, %bb ], [ %scevgep14, %bb14 ] ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=3]
  %left.0.1.ph = phi %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* [ %begin.0.tr5, %bb ], [ %left.0.0.lcssa, %bb14 ] ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=5]
  br label %bb1

bb1:                                              ; preds = %bb1, %bb1.outer
  %indvar9 = phi i32 [ 0, %bb1.outer ], [ %indvar.next10, %bb1 ] ; <i32> [#uses=3]
  %tmp13 = xor i32 %indvar9, -1                   ; <i32> [#uses=2]
  %scevgep1415 = getelementptr inbounds %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %right.0.0.ph, i32 %tmp13, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=2]
  %7 = load double* %scevgep1415, align 4         ; <double> [#uses=2]
  %8 = fcmp olt double %6, %7                     ; <i1> [#uses=1]
  %indvar.next10 = add i32 %indvar9, 1            ; <i32> [#uses=1]
  br i1 %8, label %bb1, label %bb3

bb3:                                              ; preds = %bb1
  %scevgep14 = getelementptr %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %right.0.0.ph, i32 %tmp13 ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=3]
  %9 = icmp ult %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.0.1.ph, %scevgep14 ; <i1> [#uses=1]
  br i1 %9, label %bb8.preheader, label %bb15

bb8.preheader:                                    ; preds = %bb3
  %10 = getelementptr inbounds %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.0.1.ph, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %11 = load double* %10, align 4                 ; <double> [#uses=1]
  %12 = fcmp olt double %11, %6                   ; <i1> [#uses=1]
  br i1 %12, label %bb7, label %bb10

bb7:                                              ; preds = %bb7, %bb8.preheader
  %indvar = phi i32 [ %tmp, %bb7 ], [ 0, %bb8.preheader ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=3]
  %scevgep7 = getelementptr inbounds %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.0.1.ph, i32 %tmp, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %13 = load double* %scevgep7, align 4           ; <double> [#uses=1]
  %14 = fcmp olt double %13, %6                   ; <i1> [#uses=1]
  br i1 %14, label %bb7, label %bb10.loopexit

bb10.loopexit:                                    ; preds = %bb7
  %scevgep = getelementptr %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.0.1.ph, i32 %tmp ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=1]
  br label %bb10

bb10:                                             ; preds = %bb10.loopexit, %bb8.preheader
  %left.0.0.lcssa = phi %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* [ %left.0.1.ph, %bb8.preheader ], [ %scevgep, %bb10.loopexit ] ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=3]
  %15 = icmp ult %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.0.0.lcssa, %scevgep14 ; <i1> [#uses=1]
  br i1 %15, label %bb14, label %bb15

bb14:                                             ; preds = %bb10
  %16 = getelementptr inbounds %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.0.0.lcssa, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=2]
  %17 = load double* %16, align 4                 ; <double> [#uses=1]
  store double %17, double* %scevgep1415, align 4
  store double %7, double* %16, align 4
  br label %bb1.outer

bb15:                                             ; preds = %bb10, %bb3
  %tmp11 = sub i32 0, %indvar9                    ; <i32> [#uses=1]
  %right.0.0 = getelementptr %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %right.0.0.ph, i32 %tmp11 ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=3]
  %18 = ptrtoint %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %right.0.0 to i32 ; <i32> [#uses=3]
  %19 = ptrtoint %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %begin.0.tr5 to i32 ; <i32> [#uses=1]
  %20 = sub i32 %18, %19                          ; <i32> [#uses=1]
  %21 = ashr i32 %20, 3                           ; <i32> [#uses=1]
  %22 = icmp sgt i32 %21, 1                       ; <i1> [#uses=1]
  br i1 %22, label %bb.i, label %_ZN9benchmark9quicksortI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEvT_SE_.exit

bb.i:                                             ; preds = %bb15.i, %bb15
  %begin.0.tr5.i = phi %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* [ %right.0.0.i, %bb15.i ], [ %begin.0.tr5, %bb15 ] ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=3]
  %23 = getelementptr inbounds %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %begin.0.tr5.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %24 = load double* %23, align 4                 ; <double> [#uses=3]
  br label %bb1.outer.i

bb1.outer.i:                                      ; preds = %bb14.i, %bb.i
  %right.0.0.ph.i = phi %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* [ %right.0.0, %bb.i ], [ %scevgep14.i, %bb14.i ] ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=3]
  %left.0.1.ph.i = phi %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* [ %begin.0.tr5.i, %bb.i ], [ %left.0.0.lcssa.i, %bb14.i ] ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=5]
  br label %bb1.i

bb1.i:                                            ; preds = %bb1.i, %bb1.outer.i
  %indvar9.i = phi i32 [ 0, %bb1.outer.i ], [ %indvar.next10.i, %bb1.i ] ; <i32> [#uses=3]
  %tmp13.i = xor i32 %indvar9.i, -1               ; <i32> [#uses=2]
  %scevgep1415.i = getelementptr inbounds %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %right.0.0.ph.i, i32 %tmp13.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=2]
  %25 = load double* %scevgep1415.i, align 4      ; <double> [#uses=2]
  %26 = fcmp olt double %24, %25                  ; <i1> [#uses=1]
  %indvar.next10.i = add i32 %indvar9.i, 1        ; <i32> [#uses=1]
  br i1 %26, label %bb1.i, label %bb3.i

bb3.i:                                            ; preds = %bb1.i
  %scevgep14.i = getelementptr %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %right.0.0.ph.i, i32 %tmp13.i ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=3]
  %27 = icmp ult %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.0.1.ph.i, %scevgep14.i ; <i1> [#uses=1]
  br i1 %27, label %bb8.preheader.i, label %bb15.i

bb8.preheader.i:                                  ; preds = %bb3.i
  %28 = getelementptr inbounds %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.0.1.ph.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %29 = load double* %28, align 4                 ; <double> [#uses=1]
  %30 = fcmp olt double %29, %24                  ; <i1> [#uses=1]
  br i1 %30, label %bb7.i, label %bb10.i

bb7.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %indvar.i = phi i32 [ %tmp.i, %bb7.i ], [ 0, %bb8.preheader.i ] ; <i32> [#uses=1]
  %tmp.i = add i32 %indvar.i, 1                   ; <i32> [#uses=3]
  %scevgep7.i = getelementptr inbounds %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.0.1.ph.i, i32 %tmp.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %31 = load double* %scevgep7.i, align 4         ; <double> [#uses=1]
  %32 = fcmp olt double %31, %24                  ; <i1> [#uses=1]
  br i1 %32, label %bb7.i, label %bb10.i.loopexit

bb10.i.loopexit:                                  ; preds = %bb7.i
  %scevgep.i = getelementptr %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.0.1.ph.i, i32 %tmp.i ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=1]
  br label %bb10.i

bb10.i:                                           ; preds = %bb10.i.loopexit, %bb8.preheader.i
  %left.0.0.lcssa.i = phi %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* [ %left.0.1.ph.i, %bb8.preheader.i ], [ %scevgep.i, %bb10.i.loopexit ] ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=3]
  %33 = icmp ult %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.0.0.lcssa.i, %scevgep14.i ; <i1> [#uses=1]
  br i1 %33, label %bb14.i, label %bb15.i

bb14.i:                                           ; preds = %bb10.i
  %34 = getelementptr inbounds %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %left.0.0.lcssa.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=2]
  %35 = load double* %34, align 4                 ; <double> [#uses=1]
  store double %35, double* %scevgep1415.i, align 4
  store double %25, double* %34, align 4
  br label %bb1.outer.i

bb15.i:                                           ; preds = %bb10.i, %bb3.i
  %tmp11.i = sub i32 0, %indvar9.i                ; <i32> [#uses=1]
  %right.0.0.i = getelementptr %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %right.0.0.ph.i, i32 %tmp11.i ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=3]
  tail call fastcc void @_ZN9benchmark9quicksortI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEvT_SE_(%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %begin.0.tr5.i, %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %right.0.0.i) nounwind
  %36 = ptrtoint %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %right.0.0.i to i32 ; <i32> [#uses=1]
  %37 = sub i32 %18, %36                          ; <i32> [#uses=1]
  %38 = ashr i32 %37, 3                           ; <i32> [#uses=1]
  %39 = icmp sgt i32 %38, 1                       ; <i1> [#uses=1]
  br i1 %39, label %bb.i, label %_ZN9benchmark9quicksortI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEvT_SE_.exit

_ZN9benchmark9quicksortI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEvT_SE_.exit: ; preds = %bb15.i, %bb15
  %40 = sub i32 %0, %18                           ; <i32> [#uses=1]
  %41 = ashr i32 %40, 3                           ; <i32> [#uses=1]
  %42 = icmp sgt i32 %41, 1                       ; <i1> [#uses=1]
  br i1 %42, label %bb, label %return

return:                                           ; preds = %_ZN9benchmark9quicksortI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEvT_SE_.exit, %entry
  ret void
}

declare i32 @printf(i8* noalias nocapture, ...) nounwind

declare i32 @rand() nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = icmp sgt i32 %argc, 1                      ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb1

bb:                                               ; preds = %entry
  %1 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %2 = load i8** %1, align 4                      ; <i8*> [#uses=1]
  %3 = tail call i32 @atoi(i8* %2) nounwind readonly ; <i32> [#uses=1]
  br label %bb1

bb1:                                              ; preds = %bb, %entry
  %iterations.0 = phi i32 [ %3, %bb ], [ 200000, %entry ] ; <i32> [#uses=9]
  %4 = icmp sgt i32 %argc, 2                      ; <i1> [#uses=1]
  br i1 %4, label %bb2, label %bb3

bb2:                                              ; preds = %bb1
  %5 = getelementptr inbounds i8** %argv, i32 2   ; <i8**> [#uses=1]
  %6 = load i8** %5, align 4                      ; <i8*> [#uses=1]
  %7 = tail call double @atof(i8* %6) nounwind readonly ; <double> [#uses=1]
  br label %bb3

bb3:                                              ; preds = %bb2, %bb1
  %init_value.0 = phi double [ %7, %bb2 ], [ 3.000000e+00, %bb1 ] ; <double> [#uses=10]
  %8 = fptosi double %init_value.0 to i32         ; <i32> [#uses=1]
  %9 = add nsw i32 %8, 123                        ; <i32> [#uses=1]
  tail call void @srand(i32 %9) nounwind
  br label %bb.i500

bb.i500:                                          ; preds = %bb.i500, %bb3
  %indvar.i496 = phi i32 [ 0, %bb3 ], [ %tmp643, %bb.i500 ] ; <i32> [#uses=2]
  %tmp643 = add i32 %indvar.i496, 1               ; <i32> [#uses=2]
  %first_addr.01.i497 = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i496 ; <double*> [#uses=1]
  store double %init_value.0, double* %first_addr.01.i497, align 8
  %scevgep.i499.idx.mask = and i32 %tmp643, 536870911 ; <i32> [#uses=1]
  %10 = icmp eq i32 %scevgep.i499.idx.mask, 2000  ; <i1> [#uses=1]
  br i1 %10, label %bb.i495, label %bb.i500

bb.i495:                                          ; preds = %bb.i495, %bb.i500
  %indvar.i493 = phi i32 [ %tmp646, %bb.i495 ], [ 0, %bb.i500 ] ; <i32> [#uses=2]
  %tmp646 = add i32 %indvar.i493, 1               ; <i32> [#uses=2]
  %scevgep2.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %indvar.i493, i32 0 ; <double*> [#uses=1]
  store double %init_value.0, double* %scevgep2.i, align 8
  %scevgep3.i.idx.mask = and i32 %tmp646, 536870911 ; <i32> [#uses=1]
  %11 = icmp eq i32 %scevgep3.i.idx.mask, 2000    ; <i1> [#uses=1]
  br i1 %11, label %bb.i492, label %bb.i495

bb.i492:                                          ; preds = %bb.i492, %bb.i495
  %indvar.i489 = phi i32 [ %tmp650, %bb.i492 ], [ 0, %bb.i495 ] ; <i32> [#uses=2]
  %tmp650 = add i32 %indvar.i489, 1               ; <i32> [#uses=2]
  %scevgep23.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %indvar.i489, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  store double %init_value.0, double* %scevgep23.i, align 8
  %scevgep.i491.idx.mask = and i32 %tmp650, 536870911 ; <i32> [#uses=1]
  %12 = icmp eq i32 %scevgep.i491.idx.mask, 2000  ; <i1> [#uses=1]
  br i1 %12, label %_ZN9benchmark4fillIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEvT_SD_T0_.exit, label %bb.i492

_ZN9benchmark4fillIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEvT_SD_T0_.exit: ; preds = %bb.i492
  %13 = icmp sgt i32 %iterations.0, 0             ; <i1> [#uses=6]
  br i1 %13, label %bb.nph.i471, label %_Z15test_accumulateI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_T0_PKc.exit

bb.nph.i471:                                      ; preds = %_ZN9benchmark4fillIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEvT_SD_T0_.exit
  %14 = fmul double %init_value.0, 2.000000e+03   ; <double> [#uses=1]
  br label %bb.i479

bb.i479:                                          ; preds = %_Z9check_sumd.exit.i485, %bb.nph.i471
  %i.02.i477 = phi i32 [ 0, %bb.nph.i471 ], [ %tmp4.i478, %_Z9check_sumd.exit.i485 ] ; <i32> [#uses=1]
  %tmp4.i478 = add i32 %i.02.i477, 1              ; <i32> [#uses=2]
  br label %bb.i.i483

bb.i.i483:                                        ; preds = %bb.i.i483, %bb.i479
  %indvar.i.i480 = phi i32 [ 0, %bb.i479 ], [ %tmp655, %bb.i.i483 ] ; <i32> [#uses=2]
  %result_addr.01.i.i = phi double [ 0.000000e+00, %bb.i479 ], [ %16, %bb.i.i483 ] ; <double> [#uses=1]
  %tmp655 = add i32 %indvar.i.i480, 1             ; <i32> [#uses=2]
  %first_addr.02.i.i = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i480 ; <double*> [#uses=1]
  %15 = load double* %first_addr.02.i.i, align 8  ; <double> [#uses=1]
  %16 = fadd double %15, %result_addr.01.i.i      ; <double> [#uses=2]
  %scevgep.i.i482.idx.mask = and i32 %tmp655, 536870911 ; <i32> [#uses=1]
  %17 = icmp eq i32 %scevgep.i.i482.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %17, label %_ZN9benchmark10accumulateIPddEET0_T_S3_S2_.exit.i, label %bb.i.i483

_ZN9benchmark10accumulateIPddEET0_T_S3_S2_.exit.i: ; preds = %bb.i.i483
  %18 = fcmp une double %14, %16                  ; <i1> [#uses=1]
  br i1 %18, label %bb.i1.i484, label %_Z9check_sumd.exit.i485

bb.i1.i484:                                       ; preds = %_ZN9benchmark10accumulateIPddEET0_T_S3_S2_.exit.i
  %19 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z9check_sumd.exit.i485

_Z9check_sumd.exit.i485:                          ; preds = %bb.i1.i484, %_ZN9benchmark10accumulateIPddEET0_T_S3_S2_.exit.i
  %20 = icmp slt i32 %tmp4.i478, %iterations.0    ; <i1> [#uses=1]
  br i1 %20, label %bb.i479, label %_Z15test_accumulateIPddEvT_S1_T0_PKc.exit

_Z15test_accumulateIPddEvT_S1_T0_PKc.exit:        ; preds = %_Z9check_sumd.exit.i485
  br i1 %13, label %bb.nph.i456, label %_Z15test_accumulateI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_T0_PKc.exit

bb.nph.i456:                                      ; preds = %_Z15test_accumulateIPddEvT_S1_T0_PKc.exit
  %21 = fmul double %init_value.0, 2.000000e+03   ; <double> [#uses=1]
  br label %bb.i464

bb.i464:                                          ; preds = %_Z9check_sumd.exit.i470, %bb.nph.i456
  %i.02.i462 = phi i32 [ 0, %bb.nph.i456 ], [ %tmp4.i463, %_Z9check_sumd.exit.i470 ] ; <i32> [#uses=1]
  %tmp4.i463 = add i32 %i.02.i462, 1              ; <i32> [#uses=2]
  br label %bb.i.i468

bb.i.i468:                                        ; preds = %bb.i.i468, %bb.i464
  %indvar.i.i465 = phi i32 [ 0, %bb.i464 ], [ %tmp661, %bb.i.i468 ] ; <i32> [#uses=2]
  %result_addr.02.i.i = phi double [ 0.000000e+00, %bb.i464 ], [ %23, %bb.i.i468 ] ; <double> [#uses=1]
  %tmp661 = add i32 %indvar.i.i465, 1             ; <i32> [#uses=2]
  %first_addr.0.01.i.i = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i465 ; <double*> [#uses=1]
  %22 = load double* %first_addr.0.01.i.i, align 8 ; <double> [#uses=1]
  %23 = fadd double %22, %result_addr.02.i.i      ; <double> [#uses=2]
  %scevgep.i.i467.idx.mask = and i32 %tmp661, 536870911 ; <i32> [#uses=1]
  %24 = icmp eq i32 %scevgep.i.i467.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %24, label %_ZN9benchmark10accumulateI14PointerWrapperIdEdEET0_T_S4_S3_.exit.i, label %bb.i.i468

_ZN9benchmark10accumulateI14PointerWrapperIdEdEET0_T_S4_S3_.exit.i: ; preds = %bb.i.i468
  %25 = fcmp une double %21, %23                  ; <i1> [#uses=1]
  br i1 %25, label %bb.i1.i469, label %_Z9check_sumd.exit.i470

bb.i1.i469:                                       ; preds = %_ZN9benchmark10accumulateI14PointerWrapperIdEdEET0_T_S4_S3_.exit.i
  %26 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z9check_sumd.exit.i470

_Z9check_sumd.exit.i470:                          ; preds = %bb.i1.i469, %_ZN9benchmark10accumulateI14PointerWrapperIdEdEET0_T_S4_S3_.exit.i
  %27 = icmp slt i32 %tmp4.i463, %iterations.0    ; <i1> [#uses=1]
  br i1 %27, label %bb.i464, label %_Z15test_accumulateI14PointerWrapperIdEdEvT_S2_T0_PKc.exit

_Z15test_accumulateI14PointerWrapperIdEdEvT_S2_T0_PKc.exit: ; preds = %_Z9check_sumd.exit.i470
  br i1 %13, label %bb.nph.i440, label %_Z15test_accumulateI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_T0_PKc.exit

bb.nph.i440:                                      ; preds = %_Z15test_accumulateI14PointerWrapperIdEdEvT_S2_T0_PKc.exit
  %28 = fmul double %init_value.0, 2.000000e+03   ; <double> [#uses=1]
  br label %bb.i448

bb.i448:                                          ; preds = %_Z9check_sumd.exit.i455, %bb.nph.i440
  %i.02.i446 = phi i32 [ 0, %bb.nph.i440 ], [ %tmp5.i447, %_Z9check_sumd.exit.i455 ] ; <i32> [#uses=1]
  %tmp5.i447 = add i32 %i.02.i446, 1              ; <i32> [#uses=2]
  br label %bb.i.i453

bb.i.i453:                                        ; preds = %bb.i.i453, %bb.i448
  %indvar.i.i449 = phi i32 [ 0, %bb.i448 ], [ %tmp667, %bb.i.i453 ] ; <i32> [#uses=2]
  %result_addr.0.01.i.i450 = phi double [ 0.000000e+00, %bb.i448 ], [ %30, %bb.i.i453 ] ; <double> [#uses=1]
  %tmp667 = add i32 %indvar.i.i449, 1             ; <i32> [#uses=2]
  %scevgep45.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %indvar.i.i449, i32 0 ; <double*> [#uses=1]
  %29 = load double* %scevgep45.i.i, align 8      ; <double> [#uses=1]
  %30 = fadd double %result_addr.0.01.i.i450, %29 ; <double> [#uses=2]
  %scevgep.i.i452.idx.mask = and i32 %tmp667, 536870911 ; <i32> [#uses=1]
  %31 = icmp eq i32 %scevgep.i.i452.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %31, label %_ZN9benchmark10accumulateIP12ValueWrapperIdES2_EET0_T_S5_S4_.exit.i, label %bb.i.i453

_ZN9benchmark10accumulateIP12ValueWrapperIdES2_EET0_T_S5_S4_.exit.i: ; preds = %bb.i.i453
  %32 = fcmp une double %28, %30                  ; <i1> [#uses=1]
  br i1 %32, label %bb.i1.i454, label %_Z9check_sumd.exit.i455

bb.i1.i454:                                       ; preds = %_ZN9benchmark10accumulateIP12ValueWrapperIdES2_EET0_T_S5_S4_.exit.i
  %33 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z9check_sumd.exit.i455

_Z9check_sumd.exit.i455:                          ; preds = %bb.i1.i454, %_ZN9benchmark10accumulateIP12ValueWrapperIdES2_EET0_T_S5_S4_.exit.i
  %34 = icmp slt i32 %tmp5.i447, %iterations.0    ; <i1> [#uses=1]
  br i1 %34, label %bb.i448, label %_Z15test_accumulateIP12ValueWrapperIdES1_EvT_S3_T0_PKc.exit

_Z15test_accumulateIP12ValueWrapperIdES1_EvT_S3_T0_PKc.exit: ; preds = %_Z9check_sumd.exit.i455
  br i1 %13, label %bb.nph.i429, label %_Z15test_accumulateI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_T0_PKc.exit

bb.nph.i429:                                      ; preds = %_Z15test_accumulateIP12ValueWrapperIdES1_EvT_S3_T0_PKc.exit
  %35 = fmul double %init_value.0, 2.000000e+03   ; <double> [#uses=1]
  br label %bb.i434

bb.i434:                                          ; preds = %_Z9check_sumd.exit.i439, %bb.nph.i429
  %i.02.i = phi i32 [ 0, %bb.nph.i429 ], [ %tmp5.i433, %_Z9check_sumd.exit.i439 ] ; <i32> [#uses=1]
  %tmp5.i433 = add i32 %i.02.i, 1                 ; <i32> [#uses=2]
  br label %bb.i.i438

bb.i.i438:                                        ; preds = %bb.i.i438, %bb.i434
  %indvar.i.i435 = phi i32 [ 0, %bb.i434 ], [ %tmp674, %bb.i.i438 ] ; <i32> [#uses=2]
  %result_addr.0.01.i.i = phi double [ 0.000000e+00, %bb.i434 ], [ %37, %bb.i.i438 ] ; <double> [#uses=1]
  %tmp674 = add i32 %indvar.i.i435, 1             ; <i32> [#uses=2]
  %scevgep4.i.i437 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %indvar.i.i435, i32 0 ; <double*> [#uses=1]
  %36 = load double* %scevgep4.i.i437, align 8    ; <double> [#uses=1]
  %37 = fadd double %result_addr.0.01.i.i, %36    ; <double> [#uses=2]
  %scevgep5.i.i436.idx.mask = and i32 %tmp674, 536870911 ; <i32> [#uses=1]
  %38 = icmp eq i32 %scevgep5.i.i436.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %38, label %_ZN9benchmark10accumulateI14PointerWrapperI12ValueWrapperIdEES3_EET0_T_S6_S5_.exit.i, label %bb.i.i438

_ZN9benchmark10accumulateI14PointerWrapperI12ValueWrapperIdEES3_EET0_T_S6_S5_.exit.i: ; preds = %bb.i.i438
  %39 = fcmp une double %35, %37                  ; <i1> [#uses=1]
  br i1 %39, label %bb.i1.i, label %_Z9check_sumd.exit.i439

bb.i1.i:                                          ; preds = %_ZN9benchmark10accumulateI14PointerWrapperI12ValueWrapperIdEES3_EET0_T_S6_S5_.exit.i
  %40 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z9check_sumd.exit.i439

_Z9check_sumd.exit.i439:                          ; preds = %bb.i1.i, %_ZN9benchmark10accumulateI14PointerWrapperI12ValueWrapperIdEES3_EET0_T_S6_S5_.exit.i
  %41 = icmp slt i32 %tmp5.i433, %iterations.0    ; <i1> [#uses=1]
  br i1 %41, label %bb.i434, label %_Z15test_accumulateI14PointerWrapperI12ValueWrapperIdEES2_EvT_S4_T0_PKc.exit

_Z15test_accumulateI14PointerWrapperI12ValueWrapperIdEES2_EvT_S4_T0_PKc.exit: ; preds = %_Z9check_sumd.exit.i439
  br i1 %13, label %bb.nph.i412, label %_Z15test_accumulateI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_T0_PKc.exit

bb.nph.i412:                                      ; preds = %_Z15test_accumulateI14PointerWrapperI12ValueWrapperIdEES2_EvT_S4_T0_PKc.exit
  %42 = fmul double %init_value.0, 2.000000e+03   ; <double> [#uses=1]
  br label %bb.i422

bb.i422:                                          ; preds = %_Z9check_sumd.exit.i428, %bb.nph.i412
  %i.06.i419 = phi i32 [ 0, %bb.nph.i412 ], [ %tmp9.i420, %_Z9check_sumd.exit.i428 ] ; <i32> [#uses=1]
  %tmp9.i420 = add i32 %i.06.i419, 1              ; <i32> [#uses=2]
  br label %bb.i.i426

bb.i.i426:                                        ; preds = %bb.i.i426, %bb.i422
  %43 = phi double [ 0.000000e+00, %bb.i422 ], [ %45, %bb.i.i426 ] ; <double> [#uses=1]
  %indvar.i.i423 = phi i32 [ 0, %bb.i422 ], [ %tmp680, %bb.i.i426 ] ; <i32> [#uses=2]
  %tmp680 = add i32 %indvar.i.i423, 1             ; <i32> [#uses=2]
  %scevgep23.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %indvar.i.i423, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %44 = load double* %scevgep23.i.i, align 8      ; <double> [#uses=1]
  %45 = fadd double %43, %44                      ; <double> [#uses=2]
  %scevgep.i.i425.idx.mask = and i32 %tmp680, 536870911 ; <i32> [#uses=1]
  %46 = icmp eq i32 %scevgep.i.i425.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %46, label %_ZN9benchmark10accumulateIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EET0_T_SE_SD_.exit.i, label %bb.i.i426

_ZN9benchmark10accumulateIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EET0_T_SE_SD_.exit.i: ; preds = %bb.i.i426
  %47 = fcmp une double %42, %45                  ; <i1> [#uses=1]
  br i1 %47, label %bb.i2.i427, label %_Z9check_sumd.exit.i428

bb.i2.i427:                                       ; preds = %_ZN9benchmark10accumulateIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EET0_T_SE_SD_.exit.i
  %48 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z9check_sumd.exit.i428

_Z9check_sumd.exit.i428:                          ; preds = %bb.i2.i427, %_ZN9benchmark10accumulateIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EET0_T_SE_SD_.exit.i
  %49 = icmp slt i32 %tmp9.i420, %iterations.0    ; <i1> [#uses=1]
  br i1 %49, label %bb.i422, label %_Z15test_accumulateIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_T0_PKc.exit

_Z15test_accumulateIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_T0_PKc.exit: ; preds = %_Z9check_sumd.exit.i428
  br i1 %13, label %bb.nph.i397, label %_Z15test_accumulateI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_T0_PKc.exit

bb.nph.i397:                                      ; preds = %_Z15test_accumulateIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_T0_PKc.exit
  %50 = fmul double %init_value.0, 2.000000e+03   ; <double> [#uses=1]
  br label %bb.i402

bb.i402:                                          ; preds = %_Z9check_sumd.exit.i, %bb.nph.i397
  %i.06.i399 = phi i32 [ 0, %bb.nph.i397 ], [ %tmp9.i400, %_Z9check_sumd.exit.i ] ; <i32> [#uses=1]
  %tmp9.i400 = add i32 %i.06.i399, 1              ; <i32> [#uses=2]
  br label %bb.i.i406

bb.i.i406:                                        ; preds = %bb.i.i406, %bb.i402
  %51 = phi double [ 0.000000e+00, %bb.i402 ], [ %53, %bb.i.i406 ] ; <double> [#uses=1]
  %indvar.i.i403 = phi i32 [ 0, %bb.i402 ], [ %tmp686, %bb.i.i406 ] ; <i32> [#uses=2]
  %tmp686 = add i32 %indvar.i.i403, 1             ; <i32> [#uses=2]
  %scevgep2.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %indvar.i.i403, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %52 = load double* %scevgep2.i.i, align 8       ; <double> [#uses=1]
  %53 = fadd double %51, %52                      ; <double> [#uses=2]
  %scevgep3.i.i405.idx.mask = and i32 %tmp686, 536870911 ; <i32> [#uses=1]
  %54 = icmp eq i32 %scevgep3.i.i405.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %54, label %_ZN9benchmark10accumulateI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EET0_T_SF_SE_.exit.i, label %bb.i.i406

_ZN9benchmark10accumulateI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EET0_T_SF_SE_.exit.i: ; preds = %bb.i.i406
  %55 = fcmp une double %50, %53                  ; <i1> [#uses=1]
  br i1 %55, label %bb.i2.i407, label %_Z9check_sumd.exit.i

bb.i2.i407:                                       ; preds = %_ZN9benchmark10accumulateI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EET0_T_SF_SE_.exit.i
  %56 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z9check_sumd.exit.i

_Z9check_sumd.exit.i:                             ; preds = %bb.i2.i407, %_ZN9benchmark10accumulateI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EET0_T_SF_SE_.exit.i
  %57 = icmp slt i32 %tmp9.i400, %iterations.0    ; <i1> [#uses=1]
  br i1 %57, label %bb.i402, label %_Z15test_accumulateI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_T0_PKc.exit

_Z15test_accumulateI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_T0_PKc.exit: ; preds = %_Z9check_sumd.exit.i, %_Z15test_accumulateIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_T0_PKc.exit, %_Z15test_accumulateI14PointerWrapperI12ValueWrapperIdEES2_EvT_S4_T0_PKc.exit, %_Z15test_accumulateIP12ValueWrapperIdES1_EvT_S3_T0_PKc.exit, %_Z15test_accumulateI14PointerWrapperIdEdEvT_S2_T0_PKc.exit, %_Z15test_accumulateIPddEvT_S1_T0_PKc.exit, %_ZN9benchmark4fillIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEvT_SD_T0_.exit
  %58 = sdiv i32 %iterations.0, 2000              ; <i32> [#uses=7]
  br label %bb.i392

bb.i392:                                          ; preds = %bb.i392, %_Z15test_accumulateI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_T0_PKc.exit
  %indvar.i389 = phi i32 [ 0, %_Z15test_accumulateI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_T0_PKc.exit ], [ %tmp691, %bb.i392 ] ; <i32> [#uses=2]
  %tmp691 = add i32 %indvar.i389, 1               ; <i32> [#uses=2]
  %first_addr.01.i = getelementptr [2000 x double]* @dataMaster, i32 0, i32 %indvar.i389 ; <double*> [#uses=1]
  %59 = tail call i32 @rand() nounwind            ; <i32> [#uses=1]
  %60 = sitofp i32 %59 to double                  ; <double> [#uses=1]
  store double %60, double* %first_addr.01.i, align 8
  %scevgep.i391.idx.mask = and i32 %tmp691, 536870911 ; <i32> [#uses=1]
  %61 = icmp eq i32 %scevgep.i391.idx.mask, 2000  ; <i1> [#uses=1]
  br i1 %61, label %bb.i388, label %bb.i392

bb.i388:                                          ; preds = %bb.i388, %bb.i392
  %indvar.i383 = phi i32 [ %tmp694, %bb.i388 ], [ 0, %bb.i392 ] ; <i32> [#uses=3]
  %tmp694 = add i32 %indvar.i383, 1               ; <i32> [#uses=2]
  %scevgep45.i385 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VDataMaster, i32 0, i32 %indvar.i383, i32 0 ; <double*> [#uses=1]
  %firstSource_addr.02.i384 = getelementptr [2000 x double]* @dataMaster, i32 0, i32 %indvar.i383 ; <double*> [#uses=1]
  %62 = load double* %firstSource_addr.02.i384, align 8 ; <double> [#uses=1]
  store double %62, double* %scevgep45.i385, align 8
  %scevgep.i387.idx.mask = and i32 %tmp694, 536870911 ; <i32> [#uses=1]
  %63 = icmp eq i32 %scevgep.i387.idx.mask, 2000  ; <i1> [#uses=1]
  br i1 %63, label %bb.i382, label %bb.i388

bb.i382:                                          ; preds = %bb.i382, %bb.i388
  %indvar.i = phi i32 [ %tmp699, %bb.i382 ], [ 0, %bb.i388 ] ; <i32> [#uses=3]
  %tmp699 = add i32 %indvar.i, 1                  ; <i32> [#uses=2]
  %scevgep45.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10DataMaster, i32 0, i32 %indvar.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %firstSource_addr.02.i = getelementptr [2000 x double]* @dataMaster, i32 0, i32 %indvar.i ; <double*> [#uses=1]
  %64 = load double* %firstSource_addr.02.i, align 8 ; <double> [#uses=1]
  store double %64, double* %scevgep45.i, align 8
  %scevgep.i.idx.mask = and i32 %tmp699, 536870911 ; <i32> [#uses=1]
  %65 = icmp eq i32 %scevgep.i.idx.mask, 2000     ; <i1> [#uses=1]
  br i1 %65, label %_ZN9benchmark4copyIPdP12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEEEvT_SE_T0_.exit, label %bb.i382

_ZN9benchmark4copyIPdP12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEEEvT_SE_T0_.exit: ; preds = %bb.i382
  %66 = icmp sgt i32 %iterations.0, 1999          ; <i1> [#uses=6]
  br i1 %66, label %bb.i353, label %_Z19test_insertion_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit

bb.i353:                                          ; preds = %_Z13verify_sortedIPdEvT_S1_.exit.i380, %_ZN9benchmark4copyIPdP12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEEEvT_SE_T0_.exit
  %i.07.i351 = phi i32 [ %tmp15.i352, %_Z13verify_sortedIPdEvT_S1_.exit.i380 ], [ 0, %_ZN9benchmark4copyIPdP12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEEEvT_SE_T0_.exit ] ; <i32> [#uses=1]
  %tmp15.i352 = add i32 %i.07.i351, 1             ; <i32> [#uses=2]
  br label %bb.i.i359

bb.i.i359:                                        ; preds = %bb.i.i359, %bb.i353
  %indvar.i.i354 = phi i32 [ 0, %bb.i353 ], [ %tmp975, %bb.i.i359 ] ; <i32> [#uses=3]
  %tmp975 = add i32 %indvar.i.i354, 1             ; <i32> [#uses=2]
  %firstSource_addr.02.i.i358 = getelementptr [2000 x double]* @dataMaster, i32 0, i32 %indvar.i.i354 ; <double*> [#uses=1]
  %firstDest_addr.01.i.i357 = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i354 ; <double*> [#uses=1]
  %67 = load double* %firstSource_addr.02.i.i358, align 8 ; <double> [#uses=1]
  store double %67, double* %firstDest_addr.01.i.i357, align 8
  %scevgep.i.i356.idx.mask = and i32 %tmp975, 536870911 ; <i32> [#uses=1]
  %68 = icmp eq i32 %scevgep.i.i356.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %68, label %bb.i3.i364, label %bb.i.i359

bb.i3.i364:                                       ; preds = %bb7.i.i, %bb.i.i359
  %69 = phi i32 [ %tmp968, %bb7.i.i ], [ 0, %bb.i.i359 ] ; <i32> [#uses=3]
  %tmp968 = add i32 %69, 1                        ; <i32> [#uses=3]
  %tmp972 = add i32 %69, 2                        ; <i32> [#uses=1]
  %p.04.i.i = getelementptr [2000 x double]* @data, i32 0, i32 %tmp968 ; <double*> [#uses=1]
  %70 = load double* %p.04.i.i, align 8           ; <double> [#uses=2]
  br label %bb2.i.i370

bb1.i.i366:                                       ; preds = %bb3.i.i372
  store double %72, double* %j.0.i.i369, align 8
  %indvar.next.i.i365 = add i32 %indvar.i4.i367, 1 ; <i32> [#uses=1]
  br label %bb2.i.i370

bb2.i.i370:                                       ; preds = %bb1.i.i366, %bb.i3.i364
  %indvar.i4.i367 = phi i32 [ 0, %bb.i3.i364 ], [ %indvar.next.i.i365, %bb1.i.i366 ] ; <i32> [#uses=3]
  %tmp969 = sub i32 %tmp968, %indvar.i4.i367      ; <i32> [#uses=1]
  %j.0.i.i369 = getelementptr [2000 x double]* @data, i32 0, i32 %tmp969 ; <double*> [#uses=3]
  %71 = icmp eq double* %j.0.i.i369, getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0) ; <i1> [#uses=1]
  br i1 %71, label %bb7.i.i, label %bb3.i.i372

bb3.i.i372:                                       ; preds = %bb2.i.i370
  %tmp966 = sub i32 %69, %indvar.i4.i367          ; <i32> [#uses=1]
  %scevgep.i5.i371 = getelementptr [2000 x double]* @data, i32 0, i32 %tmp966 ; <double*> [#uses=1]
  %72 = load double* %scevgep.i5.i371, align 8    ; <double> [#uses=2]
  %73 = fcmp ule double %72, %70                  ; <i1> [#uses=1]
  br i1 %73, label %bb7.i.i, label %bb1.i.i366

bb7.i.i:                                          ; preds = %bb3.i.i372, %bb2.i.i370
  store double %70, double* %j.0.i.i369, align 8
  %p.0.i.i363.idx.mask = and i32 %tmp972, 536870911 ; <i32> [#uses=1]
  %74 = icmp eq i32 %p.0.i.i363.idx.mask, 2000    ; <i1> [#uses=1]
  br i1 %74, label %bb2.i.i.i378, label %bb.i3.i364

bb.i.i.i374:                                      ; preds = %bb2.i.i.i378
  %prev.0.i.i.i373 = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i.i375 ; <double*> [#uses=1]
  %75 = load double* %first_addr.0.i.i.i377, align 8 ; <double> [#uses=1]
  %76 = load double* %prev.0.i.i.i373, align 8    ; <double> [#uses=1]
  %77 = fcmp olt double %75, %76                  ; <i1> [#uses=1]
  br i1 %77, label %bb.i2.i379, label %bb2.i.i.i378

bb2.i.i.i378:                                     ; preds = %bb.i.i.i374, %bb7.i.i
  %indvar.i.i.i375 = phi i32 [ %tmp979, %bb.i.i.i374 ], [ 0, %bb7.i.i ] ; <i32> [#uses=2]
  %tmp979 = add i32 %indvar.i.i.i375, 1           ; <i32> [#uses=2]
  %first_addr.0.i.i.i377 = getelementptr [2000 x double]* @data, i32 0, i32 %tmp979 ; <double*> [#uses=2]
  %78 = icmp eq double* %first_addr.0.i.i.i377, getelementptr ([2000 x double]* @data, i32 1, i32 0) ; <i1> [#uses=1]
  br i1 %78, label %_Z13verify_sortedIPdEvT_S1_.exit.i380, label %bb.i.i.i374

bb.i2.i379:                                       ; preds = %bb.i.i.i374
  %79 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIPdEvT_S1_.exit.i380

_Z13verify_sortedIPdEvT_S1_.exit.i380:            ; preds = %bb.i2.i379, %bb2.i.i.i378
  %80 = icmp slt i32 %tmp15.i352, %58             ; <i1> [#uses=1]
  br i1 %80, label %bb.i353, label %_Z19test_insertion_sortIPddEvT_S1_S1_S1_T0_PKc.exit

_Z19test_insertion_sortIPddEvT_S1_S1_S1_T0_PKc.exit: ; preds = %_Z13verify_sortedIPdEvT_S1_.exit.i380
  br i1 %66, label %bb.i320, label %_Z19test_insertion_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit

bb.i320:                                          ; preds = %_Z13verify_sortedI14PointerWrapperIdEEvT_S2_.exit.i348, %_Z19test_insertion_sortIPddEvT_S1_S1_S1_T0_PKc.exit
  %i.07.i = phi i32 [ %tmp15.i319, %_Z13verify_sortedI14PointerWrapperIdEEvT_S2_.exit.i348 ], [ 0, %_Z19test_insertion_sortIPddEvT_S1_S1_S1_T0_PKc.exit ] ; <i32> [#uses=1]
  %tmp15.i319 = add i32 %i.07.i, 1                ; <i32> [#uses=2]
  br label %bb.i.i326

bb.i.i326:                                        ; preds = %bb.i.i326, %bb.i320
  %indvar.i.i321 = phi i32 [ 0, %bb.i320 ], [ %tmp956, %bb.i.i326 ] ; <i32> [#uses=3]
  %tmp956 = add i32 %indvar.i.i321, 1             ; <i32> [#uses=2]
  %firstSource_addr.0.03.i.i325 = getelementptr [2000 x double]* @dataMaster, i32 0, i32 %indvar.i.i321 ; <double*> [#uses=1]
  %firstDest_addr.0.02.i.i324 = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i321 ; <double*> [#uses=1]
  %81 = load double* %firstSource_addr.0.03.i.i325, align 8 ; <double> [#uses=1]
  store double %81, double* %firstDest_addr.0.02.i.i324, align 8
  %scevgep.i.i323.idx.mask = and i32 %tmp956, 536870911 ; <i32> [#uses=1]
  %82 = icmp eq i32 %scevgep.i.i323.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %82, label %bb.i3.i331, label %bb.i.i326

bb.i3.i331:                                       ; preds = %bb11.i.i340, %bb.i.i326
  %83 = phi i32 [ %tmp949, %bb11.i.i340 ], [ 0, %bb.i.i326 ] ; <i32> [#uses=3]
  %tmp949 = add i32 %83, 1                        ; <i32> [#uses=3]
  %tmp953 = add i32 %83, 2                        ; <i32> [#uses=1]
  %p.0.05.i.i330 = getelementptr [2000 x double]* @data, i32 0, i32 %tmp949 ; <double*> [#uses=1]
  %84 = load double* %p.0.05.i.i330, align 8      ; <double> [#uses=2]
  br label %bb2.i.i337

bb1.i.i333:                                       ; preds = %bb6.i.i339
  store double %86, double* %j.0.0.i.i336, align 8
  %indvar.next.i.i332 = add i32 %indvar.i4.i334, 1 ; <i32> [#uses=1]
  br label %bb2.i.i337

bb2.i.i337:                                       ; preds = %bb1.i.i333, %bb.i3.i331
  %indvar.i4.i334 = phi i32 [ 0, %bb.i3.i331 ], [ %indvar.next.i.i332, %bb1.i.i333 ] ; <i32> [#uses=3]
  %tmp950 = sub i32 %tmp949, %indvar.i4.i334      ; <i32> [#uses=1]
  %j.0.0.i.i336 = getelementptr [2000 x double]* @data, i32 0, i32 %tmp950 ; <double*> [#uses=3]
  %85 = icmp eq double* %j.0.0.i.i336, getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0) ; <i1> [#uses=1]
  br i1 %85, label %bb11.i.i340, label %bb6.i.i339

bb6.i.i339:                                       ; preds = %bb2.i.i337
  %tmp947 = sub i32 %83, %indvar.i4.i334          ; <i32> [#uses=1]
  %scevgep.i5.i = getelementptr [2000 x double]* @data, i32 0, i32 %tmp947 ; <double*> [#uses=1]
  %86 = load double* %scevgep.i5.i, align 8       ; <double> [#uses=2]
  %87 = fcmp ule double %86, %84                  ; <i1> [#uses=1]
  br i1 %87, label %bb11.i.i340, label %bb1.i.i333

bb11.i.i340:                                      ; preds = %bb6.i.i339, %bb2.i.i337
  store double %84, double* %j.0.0.i.i336, align 8
  %p.0.0.i.i329.idx.mask = and i32 %tmp953, 536870911 ; <i32> [#uses=1]
  %88 = icmp eq i32 %p.0.0.i.i329.idx.mask, 2000  ; <i1> [#uses=1]
  br i1 %88, label %bb2.i.i.i346, label %bb.i3.i331

bb.i.i.i342:                                      ; preds = %bb2.i.i.i346
  %prev.0.0.i.i.i341 = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i.i343 ; <double*> [#uses=1]
  %89 = load double* %first_addr.0.0.i.i.i345, align 8 ; <double> [#uses=1]
  %90 = load double* %prev.0.0.i.i.i341, align 8  ; <double> [#uses=1]
  %91 = fcmp olt double %89, %90                  ; <i1> [#uses=1]
  br i1 %91, label %bb.i2.i347, label %bb2.i.i.i346

bb2.i.i.i346:                                     ; preds = %bb.i.i.i342, %bb11.i.i340
  %indvar.i.i.i343 = phi i32 [ %tmp960, %bb.i.i.i342 ], [ 0, %bb11.i.i340 ] ; <i32> [#uses=2]
  %tmp960 = add i32 %indvar.i.i.i343, 1           ; <i32> [#uses=2]
  %first_addr.0.0.i.i.i345 = getelementptr [2000 x double]* @data, i32 0, i32 %tmp960 ; <double*> [#uses=2]
  %92 = icmp eq double* %first_addr.0.0.i.i.i345, getelementptr ([2000 x double]* @data, i32 1, i32 0) ; <i1> [#uses=1]
  br i1 %92, label %_Z13verify_sortedI14PointerWrapperIdEEvT_S2_.exit.i348, label %bb.i.i.i342

bb.i2.i347:                                       ; preds = %bb.i.i.i342
  %93 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedI14PointerWrapperIdEEvT_S2_.exit.i348

_Z13verify_sortedI14PointerWrapperIdEEvT_S2_.exit.i348: ; preds = %bb.i2.i347, %bb2.i.i.i346
  %94 = icmp slt i32 %tmp15.i319, %58             ; <i1> [#uses=1]
  br i1 %94, label %bb.i320, label %_Z19test_insertion_sortI14PointerWrapperIdEdEvT_S2_S2_S2_T0_PKc.exit

_Z19test_insertion_sortI14PointerWrapperIdEdEvT_S2_S2_S2_T0_PKc.exit: ; preds = %_Z13verify_sortedI14PointerWrapperIdEEvT_S2_.exit.i348
  br i1 %66, label %bb.i284, label %_Z19test_insertion_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit

bb.i284:                                          ; preds = %_Z13verify_sortedIP12ValueWrapperIdEEvT_S3_.exit.i316, %_Z19test_insertion_sortI14PointerWrapperIdEdEvT_S2_S2_S2_T0_PKc.exit
  %i.06.i282 = phi i32 [ %tmp29.i283, %_Z13verify_sortedIP12ValueWrapperIdEEvT_S3_.exit.i316 ], [ 0, %_Z19test_insertion_sortI14PointerWrapperIdEdEvT_S2_S2_S2_T0_PKc.exit ] ; <i32> [#uses=1]
  %tmp29.i283 = add i32 %i.06.i282, 1             ; <i32> [#uses=2]
  br label %bb.i.i290

bb.i.i290:                                        ; preds = %bb.i.i290, %bb.i284
  %indvar.i.i285 = phi i32 [ 0, %bb.i284 ], [ %tmp933, %bb.i.i290 ] ; <i32> [#uses=3]
  %tmp933 = add i32 %indvar.i.i285, 1             ; <i32> [#uses=2]
  %scevgep3.i.i289 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VDataMaster, i32 0, i32 %indvar.i.i285, i32 0 ; <double*> [#uses=1]
  %scevgep56.i.i288 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %indvar.i.i285, i32 0 ; <double*> [#uses=1]
  %95 = load double* %scevgep3.i.i289, align 8    ; <double> [#uses=1]
  store double %95, double* %scevgep56.i.i288, align 8
  %scevgep4.i.i287.idx.mask = and i32 %tmp933, 536870911 ; <i32> [#uses=1]
  %96 = icmp eq i32 %scevgep4.i.i287.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %96, label %bb.i3.i296, label %bb.i.i290

bb.i3.i296:                                       ; preds = %bb11.i.i307, %bb.i.i290
  %97 = phi i32 [ %tmp924, %bb11.i.i307 ], [ 0, %bb.i.i290 ] ; <i32> [#uses=3]
  %tmp924 = add i32 %97, 1                        ; <i32> [#uses=3]
  %tmp929 = add i32 %97, 2                        ; <i32> [#uses=1]
  %scevgep1516.i.i295 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %tmp924, i32 0 ; <double*> [#uses=1]
  %98 = load double* %scevgep1516.i.i295, align 8 ; <double> [#uses=2]
  br label %bb2.i.i303

bb1.i.i298:                                       ; preds = %bb3.i.i306
  store double %100, double* %j.09.i.i302, align 8
  %indvar.next.i.i297 = add i32 %indvar.i4.i299, 1 ; <i32> [#uses=1]
  br label %bb2.i.i303

bb2.i.i303:                                       ; preds = %bb1.i.i298, %bb.i3.i296
  %indvar.i4.i299 = phi i32 [ 0, %bb.i3.i296 ], [ %indvar.next.i.i297, %bb1.i.i298 ] ; <i32> [#uses=3]
  %tmp925 = sub i32 %tmp924, %indvar.i4.i299      ; <i32> [#uses=2]
  %j.0.i.i301 = getelementptr [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %tmp925 ; <%"struct.ValueWrapper<double>"*> [#uses=1]
  %j.09.i.i302 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %tmp925, i32 0 ; <double*> [#uses=2]
  %99 = icmp eq %"struct.ValueWrapper<double>"* %j.0.i.i301, getelementptr inbounds ([2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 0) ; <i1> [#uses=1]
  br i1 %99, label %bb11.i.i307, label %bb3.i.i306

bb3.i.i306:                                       ; preds = %bb2.i.i303
  %tmp921 = sub i32 %97, %indvar.i4.i299          ; <i32> [#uses=1]
  %scevgep11.i.i305 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %tmp921, i32 0 ; <double*> [#uses=1]
  %100 = load double* %scevgep11.i.i305, align 8  ; <double> [#uses=2]
  %101 = fcmp olt double %98, %100                ; <i1> [#uses=1]
  br i1 %101, label %bb1.i.i298, label %bb11.i.i307

bb11.i.i307:                                      ; preds = %bb3.i.i306, %bb2.i.i303
  store double %98, double* %j.09.i.i302, align 8
  %p.0.i.i294.idx.mask = and i32 %tmp929, 536870911 ; <i32> [#uses=1]
  %102 = icmp eq i32 %p.0.i.i294.idx.mask, 2000   ; <i1> [#uses=1]
  br i1 %102, label %bb2.i.i.i314, label %bb.i3.i296

bb.i.i.i310:                                      ; preds = %bb2.i.i.i314
  %scevgep23.i.i.i308 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %tmp939, i32 0 ; <double*> [#uses=1]
  %scevgep1.i.i.i309 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %indvar.i.i.i311, i32 0 ; <double*> [#uses=1]
  %103 = load double* %scevgep23.i.i.i308, align 8 ; <double> [#uses=1]
  %104 = load double* %scevgep1.i.i.i309, align 8 ; <double> [#uses=1]
  %105 = fcmp olt double %103, %104               ; <i1> [#uses=1]
  br i1 %105, label %bb.i2.i315, label %bb2.i.i.i314

bb2.i.i.i314:                                     ; preds = %bb.i.i.i310, %bb11.i.i307
  %indvar.i.i.i311 = phi i32 [ %tmp939, %bb.i.i.i310 ], [ 0, %bb11.i.i307 ] ; <i32> [#uses=2]
  %tmp939 = add i32 %indvar.i.i.i311, 1           ; <i32> [#uses=3]
  %first_addr.0.i.i.i313.idx.mask = and i32 %tmp939, 536870911 ; <i32> [#uses=1]
  %106 = icmp eq i32 %first_addr.0.i.i.i313.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %106, label %_Z13verify_sortedIP12ValueWrapperIdEEvT_S3_.exit.i316, label %bb.i.i.i310

bb.i2.i315:                                       ; preds = %bb.i.i.i310
  %107 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIP12ValueWrapperIdEEvT_S3_.exit.i316

_Z13verify_sortedIP12ValueWrapperIdEEvT_S3_.exit.i316: ; preds = %bb.i2.i315, %bb2.i.i.i314
  %108 = icmp slt i32 %tmp29.i283, %58            ; <i1> [#uses=1]
  br i1 %108, label %bb.i284, label %_Z19test_insertion_sortIP12ValueWrapperIdES1_EvT_S3_S3_S3_T0_PKc.exit

_Z19test_insertion_sortIP12ValueWrapperIdES1_EvT_S3_S3_S3_T0_PKc.exit: ; preds = %_Z13verify_sortedIP12ValueWrapperIdEEvT_S3_.exit.i316
  br i1 %66, label %bb.i250, label %_Z19test_insertion_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit

bb.i250:                                          ; preds = %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIdEEEvT_S4_.exit.i279, %_Z19test_insertion_sortIP12ValueWrapperIdES1_EvT_S3_S3_S3_T0_PKc.exit
  %i.06.i248 = phi i32 [ %tmp28.i249, %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIdEEEvT_S4_.exit.i279 ], [ 0, %_Z19test_insertion_sortIP12ValueWrapperIdES1_EvT_S3_S3_S3_T0_PKc.exit ] ; <i32> [#uses=1]
  %tmp28.i249 = add i32 %i.06.i248, 1             ; <i32> [#uses=2]
  br label %bb.i.i256

bb.i.i256:                                        ; preds = %bb.i.i256, %bb.i250
  %indvar.i.i251 = phi i32 [ 0, %bb.i250 ], [ %tmp907, %bb.i.i256 ] ; <i32> [#uses=3]
  %tmp907 = add i32 %indvar.i.i251, 1             ; <i32> [#uses=2]
  %scevgep4.i.i255 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VDataMaster, i32 0, i32 %indvar.i.i251, i32 0 ; <double*> [#uses=1]
  %scevgep67.i.i254 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %indvar.i.i251, i32 0 ; <double*> [#uses=1]
  %109 = load double* %scevgep4.i.i255, align 8   ; <double> [#uses=1]
  store double %109, double* %scevgep67.i.i254, align 8
  %scevgep5.i.i253.idx.mask = and i32 %tmp907, 536870911 ; <i32> [#uses=1]
  %110 = icmp eq i32 %scevgep5.i.i253.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %110, label %bb.i3.i261, label %bb.i.i256

bb.i3.i261:                                       ; preds = %bb15.i.i270, %bb.i.i256
  %111 = phi i32 [ %tmp898, %bb15.i.i270 ], [ 0, %bb.i.i256 ] ; <i32> [#uses=3]
  %tmp898 = add i32 %111, 1                       ; <i32> [#uses=3]
  %tmp903 = add i32 %111, 2                       ; <i32> [#uses=1]
  %scevgep1819.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %tmp898, i32 0 ; <double*> [#uses=1]
  %112 = load double* %scevgep1819.i.i, align 8   ; <double> [#uses=2]
  br label %bb2.i.i267

bb1.i.i263:                                       ; preds = %bb6.i.i269
  store double %114, double* %j.0.014.i.i, align 8
  %indvar.next.i.i262 = add i32 %indvar.i4.i264, 1 ; <i32> [#uses=1]
  br label %bb2.i.i267

bb2.i.i267:                                       ; preds = %bb1.i.i263, %bb.i3.i261
  %indvar.i4.i264 = phi i32 [ 0, %bb.i3.i261 ], [ %indvar.next.i.i262, %bb1.i.i263 ] ; <i32> [#uses=3]
  %tmp899 = sub i32 %tmp898, %indvar.i4.i264      ; <i32> [#uses=2]
  %j.0.0.i.i266 = getelementptr [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %tmp899 ; <%"struct.ValueWrapper<double>"*> [#uses=1]
  %j.0.014.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %tmp899, i32 0 ; <double*> [#uses=2]
  %113 = icmp eq %"struct.ValueWrapper<double>"* %j.0.0.i.i266, getelementptr inbounds ([2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 0) ; <i1> [#uses=1]
  br i1 %113, label %bb15.i.i270, label %bb6.i.i269

bb6.i.i269:                                       ; preds = %bb2.i.i267
  %tmp895 = sub i32 %111, %indvar.i4.i264         ; <i32> [#uses=1]
  %scevgep10.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %tmp895, i32 0 ; <double*> [#uses=1]
  %114 = load double* %scevgep10.i.i, align 8     ; <double> [#uses=2]
  %115 = fcmp olt double %112, %114               ; <i1> [#uses=1]
  br i1 %115, label %bb1.i.i263, label %bb15.i.i270

bb15.i.i270:                                      ; preds = %bb6.i.i269, %bb2.i.i267
  store double %112, double* %j.0.014.i.i, align 8
  %p.0.0.i.i260.idx.mask = and i32 %tmp903, 536870911 ; <i32> [#uses=1]
  %116 = icmp eq i32 %p.0.0.i.i260.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %116, label %bb2.i.i.i277, label %bb.i3.i261

bb.i.i.i273:                                      ; preds = %bb2.i.i.i277
  %scevgep56.i.i.i271 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %tmp913, i32 0 ; <double*> [#uses=1]
  %scevgep4.i.i.i272 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %indvar.i.i.i274, i32 0 ; <double*> [#uses=1]
  %117 = load double* %scevgep56.i.i.i271, align 8 ; <double> [#uses=1]
  %118 = load double* %scevgep4.i.i.i272, align 8 ; <double> [#uses=1]
  %119 = fcmp olt double %117, %118               ; <i1> [#uses=1]
  br i1 %119, label %bb.i2.i278, label %bb2.i.i.i277

bb2.i.i.i277:                                     ; preds = %bb.i.i.i273, %bb15.i.i270
  %indvar.i.i.i274 = phi i32 [ %tmp913, %bb.i.i.i273 ], [ 0, %bb15.i.i270 ] ; <i32> [#uses=2]
  %tmp913 = add i32 %indvar.i.i.i274, 1           ; <i32> [#uses=3]
  %first_addr.0.0.i.i.i276.idx.mask = and i32 %tmp913, 536870911 ; <i32> [#uses=1]
  %120 = icmp eq i32 %first_addr.0.0.i.i.i276.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %120, label %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIdEEEvT_S4_.exit.i279, label %bb.i.i.i273

bb.i2.i278:                                       ; preds = %bb.i.i.i273
  %121 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIdEEEvT_S4_.exit.i279

_Z13verify_sortedI14PointerWrapperI12ValueWrapperIdEEEvT_S4_.exit.i279: ; preds = %bb.i2.i278, %bb2.i.i.i277
  %122 = icmp slt i32 %tmp28.i249, %58            ; <i1> [#uses=1]
  br i1 %122, label %bb.i250, label %_Z19test_insertion_sortI14PointerWrapperI12ValueWrapperIdEES2_EvT_S4_S4_S4_T0_PKc.exit

_Z19test_insertion_sortI14PointerWrapperI12ValueWrapperIdEES2_EvT_S4_S4_S4_T0_PKc.exit: ; preds = %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIdEEEvT_S4_.exit.i279
  br i1 %66, label %bb.i225, label %_Z19test_insertion_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit

bb.i225:                                          ; preds = %_Z13verify_sortedIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEEEvT_SC_.exit.i246, %_Z19test_insertion_sortI14PointerWrapperI12ValueWrapperIdEES2_EvT_S4_S4_S4_T0_PKc.exit
  %i.06.i224 = phi i32 [ %tmp29.i, %_Z13verify_sortedIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEEEvT_SC_.exit.i246 ], [ 0, %_Z19test_insertion_sortI14PointerWrapperI12ValueWrapperIdEES2_EvT_S4_S4_S4_T0_PKc.exit ] ; <i32> [#uses=1]
  %tmp29.i = add i32 %i.06.i224, 1                ; <i32> [#uses=2]
  br label %bb.i.i230

bb.i.i230:                                        ; preds = %bb.i.i230, %bb.i225
  %indvar.i.i226 = phi i32 [ 0, %bb.i225 ], [ %tmp881, %bb.i.i230 ] ; <i32> [#uses=3]
  %tmp881 = add i32 %indvar.i.i226, 1             ; <i32> [#uses=2]
  %scevgep34.i.i229 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10DataMaster, i32 0, i32 %indvar.i.i226, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %scevgep56.i.i228 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %indvar.i.i226, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %123 = load double* %scevgep34.i.i229, align 8  ; <double> [#uses=1]
  store double %123, double* %scevgep56.i.i228, align 8
  %scevgep.i.i227.idx.mask = and i32 %tmp881, 536870911 ; <i32> [#uses=1]
  %124 = icmp eq i32 %scevgep.i.i227.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %124, label %bb.i3.i233, label %bb.i.i230

bb.i3.i233:                                       ; preds = %bb11.i.i, %bb.i.i230
  %125 = phi i32 [ %tmp872, %bb11.i.i ], [ 0, %bb.i.i230 ] ; <i32> [#uses=3]
  %tmp872 = add i32 %125, 1                       ; <i32> [#uses=3]
  %tmp877 = add i32 %125, 2                       ; <i32> [#uses=1]
  %scevgep1516.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %tmp872, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %126 = load double* %scevgep1516.i.i, align 8   ; <double> [#uses=2]
  br label %bb2.i.i237

bb1.i.i235:                                       ; preds = %bb3.i.i
  store double %128, double* %j.09.i.i, align 8
  %indvar.next.i.i234 = add i32 %indvar.i4.i236, 1 ; <i32> [#uses=1]
  br label %bb2.i.i237

bb2.i.i237:                                       ; preds = %bb1.i.i235, %bb.i3.i233
  %indvar.i4.i236 = phi i32 [ 0, %bb.i3.i233 ], [ %indvar.next.i.i234, %bb1.i.i235 ] ; <i32> [#uses=3]
  %tmp873 = sub i32 %tmp872, %indvar.i4.i236      ; <i32> [#uses=2]
  %j.0.i.i = getelementptr [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %tmp873 ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=1]
  %j.09.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %tmp873, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=2]
  %127 = icmp eq %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %j.0.i.i, getelementptr inbounds ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 0) ; <i1> [#uses=1]
  br i1 %127, label %bb11.i.i, label %bb3.i.i

bb3.i.i:                                          ; preds = %bb2.i.i237
  %tmp869 = sub i32 %125, %indvar.i4.i236         ; <i32> [#uses=1]
  %scevgep11.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %tmp869, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %128 = load double* %scevgep11.i.i, align 8     ; <double> [#uses=2]
  %129 = fcmp olt double %126, %128               ; <i1> [#uses=1]
  br i1 %129, label %bb1.i.i235, label %bb11.i.i

bb11.i.i:                                         ; preds = %bb3.i.i, %bb2.i.i237
  store double %126, double* %j.09.i.i, align 8
  %p.0.i.i.idx.mask = and i32 %tmp877, 536870911  ; <i32> [#uses=1]
  %130 = icmp eq i32 %p.0.i.i.idx.mask, 2000      ; <i1> [#uses=1]
  br i1 %130, label %bb2.i.i.i244, label %bb.i3.i233

bb.i.i.i241:                                      ; preds = %bb2.i.i.i244
  %scevgep23.i.i.i239 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %tmp887, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %scevgep1.i.i.i240 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %indvar.i.i.i242, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %131 = load double* %scevgep23.i.i.i239, align 8 ; <double> [#uses=1]
  %132 = load double* %scevgep1.i.i.i240, align 8 ; <double> [#uses=1]
  %133 = fcmp olt double %131, %132               ; <i1> [#uses=1]
  br i1 %133, label %bb.i2.i245, label %bb2.i.i.i244

bb2.i.i.i244:                                     ; preds = %bb.i.i.i241, %bb11.i.i
  %indvar.i.i.i242 = phi i32 [ %tmp887, %bb.i.i.i241 ], [ 0, %bb11.i.i ] ; <i32> [#uses=2]
  %tmp887 = add i32 %indvar.i.i.i242, 1           ; <i32> [#uses=3]
  %first_addr.0.i.i.i243.idx.mask = and i32 %tmp887, 536870911 ; <i32> [#uses=1]
  %134 = icmp eq i32 %first_addr.0.i.i.i243.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %134, label %_Z13verify_sortedIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEEEvT_SC_.exit.i246, label %bb.i.i.i241

bb.i2.i245:                                       ; preds = %bb.i.i.i241
  %135 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEEEvT_SC_.exit.i246

_Z13verify_sortedIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEEEvT_SC_.exit.i246: ; preds = %bb.i2.i245, %bb2.i.i.i244
  %136 = icmp slt i32 %tmp29.i, %58               ; <i1> [#uses=1]
  br i1 %136, label %bb.i225, label %_Z19test_insertion_sortIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_SC_SC_T0_PKc.exit

_Z19test_insertion_sortIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_SC_SC_T0_PKc.exit: ; preds = %_Z13verify_sortedIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEEEvT_SC_.exit.i246
  br i1 %66, label %bb.i204, label %_Z19test_insertion_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit

bb.i204:                                          ; preds = %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEEEvT_SD_.exit.i219, %_Z19test_insertion_sortIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_SC_SC_T0_PKc.exit
  %i.06.i = phi i32 [ %tmp28.i, %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEEEvT_SD_.exit.i219 ], [ 0, %_Z19test_insertion_sortIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_SC_SC_T0_PKc.exit ] ; <i32> [#uses=1]
  %tmp28.i = add i32 %i.06.i, 1                   ; <i32> [#uses=2]
  br label %bb.i.i210

bb.i.i210:                                        ; preds = %bb.i.i210, %bb.i204
  %indvar.i.i205 = phi i32 [ 0, %bb.i204 ], [ %tmp856, %bb.i.i210 ] ; <i32> [#uses=3]
  %tmp856 = add i32 %indvar.i.i205, 1             ; <i32> [#uses=2]
  %scevgep4.i.i209 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10DataMaster, i32 0, i32 %indvar.i.i205, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %scevgep67.i.i208 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %indvar.i.i205, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %137 = load double* %scevgep4.i.i209, align 8   ; <double> [#uses=1]
  store double %137, double* %scevgep67.i.i208, align 8
  %scevgep5.i.i207.idx.mask = and i32 %tmp856, 536870911 ; <i32> [#uses=1]
  %138 = icmp eq i32 %scevgep5.i.i207.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %138, label %bb.i3.i, label %bb.i.i210

bb.i3.i:                                          ; preds = %bb15.i.i, %bb.i.i210
  %139 = phi i32 [ %tmp847, %bb15.i.i ], [ 0, %bb.i.i210 ] ; <i32> [#uses=3]
  %tmp847 = add i32 %139, 1                       ; <i32> [#uses=3]
  %tmp852 = add i32 %139, 2                       ; <i32> [#uses=1]
  %scevgep1718.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %tmp847, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %140 = load double* %scevgep1718.i.i, align 8   ; <double> [#uses=2]
  br label %bb2.i.i

bb1.i.i:                                          ; preds = %bb6.i.i
  store double %142, double* %j.0.013.i.i, align 8
  %indvar.next.i.i = add i32 %indvar.i4.i, 1      ; <i32> [#uses=1]
  br label %bb2.i.i

bb2.i.i:                                          ; preds = %bb1.i.i, %bb.i3.i
  %indvar.i4.i = phi i32 [ 0, %bb.i3.i ], [ %indvar.next.i.i, %bb1.i.i ] ; <i32> [#uses=3]
  %tmp848 = sub i32 %tmp847, %indvar.i4.i         ; <i32> [#uses=2]
  %j.0.0.i.i = getelementptr [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %tmp848 ; <%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"*> [#uses=1]
  %j.0.013.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %tmp848, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=2]
  %141 = icmp eq %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* %j.0.0.i.i, getelementptr inbounds ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 0) ; <i1> [#uses=1]
  br i1 %141, label %bb15.i.i, label %bb6.i.i

bb6.i.i:                                          ; preds = %bb2.i.i
  %tmp844 = sub i32 %139, %indvar.i4.i            ; <i32> [#uses=1]
  %scevgep9.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %tmp844, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %142 = load double* %scevgep9.i.i, align 8      ; <double> [#uses=2]
  %143 = fcmp olt double %140, %142               ; <i1> [#uses=1]
  br i1 %143, label %bb1.i.i, label %bb15.i.i

bb15.i.i:                                         ; preds = %bb6.i.i, %bb2.i.i
  store double %140, double* %j.0.013.i.i, align 8
  %p.0.0.i.i.idx.mask = and i32 %tmp852, 536870911 ; <i32> [#uses=1]
  %144 = icmp eq i32 %p.0.0.i.i.idx.mask, 2000    ; <i1> [#uses=1]
  br i1 %144, label %bb2.i.i.i217, label %bb.i3.i

bb.i.i.i214:                                      ; preds = %bb2.i.i.i217
  %scevgep45.i.i.i212 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %tmp862, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %scevgep3.i.i.i213 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %indvar.i.i.i215, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %145 = load double* %scevgep45.i.i.i212, align 8 ; <double> [#uses=1]
  %146 = load double* %scevgep3.i.i.i213, align 8 ; <double> [#uses=1]
  %147 = fcmp olt double %145, %146               ; <i1> [#uses=1]
  br i1 %147, label %bb.i2.i218, label %bb2.i.i.i217

bb2.i.i.i217:                                     ; preds = %bb.i.i.i214, %bb15.i.i
  %indvar.i.i.i215 = phi i32 [ %tmp862, %bb.i.i.i214 ], [ 0, %bb15.i.i ] ; <i32> [#uses=2]
  %tmp862 = add i32 %indvar.i.i.i215, 1           ; <i32> [#uses=3]
  %first_addr.0.0.i.i.i216.idx.mask = and i32 %tmp862, 536870911 ; <i32> [#uses=1]
  %148 = icmp eq i32 %first_addr.0.0.i.i.i216.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %148, label %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEEEvT_SD_.exit.i219, label %bb.i.i.i214

bb.i2.i218:                                       ; preds = %bb.i.i.i214
  %149 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEEEvT_SD_.exit.i219

_Z13verify_sortedI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEEEvT_SD_.exit.i219: ; preds = %bb.i2.i218, %bb2.i.i.i217
  %150 = icmp slt i32 %tmp28.i, %58               ; <i1> [#uses=1]
  br i1 %150, label %bb.i204, label %_Z19test_insertion_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit

_Z19test_insertion_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit: ; preds = %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEEEvT_SD_.exit.i219, %_Z19test_insertion_sortIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_SC_SC_T0_PKc.exit, %_Z19test_insertion_sortI14PointerWrapperI12ValueWrapperIdEES2_EvT_S4_S4_S4_T0_PKc.exit, %_Z19test_insertion_sortIP12ValueWrapperIdES1_EvT_S3_S3_S3_T0_PKc.exit, %_Z19test_insertion_sortI14PointerWrapperIdEdEvT_S2_S2_S2_T0_PKc.exit, %_Z19test_insertion_sortIPddEvT_S1_S1_S1_T0_PKc.exit, %_ZN9benchmark4copyIPdP12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEEEvT_SE_T0_.exit
  %151 = shl i32 %58, 3                           ; <i32> [#uses=13]
  %152 = icmp sgt i32 %151, 0                     ; <i1> [#uses=12]
  br i1 %152, label %bb.i184, label %_Z14test_heap_sortIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_SC_SC_T0_PKc.exit.thread.critedge

bb.i184:                                          ; preds = %_Z13verify_sortedIPdEvT_S1_.exit.i199, %_Z19test_insertion_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit
  %i.03.i182 = phi i32 [ %tmp5.i183, %_Z13verify_sortedIPdEvT_S1_.exit.i199 ], [ 0, %_Z19test_insertion_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit ] ; <i32> [#uses=1]
  %tmp5.i183 = add i32 %i.03.i182, 1              ; <i32> [#uses=2]
  br label %bb.i.i190

bb.i.i190:                                        ; preds = %bb.i.i190, %bb.i184
  %indvar.i.i185 = phi i32 [ 0, %bb.i184 ], [ %tmp834, %bb.i.i190 ] ; <i32> [#uses=3]
  %tmp834 = add i32 %indvar.i.i185, 1             ; <i32> [#uses=2]
  %firstSource_addr.02.i.i189 = getelementptr [2000 x double]* @dataMaster, i32 0, i32 %indvar.i.i185 ; <double*> [#uses=1]
  %firstDest_addr.01.i.i188 = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i185 ; <double*> [#uses=1]
  %153 = load double* %firstSource_addr.02.i.i189, align 8 ; <double> [#uses=1]
  store double %153, double* %firstDest_addr.01.i.i188, align 8
  %scevgep.i.i187.idx.mask = and i32 %tmp834, 536870911 ; <i32> [#uses=1]
  %154 = icmp eq i32 %scevgep.i.i187.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %154, label %_ZN9benchmark4copyIPdS1_EEvT_S2_T0_.exit.i191, label %bb.i.i190

_ZN9benchmark4copyIPdS1_EEvT_S2_T0_.exit.i191:    ; preds = %bb.i.i190
  tail call fastcc void @_ZN9benchmark9quicksortIPddEEvT_S2_(double* getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0), double* getelementptr ([2000 x double]* @data, i32 1, i32 0)) nounwind
  br label %bb2.i.i.i197

bb.i.i.i193:                                      ; preds = %bb2.i.i.i197
  %prev.0.i.i.i192 = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i.i194 ; <double*> [#uses=1]
  %155 = load double* %first_addr.0.i.i.i196, align 8 ; <double> [#uses=1]
  %156 = load double* %prev.0.i.i.i192, align 8   ; <double> [#uses=1]
  %157 = fcmp olt double %155, %156               ; <i1> [#uses=1]
  br i1 %157, label %bb.i2.i198, label %bb2.i.i.i197

bb2.i.i.i197:                                     ; preds = %bb.i.i.i193, %_ZN9benchmark4copyIPdS1_EEvT_S2_T0_.exit.i191
  %indvar.i.i.i194 = phi i32 [ 0, %_ZN9benchmark4copyIPdS1_EEvT_S2_T0_.exit.i191 ], [ %tmp838, %bb.i.i.i193 ] ; <i32> [#uses=2]
  %tmp838 = add i32 %indvar.i.i.i194, 1           ; <i32> [#uses=2]
  %first_addr.0.i.i.i196 = getelementptr [2000 x double]* @data, i32 0, i32 %tmp838 ; <double*> [#uses=2]
  %158 = icmp eq double* %first_addr.0.i.i.i196, getelementptr ([2000 x double]* @data, i32 1, i32 0) ; <i1> [#uses=1]
  br i1 %158, label %_Z13verify_sortedIPdEvT_S1_.exit.i199, label %bb.i.i.i193

bb.i2.i198:                                       ; preds = %bb.i.i.i193
  %159 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIPdEvT_S1_.exit.i199

_Z13verify_sortedIPdEvT_S1_.exit.i199:            ; preds = %bb.i2.i198, %bb2.i.i.i197
  %160 = icmp slt i32 %tmp5.i183, %151            ; <i1> [#uses=1]
  br i1 %160, label %bb.i184, label %_Z14test_quicksortIPddEvT_S1_S1_S1_T0_PKc.exit

_Z14test_quicksortIPddEvT_S1_S1_S1_T0_PKc.exit:   ; preds = %_Z13verify_sortedIPdEvT_S1_.exit.i199
  br i1 %152, label %bb.i165, label %_Z14test_heap_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit

bb.i165:                                          ; preds = %_Z13verify_sortedI14PointerWrapperIdEEvT_S2_.exit.i180, %_Z14test_quicksortIPddEvT_S1_S1_S1_T0_PKc.exit
  %i.03.i163 = phi i32 [ %tmp5.i164, %_Z13verify_sortedI14PointerWrapperIdEEvT_S2_.exit.i180 ], [ 0, %_Z14test_quicksortIPddEvT_S1_S1_S1_T0_PKc.exit ] ; <i32> [#uses=1]
  %tmp5.i164 = add i32 %i.03.i163, 1              ; <i32> [#uses=2]
  br label %bb.i.i171

bb.i.i171:                                        ; preds = %bb.i.i171, %bb.i165
  %indvar.i.i166 = phi i32 [ 0, %bb.i165 ], [ %tmp825, %bb.i.i171 ] ; <i32> [#uses=3]
  %tmp825 = add i32 %indvar.i.i166, 1             ; <i32> [#uses=2]
  %firstSource_addr.0.03.i.i170 = getelementptr [2000 x double]* @dataMaster, i32 0, i32 %indvar.i.i166 ; <double*> [#uses=1]
  %firstDest_addr.0.02.i.i169 = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i166 ; <double*> [#uses=1]
  %161 = load double* %firstSource_addr.0.03.i.i170, align 8 ; <double> [#uses=1]
  store double %161, double* %firstDest_addr.0.02.i.i169, align 8
  %scevgep.i.i168.idx.mask = and i32 %tmp825, 536870911 ; <i32> [#uses=1]
  %162 = icmp eq i32 %scevgep.i.i168.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %162, label %_ZN9benchmark4copyI14PointerWrapperIdES2_EEvT_S3_T0_.exit.i172, label %bb.i.i171

_ZN9benchmark4copyI14PointerWrapperIdES2_EEvT_S3_T0_.exit.i172: ; preds = %bb.i.i171
  tail call fastcc void @_ZN9benchmark9quicksortI14PointerWrapperIdEdEEvT_S3_(double* getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0), double* getelementptr ([2000 x double]* @data, i32 1, i32 0)) nounwind
  br label %bb2.i.i.i178

bb.i.i.i174:                                      ; preds = %bb2.i.i.i178
  %prev.0.0.i.i.i173 = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i.i175 ; <double*> [#uses=1]
  %163 = load double* %first_addr.0.0.i.i.i177, align 8 ; <double> [#uses=1]
  %164 = load double* %prev.0.0.i.i.i173, align 8 ; <double> [#uses=1]
  %165 = fcmp olt double %163, %164               ; <i1> [#uses=1]
  br i1 %165, label %bb.i2.i179, label %bb2.i.i.i178

bb2.i.i.i178:                                     ; preds = %bb.i.i.i174, %_ZN9benchmark4copyI14PointerWrapperIdES2_EEvT_S3_T0_.exit.i172
  %indvar.i.i.i175 = phi i32 [ 0, %_ZN9benchmark4copyI14PointerWrapperIdES2_EEvT_S3_T0_.exit.i172 ], [ %tmp829, %bb.i.i.i174 ] ; <i32> [#uses=2]
  %tmp829 = add i32 %indvar.i.i.i175, 1           ; <i32> [#uses=2]
  %first_addr.0.0.i.i.i177 = getelementptr [2000 x double]* @data, i32 0, i32 %tmp829 ; <double*> [#uses=2]
  %166 = icmp eq double* %first_addr.0.0.i.i.i177, getelementptr ([2000 x double]* @data, i32 1, i32 0) ; <i1> [#uses=1]
  br i1 %166, label %_Z13verify_sortedI14PointerWrapperIdEEvT_S2_.exit.i180, label %bb.i.i.i174

bb.i2.i179:                                       ; preds = %bb.i.i.i174
  %167 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedI14PointerWrapperIdEEvT_S2_.exit.i180

_Z13verify_sortedI14PointerWrapperIdEEvT_S2_.exit.i180: ; preds = %bb.i2.i179, %bb2.i.i.i178
  %168 = icmp slt i32 %tmp5.i164, %151            ; <i1> [#uses=1]
  br i1 %168, label %bb.i165, label %_Z14test_quicksortI14PointerWrapperIdEdEvT_S2_S2_S2_T0_PKc.exit

_Z14test_quicksortI14PointerWrapperIdEdEvT_S2_S2_S2_T0_PKc.exit: ; preds = %_Z13verify_sortedI14PointerWrapperIdEEvT_S2_.exit.i180
  br i1 %152, label %bb.i145, label %_Z14test_heap_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit

bb.i145:                                          ; preds = %_Z13verify_sortedIP12ValueWrapperIdEEvT_S3_.exit.i161, %_Z14test_quicksortI14PointerWrapperIdEdEvT_S2_S2_S2_T0_PKc.exit
  %i.03.i143 = phi i32 [ %tmp12.i144, %_Z13verify_sortedIP12ValueWrapperIdEEvT_S3_.exit.i161 ], [ 0, %_Z14test_quicksortI14PointerWrapperIdEdEvT_S2_S2_S2_T0_PKc.exit ] ; <i32> [#uses=1]
  %tmp12.i144 = add i32 %i.03.i143, 1             ; <i32> [#uses=2]
  br label %bb.i.i151

bb.i.i151:                                        ; preds = %bb.i.i151, %bb.i145
  %indvar.i.i146 = phi i32 [ 0, %bb.i145 ], [ %tmp812, %bb.i.i151 ] ; <i32> [#uses=3]
  %tmp812 = add i32 %indvar.i.i146, 1             ; <i32> [#uses=2]
  %scevgep3.i.i150 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VDataMaster, i32 0, i32 %indvar.i.i146, i32 0 ; <double*> [#uses=1]
  %scevgep56.i.i149 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %indvar.i.i146, i32 0 ; <double*> [#uses=1]
  %169 = load double* %scevgep3.i.i150, align 8   ; <double> [#uses=1]
  store double %169, double* %scevgep56.i.i149, align 8
  %scevgep4.i.i148.idx.mask = and i32 %tmp812, 536870911 ; <i32> [#uses=1]
  %170 = icmp eq i32 %scevgep4.i.i148.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %170, label %_ZN9benchmark4copyIP12ValueWrapperIdES3_EEvT_S4_T0_.exit.i152, label %bb.i.i151

_ZN9benchmark4copyIP12ValueWrapperIdES3_EEvT_S4_T0_.exit.i152: ; preds = %bb.i.i151
  tail call fastcc void @_ZN9benchmark9quicksortIP12ValueWrapperIdES2_EEvT_S4_(%"struct.ValueWrapper<double>"* getelementptr inbounds ([2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 0), %"struct.ValueWrapper<double>"* getelementptr ([2000 x %"struct.ValueWrapper<double>"]* @VData, i32 1, i32 0)) nounwind
  br label %bb2.i.i.i159

bb.i.i.i155:                                      ; preds = %bb2.i.i.i159
  %scevgep23.i.i.i153 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %tmp818, i32 0 ; <double*> [#uses=1]
  %scevgep1.i.i.i154 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %indvar.i.i.i156, i32 0 ; <double*> [#uses=1]
  %171 = load double* %scevgep23.i.i.i153, align 8 ; <double> [#uses=1]
  %172 = load double* %scevgep1.i.i.i154, align 8 ; <double> [#uses=1]
  %173 = fcmp olt double %171, %172               ; <i1> [#uses=1]
  br i1 %173, label %bb.i2.i160, label %bb2.i.i.i159

bb2.i.i.i159:                                     ; preds = %bb.i.i.i155, %_ZN9benchmark4copyIP12ValueWrapperIdES3_EEvT_S4_T0_.exit.i152
  %indvar.i.i.i156 = phi i32 [ 0, %_ZN9benchmark4copyIP12ValueWrapperIdES3_EEvT_S4_T0_.exit.i152 ], [ %tmp818, %bb.i.i.i155 ] ; <i32> [#uses=2]
  %tmp818 = add i32 %indvar.i.i.i156, 1           ; <i32> [#uses=3]
  %first_addr.0.i.i.i158.idx.mask = and i32 %tmp818, 536870911 ; <i32> [#uses=1]
  %174 = icmp eq i32 %first_addr.0.i.i.i158.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %174, label %_Z13verify_sortedIP12ValueWrapperIdEEvT_S3_.exit.i161, label %bb.i.i.i155

bb.i2.i160:                                       ; preds = %bb.i.i.i155
  %175 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIP12ValueWrapperIdEEvT_S3_.exit.i161

_Z13verify_sortedIP12ValueWrapperIdEEvT_S3_.exit.i161: ; preds = %bb.i2.i160, %bb2.i.i.i159
  %176 = icmp slt i32 %tmp12.i144, %151           ; <i1> [#uses=1]
  br i1 %176, label %bb.i145, label %_Z14test_quicksortIP12ValueWrapperIdES1_EvT_S3_S3_S3_T0_PKc.exit

_Z14test_quicksortIP12ValueWrapperIdES1_EvT_S3_S3_S3_T0_PKc.exit: ; preds = %_Z13verify_sortedIP12ValueWrapperIdEEvT_S3_.exit.i161
  br i1 %152, label %bb.i125, label %_Z14test_heap_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit

bb.i125:                                          ; preds = %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIdEEEvT_S4_.exit.i141, %_Z14test_quicksortIP12ValueWrapperIdES1_EvT_S3_S3_S3_T0_PKc.exit
  %i.03.i123 = phi i32 [ %tmp12.i124, %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIdEEEvT_S4_.exit.i141 ], [ 0, %_Z14test_quicksortIP12ValueWrapperIdES1_EvT_S3_S3_S3_T0_PKc.exit ] ; <i32> [#uses=1]
  %tmp12.i124 = add i32 %i.03.i123, 1             ; <i32> [#uses=2]
  br label %bb.i.i131

bb.i.i131:                                        ; preds = %bb.i.i131, %bb.i125
  %indvar.i.i126 = phi i32 [ 0, %bb.i125 ], [ %tmp799, %bb.i.i131 ] ; <i32> [#uses=3]
  %tmp799 = add i32 %indvar.i.i126, 1             ; <i32> [#uses=2]
  %scevgep4.i.i130 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VDataMaster, i32 0, i32 %indvar.i.i126, i32 0 ; <double*> [#uses=1]
  %scevgep67.i.i129 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %indvar.i.i126, i32 0 ; <double*> [#uses=1]
  %177 = load double* %scevgep4.i.i130, align 8   ; <double> [#uses=1]
  store double %177, double* %scevgep67.i.i129, align 8
  %scevgep5.i.i128.idx.mask = and i32 %tmp799, 536870911 ; <i32> [#uses=1]
  %178 = icmp eq i32 %scevgep5.i.i128.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %178, label %_ZN9benchmark4copyI14PointerWrapperI12ValueWrapperIdEES4_EEvT_S5_T0_.exit.i132, label %bb.i.i131

_ZN9benchmark4copyI14PointerWrapperI12ValueWrapperIdEES4_EEvT_S5_T0_.exit.i132: ; preds = %bb.i.i131
  tail call fastcc void @_ZN9benchmark9quicksortI14PointerWrapperI12ValueWrapperIdEES3_EEvT_S5_(%"struct.ValueWrapper<double>"* getelementptr inbounds ([2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 0), %"struct.ValueWrapper<double>"* getelementptr ([2000 x %"struct.ValueWrapper<double>"]* @VData, i32 1, i32 0)) nounwind
  br label %bb2.i.i.i139

bb.i.i.i135:                                      ; preds = %bb2.i.i.i139
  %scevgep56.i.i.i133 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %tmp805, i32 0 ; <double*> [#uses=1]
  %scevgep4.i.i.i134 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %indvar.i.i.i136, i32 0 ; <double*> [#uses=1]
  %179 = load double* %scevgep56.i.i.i133, align 8 ; <double> [#uses=1]
  %180 = load double* %scevgep4.i.i.i134, align 8 ; <double> [#uses=1]
  %181 = fcmp olt double %179, %180               ; <i1> [#uses=1]
  br i1 %181, label %bb.i2.i140, label %bb2.i.i.i139

bb2.i.i.i139:                                     ; preds = %bb.i.i.i135, %_ZN9benchmark4copyI14PointerWrapperI12ValueWrapperIdEES4_EEvT_S5_T0_.exit.i132
  %indvar.i.i.i136 = phi i32 [ 0, %_ZN9benchmark4copyI14PointerWrapperI12ValueWrapperIdEES4_EEvT_S5_T0_.exit.i132 ], [ %tmp805, %bb.i.i.i135 ] ; <i32> [#uses=2]
  %tmp805 = add i32 %indvar.i.i.i136, 1           ; <i32> [#uses=3]
  %first_addr.0.0.i.i.i138.idx.mask = and i32 %tmp805, 536870911 ; <i32> [#uses=1]
  %182 = icmp eq i32 %first_addr.0.0.i.i.i138.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %182, label %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIdEEEvT_S4_.exit.i141, label %bb.i.i.i135

bb.i2.i140:                                       ; preds = %bb.i.i.i135
  %183 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIdEEEvT_S4_.exit.i141

_Z13verify_sortedI14PointerWrapperI12ValueWrapperIdEEEvT_S4_.exit.i141: ; preds = %bb.i2.i140, %bb2.i.i.i139
  %184 = icmp slt i32 %tmp12.i124, %151           ; <i1> [#uses=1]
  br i1 %184, label %bb.i125, label %_Z14test_quicksortI14PointerWrapperI12ValueWrapperIdEES2_EvT_S4_S4_S4_T0_PKc.exit

_Z14test_quicksortI14PointerWrapperI12ValueWrapperIdEES2_EvT_S4_S4_S4_T0_PKc.exit: ; preds = %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIdEEEvT_S4_.exit.i141
  br i1 %152, label %bb.i105, label %_Z14test_heap_sortIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_SC_SC_T0_PKc.exit.thread.critedge

bb.i105:                                          ; preds = %_Z13verify_sortedIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEEEvT_SC_.exit.i121, %_Z14test_quicksortI14PointerWrapperI12ValueWrapperIdEES2_EvT_S4_S4_S4_T0_PKc.exit
  %i.03.i103 = phi i32 [ %tmp12.i104, %_Z13verify_sortedIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEEEvT_SC_.exit.i121 ], [ 0, %_Z14test_quicksortI14PointerWrapperI12ValueWrapperIdEES2_EvT_S4_S4_S4_T0_PKc.exit ] ; <i32> [#uses=1]
  %tmp12.i104 = add i32 %i.03.i103, 1             ; <i32> [#uses=2]
  br label %bb.i.i111

bb.i.i111:                                        ; preds = %bb.i.i111, %bb.i105
  %indvar.i.i106 = phi i32 [ 0, %bb.i105 ], [ %tmp786, %bb.i.i111 ] ; <i32> [#uses=3]
  %tmp786 = add i32 %indvar.i.i106, 1             ; <i32> [#uses=2]
  %scevgep34.i.i110 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10DataMaster, i32 0, i32 %indvar.i.i106, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %scevgep56.i.i109 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %indvar.i.i106, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %185 = load double* %scevgep34.i.i110, align 8  ; <double> [#uses=1]
  store double %185, double* %scevgep56.i.i109, align 8
  %scevgep.i.i108.idx.mask = and i32 %tmp786, 536870911 ; <i32> [#uses=1]
  %186 = icmp eq i32 %scevgep.i.i108.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %186, label %_ZN9benchmark4copyIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESC_EEvT_SD_T0_.exit.i112, label %bb.i.i111

_ZN9benchmark4copyIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESC_EEvT_SD_T0_.exit.i112: ; preds = %bb.i.i111
  tail call fastcc void @_ZN9benchmark9quicksortIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEvT_SD_(%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* getelementptr inbounds ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 0), %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* getelementptr ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 1, i32 0)) nounwind
  br label %bb2.i.i.i119

bb.i.i.i115:                                      ; preds = %bb2.i.i.i119
  %scevgep23.i.i.i113 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %tmp792, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %scevgep1.i.i.i114 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %indvar.i.i.i116, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %187 = load double* %scevgep23.i.i.i113, align 8 ; <double> [#uses=1]
  %188 = load double* %scevgep1.i.i.i114, align 8 ; <double> [#uses=1]
  %189 = fcmp olt double %187, %188               ; <i1> [#uses=1]
  br i1 %189, label %bb.i2.i120, label %bb2.i.i.i119

bb2.i.i.i119:                                     ; preds = %bb.i.i.i115, %_ZN9benchmark4copyIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESC_EEvT_SD_T0_.exit.i112
  %indvar.i.i.i116 = phi i32 [ 0, %_ZN9benchmark4copyIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESC_EEvT_SD_T0_.exit.i112 ], [ %tmp792, %bb.i.i.i115 ] ; <i32> [#uses=2]
  %tmp792 = add i32 %indvar.i.i.i116, 1           ; <i32> [#uses=3]
  %first_addr.0.i.i.i118.idx.mask = and i32 %tmp792, 536870911 ; <i32> [#uses=1]
  %190 = icmp eq i32 %first_addr.0.i.i.i118.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %190, label %_Z13verify_sortedIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEEEvT_SC_.exit.i121, label %bb.i.i.i115

bb.i2.i120:                                       ; preds = %bb.i.i.i115
  %191 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEEEvT_SC_.exit.i121

_Z13verify_sortedIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEEEvT_SC_.exit.i121: ; preds = %bb.i2.i120, %bb2.i.i.i119
  %192 = icmp slt i32 %tmp12.i104, %151           ; <i1> [#uses=1]
  br i1 %192, label %bb.i105, label %_Z14test_quicksortIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_SC_SC_T0_PKc.exit

_Z14test_quicksortIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_SC_SC_T0_PKc.exit: ; preds = %_Z13verify_sortedIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEEEvT_SC_.exit.i121
  br i1 %152, label %bb.i82, label %_Z14test_heap_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit

bb.i82:                                           ; preds = %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEEEvT_SD_.exit.i98, %_Z14test_quicksortIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_SC_SC_T0_PKc.exit
  %i.03.i80 = phi i32 [ %tmp12.i81, %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEEEvT_SD_.exit.i98 ], [ 0, %_Z14test_quicksortIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_SC_SC_T0_PKc.exit ] ; <i32> [#uses=1]
  %tmp12.i81 = add i32 %i.03.i80, 1               ; <i32> [#uses=2]
  br label %bb.i.i88

bb.i.i88:                                         ; preds = %bb.i.i88, %bb.i82
  %indvar.i.i83 = phi i32 [ 0, %bb.i82 ], [ %tmp773, %bb.i.i88 ] ; <i32> [#uses=3]
  %tmp773 = add i32 %indvar.i.i83, 1              ; <i32> [#uses=2]
  %scevgep4.i.i87 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10DataMaster, i32 0, i32 %indvar.i.i83, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %scevgep67.i.i86 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %indvar.i.i83, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %193 = load double* %scevgep4.i.i87, align 8    ; <double> [#uses=1]
  store double %193, double* %scevgep67.i.i86, align 8
  %scevgep5.i.i85.idx.mask = and i32 %tmp773, 536870911 ; <i32> [#uses=1]
  %194 = icmp eq i32 %scevgep5.i.i85.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %194, label %_ZN9benchmark4copyI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESD_EEvT_SE_T0_.exit.i89, label %bb.i.i88

_ZN9benchmark4copyI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESD_EEvT_SE_T0_.exit.i89: ; preds = %bb.i.i88
  tail call fastcc void @_ZN9benchmark9quicksortI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEvT_SE_(%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* getelementptr inbounds ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 0), %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* getelementptr ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 1, i32 0)) nounwind
  br label %bb2.i.i.i96

bb.i.i.i92:                                       ; preds = %bb2.i.i.i96
  %scevgep45.i.i.i90 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %tmp779, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %scevgep3.i.i.i91 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %indvar.i.i.i93, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %195 = load double* %scevgep45.i.i.i90, align 8 ; <double> [#uses=1]
  %196 = load double* %scevgep3.i.i.i91, align 8  ; <double> [#uses=1]
  %197 = fcmp olt double %195, %196               ; <i1> [#uses=1]
  br i1 %197, label %bb.i2.i97, label %bb2.i.i.i96

bb2.i.i.i96:                                      ; preds = %bb.i.i.i92, %_ZN9benchmark4copyI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESD_EEvT_SE_T0_.exit.i89
  %indvar.i.i.i93 = phi i32 [ 0, %_ZN9benchmark4copyI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESD_EEvT_SE_T0_.exit.i89 ], [ %tmp779, %bb.i.i.i92 ] ; <i32> [#uses=2]
  %tmp779 = add i32 %indvar.i.i.i93, 1            ; <i32> [#uses=3]
  %first_addr.0.0.i.i.i95.idx.mask = and i32 %tmp779, 536870911 ; <i32> [#uses=1]
  %198 = icmp eq i32 %first_addr.0.0.i.i.i95.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %198, label %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEEEvT_SD_.exit.i98, label %bb.i.i.i92

bb.i2.i97:                                        ; preds = %bb.i.i.i92
  %199 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEEEvT_SD_.exit.i98

_Z13verify_sortedI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEEEvT_SD_.exit.i98: ; preds = %bb.i2.i97, %bb2.i.i.i96
  %200 = icmp slt i32 %tmp12.i81, %151            ; <i1> [#uses=1]
  br i1 %200, label %bb.i82, label %_Z14test_quicksortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit

_Z14test_quicksortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit: ; preds = %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEEEvT_SD_.exit.i98
  br i1 %152, label %bb.i65, label %_Z14test_heap_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit

bb.i65:                                           ; preds = %_Z13verify_sortedIPdEvT_S1_.exit.i, %_Z14test_quicksortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit
  %i.03.i63 = phi i32 [ %tmp5.i64, %_Z13verify_sortedIPdEvT_S1_.exit.i ], [ 0, %_Z14test_quicksortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit ] ; <i32> [#uses=1]
  %tmp5.i64 = add i32 %i.03.i63, 1                ; <i32> [#uses=2]
  br label %bb.i.i69

bb.i.i69:                                         ; preds = %bb.i.i69, %bb.i65
  %indvar.i.i66 = phi i32 [ 0, %bb.i65 ], [ %tmp764, %bb.i.i69 ] ; <i32> [#uses=3]
  %tmp764 = add i32 %indvar.i.i66, 1              ; <i32> [#uses=2]
  %firstSource_addr.02.i.i = getelementptr [2000 x double]* @dataMaster, i32 0, i32 %indvar.i.i66 ; <double*> [#uses=1]
  %firstDest_addr.01.i.i = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i66 ; <double*> [#uses=1]
  %201 = load double* %firstSource_addr.02.i.i, align 8 ; <double> [#uses=1]
  store double %201, double* %firstDest_addr.01.i.i, align 8
  %scevgep.i.i68.idx.mask = and i32 %tmp764, 536870911 ; <i32> [#uses=1]
  %202 = icmp eq i32 %scevgep.i.i68.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %202, label %_ZN9benchmark4copyIPdS1_EEvT_S2_T0_.exit.i, label %bb.i.i69

_ZN9benchmark4copyIPdS1_EEvT_S2_T0_.exit.i:       ; preds = %bb.i.i69
  br i1 icmp slt (i32 add (i32 sdiv (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 16), i32 -1), i32 0), label %bb5.loopexit.i, label %bb.i1

bb.i1:                                            ; preds = %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit.i, %_ZN9benchmark4copyIPdS1_EEvT_S2_T0_.exit.i
  %indvar29.i = phi i32 [ %indvar.next30.i, %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit.i ], [ 0, %_ZN9benchmark4copyIPdS1_EEvT_S2_T0_.exit.i ] ; <i32> [#uses=4]
  %j.0.i = sub i32 add (i32 sdiv (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 16), i32 -2), %indvar29.i ; <i32> [#uses=1]
  %j.024.i = sub i32 add (i32 sdiv (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 16), i32 -1), %indvar29.i ; <i32> [#uses=4]
  %scevgep36.i = getelementptr [2000 x double]* @data, i32 0, i32 %j.024.i ; <double*> [#uses=1]
  %tmp37.i = mul i32 %indvar29.i, -2              ; <i32> [#uses=1]
  %i.13.i.i = add i32 %tmp37.i, shl (i32 sdiv (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 16), i32 1) ; <i32> [#uses=3]
  %203 = load double* %scevgep36.i, align 8       ; <double> [#uses=2]
  %204 = icmp slt i32 %i.13.i.i, ashr (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 3) ; <i1> [#uses=1]
  br i1 %204, label %bb.i.i2, label %bb4.i.i

bb.i.i2:                                          ; preds = %bb.i.i2, %bb.i1
  %i.14.i.i = phi i32 [ %phitmp.i.i, %bb.i.i2 ], [ %i.13.i.i, %bb.i1 ] ; <i32> [#uses=3]
  %free.01.i.i = phi i32 [ %212, %bb.i.i2 ], [ %j.024.i, %bb.i1 ] ; <i32> [#uses=1]
  %205 = add i32 %i.14.i.i, -1                    ; <i32> [#uses=1]
  %206 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %205 ; <double*> [#uses=1]
  %207 = load double* %206, align 8               ; <double> [#uses=1]
  %208 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %i.14.i.i ; <double*> [#uses=1]
  %209 = load double* %208, align 8               ; <double> [#uses=1]
  %210 = fcmp olt double %207, %209               ; <i1> [#uses=1]
  %211 = zext i1 %210 to i32                      ; <i32> [#uses=1]
  %i.0.i.i = or i32 %211, %i.14.i.i               ; <i32> [#uses=2]
  %212 = add i32 %i.0.i.i, -1                     ; <i32> [#uses=3]
  %213 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %212 ; <double*> [#uses=1]
  %214 = load double* %213, align 8               ; <double> [#uses=1]
  %215 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.01.i.i ; <double*> [#uses=1]
  store double %214, double* %215, align 8
  %phitmp.i.i = shl i32 %i.0.i.i, 1               ; <i32> [#uses=3]
  %216 = icmp slt i32 %phitmp.i.i, ashr (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 3) ; <i1> [#uses=1]
  br i1 %216, label %bb.i.i2, label %bb4.i.i

bb4.i.i:                                          ; preds = %bb.i.i2, %bb.i1
  %i.1.lcssa.i.i = phi i32 [ %i.13.i.i, %bb.i1 ], [ %phitmp.i.i, %bb.i.i2 ] ; <i32> [#uses=2]
  %free.0.lcssa.i.i = phi i32 [ %j.024.i, %bb.i1 ], [ %212, %bb.i.i2 ] ; <i32> [#uses=3]
  %217 = icmp eq i32 %i.1.lcssa.i.i, ashr (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 3) ; <i1> [#uses=1]
  br i1 %217, label %bb5.i.i, label %bb8.i.i

bb5.i.i:                                          ; preds = %bb4.i.i
  %218 = add i32 %i.1.lcssa.i.i, -1               ; <i32> [#uses=3]
  %219 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %218 ; <double*> [#uses=1]
  %220 = load double* %219, align 8               ; <double> [#uses=1]
  %221 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.0.lcssa.i.i ; <double*> [#uses=1]
  store double %220, double* %221, align 8
  br label %bb8.i.i

bb7.i.i3:                                         ; preds = %bb9.i.i
  %222 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.2.i.i ; <double*> [#uses=1]
  store double %225, double* %222, align 8
  br label %bb8.i.i

bb8.i.i:                                          ; preds = %bb7.i.i3, %bb5.i.i, %bb4.i.i
  %free.2.i.i = phi i32 [ %i.2.i.i, %bb7.i.i3 ], [ %218, %bb5.i.i ], [ %free.0.lcssa.i.i, %bb4.i.i ] ; <i32> [#uses=3]
  %i.2.in.in.i.i = phi i32 [ %i.2.i.i, %bb7.i.i3 ], [ %218, %bb5.i.i ], [ %free.0.lcssa.i.i, %bb4.i.i ] ; <i32> [#uses=1]
  %i.2.in.i.i = add i32 %i.2.in.in.i.i, -1        ; <i32> [#uses=1]
  %i.2.i.i = sdiv i32 %i.2.in.i.i, 2              ; <i32> [#uses=3]
  %223 = icmp sgt i32 %free.2.i.i, %j.024.i       ; <i1> [#uses=1]
  br i1 %223, label %bb9.i.i, label %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit.i

bb9.i.i:                                          ; preds = %bb8.i.i
  %224 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %i.2.i.i ; <double*> [#uses=1]
  %225 = load double* %224, align 8               ; <double> [#uses=2]
  %226 = fcmp olt double %225, %203               ; <i1> [#uses=1]
  br i1 %226, label %bb7.i.i3, label %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit.i

_ZN9benchmark7sift_inIPddEEviT_iT0_.exit.i:       ; preds = %bb9.i.i, %bb8.i.i
  %227 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.2.i.i ; <double*> [#uses=1]
  store double %203, double* %227, align 8
  %228 = icmp slt i32 %j.0.i, 0                   ; <i1> [#uses=1]
  %indvar.next30.i = add i32 %indvar29.i, 1       ; <i32> [#uses=1]
  br i1 %228, label %bb5.loopexit.i, label %bb.i1

bb4.i:                                            ; preds = %bb5.loopexit.i, %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit17.i
  %indvar.i4 = phi i32 [ %indvar.next.i, %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit17.i ], [ 0, %bb5.loopexit.i ] ; <i32> [#uses=2]
  %j.120.i = sub i32 add (i32 ashr (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 3), i32 -1), %indvar.i4 ; <i32> [#uses=4]
  %scevgep.i = getelementptr [2000 x double]* @data, i32 0, i32 %j.120.i ; <double*> [#uses=2]
  %229 = load double* %scevgep.i, align 8         ; <double> [#uses=2]
  %230 = load double* getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0), align 32 ; <double> [#uses=1]
  store double %230, double* %scevgep.i, align 8
  %231 = icmp sgt i32 %j.120.i, 2                 ; <i1> [#uses=1]
  br i1 %231, label %bb.i5.i, label %bb4.i8.i

bb.i5.i:                                          ; preds = %bb.i5.i, %bb4.i
  %i.14.i1.i = phi i32 [ %phitmp.i4.i, %bb.i5.i ], [ 2, %bb4.i ] ; <i32> [#uses=3]
  %free.01.i2.i = phi i32 [ %239, %bb.i5.i ], [ 0, %bb4.i ] ; <i32> [#uses=1]
  %232 = add i32 %i.14.i1.i, -1                   ; <i32> [#uses=1]
  %233 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %232 ; <double*> [#uses=1]
  %234 = load double* %233, align 8               ; <double> [#uses=1]
  %235 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %i.14.i1.i ; <double*> [#uses=1]
  %236 = load double* %235, align 16              ; <double> [#uses=1]
  %237 = fcmp olt double %234, %236               ; <i1> [#uses=1]
  %238 = zext i1 %237 to i32                      ; <i32> [#uses=1]
  %i.0.i3.i = or i32 %238, %i.14.i1.i             ; <i32> [#uses=2]
  %239 = add i32 %i.0.i3.i, -1                    ; <i32> [#uses=3]
  %240 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %239 ; <double*> [#uses=1]
  %241 = load double* %240, align 8               ; <double> [#uses=1]
  %242 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.01.i2.i ; <double*> [#uses=1]
  store double %241, double* %242, align 8
  %phitmp.i4.i = shl i32 %i.0.i3.i, 1             ; <i32> [#uses=3]
  %243 = icmp slt i32 %phitmp.i4.i, %j.120.i      ; <i1> [#uses=1]
  br i1 %243, label %bb.i5.i, label %bb4.i8.i

bb4.i8.i:                                         ; preds = %bb.i5.i, %bb4.i
  %i.1.lcssa.i6.i = phi i32 [ 2, %bb4.i ], [ %phitmp.i4.i, %bb.i5.i ] ; <i32> [#uses=2]
  %free.0.lcssa.i7.i = phi i32 [ 0, %bb4.i ], [ %239, %bb.i5.i ] ; <i32> [#uses=3]
  %244 = icmp eq i32 %i.1.lcssa.i6.i, %j.120.i    ; <i1> [#uses=1]
  br i1 %244, label %bb5.i9.i, label %bb8.i15.i

bb5.i9.i:                                         ; preds = %bb4.i8.i
  %245 = add i32 %i.1.lcssa.i6.i, -1              ; <i32> [#uses=3]
  %246 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %245 ; <double*> [#uses=1]
  %247 = load double* %246, align 8               ; <double> [#uses=1]
  %248 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.0.lcssa.i7.i ; <double*> [#uses=1]
  store double %247, double* %248, align 8
  br label %bb8.i15.i

bb7.i10.i:                                        ; preds = %bb9.i16.i
  %249 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.2.i11.i ; <double*> [#uses=1]
  store double %252, double* %249, align 8
  br label %bb8.i15.i

bb8.i15.i:                                        ; preds = %bb7.i10.i, %bb5.i9.i, %bb4.i8.i
  %free.2.i11.i = phi i32 [ %i.2.i14.i, %bb7.i10.i ], [ %245, %bb5.i9.i ], [ %free.0.lcssa.i7.i, %bb4.i8.i ] ; <i32> [#uses=3]
  %i.2.in.in.i12.i = phi i32 [ %i.2.i14.i, %bb7.i10.i ], [ %245, %bb5.i9.i ], [ %free.0.lcssa.i7.i, %bb4.i8.i ] ; <i32> [#uses=1]
  %i.2.in.i13.i = add i32 %i.2.in.in.i12.i, -1    ; <i32> [#uses=1]
  %i.2.i14.i = sdiv i32 %i.2.in.i13.i, 2          ; <i32> [#uses=3]
  %250 = icmp sgt i32 %free.2.i11.i, 0            ; <i1> [#uses=1]
  br i1 %250, label %bb9.i16.i, label %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit17.i

bb9.i16.i:                                        ; preds = %bb8.i15.i
  %251 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %i.2.i14.i ; <double*> [#uses=1]
  %252 = load double* %251, align 8               ; <double> [#uses=2]
  %253 = fcmp olt double %252, %229               ; <i1> [#uses=1]
  br i1 %253, label %bb7.i10.i, label %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit17.i

_ZN9benchmark7sift_inIPddEEviT_iT0_.exit17.i:     ; preds = %bb9.i16.i, %bb8.i15.i
  %254 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.2.i11.i ; <double*> [#uses=1]
  store double %229, double* %254, align 8
  %indvar.next.i = add i32 %indvar.i4, 1          ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %indvar.next.i, add (i32 ashr (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 3), i32 -1) ; <i1> [#uses=1]
  br i1 %exitcond.i, label %bb2.i.i.i74, label %bb4.i

bb5.loopexit.i:                                   ; preds = %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit.i, %_ZN9benchmark4copyIPdS1_EEvT_S2_T0_.exit.i
  br i1 icmp sgt (i32 add (i32 ashr (i32 sub (i32 ptrtoint (double* getelementptr ([2000 x double]* @data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x double]* @data to i32)), i32 3), i32 -1), i32 0), label %bb4.i, label %bb2.i.i.i74

bb.i.i.i70:                                       ; preds = %bb2.i.i.i74
  %prev.0.i.i.i = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i.i71 ; <double*> [#uses=1]
  %255 = load double* %first_addr.0.i.i.i73, align 8 ; <double> [#uses=1]
  %256 = load double* %prev.0.i.i.i, align 8      ; <double> [#uses=1]
  %257 = fcmp olt double %255, %256               ; <i1> [#uses=1]
  br i1 %257, label %bb.i2.i75, label %bb2.i.i.i74

bb2.i.i.i74:                                      ; preds = %bb.i.i.i70, %bb5.loopexit.i, %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit17.i
  %indvar.i.i.i71 = phi i32 [ %tmp768, %bb.i.i.i70 ], [ 0, %_ZN9benchmark7sift_inIPddEEviT_iT0_.exit17.i ], [ 0, %bb5.loopexit.i ] ; <i32> [#uses=2]
  %tmp768 = add i32 %indvar.i.i.i71, 1            ; <i32> [#uses=2]
  %first_addr.0.i.i.i73 = getelementptr [2000 x double]* @data, i32 0, i32 %tmp768 ; <double*> [#uses=2]
  %258 = icmp eq double* %first_addr.0.i.i.i73, getelementptr ([2000 x double]* @data, i32 1, i32 0) ; <i1> [#uses=1]
  br i1 %258, label %_Z13verify_sortedIPdEvT_S1_.exit.i, label %bb.i.i.i70

bb.i2.i75:                                        ; preds = %bb.i.i.i70
  %259 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIPdEvT_S1_.exit.i

_Z13verify_sortedIPdEvT_S1_.exit.i:               ; preds = %bb.i2.i75, %bb2.i.i.i74
  %260 = icmp slt i32 %tmp5.i64, %151             ; <i1> [#uses=1]
  br i1 %260, label %bb.i65, label %_Z14test_heap_sortIPddEvT_S1_S1_S1_T0_PKc.exit

_Z14test_heap_sortIPddEvT_S1_S1_S1_T0_PKc.exit:   ; preds = %_Z13verify_sortedIPdEvT_S1_.exit.i
  br i1 %152, label %bb.i52, label %_Z14test_heap_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit

bb.i52:                                           ; preds = %_Z13verify_sortedI14PointerWrapperIdEEvT_S2_.exit.i, %_Z14test_heap_sortIPddEvT_S1_S1_S1_T0_PKc.exit
  %i.03.i51 = phi i32 [ %tmp5.i, %_Z13verify_sortedI14PointerWrapperIdEEvT_S2_.exit.i ], [ 0, %_Z14test_heap_sortIPddEvT_S1_S1_S1_T0_PKc.exit ] ; <i32> [#uses=1]
  %tmp5.i = add i32 %i.03.i51, 1                  ; <i32> [#uses=2]
  br label %bb.i.i56

bb.i.i56:                                         ; preds = %bb.i.i56, %bb.i52
  %indvar.i.i53 = phi i32 [ 0, %bb.i52 ], [ %tmp755, %bb.i.i56 ] ; <i32> [#uses=3]
  %tmp755 = add i32 %indvar.i.i53, 1              ; <i32> [#uses=2]
  %firstSource_addr.0.03.i.i = getelementptr [2000 x double]* @dataMaster, i32 0, i32 %indvar.i.i53 ; <double*> [#uses=1]
  %firstDest_addr.0.02.i.i = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i53 ; <double*> [#uses=1]
  %261 = load double* %firstSource_addr.0.03.i.i, align 8 ; <double> [#uses=1]
  store double %261, double* %firstDest_addr.0.02.i.i, align 8
  %scevgep.i.i55.idx.mask = and i32 %tmp755, 536870911 ; <i32> [#uses=1]
  %262 = icmp eq i32 %scevgep.i.i55.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %262, label %bb.i159, label %bb.i.i56

bb.i159:                                          ; preds = %_ZN9benchmark7sift_inI14PointerWrapperIdEdEEviT_iT0_.exit17.i, %bb.i.i56
  %indvar29.i155 = phi i32 [ %indvar.next30.i176, %_ZN9benchmark7sift_inI14PointerWrapperIdEdEEviT_iT0_.exit17.i ], [ 0, %bb.i.i56 ] ; <i32> [#uses=4]
  %j.0.i156 = sub i32 998, %indvar29.i155         ; <i32> [#uses=1]
  %j.024.i157 = sub i32 999, %indvar29.i155       ; <i32> [#uses=4]
  %tmp36.i = mul i32 %indvar29.i155, -2           ; <i32> [#uses=1]
  %i.13.i.i158 = add i32 %tmp36.i, 2000           ; <i32> [#uses=3]
  %scevgep39.i = getelementptr [2000 x double]* @data, i32 0, i32 %j.024.i157 ; <double*> [#uses=1]
  %263 = load double* %scevgep39.i, align 8       ; <double> [#uses=2]
  %264 = icmp slt i32 %i.13.i.i158, 2000          ; <i1> [#uses=1]
  br i1 %264, label %bb.i5.i164, label %bb4.i8.i167

bb.i5.i164:                                       ; preds = %bb.i5.i164, %bb.i159
  %i.14.i1.i160 = phi i32 [ %phitmp.i4.i163, %bb.i5.i164 ], [ %i.13.i.i158, %bb.i159 ] ; <i32> [#uses=3]
  %free.01.i2.i161 = phi i32 [ %273, %bb.i5.i164 ], [ %j.024.i157, %bb.i159 ] ; <i32> [#uses=1]
  %265 = add i32 %i.14.i1.i160, -1                ; <i32> [#uses=1]
  %266 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %265 ; <double*> [#uses=1]
  %267 = load double* %266, align 8               ; <double> [#uses=1]
  %268 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %i.14.i1.i160 ; <double*> [#uses=1]
  %269 = load double* %268, align 8               ; <double> [#uses=1]
  %270 = fcmp olt double %267, %269               ; <i1> [#uses=1]
  %271 = zext i1 %270 to i32                      ; <i32> [#uses=1]
  %i.0.i3.i162 = or i32 %271, %i.14.i1.i160       ; <i32> [#uses=2]
  %272 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.01.i2.i161 ; <double*> [#uses=1]
  %273 = add i32 %i.0.i3.i162, -1                 ; <i32> [#uses=3]
  %274 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %273 ; <double*> [#uses=1]
  %275 = load double* %274, align 8               ; <double> [#uses=1]
  store double %275, double* %272, align 8
  %phitmp.i4.i163 = shl i32 %i.0.i3.i162, 1       ; <i32> [#uses=3]
  %276 = icmp slt i32 %phitmp.i4.i163, 2000       ; <i1> [#uses=1]
  br i1 %276, label %bb.i5.i164, label %bb4.i8.i167

bb4.i8.i167:                                      ; preds = %bb.i5.i164, %bb.i159
  %i.1.lcssa.i6.i165 = phi i32 [ %i.13.i.i158, %bb.i159 ], [ %phitmp.i4.i163, %bb.i5.i164 ] ; <i32> [#uses=2]
  %free.0.lcssa.i7.i166 = phi i32 [ %j.024.i157, %bb.i159 ], [ %273, %bb.i5.i164 ] ; <i32> [#uses=3]
  %277 = icmp eq i32 %i.1.lcssa.i6.i165, 2000     ; <i1> [#uses=1]
  br i1 %277, label %bb5.i9.i168, label %bb8.i15.i174

bb5.i9.i168:                                      ; preds = %bb4.i8.i167
  %278 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.0.lcssa.i7.i166 ; <double*> [#uses=1]
  %279 = add i32 %i.1.lcssa.i6.i165, -1           ; <i32> [#uses=3]
  %280 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %279 ; <double*> [#uses=1]
  %281 = load double* %280, align 8               ; <double> [#uses=1]
  store double %281, double* %278, align 8
  br label %bb8.i15.i174

bb7.i10.i169:                                     ; preds = %bb9.i16.i175
  %282 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.2.i11.i170 ; <double*> [#uses=1]
  store double %285, double* %282, align 8
  br label %bb8.i15.i174

bb8.i15.i174:                                     ; preds = %bb7.i10.i169, %bb5.i9.i168, %bb4.i8.i167
  %free.2.i11.i170 = phi i32 [ %i.2.i14.i173, %bb7.i10.i169 ], [ %279, %bb5.i9.i168 ], [ %free.0.lcssa.i7.i166, %bb4.i8.i167 ] ; <i32> [#uses=3]
  %i.2.in.in.i12.i171 = phi i32 [ %i.2.i14.i173, %bb7.i10.i169 ], [ %279, %bb5.i9.i168 ], [ %free.0.lcssa.i7.i166, %bb4.i8.i167 ] ; <i32> [#uses=1]
  %i.2.in.i13.i172 = add i32 %i.2.in.in.i12.i171, -1 ; <i32> [#uses=1]
  %i.2.i14.i173 = sdiv i32 %i.2.in.i13.i172, 2    ; <i32> [#uses=3]
  %283 = icmp sgt i32 %free.2.i11.i170, %j.024.i157 ; <i1> [#uses=1]
  br i1 %283, label %bb9.i16.i175, label %_ZN9benchmark7sift_inI14PointerWrapperIdEdEEviT_iT0_.exit17.i

bb9.i16.i175:                                     ; preds = %bb8.i15.i174
  %284 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %i.2.i14.i173 ; <double*> [#uses=1]
  %285 = load double* %284, align 8               ; <double> [#uses=2]
  %286 = fcmp uge double %285, %263               ; <i1> [#uses=1]
  br i1 %286, label %_ZN9benchmark7sift_inI14PointerWrapperIdEdEEviT_iT0_.exit17.i, label %bb7.i10.i169

_ZN9benchmark7sift_inI14PointerWrapperIdEdEEviT_iT0_.exit17.i: ; preds = %bb9.i16.i175, %bb8.i15.i174
  %287 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.2.i11.i170 ; <double*> [#uses=1]
  store double %263, double* %287, align 8
  %288 = icmp slt i32 %j.0.i156, 0                ; <i1> [#uses=1]
  %indvar.next30.i176 = add i32 %indvar29.i155, 1 ; <i32> [#uses=1]
  br i1 %288, label %bb4.i180, label %bb.i159

bb4.i180:                                         ; preds = %_ZN9benchmark7sift_inI14PointerWrapperIdEdEEviT_iT0_.exit.i, %_ZN9benchmark7sift_inI14PointerWrapperIdEdEEviT_iT0_.exit17.i
  %indvar.i177 = phi i32 [ %indvar.next.i197, %_ZN9benchmark7sift_inI14PointerWrapperIdEdEEviT_iT0_.exit.i ], [ 0, %_ZN9benchmark7sift_inI14PointerWrapperIdEdEEviT_iT0_.exit17.i ] ; <i32> [#uses=2]
  %j.120.i178 = sub i32 1999, %indvar.i177        ; <i32> [#uses=4]
  %scevgep.i179 = getelementptr [2000 x double]* @data, i32 0, i32 %j.120.i178 ; <double*> [#uses=2]
  %289 = load double* %scevgep.i179, align 8      ; <double> [#uses=2]
  %290 = load double* getelementptr inbounds ([2000 x double]* @data, i32 0, i32 0), align 32 ; <double> [#uses=1]
  store double %290, double* %scevgep.i179, align 8
  %291 = icmp sgt i32 %j.120.i178, 2              ; <i1> [#uses=1]
  br i1 %291, label %bb.i.i185, label %bb4.i.i188

bb.i.i185:                                        ; preds = %bb.i.i185, %bb4.i180
  %i.14.i.i181 = phi i32 [ %phitmp.i.i184, %bb.i.i185 ], [ 2, %bb4.i180 ] ; <i32> [#uses=3]
  %free.01.i.i182 = phi i32 [ %300, %bb.i.i185 ], [ 0, %bb4.i180 ] ; <i32> [#uses=1]
  %292 = add i32 %i.14.i.i181, -1                 ; <i32> [#uses=1]
  %293 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %292 ; <double*> [#uses=1]
  %294 = load double* %293, align 8               ; <double> [#uses=1]
  %295 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %i.14.i.i181 ; <double*> [#uses=1]
  %296 = load double* %295, align 16              ; <double> [#uses=1]
  %297 = fcmp olt double %294, %296               ; <i1> [#uses=1]
  %298 = zext i1 %297 to i32                      ; <i32> [#uses=1]
  %i.0.i.i183 = or i32 %298, %i.14.i.i181         ; <i32> [#uses=2]
  %299 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.01.i.i182 ; <double*> [#uses=1]
  %300 = add i32 %i.0.i.i183, -1                  ; <i32> [#uses=3]
  %301 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %300 ; <double*> [#uses=1]
  %302 = load double* %301, align 8               ; <double> [#uses=1]
  store double %302, double* %299, align 8
  %phitmp.i.i184 = shl i32 %i.0.i.i183, 1         ; <i32> [#uses=3]
  %303 = icmp slt i32 %phitmp.i.i184, %j.120.i178 ; <i1> [#uses=1]
  br i1 %303, label %bb.i.i185, label %bb4.i.i188

bb4.i.i188:                                       ; preds = %bb.i.i185, %bb4.i180
  %i.1.lcssa.i.i186 = phi i32 [ 2, %bb4.i180 ], [ %phitmp.i.i184, %bb.i.i185 ] ; <i32> [#uses=2]
  %free.0.lcssa.i.i187 = phi i32 [ 0, %bb4.i180 ], [ %300, %bb.i.i185 ] ; <i32> [#uses=3]
  %304 = icmp eq i32 %i.1.lcssa.i.i186, %j.120.i178 ; <i1> [#uses=1]
  br i1 %304, label %bb5.i.i189, label %bb8.i.i195

bb5.i.i189:                                       ; preds = %bb4.i.i188
  %305 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.0.lcssa.i.i187 ; <double*> [#uses=1]
  %306 = add i32 %i.1.lcssa.i.i186, -1            ; <i32> [#uses=3]
  %307 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %306 ; <double*> [#uses=1]
  %308 = load double* %307, align 8               ; <double> [#uses=1]
  store double %308, double* %305, align 8
  br label %bb8.i.i195

bb7.i.i190:                                       ; preds = %bb9.i.i196
  %309 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.2.i.i191 ; <double*> [#uses=1]
  store double %312, double* %309, align 8
  br label %bb8.i.i195

bb8.i.i195:                                       ; preds = %bb7.i.i190, %bb5.i.i189, %bb4.i.i188
  %free.2.i.i191 = phi i32 [ %i.2.i.i194, %bb7.i.i190 ], [ %306, %bb5.i.i189 ], [ %free.0.lcssa.i.i187, %bb4.i.i188 ] ; <i32> [#uses=3]
  %i.2.in.in.i.i192 = phi i32 [ %i.2.i.i194, %bb7.i.i190 ], [ %306, %bb5.i.i189 ], [ %free.0.lcssa.i.i187, %bb4.i.i188 ] ; <i32> [#uses=1]
  %i.2.in.i.i193 = add i32 %i.2.in.in.i.i192, -1  ; <i32> [#uses=1]
  %i.2.i.i194 = sdiv i32 %i.2.in.i.i193, 2        ; <i32> [#uses=3]
  %310 = icmp sgt i32 %free.2.i.i191, 0           ; <i1> [#uses=1]
  br i1 %310, label %bb9.i.i196, label %_ZN9benchmark7sift_inI14PointerWrapperIdEdEEviT_iT0_.exit.i

bb9.i.i196:                                       ; preds = %bb8.i.i195
  %311 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %i.2.i.i194 ; <double*> [#uses=1]
  %312 = load double* %311, align 8               ; <double> [#uses=2]
  %313 = fcmp uge double %312, %289               ; <i1> [#uses=1]
  br i1 %313, label %_ZN9benchmark7sift_inI14PointerWrapperIdEdEEviT_iT0_.exit.i, label %bb7.i.i190

_ZN9benchmark7sift_inI14PointerWrapperIdEdEEviT_iT0_.exit.i: ; preds = %bb9.i.i196, %bb8.i.i195
  %314 = getelementptr inbounds [2000 x double]* @data, i32 0, i32 %free.2.i.i191 ; <double*> [#uses=1]
  store double %289, double* %314, align 8
  %indvar.next.i197 = add i32 %indvar.i177, 1     ; <i32> [#uses=2]
  %exitcond.i198 = icmp eq i32 %indvar.next.i197, 1999 ; <i1> [#uses=1]
  br i1 %exitcond.i198, label %bb2.i.i.i60, label %bb4.i180

bb.i.i.i57:                                       ; preds = %bb2.i.i.i60
  %prev.0.0.i.i.i = getelementptr [2000 x double]* @data, i32 0, i32 %indvar.i.i.i58 ; <double*> [#uses=1]
  %315 = load double* %first_addr.0.0.i.i.i59, align 8 ; <double> [#uses=1]
  %316 = load double* %prev.0.0.i.i.i, align 8    ; <double> [#uses=1]
  %317 = fcmp olt double %315, %316               ; <i1> [#uses=1]
  br i1 %317, label %bb.i2.i61, label %bb2.i.i.i60

bb2.i.i.i60:                                      ; preds = %bb.i.i.i57, %_ZN9benchmark7sift_inI14PointerWrapperIdEdEEviT_iT0_.exit.i
  %indvar.i.i.i58 = phi i32 [ %tmp759, %bb.i.i.i57 ], [ 0, %_ZN9benchmark7sift_inI14PointerWrapperIdEdEEviT_iT0_.exit.i ] ; <i32> [#uses=2]
  %tmp759 = add i32 %indvar.i.i.i58, 1            ; <i32> [#uses=2]
  %first_addr.0.0.i.i.i59 = getelementptr [2000 x double]* @data, i32 0, i32 %tmp759 ; <double*> [#uses=2]
  %318 = icmp eq double* %first_addr.0.0.i.i.i59, getelementptr ([2000 x double]* @data, i32 1, i32 0) ; <i1> [#uses=1]
  br i1 %318, label %_Z13verify_sortedI14PointerWrapperIdEEvT_S2_.exit.i, label %bb.i.i.i57

bb.i2.i61:                                        ; preds = %bb.i.i.i57
  %319 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedI14PointerWrapperIdEEvT_S2_.exit.i

_Z13verify_sortedI14PointerWrapperIdEEvT_S2_.exit.i: ; preds = %bb.i2.i61, %bb2.i.i.i60
  %320 = icmp slt i32 %tmp5.i, %151               ; <i1> [#uses=1]
  br i1 %320, label %bb.i52, label %_Z14test_heap_sortI14PointerWrapperIdEdEvT_S2_S2_S2_T0_PKc.exit

_Z14test_heap_sortI14PointerWrapperIdEdEvT_S2_S2_S2_T0_PKc.exit: ; preds = %_Z13verify_sortedI14PointerWrapperIdEEvT_S2_.exit.i
  br i1 %152, label %bb.i36, label %_Z14test_heap_sortIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_SC_SC_T0_PKc.exit.thread.critedge

bb.i36:                                           ; preds = %_Z13verify_sortedIP12ValueWrapperIdEEvT_S3_.exit.i, %_Z14test_heap_sortI14PointerWrapperIdEdEvT_S2_S2_S2_T0_PKc.exit
  %i.03.i34 = phi i32 [ %tmp12.i35, %_Z13verify_sortedIP12ValueWrapperIdEEvT_S3_.exit.i ], [ 0, %_Z14test_heap_sortI14PointerWrapperIdEdEvT_S2_S2_S2_T0_PKc.exit ] ; <i32> [#uses=1]
  %tmp12.i35 = add i32 %i.03.i34, 1               ; <i32> [#uses=2]
  br label %bb.i.i41

bb.i.i41:                                         ; preds = %bb.i.i41, %bb.i36
  %indvar.i.i37 = phi i32 [ 0, %bb.i36 ], [ %tmp742, %bb.i.i41 ] ; <i32> [#uses=3]
  %tmp742 = add i32 %indvar.i.i37, 1              ; <i32> [#uses=2]
  %scevgep3.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VDataMaster, i32 0, i32 %indvar.i.i37, i32 0 ; <double*> [#uses=1]
  %scevgep56.i.i40 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %indvar.i.i37, i32 0 ; <double*> [#uses=1]
  %321 = load double* %scevgep3.i.i, align 8      ; <double> [#uses=1]
  store double %321, double* %scevgep56.i.i40, align 8
  %scevgep4.i.i39.idx.mask = and i32 %tmp742, 536870911 ; <i32> [#uses=1]
  %322 = icmp eq i32 %scevgep4.i.i39.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %322, label %_ZN9benchmark4copyIP12ValueWrapperIdES3_EEvT_S4_T0_.exit.i, label %bb.i.i41

_ZN9benchmark4copyIP12ValueWrapperIdES3_EEvT_S4_T0_.exit.i: ; preds = %bb.i.i41
  br i1 icmp slt (i32 add (i32 sdiv (i32 sub (i32 ptrtoint (%"struct.ValueWrapper<double>"* getelementptr ([2000 x %"struct.ValueWrapper<double>"]* @VData, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x %"struct.ValueWrapper<double>"]* @VData to i32)), i32 16), i32 -1), i32 0), label %bb7.loopexit.i153, label %bb.i112

bb.i112:                                          ; preds = %_ZN9benchmark7sift_inIP12ValueWrapperIdES2_EEviT_iT0_.exit.i, %_ZN9benchmark4copyIP12ValueWrapperIdES3_EEvT_S4_T0_.exit.i
  %indvar30.i108 = phi i32 [ %indvar.next31.i129, %_ZN9benchmark7sift_inIP12ValueWrapperIdES2_EEviT_iT0_.exit.i ], [ 0, %_ZN9benchmark4copyIP12ValueWrapperIdES3_EEvT_S4_T0_.exit.i ] ; <i32> [#uses=4]
  %j.0.i109 = sub i32 add (i32 sdiv (i32 sub (i32 ptrtoint (%"struct.ValueWrapper<double>"* getelementptr ([2000 x %"struct.ValueWrapper<double>"]* @VData, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x %"struct.ValueWrapper<double>"]* @VData to i32)), i32 16), i32 -2), %indvar30.i108 ; <i32> [#uses=1]
  %j.024.i110 = sub i32 add (i32 sdiv (i32 sub (i32 ptrtoint (%"struct.ValueWrapper<double>"* getelementptr ([2000 x %"struct.ValueWrapper<double>"]* @VData, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x %"struct.ValueWrapper<double>"]* @VData to i32)), i32 16), i32 -1), %indvar30.i108 ; <i32> [#uses=4]
  %scevgep3738.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %j.024.i110, i32 0 ; <double*> [#uses=1]
  %tmp39.i = mul i32 %indvar30.i108, -2           ; <i32> [#uses=1]
  %i.14.i.i111 = add i32 %tmp39.i, shl (i32 sdiv (i32 sub (i32 ptrtoint (%"struct.ValueWrapper<double>"* getelementptr ([2000 x %"struct.ValueWrapper<double>"]* @VData, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x %"struct.ValueWrapper<double>"]* @VData to i32)), i32 16), i32 1) ; <i32> [#uses=3]
  %323 = load double* %scevgep3738.i, align 8     ; <double> [#uses=2]
  %324 = icmp slt i32 %i.14.i.i111, ashr (i32 sub (i32 ptrtoint (%"struct.ValueWrapper<double>"* getelementptr ([2000 x %"struct.ValueWrapper<double>"]* @VData, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x %"struct.ValueWrapper<double>"]* @VData to i32)), i32 3) ; <i1> [#uses=1]
  br i1 %324, label %bb.i.i117, label %bb4.i.i120

bb.i.i117:                                        ; preds = %bb.i.i117, %bb.i112
  %i.15.i.i113 = phi i32 [ %phitmp.i.i116, %bb.i.i117 ], [ %i.14.i.i111, %bb.i112 ] ; <i32> [#uses=3]
  %free.02.i.i114 = phi i32 [ %332, %bb.i.i117 ], [ %j.024.i110, %bb.i112 ] ; <i32> [#uses=1]
  %325 = add i32 %i.15.i.i113, -1                 ; <i32> [#uses=1]
  %326 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %325, i32 0 ; <double*> [#uses=1]
  %327 = load double* %326, align 8               ; <double> [#uses=1]
  %328 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %i.15.i.i113, i32 0 ; <double*> [#uses=1]
  %329 = load double* %328, align 8               ; <double> [#uses=1]
  %330 = fcmp olt double %327, %329               ; <i1> [#uses=1]
  %331 = zext i1 %330 to i32                      ; <i32> [#uses=1]
  %i.1..i.i115 = or i32 %331, %i.15.i.i113        ; <i32> [#uses=2]
  %332 = add i32 %i.1..i.i115, -1                 ; <i32> [#uses=3]
  %333 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %332, i32 0 ; <double*> [#uses=1]
  %334 = load double* %333, align 8               ; <double> [#uses=1]
  %335 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %free.02.i.i114, i32 0 ; <double*> [#uses=1]
  store double %334, double* %335, align 8
  %phitmp.i.i116 = shl i32 %i.1..i.i115, 1        ; <i32> [#uses=3]
  %336 = icmp slt i32 %phitmp.i.i116, ashr (i32 sub (i32 ptrtoint (%"struct.ValueWrapper<double>"* getelementptr ([2000 x %"struct.ValueWrapper<double>"]* @VData, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x %"struct.ValueWrapper<double>"]* @VData to i32)), i32 3) ; <i1> [#uses=1]
  br i1 %336, label %bb.i.i117, label %bb4.i.i120

bb4.i.i120:                                       ; preds = %bb.i.i117, %bb.i112
  %i.1.lcssa.i.i118 = phi i32 [ %i.14.i.i111, %bb.i112 ], [ %phitmp.i.i116, %bb.i.i117 ] ; <i32> [#uses=2]
  %free.0.lcssa.i.i119 = phi i32 [ %j.024.i110, %bb.i112 ], [ %332, %bb.i.i117 ] ; <i32> [#uses=3]
  %337 = icmp eq i32 %i.1.lcssa.i.i118, ashr (i32 sub (i32 ptrtoint (%"struct.ValueWrapper<double>"* getelementptr ([2000 x %"struct.ValueWrapper<double>"]* @VData, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x %"struct.ValueWrapper<double>"]* @VData to i32)), i32 3) ; <i1> [#uses=1]
  br i1 %337, label %bb5.i.i121, label %bb8.i.i127

bb5.i.i121:                                       ; preds = %bb4.i.i120
  %338 = add i32 %i.1.lcssa.i.i118, -1            ; <i32> [#uses=3]
  %339 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %338, i32 0 ; <double*> [#uses=1]
  %340 = load double* %339, align 8               ; <double> [#uses=1]
  %341 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %free.0.lcssa.i.i119, i32 0 ; <double*> [#uses=1]
  store double %340, double* %341, align 8
  br label %bb8.i.i127

bb7.i.i122:                                       ; preds = %bb9.i.i128
  %342 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %free.2.i.i123, i32 0 ; <double*> [#uses=1]
  store double %345, double* %342, align 8
  br label %bb8.i.i127

bb8.i.i127:                                       ; preds = %bb7.i.i122, %bb5.i.i121, %bb4.i.i120
  %free.2.i.i123 = phi i32 [ %i.2.i.i126, %bb7.i.i122 ], [ %338, %bb5.i.i121 ], [ %free.0.lcssa.i.i119, %bb4.i.i120 ] ; <i32> [#uses=3]
  %i.2.in.in.i.i124 = phi i32 [ %i.2.i.i126, %bb7.i.i122 ], [ %338, %bb5.i.i121 ], [ %free.0.lcssa.i.i119, %bb4.i.i120 ] ; <i32> [#uses=1]
  %i.2.in.i.i125 = add i32 %i.2.in.in.i.i124, -1  ; <i32> [#uses=1]
  %i.2.i.i126 = sdiv i32 %i.2.in.i.i125, 2        ; <i32> [#uses=3]
  %343 = icmp sgt i32 %free.2.i.i123, %j.024.i110 ; <i1> [#uses=1]
  br i1 %343, label %bb9.i.i128, label %_ZN9benchmark7sift_inIP12ValueWrapperIdES2_EEviT_iT0_.exit.i

bb9.i.i128:                                       ; preds = %bb8.i.i127
  %344 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %i.2.i.i126, i32 0 ; <double*> [#uses=1]
  %345 = load double* %344, align 8               ; <double> [#uses=2]
  %346 = fcmp olt double %345, %323               ; <i1> [#uses=1]
  br i1 %346, label %bb7.i.i122, label %_ZN9benchmark7sift_inIP12ValueWrapperIdES2_EEviT_iT0_.exit.i

_ZN9benchmark7sift_inIP12ValueWrapperIdES2_EEviT_iT0_.exit.i: ; preds = %bb9.i.i128, %bb8.i.i127
  %347 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %free.2.i.i123, i32 0 ; <double*> [#uses=1]
  store double %323, double* %347, align 8
  %348 = icmp slt i32 %j.0.i109, 0                ; <i1> [#uses=1]
  %indvar.next31.i129 = add i32 %indvar30.i108, 1 ; <i32> [#uses=1]
  br i1 %348, label %bb7.loopexit.i153, label %bb.i112

bb4.i134:                                         ; preds = %bb7.loopexit.i153, %_ZN9benchmark7sift_inIP12ValueWrapperIdES2_EEviT_iT0_.exit17.i
  %indvar.i131 = phi i32 [ %indvar.next.i151, %_ZN9benchmark7sift_inIP12ValueWrapperIdES2_EEviT_iT0_.exit17.i ], [ 0, %bb7.loopexit.i153 ] ; <i32> [#uses=2]
  %j.120.i132 = sub i32 add (i32 ashr (i32 sub (i32 ptrtoint (%"struct.ValueWrapper<double>"* getelementptr ([2000 x %"struct.ValueWrapper<double>"]* @VData, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x %"struct.ValueWrapper<double>"]* @VData to i32)), i32 3), i32 -1), %indvar.i131 ; <i32> [#uses=4]
  %scevgep28.i133 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %j.120.i132, i32 0 ; <double*> [#uses=2]
  %349 = load double* %scevgep28.i133, align 8    ; <double> [#uses=2]
  %350 = load double* getelementptr inbounds ([2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 0, i32 0), align 32 ; <double> [#uses=1]
  store double %350, double* %scevgep28.i133, align 8
  %351 = icmp sgt i32 %j.120.i132, 2              ; <i1> [#uses=1]
  br i1 %351, label %bb.i5.i139, label %bb4.i8.i142

bb.i5.i139:                                       ; preds = %bb.i5.i139, %bb4.i134
  %i.15.i1.i135 = phi i32 [ %phitmp.i4.i138, %bb.i5.i139 ], [ 2, %bb4.i134 ] ; <i32> [#uses=3]
  %free.02.i2.i136 = phi i32 [ %359, %bb.i5.i139 ], [ 0, %bb4.i134 ] ; <i32> [#uses=1]
  %352 = add i32 %i.15.i1.i135, -1                ; <i32> [#uses=1]
  %353 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %352, i32 0 ; <double*> [#uses=1]
  %354 = load double* %353, align 8               ; <double> [#uses=1]
  %355 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %i.15.i1.i135, i32 0 ; <double*> [#uses=1]
  %356 = load double* %355, align 16              ; <double> [#uses=1]
  %357 = fcmp olt double %354, %356               ; <i1> [#uses=1]
  %358 = zext i1 %357 to i32                      ; <i32> [#uses=1]
  %i.1..i3.i137 = or i32 %358, %i.15.i1.i135      ; <i32> [#uses=2]
  %359 = add i32 %i.1..i3.i137, -1                ; <i32> [#uses=3]
  %360 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %359, i32 0 ; <double*> [#uses=1]
  %361 = load double* %360, align 8               ; <double> [#uses=1]
  %362 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %free.02.i2.i136, i32 0 ; <double*> [#uses=1]
  store double %361, double* %362, align 8
  %phitmp.i4.i138 = shl i32 %i.1..i3.i137, 1      ; <i32> [#uses=3]
  %363 = icmp slt i32 %phitmp.i4.i138, %j.120.i132 ; <i1> [#uses=1]
  br i1 %363, label %bb.i5.i139, label %bb4.i8.i142

bb4.i8.i142:                                      ; preds = %bb.i5.i139, %bb4.i134
  %i.1.lcssa.i6.i140 = phi i32 [ 2, %bb4.i134 ], [ %phitmp.i4.i138, %bb.i5.i139 ] ; <i32> [#uses=2]
  %free.0.lcssa.i7.i141 = phi i32 [ 0, %bb4.i134 ], [ %359, %bb.i5.i139 ] ; <i32> [#uses=3]
  %364 = icmp eq i32 %i.1.lcssa.i6.i140, %j.120.i132 ; <i1> [#uses=1]
  br i1 %364, label %bb5.i9.i143, label %bb8.i15.i149

bb5.i9.i143:                                      ; preds = %bb4.i8.i142
  %365 = add i32 %i.1.lcssa.i6.i140, -1           ; <i32> [#uses=3]
  %366 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %365, i32 0 ; <double*> [#uses=1]
  %367 = load double* %366, align 8               ; <double> [#uses=1]
  %368 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %free.0.lcssa.i7.i141, i32 0 ; <double*> [#uses=1]
  store double %367, double* %368, align 8
  br label %bb8.i15.i149

bb7.i10.i144:                                     ; preds = %bb9.i16.i150
  %369 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %free.2.i11.i145, i32 0 ; <double*> [#uses=1]
  store double %372, double* %369, align 8
  br label %bb8.i15.i149

bb8.i15.i149:                                     ; preds = %bb7.i10.i144, %bb5.i9.i143, %bb4.i8.i142
  %free.2.i11.i145 = phi i32 [ %i.2.i14.i148, %bb7.i10.i144 ], [ %365, %bb5.i9.i143 ], [ %free.0.lcssa.i7.i141, %bb4.i8.i142 ] ; <i32> [#uses=3]
  %i.2.in.in.i12.i146 = phi i32 [ %i.2.i14.i148, %bb7.i10.i144 ], [ %365, %bb5.i9.i143 ], [ %free.0.lcssa.i7.i141, %bb4.i8.i142 ] ; <i32> [#uses=1]
  %i.2.in.i13.i147 = add i32 %i.2.in.in.i12.i146, -1 ; <i32> [#uses=1]
  %i.2.i14.i148 = sdiv i32 %i.2.in.i13.i147, 2    ; <i32> [#uses=3]
  %370 = icmp sgt i32 %free.2.i11.i145, 0         ; <i1> [#uses=1]
  br i1 %370, label %bb9.i16.i150, label %_ZN9benchmark7sift_inIP12ValueWrapperIdES2_EEviT_iT0_.exit17.i

bb9.i16.i150:                                     ; preds = %bb8.i15.i149
  %371 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %i.2.i14.i148, i32 0 ; <double*> [#uses=1]
  %372 = load double* %371, align 8               ; <double> [#uses=2]
  %373 = fcmp olt double %372, %349               ; <i1> [#uses=1]
  br i1 %373, label %bb7.i10.i144, label %_ZN9benchmark7sift_inIP12ValueWrapperIdES2_EEviT_iT0_.exit17.i

_ZN9benchmark7sift_inIP12ValueWrapperIdES2_EEviT_iT0_.exit17.i: ; preds = %bb9.i16.i150, %bb8.i15.i149
  %374 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %free.2.i11.i145, i32 0 ; <double*> [#uses=1]
  store double %349, double* %374, align 8
  %indvar.next.i151 = add i32 %indvar.i131, 1     ; <i32> [#uses=2]
  %exitcond.i152 = icmp eq i32 %indvar.next.i151, add (i32 ashr (i32 sub (i32 ptrtoint (%"struct.ValueWrapper<double>"* getelementptr ([2000 x %"struct.ValueWrapper<double>"]* @VData, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x %"struct.ValueWrapper<double>"]* @VData to i32)), i32 3), i32 -1) ; <i1> [#uses=1]
  br i1 %exitcond.i152, label %bb2.i.i.i48, label %bb4.i134

bb7.loopexit.i153:                                ; preds = %_ZN9benchmark7sift_inIP12ValueWrapperIdES2_EEviT_iT0_.exit.i, %_ZN9benchmark4copyIP12ValueWrapperIdES3_EEvT_S4_T0_.exit.i
  br i1 icmp sgt (i32 add (i32 ashr (i32 sub (i32 ptrtoint (%"struct.ValueWrapper<double>"* getelementptr ([2000 x %"struct.ValueWrapper<double>"]* @VData, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x %"struct.ValueWrapper<double>"]* @VData to i32)), i32 3), i32 -1), i32 0), label %bb4.i134, label %bb2.i.i.i48

bb.i.i.i44:                                       ; preds = %bb2.i.i.i48
  %scevgep23.i.i.i42 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %tmp748, i32 0 ; <double*> [#uses=1]
  %scevgep1.i.i.i43 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %indvar.i.i.i45, i32 0 ; <double*> [#uses=1]
  %375 = load double* %scevgep23.i.i.i42, align 8 ; <double> [#uses=1]
  %376 = load double* %scevgep1.i.i.i43, align 8  ; <double> [#uses=1]
  %377 = fcmp olt double %375, %376               ; <i1> [#uses=1]
  br i1 %377, label %bb.i2.i49, label %bb2.i.i.i48

bb2.i.i.i48:                                      ; preds = %bb.i.i.i44, %bb7.loopexit.i153, %_ZN9benchmark7sift_inIP12ValueWrapperIdES2_EEviT_iT0_.exit17.i
  %indvar.i.i.i45 = phi i32 [ %tmp748, %bb.i.i.i44 ], [ 0, %_ZN9benchmark7sift_inIP12ValueWrapperIdES2_EEviT_iT0_.exit17.i ], [ 0, %bb7.loopexit.i153 ] ; <i32> [#uses=2]
  %tmp748 = add i32 %indvar.i.i.i45, 1            ; <i32> [#uses=3]
  %first_addr.0.i.i.i47.idx.mask = and i32 %tmp748, 536870911 ; <i32> [#uses=1]
  %378 = icmp eq i32 %first_addr.0.i.i.i47.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %378, label %_Z13verify_sortedIP12ValueWrapperIdEEvT_S3_.exit.i, label %bb.i.i.i44

bb.i2.i49:                                        ; preds = %bb.i.i.i44
  %379 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIP12ValueWrapperIdEEvT_S3_.exit.i

_Z13verify_sortedIP12ValueWrapperIdEEvT_S3_.exit.i: ; preds = %bb.i2.i49, %bb2.i.i.i48
  %380 = icmp slt i32 %tmp12.i35, %151            ; <i1> [#uses=1]
  br i1 %380, label %bb.i36, label %_Z14test_heap_sortIP12ValueWrapperIdES1_EvT_S3_S3_S3_T0_PKc.exit

_Z14test_heap_sortIP12ValueWrapperIdES1_EvT_S3_S3_S3_T0_PKc.exit: ; preds = %_Z13verify_sortedIP12ValueWrapperIdEEvT_S3_.exit.i
  br i1 %152, label %bb.i20, label %_Z14test_heap_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit

bb.i20:                                           ; preds = %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIdEEEvT_S4_.exit.i, %_Z14test_heap_sortIP12ValueWrapperIdES1_EvT_S3_S3_S3_T0_PKc.exit
  %i.03.i18 = phi i32 [ %tmp12.i19, %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIdEEEvT_S4_.exit.i ], [ 0, %_Z14test_heap_sortIP12ValueWrapperIdES1_EvT_S3_S3_S3_T0_PKc.exit ] ; <i32> [#uses=1]
  %tmp12.i19 = add i32 %i.03.i18, 1               ; <i32> [#uses=2]
  br label %bb.i.i26

bb.i.i26:                                         ; preds = %bb.i.i26, %bb.i20
  %indvar.i.i21 = phi i32 [ 0, %bb.i20 ], [ %tmp729, %bb.i.i26 ] ; <i32> [#uses=3]
  %tmp729 = add i32 %indvar.i.i21, 1              ; <i32> [#uses=2]
  %scevgep4.i.i25 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VDataMaster, i32 0, i32 %indvar.i.i21, i32 0 ; <double*> [#uses=1]
  %scevgep67.i.i24 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %indvar.i.i21, i32 0 ; <double*> [#uses=1]
  %381 = load double* %scevgep4.i.i25, align 8    ; <double> [#uses=1]
  store double %381, double* %scevgep67.i.i24, align 8
  %scevgep5.i.i23.idx.mask = and i32 %tmp729, 536870911 ; <i32> [#uses=1]
  %382 = icmp eq i32 %scevgep5.i.i23.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %382, label %bb.i72, label %bb.i.i26

bb.i72:                                           ; preds = %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIdEES3_EEviT_iT0_.exit17.i, %bb.i.i26
  %indvar30.i = phi i32 [ %indvar.next31.i, %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIdEES3_EEviT_iT0_.exit17.i ], [ 0, %bb.i.i26 ] ; <i32> [#uses=4]
  %j.0.i68 = sub i32 998, %indvar30.i             ; <i32> [#uses=1]
  %j.024.i69 = sub i32 999, %indvar30.i           ; <i32> [#uses=4]
  %tmp37.i70 = mul i32 %indvar30.i, -2            ; <i32> [#uses=1]
  %i.14.i.i71 = add i32 %tmp37.i70, 2000          ; <i32> [#uses=3]
  %scevgep4041.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %j.024.i69, i32 0 ; <double*> [#uses=1]
  %383 = load double* %scevgep4041.i, align 8     ; <double> [#uses=2]
  %384 = icmp slt i32 %i.14.i.i71, 2000           ; <i1> [#uses=1]
  br i1 %384, label %bb.i5.i74, label %bb4.i8.i77

bb.i5.i74:                                        ; preds = %bb.i5.i74, %bb.i72
  %i.15.i1.i = phi i32 [ %phitmp.i4.i73, %bb.i5.i74 ], [ %i.14.i.i71, %bb.i72 ] ; <i32> [#uses=3]
  %free.02.i2.i = phi i32 [ %392, %bb.i5.i74 ], [ %j.024.i69, %bb.i72 ] ; <i32> [#uses=1]
  %385 = add i32 %i.15.i1.i, -1                   ; <i32> [#uses=1]
  %386 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %385, i32 0 ; <double*> [#uses=1]
  %387 = load double* %386, align 8               ; <double> [#uses=1]
  %388 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %i.15.i1.i, i32 0 ; <double*> [#uses=1]
  %389 = load double* %388, align 8               ; <double> [#uses=1]
  %390 = fcmp olt double %387, %389               ; <i1> [#uses=1]
  %391 = zext i1 %390 to i32                      ; <i32> [#uses=1]
  %i.1..i3.i = or i32 %391, %i.15.i1.i            ; <i32> [#uses=2]
  %392 = add i32 %i.1..i3.i, -1                   ; <i32> [#uses=3]
  %393 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %392, i32 0 ; <double*> [#uses=1]
  %394 = load double* %393, align 8               ; <double> [#uses=1]
  %395 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %free.02.i2.i, i32 0 ; <double*> [#uses=1]
  store double %394, double* %395, align 8
  %phitmp.i4.i73 = shl i32 %i.1..i3.i, 1          ; <i32> [#uses=3]
  %396 = icmp slt i32 %phitmp.i4.i73, 2000        ; <i1> [#uses=1]
  br i1 %396, label %bb.i5.i74, label %bb4.i8.i77

bb4.i8.i77:                                       ; preds = %bb.i5.i74, %bb.i72
  %i.1.lcssa.i6.i75 = phi i32 [ %i.14.i.i71, %bb.i72 ], [ %phitmp.i4.i73, %bb.i5.i74 ] ; <i32> [#uses=2]
  %free.0.lcssa.i7.i76 = phi i32 [ %j.024.i69, %bb.i72 ], [ %392, %bb.i5.i74 ] ; <i32> [#uses=3]
  %397 = icmp eq i32 %i.1.lcssa.i6.i75, 2000      ; <i1> [#uses=1]
  br i1 %397, label %bb5.i9.i78, label %bb8.i15.i84

bb5.i9.i78:                                       ; preds = %bb4.i8.i77
  %398 = add i32 %i.1.lcssa.i6.i75, -1            ; <i32> [#uses=3]
  %399 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %398, i32 0 ; <double*> [#uses=1]
  %400 = load double* %399, align 8               ; <double> [#uses=1]
  %401 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %free.0.lcssa.i7.i76, i32 0 ; <double*> [#uses=1]
  store double %400, double* %401, align 8
  br label %bb8.i15.i84

bb7.i10.i79:                                      ; preds = %bb9.i16.i85
  %402 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %free.2.i11.i80, i32 0 ; <double*> [#uses=1]
  store double %405, double* %402, align 8
  br label %bb8.i15.i84

bb8.i15.i84:                                      ; preds = %bb7.i10.i79, %bb5.i9.i78, %bb4.i8.i77
  %free.2.i11.i80 = phi i32 [ %i.2.i14.i83, %bb7.i10.i79 ], [ %398, %bb5.i9.i78 ], [ %free.0.lcssa.i7.i76, %bb4.i8.i77 ] ; <i32> [#uses=3]
  %i.2.in.in.i12.i81 = phi i32 [ %i.2.i14.i83, %bb7.i10.i79 ], [ %398, %bb5.i9.i78 ], [ %free.0.lcssa.i7.i76, %bb4.i8.i77 ] ; <i32> [#uses=1]
  %i.2.in.i13.i82 = add i32 %i.2.in.in.i12.i81, -1 ; <i32> [#uses=1]
  %i.2.i14.i83 = sdiv i32 %i.2.in.i13.i82, 2      ; <i32> [#uses=3]
  %403 = icmp sgt i32 %free.2.i11.i80, %j.024.i69 ; <i1> [#uses=1]
  br i1 %403, label %bb9.i16.i85, label %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIdEES3_EEviT_iT0_.exit17.i

bb9.i16.i85:                                      ; preds = %bb8.i15.i84
  %404 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %i.2.i14.i83, i32 0 ; <double*> [#uses=1]
  %405 = load double* %404, align 8               ; <double> [#uses=2]
  %406 = fcmp olt double %405, %383               ; <i1> [#uses=1]
  br i1 %406, label %bb7.i10.i79, label %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIdEES3_EEviT_iT0_.exit17.i

_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIdEES3_EEviT_iT0_.exit17.i: ; preds = %bb9.i16.i85, %bb8.i15.i84
  %407 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %free.2.i11.i80, i32 0 ; <double*> [#uses=1]
  store double %383, double* %407, align 8
  %408 = icmp slt i32 %j.0.i68, 0                 ; <i1> [#uses=1]
  %indvar.next31.i = add i32 %indvar30.i, 1       ; <i32> [#uses=1]
  br i1 %408, label %bb6.i, label %bb.i72

bb6.i:                                            ; preds = %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIdEES3_EEviT_iT0_.exit.i, %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIdEES3_EEviT_iT0_.exit17.i
  %indvar.i87 = phi i32 [ %indvar.next.i105, %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIdEES3_EEviT_iT0_.exit.i ], [ 0, %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIdEES3_EEviT_iT0_.exit17.i ] ; <i32> [#uses=2]
  %j.120.i88 = sub i32 1999, %indvar.i87          ; <i32> [#uses=4]
  %scevgep28.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %j.120.i88, i32 0 ; <double*> [#uses=2]
  %409 = load double* %scevgep28.i, align 8       ; <double> [#uses=2]
  %410 = load double* getelementptr inbounds ([2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 0, i32 0), align 32 ; <double> [#uses=1]
  store double %410, double* %scevgep28.i, align 8
  %411 = icmp sgt i32 %j.120.i88, 2               ; <i1> [#uses=1]
  br i1 %411, label %bb.i.i93, label %bb4.i.i96

bb.i.i93:                                         ; preds = %bb.i.i93, %bb6.i
  %i.15.i.i89 = phi i32 [ %phitmp.i.i92, %bb.i.i93 ], [ 2, %bb6.i ] ; <i32> [#uses=3]
  %free.02.i.i90 = phi i32 [ %419, %bb.i.i93 ], [ 0, %bb6.i ] ; <i32> [#uses=1]
  %412 = add i32 %i.15.i.i89, -1                  ; <i32> [#uses=1]
  %413 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %412, i32 0 ; <double*> [#uses=1]
  %414 = load double* %413, align 8               ; <double> [#uses=1]
  %415 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %i.15.i.i89, i32 0 ; <double*> [#uses=1]
  %416 = load double* %415, align 16              ; <double> [#uses=1]
  %417 = fcmp olt double %414, %416               ; <i1> [#uses=1]
  %418 = zext i1 %417 to i32                      ; <i32> [#uses=1]
  %i.1..i.i91 = or i32 %418, %i.15.i.i89          ; <i32> [#uses=2]
  %419 = add i32 %i.1..i.i91, -1                  ; <i32> [#uses=3]
  %420 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %419, i32 0 ; <double*> [#uses=1]
  %421 = load double* %420, align 8               ; <double> [#uses=1]
  %422 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %free.02.i.i90, i32 0 ; <double*> [#uses=1]
  store double %421, double* %422, align 8
  %phitmp.i.i92 = shl i32 %i.1..i.i91, 1          ; <i32> [#uses=3]
  %423 = icmp slt i32 %phitmp.i.i92, %j.120.i88   ; <i1> [#uses=1]
  br i1 %423, label %bb.i.i93, label %bb4.i.i96

bb4.i.i96:                                        ; preds = %bb.i.i93, %bb6.i
  %i.1.lcssa.i.i94 = phi i32 [ 2, %bb6.i ], [ %phitmp.i.i92, %bb.i.i93 ] ; <i32> [#uses=2]
  %free.0.lcssa.i.i95 = phi i32 [ 0, %bb6.i ], [ %419, %bb.i.i93 ] ; <i32> [#uses=3]
  %424 = icmp eq i32 %i.1.lcssa.i.i94, %j.120.i88 ; <i1> [#uses=1]
  br i1 %424, label %bb5.i.i97, label %bb8.i.i103

bb5.i.i97:                                        ; preds = %bb4.i.i96
  %425 = add i32 %i.1.lcssa.i.i94, -1             ; <i32> [#uses=3]
  %426 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %425, i32 0 ; <double*> [#uses=1]
  %427 = load double* %426, align 8               ; <double> [#uses=1]
  %428 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %free.0.lcssa.i.i95, i32 0 ; <double*> [#uses=1]
  store double %427, double* %428, align 8
  br label %bb8.i.i103

bb7.i.i98:                                        ; preds = %bb9.i.i104
  %429 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %free.2.i.i99, i32 0 ; <double*> [#uses=1]
  store double %432, double* %429, align 8
  br label %bb8.i.i103

bb8.i.i103:                                       ; preds = %bb7.i.i98, %bb5.i.i97, %bb4.i.i96
  %free.2.i.i99 = phi i32 [ %i.2.i.i102, %bb7.i.i98 ], [ %425, %bb5.i.i97 ], [ %free.0.lcssa.i.i95, %bb4.i.i96 ] ; <i32> [#uses=3]
  %i.2.in.in.i.i100 = phi i32 [ %i.2.i.i102, %bb7.i.i98 ], [ %425, %bb5.i.i97 ], [ %free.0.lcssa.i.i95, %bb4.i.i96 ] ; <i32> [#uses=1]
  %i.2.in.i.i101 = add i32 %i.2.in.in.i.i100, -1  ; <i32> [#uses=1]
  %i.2.i.i102 = sdiv i32 %i.2.in.i.i101, 2        ; <i32> [#uses=3]
  %430 = icmp sgt i32 %free.2.i.i99, 0            ; <i1> [#uses=1]
  br i1 %430, label %bb9.i.i104, label %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIdEES3_EEviT_iT0_.exit.i

bb9.i.i104:                                       ; preds = %bb8.i.i103
  %431 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %i.2.i.i102, i32 0 ; <double*> [#uses=1]
  %432 = load double* %431, align 8               ; <double> [#uses=2]
  %433 = fcmp olt double %432, %409               ; <i1> [#uses=1]
  br i1 %433, label %bb7.i.i98, label %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIdEES3_EEviT_iT0_.exit.i

_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIdEES3_EEviT_iT0_.exit.i: ; preds = %bb9.i.i104, %bb8.i.i103
  %434 = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %free.2.i.i99, i32 0 ; <double*> [#uses=1]
  store double %409, double* %434, align 8
  %indvar.next.i105 = add i32 %indvar.i87, 1      ; <i32> [#uses=2]
  %exitcond.i106 = icmp eq i32 %indvar.next.i105, 1999 ; <i1> [#uses=1]
  br i1 %exitcond.i106, label %bb2.i.i.i31, label %bb6.i

bb.i.i.i27:                                       ; preds = %bb2.i.i.i31
  %scevgep56.i.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %tmp735, i32 0 ; <double*> [#uses=1]
  %scevgep4.i.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<double>"]* @VData, i32 0, i32 %indvar.i.i.i28, i32 0 ; <double*> [#uses=1]
  %435 = load double* %scevgep56.i.i.i, align 8   ; <double> [#uses=1]
  %436 = load double* %scevgep4.i.i.i, align 8    ; <double> [#uses=1]
  %437 = fcmp olt double %435, %436               ; <i1> [#uses=1]
  br i1 %437, label %bb.i2.i32, label %bb2.i.i.i31

bb2.i.i.i31:                                      ; preds = %bb.i.i.i27, %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIdEES3_EEviT_iT0_.exit.i
  %indvar.i.i.i28 = phi i32 [ %tmp735, %bb.i.i.i27 ], [ 0, %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIdEES3_EEviT_iT0_.exit.i ] ; <i32> [#uses=2]
  %tmp735 = add i32 %indvar.i.i.i28, 1            ; <i32> [#uses=3]
  %first_addr.0.0.i.i.i30.idx.mask = and i32 %tmp735, 536870911 ; <i32> [#uses=1]
  %438 = icmp eq i32 %first_addr.0.0.i.i.i30.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %438, label %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIdEEEvT_S4_.exit.i, label %bb.i.i.i27

bb.i2.i32:                                        ; preds = %bb.i.i.i27
  %439 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIdEEEvT_S4_.exit.i

_Z13verify_sortedI14PointerWrapperI12ValueWrapperIdEEEvT_S4_.exit.i: ; preds = %bb.i2.i32, %bb2.i.i.i31
  %440 = icmp slt i32 %tmp12.i19, %151            ; <i1> [#uses=1]
  br i1 %440, label %bb.i20, label %_Z14test_heap_sortI14PointerWrapperI12ValueWrapperIdEES2_EvT_S4_S4_S4_T0_PKc.exit

_Z14test_heap_sortI14PointerWrapperI12ValueWrapperIdEES2_EvT_S4_S4_S4_T0_PKc.exit: ; preds = %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIdEEEvT_S4_.exit.i
  br i1 %152, label %bb.i8, label %_Z14test_heap_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit

_Z14test_heap_sortIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_SC_SC_T0_PKc.exit.thread.critedge: ; preds = %_Z14test_heap_sortI14PointerWrapperIdEdEvT_S2_S2_S2_T0_PKc.exit, %_Z14test_quicksortI14PointerWrapperI12ValueWrapperIdEES2_EvT_S4_S4_S4_T0_PKc.exit, %_Z19test_insertion_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit
  ret i32 0

bb.i8:                                            ; preds = %_Z13verify_sortedIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEEEvT_SC_.exit.i, %_Z14test_heap_sortI14PointerWrapperI12ValueWrapperIdEES2_EvT_S4_S4_S4_T0_PKc.exit
  %i.03.i6 = phi i32 [ %tmp12.i7, %_Z13verify_sortedIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEEEvT_SC_.exit.i ], [ 0, %_Z14test_heap_sortI14PointerWrapperI12ValueWrapperIdEES2_EvT_S4_S4_S4_T0_PKc.exit ] ; <i32> [#uses=1]
  %tmp12.i7 = add i32 %i.03.i6, 1                 ; <i32> [#uses=2]
  br label %bb.i.i11

bb.i.i11:                                         ; preds = %bb.i.i11, %bb.i8
  %indvar.i.i9 = phi i32 [ 0, %bb.i8 ], [ %tmp716, %bb.i.i11 ] ; <i32> [#uses=3]
  %tmp716 = add i32 %indvar.i.i9, 1               ; <i32> [#uses=2]
  %scevgep34.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10DataMaster, i32 0, i32 %indvar.i.i9, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %scevgep56.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %indvar.i.i9, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %441 = load double* %scevgep34.i.i, align 8     ; <double> [#uses=1]
  store double %441, double* %scevgep56.i.i, align 8
  %scevgep.i.i.idx.mask = and i32 %tmp716, 536870911 ; <i32> [#uses=1]
  %442 = icmp eq i32 %scevgep.i.i.idx.mask, 2000  ; <i1> [#uses=1]
  br i1 %442, label %_ZN9benchmark4copyIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESC_EEvT_SD_T0_.exit.i, label %bb.i.i11

_ZN9benchmark4copyIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESC_EEvT_SD_T0_.exit.i: ; preds = %bb.i.i11
  br i1 icmp slt (i32 add (i32 sdiv (i32 sub (i32 ptrtoint (%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* getelementptr ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data to i32)), i32 16), i32 -1), i32 0), label %bb5.loopexit.i66, label %bb.i28

bb.i28:                                           ; preds = %_ZN9benchmark7sift_inIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEviT_iT0_.exit.i, %_ZN9benchmark4copyIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESC_EEvT_SD_T0_.exit.i
  %indvar45.i = phi i32 [ %indvar.next46.i, %_ZN9benchmark7sift_inIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEviT_iT0_.exit.i ], [ 0, %_ZN9benchmark4copyIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESC_EEvT_SD_T0_.exit.i ] ; <i32> [#uses=4]
  %j.0.i26 = sub i32 add (i32 sdiv (i32 sub (i32 ptrtoint (%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* getelementptr ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data to i32)), i32 16), i32 -2), %indvar45.i ; <i32> [#uses=1]
  %j.039.i = sub i32 add (i32 sdiv (i32 sub (i32 ptrtoint (%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* getelementptr ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data to i32)), i32 16), i32 -1), %indvar45.i ; <i32> [#uses=4]
  %scevgep5253.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %j.039.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %tmp54.i = mul i32 %indvar45.i, -2              ; <i32> [#uses=1]
  %i.14.i.i27 = add i32 %tmp54.i, shl (i32 sdiv (i32 sub (i32 ptrtoint (%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* getelementptr ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data to i32)), i32 16), i32 1) ; <i32> [#uses=3]
  %443 = load double* %scevgep5253.i, align 8     ; <double> [#uses=2]
  %444 = icmp slt i32 %i.14.i.i27, ashr (i32 sub (i32 ptrtoint (%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* getelementptr ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data to i32)), i32 3) ; <i1> [#uses=1]
  br i1 %444, label %bb.i.i33, label %bb4.i.i36

bb.i.i33:                                         ; preds = %bb.i.i33, %bb.i28
  %i.15.i.i29 = phi i32 [ %phitmp.i.i32, %bb.i.i33 ], [ %i.14.i.i27, %bb.i28 ] ; <i32> [#uses=3]
  %free.02.i.i30 = phi i32 [ %452, %bb.i.i33 ], [ %j.039.i, %bb.i28 ] ; <i32> [#uses=1]
  %445 = add i32 %i.15.i.i29, -1                  ; <i32> [#uses=1]
  %446 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %445, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %447 = load double* %446, align 8               ; <double> [#uses=1]
  %448 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %i.15.i.i29, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %449 = load double* %448, align 8               ; <double> [#uses=1]
  %450 = fcmp olt double %447, %449               ; <i1> [#uses=1]
  %451 = zext i1 %450 to i32                      ; <i32> [#uses=1]
  %i.1..i.i31 = or i32 %451, %i.15.i.i29          ; <i32> [#uses=2]
  %452 = add i32 %i.1..i.i31, -1                  ; <i32> [#uses=3]
  %453 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %452, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %454 = load double* %453, align 8               ; <double> [#uses=1]
  %455 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %free.02.i.i30, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  store double %454, double* %455, align 8
  %phitmp.i.i32 = shl i32 %i.1..i.i31, 1          ; <i32> [#uses=3]
  %456 = icmp slt i32 %phitmp.i.i32, ashr (i32 sub (i32 ptrtoint (%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* getelementptr ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data to i32)), i32 3) ; <i1> [#uses=1]
  br i1 %456, label %bb.i.i33, label %bb4.i.i36

bb4.i.i36:                                        ; preds = %bb.i.i33, %bb.i28
  %i.1.lcssa.i.i34 = phi i32 [ %i.14.i.i27, %bb.i28 ], [ %phitmp.i.i32, %bb.i.i33 ] ; <i32> [#uses=2]
  %free.0.lcssa.i.i35 = phi i32 [ %j.039.i, %bb.i28 ], [ %452, %bb.i.i33 ] ; <i32> [#uses=3]
  %457 = icmp eq i32 %i.1.lcssa.i.i34, ashr (i32 sub (i32 ptrtoint (%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* getelementptr ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data to i32)), i32 3) ; <i1> [#uses=1]
  br i1 %457, label %bb5.i.i37, label %bb8.i.i43

bb5.i.i37:                                        ; preds = %bb4.i.i36
  %458 = add i32 %i.1.lcssa.i.i34, -1             ; <i32> [#uses=3]
  %459 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %458, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %460 = load double* %459, align 8               ; <double> [#uses=1]
  %461 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %free.0.lcssa.i.i35, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  store double %460, double* %461, align 8
  br label %bb8.i.i43

bb7.i.i38:                                        ; preds = %bb9.i.i44
  %462 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %free.2.i.i39, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  store double %465, double* %462, align 8
  br label %bb8.i.i43

bb8.i.i43:                                        ; preds = %bb7.i.i38, %bb5.i.i37, %bb4.i.i36
  %free.2.i.i39 = phi i32 [ %i.2.i.i42, %bb7.i.i38 ], [ %458, %bb5.i.i37 ], [ %free.0.lcssa.i.i35, %bb4.i.i36 ] ; <i32> [#uses=3]
  %i.2.in.in.i.i40 = phi i32 [ %i.2.i.i42, %bb7.i.i38 ], [ %458, %bb5.i.i37 ], [ %free.0.lcssa.i.i35, %bb4.i.i36 ] ; <i32> [#uses=1]
  %i.2.in.i.i41 = add i32 %i.2.in.in.i.i40, -1    ; <i32> [#uses=1]
  %i.2.i.i42 = sdiv i32 %i.2.in.i.i41, 2          ; <i32> [#uses=3]
  %463 = icmp sgt i32 %free.2.i.i39, %j.039.i     ; <i1> [#uses=1]
  br i1 %463, label %bb9.i.i44, label %_ZN9benchmark7sift_inIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEviT_iT0_.exit.i

bb9.i.i44:                                        ; preds = %bb8.i.i43
  %464 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %i.2.i.i42, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %465 = load double* %464, align 8               ; <double> [#uses=2]
  %466 = fcmp olt double %465, %443               ; <i1> [#uses=1]
  br i1 %466, label %bb7.i.i38, label %_ZN9benchmark7sift_inIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEviT_iT0_.exit.i

_ZN9benchmark7sift_inIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEviT_iT0_.exit.i: ; preds = %bb9.i.i44, %bb8.i.i43
  %467 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %free.2.i.i39, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  store double %443, double* %467, align 8
  %468 = icmp slt i32 %j.0.i26, 0                 ; <i1> [#uses=1]
  %indvar.next46.i = add i32 %indvar45.i, 1       ; <i32> [#uses=1]
  br i1 %468, label %bb5.loopexit.i66, label %bb.i28

bb4.i47:                                          ; preds = %bb5.loopexit.i66, %_ZN9benchmark7sift_inIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEviT_iT0_.exit26.i
  %indvar.i46 = phi i32 [ %indvar.next.i64, %_ZN9benchmark7sift_inIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEviT_iT0_.exit26.i ], [ 0, %bb5.loopexit.i66 ] ; <i32> [#uses=2]
  %j.135.i = sub i32 add (i32 ashr (i32 sub (i32 ptrtoint (%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* getelementptr ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data to i32)), i32 3), i32 -1), %indvar.i46 ; <i32> [#uses=4]
  %scevgep43.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %j.135.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=2]
  %469 = load double* %scevgep43.i, align 8       ; <double> [#uses=2]
  %470 = load double* getelementptr inbounds ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0), align 32 ; <double> [#uses=1]
  store double %470, double* %scevgep43.i, align 8
  %471 = icmp sgt i32 %j.135.i, 2                 ; <i1> [#uses=1]
  br i1 %471, label %bb.i11.i52, label %bb4.i14.i55

bb.i11.i52:                                       ; preds = %bb.i11.i52, %bb4.i47
  %i.15.i7.i48 = phi i32 [ %phitmp.i10.i51, %bb.i11.i52 ], [ 2, %bb4.i47 ] ; <i32> [#uses=3]
  %free.02.i8.i49 = phi i32 [ %479, %bb.i11.i52 ], [ 0, %bb4.i47 ] ; <i32> [#uses=1]
  %472 = add i32 %i.15.i7.i48, -1                 ; <i32> [#uses=1]
  %473 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %472, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %474 = load double* %473, align 8               ; <double> [#uses=1]
  %475 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %i.15.i7.i48, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %476 = load double* %475, align 16              ; <double> [#uses=1]
  %477 = fcmp olt double %474, %476               ; <i1> [#uses=1]
  %478 = zext i1 %477 to i32                      ; <i32> [#uses=1]
  %i.1..i9.i50 = or i32 %478, %i.15.i7.i48        ; <i32> [#uses=2]
  %479 = add i32 %i.1..i9.i50, -1                 ; <i32> [#uses=3]
  %480 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %479, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %481 = load double* %480, align 8               ; <double> [#uses=1]
  %482 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %free.02.i8.i49, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  store double %481, double* %482, align 8
  %phitmp.i10.i51 = shl i32 %i.1..i9.i50, 1       ; <i32> [#uses=3]
  %483 = icmp slt i32 %phitmp.i10.i51, %j.135.i   ; <i1> [#uses=1]
  br i1 %483, label %bb.i11.i52, label %bb4.i14.i55

bb4.i14.i55:                                      ; preds = %bb.i11.i52, %bb4.i47
  %i.1.lcssa.i12.i53 = phi i32 [ 2, %bb4.i47 ], [ %phitmp.i10.i51, %bb.i11.i52 ] ; <i32> [#uses=2]
  %free.0.lcssa.i13.i54 = phi i32 [ 0, %bb4.i47 ], [ %479, %bb.i11.i52 ] ; <i32> [#uses=3]
  %484 = icmp eq i32 %i.1.lcssa.i12.i53, %j.135.i ; <i1> [#uses=1]
  br i1 %484, label %bb5.i15.i56, label %bb8.i24.i62

bb5.i15.i56:                                      ; preds = %bb4.i14.i55
  %485 = add i32 %i.1.lcssa.i12.i53, -1           ; <i32> [#uses=3]
  %486 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %485, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %487 = load double* %486, align 8               ; <double> [#uses=1]
  %488 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %free.0.lcssa.i13.i54, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  store double %487, double* %488, align 8
  br label %bb8.i24.i62

bb7.i19.i57:                                      ; preds = %bb9.i25.i63
  %489 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %free.2.i20.i58, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  store double %492, double* %489, align 8
  br label %bb8.i24.i62

bb8.i24.i62:                                      ; preds = %bb7.i19.i57, %bb5.i15.i56, %bb4.i14.i55
  %free.2.i20.i58 = phi i32 [ %i.2.i23.i61, %bb7.i19.i57 ], [ %485, %bb5.i15.i56 ], [ %free.0.lcssa.i13.i54, %bb4.i14.i55 ] ; <i32> [#uses=3]
  %i.2.in.in.i21.i59 = phi i32 [ %i.2.i23.i61, %bb7.i19.i57 ], [ %485, %bb5.i15.i56 ], [ %free.0.lcssa.i13.i54, %bb4.i14.i55 ] ; <i32> [#uses=1]
  %i.2.in.i22.i60 = add i32 %i.2.in.in.i21.i59, -1 ; <i32> [#uses=1]
  %i.2.i23.i61 = sdiv i32 %i.2.in.i22.i60, 2      ; <i32> [#uses=3]
  %490 = icmp sgt i32 %free.2.i20.i58, 0          ; <i1> [#uses=1]
  br i1 %490, label %bb9.i25.i63, label %_ZN9benchmark7sift_inIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEviT_iT0_.exit26.i

bb9.i25.i63:                                      ; preds = %bb8.i24.i62
  %491 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %i.2.i23.i61, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %492 = load double* %491, align 8               ; <double> [#uses=2]
  %493 = fcmp olt double %492, %469               ; <i1> [#uses=1]
  br i1 %493, label %bb7.i19.i57, label %_ZN9benchmark7sift_inIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEviT_iT0_.exit26.i

_ZN9benchmark7sift_inIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEviT_iT0_.exit26.i: ; preds = %bb9.i25.i63, %bb8.i24.i62
  %494 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %free.2.i20.i58, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  store double %469, double* %494, align 8
  %indvar.next.i64 = add i32 %indvar.i46, 1       ; <i32> [#uses=2]
  %exitcond.i65 = icmp eq i32 %indvar.next.i64, add (i32 ashr (i32 sub (i32 ptrtoint (%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* getelementptr ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data to i32)), i32 3), i32 -1) ; <i1> [#uses=1]
  br i1 %exitcond.i65, label %bb2.i.i.i15, label %bb4.i47

bb5.loopexit.i66:                                 ; preds = %_ZN9benchmark7sift_inIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEviT_iT0_.exit.i, %_ZN9benchmark4copyIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESC_EEvT_SD_T0_.exit.i
  br i1 icmp sgt (i32 add (i32 ashr (i32 sub (i32 ptrtoint (%"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"* getelementptr ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 1, i32 0) to i32), i32 ptrtoint ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data to i32)), i32 3), i32 -1), i32 0), label %bb4.i47, label %bb2.i.i.i15

bb.i.i.i12:                                       ; preds = %bb2.i.i.i15
  %scevgep23.i.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %tmp722, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %scevgep1.i.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %indvar.i.i.i13, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %495 = load double* %scevgep23.i.i.i, align 8   ; <double> [#uses=1]
  %496 = load double* %scevgep1.i.i.i, align 8    ; <double> [#uses=1]
  %497 = fcmp olt double %495, %496               ; <i1> [#uses=1]
  br i1 %497, label %bb.i2.i16, label %bb2.i.i.i15

bb2.i.i.i15:                                      ; preds = %bb.i.i.i12, %bb5.loopexit.i66, %_ZN9benchmark7sift_inIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEviT_iT0_.exit26.i
  %indvar.i.i.i13 = phi i32 [ %tmp722, %bb.i.i.i12 ], [ 0, %_ZN9benchmark7sift_inIP12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEESB_EEviT_iT0_.exit26.i ], [ 0, %bb5.loopexit.i66 ] ; <i32> [#uses=2]
  %tmp722 = add i32 %indvar.i.i.i13, 1            ; <i32> [#uses=3]
  %first_addr.0.i.i.i.idx.mask = and i32 %tmp722, 536870911 ; <i32> [#uses=1]
  %498 = icmp eq i32 %first_addr.0.i.i.i.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %498, label %_Z13verify_sortedIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEEEvT_SC_.exit.i, label %bb.i.i.i12

bb.i2.i16:                                        ; preds = %bb.i.i.i12
  %499 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEEEvT_SC_.exit.i

_Z13verify_sortedIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEEEvT_SC_.exit.i: ; preds = %bb.i2.i16, %bb2.i.i.i15
  %500 = icmp slt i32 %tmp12.i7, %151             ; <i1> [#uses=1]
  br i1 %500, label %bb.i8, label %_Z14test_heap_sortIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_SC_SC_T0_PKc.exit

_Z14test_heap_sortIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_SC_SC_T0_PKc.exit: ; preds = %_Z13verify_sortedIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEEEvT_SC_.exit.i
  br i1 %152, label %bb.i, label %_Z14test_heap_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit

bb.i:                                             ; preds = %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEEEvT_SD_.exit.i, %_Z14test_heap_sortIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_SC_SC_T0_PKc.exit
  %i.03.i = phi i32 [ %tmp12.i, %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEEEvT_SD_.exit.i ], [ 0, %_Z14test_heap_sortIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_SC_SC_T0_PKc.exit ] ; <i32> [#uses=1]
  %tmp12.i = add i32 %i.03.i, 1                   ; <i32> [#uses=2]
  br label %bb.i.i

bb.i.i:                                           ; preds = %bb.i.i, %bb.i
  %indvar.i.i = phi i32 [ 0, %bb.i ], [ %tmp704, %bb.i.i ] ; <i32> [#uses=3]
  %tmp704 = add i32 %indvar.i.i, 1                ; <i32> [#uses=2]
  %scevgep4.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10DataMaster, i32 0, i32 %indvar.i.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %scevgep67.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %indvar.i.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %501 = load double* %scevgep4.i.i, align 8      ; <double> [#uses=1]
  store double %501, double* %scevgep67.i.i, align 8
  %scevgep5.i.i.idx.mask = and i32 %tmp704, 536870911 ; <i32> [#uses=1]
  %502 = icmp eq i32 %scevgep5.i.i.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %502, label %bb.i7, label %bb.i.i

bb.i7:                                            ; preds = %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEviT_iT0_.exit26.i, %bb.i.i
  %indvar44.i = phi i32 [ %indvar.next45.i, %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEviT_iT0_.exit26.i ], [ 0, %bb.i.i ] ; <i32> [#uses=4]
  %j.0.i5 = sub i32 998, %indvar44.i              ; <i32> [#uses=1]
  %j.038.i = sub i32 999, %indvar44.i             ; <i32> [#uses=4]
  %tmp51.i = mul i32 %indvar44.i, -2              ; <i32> [#uses=1]
  %i.14.i.i6 = add i32 %tmp51.i, 2000             ; <i32> [#uses=3]
  %scevgep5455.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %j.038.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %503 = load double* %scevgep5455.i, align 8     ; <double> [#uses=2]
  %504 = icmp slt i32 %i.14.i.i6, 2000            ; <i1> [#uses=1]
  br i1 %504, label %bb.i11.i, label %bb4.i14.i

bb.i11.i:                                         ; preds = %bb.i11.i, %bb.i7
  %i.15.i7.i = phi i32 [ %phitmp.i10.i, %bb.i11.i ], [ %i.14.i.i6, %bb.i7 ] ; <i32> [#uses=3]
  %free.02.i8.i = phi i32 [ %512, %bb.i11.i ], [ %j.038.i, %bb.i7 ] ; <i32> [#uses=1]
  %505 = add i32 %i.15.i7.i, -1                   ; <i32> [#uses=1]
  %506 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %505, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %507 = load double* %506, align 8               ; <double> [#uses=1]
  %508 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %i.15.i7.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %509 = load double* %508, align 8               ; <double> [#uses=1]
  %510 = fcmp olt double %507, %509               ; <i1> [#uses=1]
  %511 = zext i1 %510 to i32                      ; <i32> [#uses=1]
  %i.1..i9.i = or i32 %511, %i.15.i7.i            ; <i32> [#uses=2]
  %512 = add i32 %i.1..i9.i, -1                   ; <i32> [#uses=3]
  %513 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %512, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %514 = load double* %513, align 8               ; <double> [#uses=1]
  %515 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %free.02.i8.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  store double %514, double* %515, align 8
  %phitmp.i10.i = shl i32 %i.1..i9.i, 1           ; <i32> [#uses=3]
  %516 = icmp slt i32 %phitmp.i10.i, 2000         ; <i1> [#uses=1]
  br i1 %516, label %bb.i11.i, label %bb4.i14.i

bb4.i14.i:                                        ; preds = %bb.i11.i, %bb.i7
  %i.1.lcssa.i12.i = phi i32 [ %i.14.i.i6, %bb.i7 ], [ %phitmp.i10.i, %bb.i11.i ] ; <i32> [#uses=2]
  %free.0.lcssa.i13.i = phi i32 [ %j.038.i, %bb.i7 ], [ %512, %bb.i11.i ] ; <i32> [#uses=3]
  %517 = icmp eq i32 %i.1.lcssa.i12.i, 2000       ; <i1> [#uses=1]
  br i1 %517, label %bb5.i15.i, label %bb8.i24.i

bb5.i15.i:                                        ; preds = %bb4.i14.i
  %518 = add i32 %i.1.lcssa.i12.i, -1             ; <i32> [#uses=3]
  %519 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %518, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %520 = load double* %519, align 8               ; <double> [#uses=1]
  %521 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %free.0.lcssa.i13.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  store double %520, double* %521, align 8
  br label %bb8.i24.i

bb7.i19.i:                                        ; preds = %bb9.i25.i
  %522 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %free.2.i20.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  store double %525, double* %522, align 8
  br label %bb8.i24.i

bb8.i24.i:                                        ; preds = %bb7.i19.i, %bb5.i15.i, %bb4.i14.i
  %free.2.i20.i = phi i32 [ %i.2.i23.i, %bb7.i19.i ], [ %518, %bb5.i15.i ], [ %free.0.lcssa.i13.i, %bb4.i14.i ] ; <i32> [#uses=3]
  %i.2.in.in.i21.i = phi i32 [ %i.2.i23.i, %bb7.i19.i ], [ %518, %bb5.i15.i ], [ %free.0.lcssa.i13.i, %bb4.i14.i ] ; <i32> [#uses=1]
  %i.2.in.i22.i = add i32 %i.2.in.in.i21.i, -1    ; <i32> [#uses=1]
  %i.2.i23.i = sdiv i32 %i.2.in.i22.i, 2          ; <i32> [#uses=3]
  %523 = icmp sgt i32 %free.2.i20.i, %j.038.i     ; <i1> [#uses=1]
  br i1 %523, label %bb9.i25.i, label %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEviT_iT0_.exit26.i

bb9.i25.i:                                        ; preds = %bb8.i24.i
  %524 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %i.2.i23.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %525 = load double* %524, align 8               ; <double> [#uses=2]
  %526 = fcmp olt double %525, %503               ; <i1> [#uses=1]
  br i1 %526, label %bb7.i19.i, label %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEviT_iT0_.exit26.i

_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEviT_iT0_.exit26.i: ; preds = %bb9.i25.i, %bb8.i24.i
  %527 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %free.2.i20.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  store double %503, double* %527, align 8
  %528 = icmp slt i32 %j.0.i5, 0                  ; <i1> [#uses=1]
  %indvar.next45.i = add i32 %indvar44.i, 1       ; <i32> [#uses=1]
  br i1 %528, label %bb4.i10, label %bb.i7

bb4.i10:                                          ; preds = %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEviT_iT0_.exit.i, %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEviT_iT0_.exit26.i
  %indvar.i9 = phi i32 [ %indvar.next.i24, %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEviT_iT0_.exit.i ], [ 0, %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEviT_iT0_.exit26.i ] ; <i32> [#uses=2]
  %j.134.i = sub i32 1999, %indvar.i9             ; <i32> [#uses=4]
  %scevgep42.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %j.134.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=2]
  %529 = load double* %scevgep42.i, align 8       ; <double> [#uses=2]
  %530 = load double* getelementptr inbounds ([2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0), align 32 ; <double> [#uses=1]
  store double %530, double* %scevgep42.i, align 8
  %531 = icmp sgt i32 %j.134.i, 2                 ; <i1> [#uses=1]
  br i1 %531, label %bb.i.i12, label %bb4.i.i15

bb.i.i12:                                         ; preds = %bb.i.i12, %bb4.i10
  %i.15.i.i = phi i32 [ %phitmp.i.i11, %bb.i.i12 ], [ 2, %bb4.i10 ] ; <i32> [#uses=3]
  %free.02.i.i = phi i32 [ %539, %bb.i.i12 ], [ 0, %bb4.i10 ] ; <i32> [#uses=1]
  %532 = add i32 %i.15.i.i, -1                    ; <i32> [#uses=1]
  %533 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %532, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %534 = load double* %533, align 8               ; <double> [#uses=1]
  %535 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %i.15.i.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %536 = load double* %535, align 16              ; <double> [#uses=1]
  %537 = fcmp olt double %534, %536               ; <i1> [#uses=1]
  %538 = zext i1 %537 to i32                      ; <i32> [#uses=1]
  %i.1..i.i = or i32 %538, %i.15.i.i              ; <i32> [#uses=2]
  %539 = add i32 %i.1..i.i, -1                    ; <i32> [#uses=3]
  %540 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %539, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %541 = load double* %540, align 8               ; <double> [#uses=1]
  %542 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %free.02.i.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  store double %541, double* %542, align 8
  %phitmp.i.i11 = shl i32 %i.1..i.i, 1            ; <i32> [#uses=3]
  %543 = icmp slt i32 %phitmp.i.i11, %j.134.i     ; <i1> [#uses=1]
  br i1 %543, label %bb.i.i12, label %bb4.i.i15

bb4.i.i15:                                        ; preds = %bb.i.i12, %bb4.i10
  %i.1.lcssa.i.i13 = phi i32 [ 2, %bb4.i10 ], [ %phitmp.i.i11, %bb.i.i12 ] ; <i32> [#uses=2]
  %free.0.lcssa.i.i14 = phi i32 [ 0, %bb4.i10 ], [ %539, %bb.i.i12 ] ; <i32> [#uses=3]
  %544 = icmp eq i32 %i.1.lcssa.i.i13, %j.134.i   ; <i1> [#uses=1]
  br i1 %544, label %bb5.i.i16, label %bb8.i.i22

bb5.i.i16:                                        ; preds = %bb4.i.i15
  %545 = add i32 %i.1.lcssa.i.i13, -1             ; <i32> [#uses=3]
  %546 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %545, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %547 = load double* %546, align 8               ; <double> [#uses=1]
  %548 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %free.0.lcssa.i.i14, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  store double %547, double* %548, align 8
  br label %bb8.i.i22

bb7.i.i17:                                        ; preds = %bb9.i.i23
  %549 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %free.2.i.i18, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  store double %552, double* %549, align 8
  br label %bb8.i.i22

bb8.i.i22:                                        ; preds = %bb7.i.i17, %bb5.i.i16, %bb4.i.i15
  %free.2.i.i18 = phi i32 [ %i.2.i.i21, %bb7.i.i17 ], [ %545, %bb5.i.i16 ], [ %free.0.lcssa.i.i14, %bb4.i.i15 ] ; <i32> [#uses=3]
  %i.2.in.in.i.i19 = phi i32 [ %i.2.i.i21, %bb7.i.i17 ], [ %545, %bb5.i.i16 ], [ %free.0.lcssa.i.i14, %bb4.i.i15 ] ; <i32> [#uses=1]
  %i.2.in.i.i20 = add i32 %i.2.in.in.i.i19, -1    ; <i32> [#uses=1]
  %i.2.i.i21 = sdiv i32 %i.2.in.i.i20, 2          ; <i32> [#uses=3]
  %550 = icmp sgt i32 %free.2.i.i18, 0            ; <i1> [#uses=1]
  br i1 %550, label %bb9.i.i23, label %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEviT_iT0_.exit.i

bb9.i.i23:                                        ; preds = %bb8.i.i22
  %551 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %i.2.i.i21, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %552 = load double* %551, align 8               ; <double> [#uses=2]
  %553 = fcmp olt double %552, %529               ; <i1> [#uses=1]
  br i1 %553, label %bb7.i.i17, label %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEviT_iT0_.exit.i

_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEviT_iT0_.exit.i: ; preds = %bb9.i.i23, %bb8.i.i22
  %554 = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %free.2.i.i18, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  store double %529, double* %554, align 8
  %indvar.next.i24 = add i32 %indvar.i9, 1        ; <i32> [#uses=2]
  %exitcond.i25 = icmp eq i32 %indvar.next.i24, 1999 ; <i1> [#uses=1]
  br i1 %exitcond.i25, label %bb2.i.i.i, label %bb4.i10

bb.i.i.i:                                         ; preds = %bb2.i.i.i
  %scevgep45.i.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %tmp710, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %scevgep3.i.i.i = getelementptr inbounds [2000 x %"struct.ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<ValueWrapper<double> > > > > > > > > >"]* @V10Data, i32 0, i32 %indvar.i.i.i, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0 ; <double*> [#uses=1]
  %555 = load double* %scevgep45.i.i.i, align 8   ; <double> [#uses=1]
  %556 = load double* %scevgep3.i.i.i, align 8    ; <double> [#uses=1]
  %557 = fcmp olt double %555, %556               ; <i1> [#uses=1]
  br i1 %557, label %bb.i2.i, label %bb2.i.i.i

bb2.i.i.i:                                        ; preds = %bb.i.i.i, %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEviT_iT0_.exit.i
  %indvar.i.i.i = phi i32 [ %tmp710, %bb.i.i.i ], [ 0, %_ZN9benchmark7sift_inI14PointerWrapperI12ValueWrapperIS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IS2_IdEEEEEEEEEEESC_EEviT_iT0_.exit.i ] ; <i32> [#uses=2]
  %tmp710 = add i32 %indvar.i.i.i, 1              ; <i32> [#uses=3]
  %first_addr.0.0.i.i.i.idx.mask = and i32 %tmp710, 536870911 ; <i32> [#uses=1]
  %558 = icmp eq i32 %first_addr.0.0.i.i.i.idx.mask, 2000 ; <i1> [#uses=1]
  br i1 %558, label %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEEEvT_SD_.exit.i, label %bb.i.i.i

bb.i2.i:                                          ; preds = %bb.i.i.i
  %559 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 0) nounwind ; <i32> [#uses=0]
  br label %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEEEvT_SD_.exit.i

_Z13verify_sortedI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEEEvT_SD_.exit.i: ; preds = %bb.i2.i, %bb2.i.i.i
  %560 = icmp slt i32 %tmp12.i, %151              ; <i1> [#uses=1]
  br i1 %560, label %bb.i, label %_Z14test_heap_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit

_Z14test_heap_sortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit: ; preds = %_Z13verify_sortedI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEEEvT_SD_.exit.i, %_Z14test_heap_sortIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_SC_SC_T0_PKc.exit, %_Z14test_heap_sortI14PointerWrapperI12ValueWrapperIdEES2_EvT_S4_S4_S4_T0_PKc.exit, %_Z14test_heap_sortIP12ValueWrapperIdES1_EvT_S3_S3_S3_T0_PKc.exit, %_Z14test_heap_sortIPddEvT_S1_S1_S1_T0_PKc.exit, %_Z14test_quicksortI14PointerWrapperI12ValueWrapperIS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IS1_IdEEEEEEEEEEESB_EvT_SD_SD_SD_T0_PKc.exit, %_Z14test_quicksortIP12ValueWrapperIS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IS0_IdEEEEEEEEEESA_EvT_SC_SC_SC_T0_PKc.exit, %_Z14test_quicksortIP12ValueWrapperIdES1_EvT_S3_S3_S3_T0_PKc.exit, %_Z14test_quicksortI14PointerWrapperIdEdEvT_S2_S2_S2_T0_PKc.exit, %_Z14test_quicksortIPddEvT_S1_S1_S1_T0_PKc.exit
  ret i32 0
}

declare i32 @atoi(i8* nocapture) nounwind readonly

declare double @atof(i8* nocapture) nounwind readonly

declare void @srand(i32) nounwind
