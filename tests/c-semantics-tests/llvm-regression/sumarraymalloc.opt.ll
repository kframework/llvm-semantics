; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/sumarraymalloc.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"Sum1 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [11 x i8] c"Sum2 = %d\0A\00", align 1

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %cmp = icmp slt i32 %argc, 2
  br i1 %cmp, label %cond.end, label %cond.false

cond.false:                                       ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1
  %0 = load i8** %arrayidx, align 8, !tbaa !0
  %call.i = tail call i64 @strtol(i8* nocapture %0, i8** null, i32 10) nounwind
  %conv.i = trunc i64 %call.i to i32
  br label %cond.end

cond.end:                                         ; preds = %entry, %cond.false
  %cond = phi i32 [ %conv.i, %cond.false ], [ 10, %entry ]
  %conv = sext i32 %cond to i64
  %mul = shl nsw i64 %conv, 2
  %call1 = tail call noalias i8* @malloc(i64 %mul) nounwind
  %1 = bitcast i8* %call1 to i32*
  %cmp1.i = icmp eq i32 %cond, 0
  br i1 %cmp1.i, label %cond.end.FillArray.exit_crit_edge, label %for.body.i

cond.end.FillArray.exit_crit_edge:                ; preds = %cond.end
  %arrayidx.2.i.pre = getelementptr inbounds i8* %call1, i64 8
  %.pre36 = bitcast i8* %arrayidx.2.i.pre to i32*
  %arrayidx.3.i.pre = getelementptr inbounds i8* %call1, i64 12
  %.pre38 = bitcast i8* %arrayidx.3.i.pre to i32*
  %arrayidx.4.i.pre = getelementptr inbounds i8* %call1, i64 16
  %.pre40 = bitcast i8* %arrayidx.4.i.pre to i32*
  %arrayidx.5.i.pre = getelementptr inbounds i8* %call1, i64 20
  %.pre42 = bitcast i8* %arrayidx.5.i.pre to i32*
  %arrayidx.6.i.pre = getelementptr inbounds i8* %call1, i64 24
  %.pre44 = bitcast i8* %arrayidx.6.i.pre to i32*
  %arrayidx.7.i.pre = getelementptr inbounds i8* %call1, i64 28
  %.pre46 = bitcast i8* %arrayidx.7.i.pre to i32*
  %arrayidx.8.i.pre = getelementptr inbounds i8* %call1, i64 32
  %.pre48 = bitcast i8* %arrayidx.8.i.pre to i32*
  %arrayidx.9.i.pre = getelementptr inbounds i8* %call1, i64 36
  %.pre50 = bitcast i8* %arrayidx.9.i.pre to i32*
  br label %FillArray.exit

for.body.i:                                       ; preds = %cond.end, %for.body.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body.i ], [ 0, %cond.end ]
  %arrayidx.i = getelementptr inbounds i32* %1, i64 %indvars.iv.i
  %2 = trunc i64 %indvars.iv.i to i32
  store i32 %2, i32* %arrayidx.i, align 4, !tbaa !3
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %cond
  br i1 %exitcond, label %FillArray.exit.loopexit, label %for.body.i

FillArray.exit.loopexit:                          ; preds = %for.body.i
  %.pre = load i32* %1, align 4, !tbaa !3
  %arrayidx.1.i.phi.trans.insert = getelementptr inbounds i8* %call1, i64 4
  %.phi.trans.insert = bitcast i8* %arrayidx.1.i.phi.trans.insert to i32*
  %.pre15 = load i32* %.phi.trans.insert, align 4, !tbaa !3
  %arrayidx.2.i.phi.trans.insert = getelementptr inbounds i8* %call1, i64 8
  %.phi.trans.insert16 = bitcast i8* %arrayidx.2.i.phi.trans.insert to i32*
  %.pre17 = load i32* %.phi.trans.insert16, align 4, !tbaa !3
  %arrayidx.3.i.phi.trans.insert = getelementptr inbounds i8* %call1, i64 12
  %.phi.trans.insert18 = bitcast i8* %arrayidx.3.i.phi.trans.insert to i32*
  %.pre19 = load i32* %.phi.trans.insert18, align 4, !tbaa !3
  %arrayidx.4.i.phi.trans.insert = getelementptr inbounds i8* %call1, i64 16
  %.phi.trans.insert20 = bitcast i8* %arrayidx.4.i.phi.trans.insert to i32*
  %.pre21 = load i32* %.phi.trans.insert20, align 4, !tbaa !3
  %arrayidx.5.i.phi.trans.insert = getelementptr inbounds i8* %call1, i64 20
  %.phi.trans.insert22 = bitcast i8* %arrayidx.5.i.phi.trans.insert to i32*
  %.pre23 = load i32* %.phi.trans.insert22, align 4, !tbaa !3
  %arrayidx.6.i.phi.trans.insert = getelementptr inbounds i8* %call1, i64 24
  %.phi.trans.insert24 = bitcast i8* %arrayidx.6.i.phi.trans.insert to i32*
  %.pre25 = load i32* %.phi.trans.insert24, align 4, !tbaa !3
  %arrayidx.7.i.phi.trans.insert = getelementptr inbounds i8* %call1, i64 28
  %.phi.trans.insert26 = bitcast i8* %arrayidx.7.i.phi.trans.insert to i32*
  %.pre27 = load i32* %.phi.trans.insert26, align 4, !tbaa !3
  %arrayidx.8.i.phi.trans.insert = getelementptr inbounds i8* %call1, i64 32
  %.phi.trans.insert28 = bitcast i8* %arrayidx.8.i.phi.trans.insert to i32*
  %.pre29 = load i32* %.phi.trans.insert28, align 4, !tbaa !3
  %arrayidx.9.i.phi.trans.insert = getelementptr inbounds i8* %call1, i64 36
  %.phi.trans.insert30 = bitcast i8* %arrayidx.9.i.phi.trans.insert to i32*
  %.pre31 = load i32* %.phi.trans.insert30, align 4, !tbaa !3
  br label %FillArray.exit

