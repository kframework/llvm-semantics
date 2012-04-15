; ModuleID = 'heapsort.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [4 x i8] c"%f\0A\00", align 1 ; <[4 x i8]*> [#uses=1]

declare i32 @strtol(i8* noalias, i8** noalias nocapture, i32) nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %0, label %bb2, label %bb2.thread

bb2.thread:                                       ; preds = %entry
  %1 = malloc [8000001 x double]                  ; <[8000001 x double]*> [#uses=1]
  %.sub = getelementptr inbounds [8000001 x double]* %1, i32 0, i32 0 ; <double*> [#uses=1]
  br label %bb.nph

bb2:                                              ; preds = %entry
  %2 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %3 = load i8** %2, align 4                      ; <i8*> [#uses=1]
  %4 = tail call i32 @strtol(i8* noalias nocapture %3, i8** noalias null, i32 10) nounwind readonly ; <i32> [#uses=4]
  %5 = add nsw i32 %4, 1                          ; <i32> [#uses=1]
  %6 = malloc double, i32 %5                      ; <double*> [#uses=2]
  %7 = icmp slt i32 %4, 1                         ; <i1> [#uses=1]
  br i1 %7, label %bb5, label %bb.nph

bb.nph:                                           ; preds = %bb2, %bb2.thread
  %iftmp.19.0.reg2mem.0 = phi i32 [ %4, %bb2 ], [ 8000000, %bb2.thread ] ; <i32> [#uses=2]
  %.reg2mem.0 = phi double* [ %6, %bb2 ], [ %.sub, %bb2.thread ] ; <double*> [#uses=2]
  br label %bb3

bb3:                                              ; preds = %bb3, %bb.nph
  %indvar = phi i32 [ 0, %bb.nph ], [ %tmp, %bb3 ] ; <i32> [#uses=2]
  %last.3486.tmp.0 = phi i32 [ 42, %bb.nph ], [ %10, %bb3 ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=2]
  %scevgep = getelementptr double* %.reg2mem.0, i32 %tmp ; <double*> [#uses=1]
  %8 = mul i32 %last.3486.tmp.0, 3877             ; <i32> [#uses=1]
  %9 = add nsw i32 %8, 29573                      ; <i32> [#uses=1]
  %10 = srem i32 %9, 139968                       ; <i32> [#uses=2]
  %11 = sitofp i32 %10 to double                  ; <double> [#uses=1]
  %12 = fdiv double %11, 1.399680e+05             ; <double> [#uses=1]
  store double %12, double* %scevgep, align 4
  %tmp6 = add i32 %indvar, 2                      ; <i32> [#uses=1]
  %13 = icmp sgt i32 %tmp6, %iftmp.19.0.reg2mem.0 ; <i1> [#uses=1]
  br i1 %13, label %bb5, label %bb3

bb5:                                              ; preds = %bb3, %bb2
  %iftmp.19.0.reg2mem.1 = phi i32 [ %4, %bb2 ], [ %iftmp.19.0.reg2mem.0, %bb3 ] ; <i32> [#uses=3]
  %.reg2mem.1 = phi double* [ %6, %bb2 ], [ %.reg2mem.0, %bb3 ] ; <double*> [#uses=10]
  %14 = ashr i32 %iftmp.19.0.reg2mem.1, 1         ; <i32> [#uses=1]
  %15 = add nsw i32 %14, 1                        ; <i32> [#uses=1]
  %16 = getelementptr inbounds double* %.reg2mem.1, i32 1 ; <double*> [#uses=2]
  br label %bb.i

bb.i:                                             ; preds = %bb12.i, %bb5
  %ir.1.i = phi i32 [ %iftmp.19.0.reg2mem.1, %bb5 ], [ %ir.0.i, %bb12.i ] ; <i32> [#uses=3]
  %l.1.i = phi i32 [ %15, %bb5 ], [ %l.0.i, %bb12.i ] ; <i32> [#uses=3]
  %17 = icmp sgt i32 %l.1.i, 1                    ; <i1> [#uses=1]
  br i1 %17, label %bb1.i, label %bb2.i

bb1.i:                                            ; preds = %bb.i
  %18 = add i32 %l.1.i, -1                        ; <i32> [#uses=2]
  %19 = getelementptr inbounds double* %.reg2mem.1, i32 %18 ; <double*> [#uses=1]
  %20 = load double* %19, align 4                 ; <double> [#uses=1]
  br label %bb4.i

bb2.i:                                            ; preds = %bb.i
  %21 = getelementptr inbounds double* %.reg2mem.1, i32 %ir.1.i ; <double*> [#uses=2]
  %22 = load double* %21, align 4                 ; <double> [#uses=2]
  %23 = load double* %16, align 4                 ; <double> [#uses=1]
  store double %23, double* %21, align 4
  %24 = add i32 %ir.1.i, -1                       ; <i32> [#uses=2]
  %25 = icmp eq i32 %24, 1                        ; <i1> [#uses=1]
  br i1 %25, label %benchmark_heapsort.exit, label %bb4.i

bb4.i:                                            ; preds = %bb2.i, %bb1.i
  %ir.0.i = phi i32 [ %ir.1.i, %bb1.i ], [ %24, %bb2.i ] ; <i32> [#uses=4]
  %l.0.i = phi i32 [ %18, %bb1.i ], [ %l.1.i, %bb2.i ] ; <i32> [#uses=3]
  %rra.0.i = phi double [ %20, %bb1.i ], [ %22, %bb2.i ] ; <double> [#uses=2]
  %26 = add nsw i32 %ir.0.i, 1                    ; <i32> [#uses=1]
  br label %bb11.outer.i

bb11.outer.i:                                     ; preds = %bb9.i, %bb4.i
  %j.1.ph.in.i = phi i32 [ %l.0.i, %bb4.i ], [ %j.0.i, %bb9.i ] ; <i32> [#uses=1]
  %i.0.ph.i = phi i32 [ %l.0.i, %bb4.i ], [ %j.0.i, %bb9.i ] ; <i32> [#uses=2]
  %j.1.ph.i = shl i32 %j.1.ph.in.i, 1             ; <i32> [#uses=1]
  br label %bb11.i

bb5.i:                                            ; preds = %bb11.i
  %27 = icmp slt i32 %j.1.i, %ir.0.i              ; <i1> [#uses=1]
  br i1 %27, label %bb6.i, label %bb8.i

bb6.i:                                            ; preds = %bb5.i
  %28 = getelementptr inbounds double* %.reg2mem.1, i32 %j.1.i ; <double*> [#uses=1]
  %29 = load double* %28, align 4                 ; <double> [#uses=1]
  %30 = add i32 %j.1.i, 1                         ; <i32> [#uses=2]
  %31 = getelementptr inbounds double* %.reg2mem.1, i32 %30 ; <double*> [#uses=1]
  %32 = load double* %31, align 4                 ; <double> [#uses=1]
  %33 = fcmp olt double %29, %32                  ; <i1> [#uses=1]
  br i1 %33, label %bb7.i, label %bb8.i

bb7.i:                                            ; preds = %bb6.i
  br label %bb8.i

bb8.i:                                            ; preds = %bb7.i, %bb6.i, %bb5.i
  %j.0.i = phi i32 [ %30, %bb7.i ], [ %j.1.i, %bb5.i ], [ %j.1.i, %bb6.i ] ; <i32> [#uses=3]
  %34 = getelementptr inbounds double* %.reg2mem.1, i32 %j.0.i ; <double*> [#uses=1]
  %35 = load double* %34, align 4                 ; <double> [#uses=2]
  %36 = fcmp ogt double %35, %rra.0.i             ; <i1> [#uses=1]
  br i1 %36, label %bb9.i, label %bb11.i

bb9.i:                                            ; preds = %bb8.i
  %37 = getelementptr inbounds double* %.reg2mem.1, i32 %i.0.ph.i ; <double*> [#uses=1]
  store double %35, double* %37, align 4
  br label %bb11.outer.i

bb11.i:                                           ; preds = %bb8.i, %bb11.outer.i
  %j.1.i = phi i32 [ %j.1.ph.i, %bb11.outer.i ], [ %26, %bb8.i ] ; <i32> [#uses=6]
  %38 = icmp sgt i32 %j.1.i, %ir.0.i              ; <i1> [#uses=1]
  br i1 %38, label %bb12.i, label %bb5.i

bb12.i:                                           ; preds = %bb11.i
  %39 = getelementptr inbounds double* %.reg2mem.1, i32 %i.0.ph.i ; <double*> [#uses=1]
  store double %rra.0.i, double* %39, align 4
  br label %bb.i

benchmark_heapsort.exit:                          ; preds = %bb2.i
  store double %22, double* %16, align 4
  %40 = getelementptr inbounds double* %.reg2mem.1, i32 %iftmp.19.0.reg2mem.1 ; <double*> [#uses=1]
  %41 = load double* %40, align 4                 ; <double> [#uses=1]
  %42 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), double %41) nounwind ; <i32> [#uses=0]
  free double* %.reg2mem.1
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