FillArray.exit:                                   ; preds = %cond.end.FillArray.exit_crit_edge, %FillArray.exit.loopexit
  %.pre-phi51 = phi i32* [ %.pre50, %cond.end.FillArray.exit_crit_edge ], [ %.phi.trans.insert30, %FillArray.exit.loopexit ]
  %.pre-phi49 = phi i32* [ %.pre48, %cond.end.FillArray.exit_crit_edge ], [ %.phi.trans.insert28, %FillArray.exit.loopexit ]
  %.pre-phi47 = phi i32* [ %.pre46, %cond.end.FillArray.exit_crit_edge ], [ %.phi.trans.insert26, %FillArray.exit.loopexit ]
  %.pre-phi45 = phi i32* [ %.pre44, %cond.end.FillArray.exit_crit_edge ], [ %.phi.trans.insert24, %FillArray.exit.loopexit ]
  %.pre-phi43 = phi i32* [ %.pre42, %cond.end.FillArray.exit_crit_edge ], [ %.phi.trans.insert22, %FillArray.exit.loopexit ]
  %.pre-phi41 = phi i32* [ %.pre40, %cond.end.FillArray.exit_crit_edge ], [ %.phi.trans.insert20, %FillArray.exit.loopexit ]
  %.pre-phi39 = phi i32* [ %.pre38, %cond.end.FillArray.exit_crit_edge ], [ %.phi.trans.insert18, %FillArray.exit.loopexit ]
  %.pre-phi37 = phi i32* [ %.pre36, %cond.end.FillArray.exit_crit_edge ], [ %.phi.trans.insert16, %FillArray.exit.loopexit ]
  %3 = phi i32 [ undef, %cond.end.FillArray.exit_crit_edge ], [ %.pre15, %FillArray.exit.loopexit ]
  %4 = phi i32 [ undef, %cond.end.FillArray.exit_crit_edge ], [ %.pre31, %FillArray.exit.loopexit ]
  %5 = phi i32 [ undef, %cond.end.FillArray.exit_crit_edge ], [ %.pre29, %FillArray.exit.loopexit ]
  %6 = phi i32 [ undef, %cond.end.FillArray.exit_crit_edge ], [ %.pre27, %FillArray.exit.loopexit ]
  %7 = phi i32 [ undef, %cond.end.FillArray.exit_crit_edge ], [ %.pre25, %FillArray.exit.loopexit ]
  %8 = phi i32 [ undef, %cond.end.FillArray.exit_crit_edge ], [ %.pre23, %FillArray.exit.loopexit ]
  %9 = phi i32 [ undef, %cond.end.FillArray.exit_crit_edge ], [ %.pre21, %FillArray.exit.loopexit ]
  %10 = phi i32 [ undef, %cond.end.FillArray.exit_crit_edge ], [ %.pre19, %FillArray.exit.loopexit ]
  %11 = phi i32 [ undef, %cond.end.FillArray.exit_crit_edge ], [ %.pre17, %FillArray.exit.loopexit ]
  %12 = phi i32 [ undef, %cond.end.FillArray.exit_crit_edge ], [ %.pre, %FillArray.exit.loopexit ]
  %add.1.i6 = add i32 %3, %12
  %add.2.i7 = add i32 %add.1.i6, %11
  %add.3.i8 = add i32 %add.2.i7, %10
  %add.4.i9 = add i32 %add.3.i8, %9
  %add.5.i10 = add i32 %add.4.i9, %8
  %add.6.i11 = add i32 %add.5.i10, %7
  %add.7.i12 = add i32 %add.6.i11, %6
  %add.8.i13 = add i32 %add.7.i12, %5
  %add.9.i14 = add i32 %add.8.i13, %4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i32 %add.9.i14) nounwind
  %13 = load i32* %.pre-phi37, align 4, !tbaa !3
  %14 = load i32* %.pre-phi39, align 4, !tbaa !3
  %15 = load i32* %.pre-phi41, align 4, !tbaa !3
  %16 = load i32* %.pre-phi43, align 4, !tbaa !3
  %17 = load i32* %.pre-phi45, align 4, !tbaa !3
  %18 = load i32* %.pre-phi47, align 4, !tbaa !3
  %19 = load i32* %.pre-phi49, align 4, !tbaa !3
  %20 = load i32* %.pre-phi51, align 4, !tbaa !3
  %add.1.i = add i32 %3, %12
  %add.2.i = add i32 %add.1.i, %13
  %add.3.i = add i32 %add.2.i, %14
  %add.4.i = add i32 %add.3.i, %15
  %add.5.i = add i32 %add.4.i, %16
  %add.6.i = add i32 %add.5.i, %17
  %add.7.i = add i32 %add.6.i, %18
  %add.8.i = add i32 %add.7.i, %19
  %add.9.i = add i32 %add.8.i, %20
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i64 0, i64 0), i32 %add.9.i) nounwind
  tail call void @free(i8* %call1) nounwind
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @free(i8* nocapture) nounwind

declare i64 @strtol(i8*, i8** nocapture, i32) nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
