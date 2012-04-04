; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020406-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.DUPFFstruct = type { i32, i32, i32* }

@.str = private unnamed_addr constant [40 x i8] c"DUPFFexgcd called on degrees %d and %d\0A\00", align 1
@.str1 = private unnamed_addr constant [41 x i8] c"calling DUPFFexgcd on degrees %d and %d\0A\00", align 1

define i32 @FFmul(i32 %x, i32 %y) nounwind uwtable readnone {
entry:
  ret i32 %x
}

define i32 @DUPFFdeg(%struct.DUPFFstruct* nocapture %f) nounwind uwtable readonly {
entry:
  %deg = getelementptr inbounds %struct.DUPFFstruct* %f, i64 0, i32 1
  %0 = load i32* %deg, align 4, !tbaa !0
  ret i32 %0
}

define noalias %struct.DUPFFstruct* @DUPFFnew(i32 %maxdeg) nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 16) nounwind
  %0 = bitcast i8* %call to %struct.DUPFFstruct*
  %coeffs = getelementptr inbounds i8* %call, i64 8
  %1 = bitcast i8* %coeffs to i32**
  store i32* null, i32** %1, align 8, !tbaa !3
  %cmp = icmp sgt i32 %maxdeg, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %add = add nsw i32 %maxdeg, 1
  %conv = sext i32 %add to i64
  %call1 = tail call noalias i8* @calloc(i64 %conv, i64 4) nounwind
  %2 = bitcast i8* %call1 to i32*
  store i32* %2, i32** %1, align 8, !tbaa !3
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %maxdeg3 = bitcast i8* %call to i32*
  store i32 %maxdeg, i32* %maxdeg3, align 4, !tbaa !0
  %deg = getelementptr inbounds i8* %call, i64 4
  %3 = bitcast i8* %deg to i32*
  store i32 -1, i32* %3, align 4, !tbaa !0
  ret %struct.DUPFFstruct* %0
}

declare noalias i8* @malloc(i64) nounwind

declare noalias i8* @calloc(i64, i64) nounwind

define void @DUPFFfree(%struct.DUPFFstruct* nocapture %x) nounwind uwtable readnone {
entry:
  ret void
}

define void @DUPFFswap(%struct.DUPFFstruct* nocapture %x, %struct.DUPFFstruct* nocapture %y) nounwind uwtable readnone {
entry:
  ret void
}

define %struct.DUPFFstruct* @DUPFFcopy(%struct.DUPFFstruct* %x) nounwind uwtable readnone {
entry:
  ret %struct.DUPFFstruct* %x
}

define void @DUPFFshift_add(%struct.DUPFFstruct* nocapture %f, %struct.DUPFFstruct* nocapture %g, i32 %deg, i32 %coeff) nounwind uwtable readnone {
entry:
  ret void
}

define %struct.DUPFFstruct* @DUPFFexgcd(%struct.DUPFFstruct** nocapture %fcofac, %struct.DUPFFstruct** nocapture %gcofac, %struct.DUPFFstruct* %f, %struct.DUPFFstruct* %g) nounwind uwtable {
entry:
  %deg.i.phi.trans.insert = getelementptr inbounds %struct.DUPFFstruct* %f, i64 0, i32 1
  %.pre = load i32* %deg.i.phi.trans.insert, align 4, !tbaa !0
  %deg.i59.phi.trans.insert = getelementptr inbounds %struct.DUPFFstruct* %g, i64 0, i32 1
  %.pre104 = load i32* %deg.i59.phi.trans.insert, align 4, !tbaa !0
  br label %tailrecurse

tailrecurse:                                      ; preds = %tailrecurse, %entry
  %0 = phi i32 [ %.pre104, %entry ], [ %2, %tailrecurse ]
  %1 = phi i32 [ %.pre, %entry ], [ %3, %tailrecurse ]
  %fcofac.tr = phi %struct.DUPFFstruct** [ %fcofac, %entry ], [ %gcofac.tr, %tailrecurse ]
  %gcofac.tr = phi %struct.DUPFFstruct** [ %gcofac, %entry ], [ %fcofac.tr, %tailrecurse ]
  %f.tr = phi %struct.DUPFFstruct* [ %f, %entry ], [ %g.tr, %tailrecurse ]
  %g.tr = phi %struct.DUPFFstruct* [ %g, %entry ], [ %f.tr, %tailrecurse ]
  %deg.i = getelementptr inbounds %struct.DUPFFstruct* %f.tr, i64 0, i32 1
  %deg.i59 = getelementptr inbounds %struct.DUPFFstruct* %g.tr, i64 0, i32 1
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str, i64 0, i64 0), i32 %1, i32 %0) nounwind
  %2 = load i32* %deg.i, align 4, !tbaa !0
  %3 = load i32* %deg.i59, align 4, !tbaa !0
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %tailrecurse, label %if.end

if.end:                                           ; preds = %tailrecurse
  %cmp7 = icmp eq i32 %2, 2
  %cmp9 = icmp eq i32 %3, 1
  %or.cond = and i1 %cmp7, %cmp9
  br i1 %or.cond, label %if.end11, label %if.then10

if.then10:                                        ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.end
  %coeffs = getelementptr inbounds %struct.DUPFFstruct* %f.tr, i64 0, i32 2
  %4 = load i32** %coeffs, align 8, !tbaa !3
  %5 = load i32* %4, align 4, !tbaa !0
  %cmp12 = icmp eq i32 %5, 0
  br i1 %cmp12, label %return, label %DUPFFnew.exit

DUPFFnew.exit:                                    ; preds = %if.end11
  %call.i90 = tail call noalias i8* @malloc(i64 16) nounwind
  %coeffs.i91 = getelementptr inbounds i8* %call.i90, i64 8
  %6 = bitcast i8* %coeffs.i91 to i32**
  %call1.i95 = tail call noalias i8* @calloc(i64 2, i64 4) nounwind
  %7 = bitcast i8* %call1.i95 to i32*
  store i32* %7, i32** %6, align 8, !tbaa !3
  %maxdeg3.i97 = bitcast i8* %call.i90 to i32*
  store i32 1, i32* %maxdeg3.i97, align 4, !tbaa !0
  %deg.i98 = getelementptr inbounds i8* %call.i90, i64 4
  %8 = bitcast i8* %deg.i98 to i32*
  store i32 1, i32* %7, align 4, !tbaa !0
  store i32 0, i32* %8, align 4, !tbaa !0
  %call.i78 = tail call noalias i8* @malloc(i64 16) nounwind
  %coeffs.i79 = getelementptr inbounds i8* %call.i78, i64 8
  %9 = bitcast i8* %coeffs.i79 to i32**
  %call1.i83 = tail call noalias i8* @calloc(i64 3, i64 4) nounwind
  %10 = bitcast i8* %call1.i83 to i32*
  store i32* %10, i32** %9, align 8, !tbaa !3
  %maxdeg3.i85 = bitcast i8* %call.i78 to i32*
  store i32 2, i32* %maxdeg3.i85, align 4, !tbaa !0
  %deg.i86 = getelementptr inbounds i8* %call.i78, i64 4
  %11 = bitcast i8* %deg.i86 to i32*
  store i32 -1, i32* %11, align 4, !tbaa !0
  %call.i67 = tail call noalias i8* @malloc(i64 16) nounwind
  %coeffs.i68 = getelementptr inbounds i8* %call.i67, i64 8
  %12 = bitcast i8* %coeffs.i68 to i32**
  %call1.i72 = tail call noalias i8* @calloc(i64 2, i64 4) nounwind
  %13 = bitcast i8* %call1.i72 to i32*
  store i32* %13, i32** %12, align 8, !tbaa !3
  %maxdeg3.i74 = bitcast i8* %call.i67 to i32*
  store i32 1, i32* %maxdeg3.i74, align 4, !tbaa !0
  %deg.i75 = getelementptr inbounds i8* %call.i67, i64 4
  %14 = bitcast i8* %deg.i75 to i32*
  store i32 -1, i32* %14, align 4, !tbaa !0
  %call.i = tail call noalias i8* @malloc(i64 16) nounwind
  %coeffs.i = getelementptr inbounds i8* %call.i, i64 8
  %15 = bitcast i8* %coeffs.i to i32**
  %call1.i = tail call noalias i8* @calloc(i64 3, i64 4) nounwind
  %16 = bitcast i8* %call1.i to i32*
  store i32* %16, i32** %15, align 8, !tbaa !3
  %maxdeg3.i = bitcast i8* %call.i to i32*
  store i32 2, i32* %maxdeg3.i, align 4, !tbaa !0
  %deg.i64 = getelementptr inbounds i8* %call.i, i64 4
  %17 = bitcast i8* %deg.i64 to i32*
  store i32 1, i32* %16, align 4, !tbaa !0
  store i32 0, i32* %17, align 4, !tbaa !0
  %18 = load i32* %deg.i59, align 4, !tbaa !0
  %cmp35101 = icmp sgt i32 %18, 0
  br i1 %cmp35101, label %while.cond40.preheader.lr.ph.split.us, label %if.end58

while.cond40.preheader.lr.ph.split.us:            ; preds = %DUPFFnew.exit
  %19 = load i32* %deg.i, align 4, !tbaa !0
  br label %while.cond40.preheader.us

while.cond40.preheader.us:                        ; preds = %while.cond40.preheader.us, %while.cond40.preheader.lr.ph.split.us
  %cmp42.us = icmp slt i32 %19, %18
  br i1 %cmp42.us, label %while.cond40.preheader.us, label %while.cond40.us

while.cond40.us:                                  ; preds = %while.cond40.preheader.us, %while.cond40.us
  br label %while.cond40.us

if.end58:                                         ; preds = %DUPFFnew.exit
  %20 = bitcast i8* %call.i78 to %struct.DUPFFstruct*
  %21 = bitcast i8* %call.i90 to %struct.DUPFFstruct*
  store %struct.DUPFFstruct* %21, %struct.DUPFFstruct** %fcofac.tr, align 8, !tbaa !3
  store %struct.DUPFFstruct* %20, %struct.DUPFFstruct** %gcofac.tr, align 8, !tbaa !3
  br label %return

return:                                           ; preds = %if.end11, %if.end58
  ret %struct.DUPFFstruct* %f.tr
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %cf = alloca %struct.DUPFFstruct*, align 8
  %cg = alloca %struct.DUPFFstruct*, align 8
  %call.i = call noalias i8* @malloc(i64 16) nounwind
  %0 = bitcast i8* %call.i to %struct.DUPFFstruct*
  %coeffs.i = getelementptr inbounds i8* %call.i, i64 8
  %1 = bitcast i8* %coeffs.i to i32**
  %call1.i = call noalias i8* @calloc(i64 2, i64 4) nounwind
  %2 = bitcast i8* %call1.i to i32*
  store i32* %2, i32** %1, align 8, !tbaa !3
  %maxdeg3.i = bitcast i8* %call.i to i32*
  store i32 1, i32* %maxdeg3.i, align 4, !tbaa !0
  %deg.i = getelementptr inbounds i8* %call.i, i64 4
  %3 = bitcast i8* %deg.i to i32*
  %arrayidx = getelementptr inbounds i8* %call1.i, i64 4
  %4 = bitcast i8* %arrayidx to i32*
  store i32 1, i32* %4, align 4, !tbaa !0
  store i32 1, i32* %3, align 4, !tbaa !0
  %call.i9 = call noalias i8* @malloc(i64 16) nounwind
  %5 = bitcast i8* %call.i9 to %struct.DUPFFstruct*
  %coeffs.i10 = getelementptr inbounds i8* %call.i9, i64 8
  %6 = bitcast i8* %coeffs.i10 to i32**
  %call1.i11 = call noalias i8* @calloc(i64 3, i64 4) nounwind
  %7 = bitcast i8* %call1.i11 to i32*
  store i32* %7, i32** %6, align 8, !tbaa !3
  %maxdeg3.i12 = bitcast i8* %call.i9 to i32*
  store i32 2, i32* %maxdeg3.i12, align 4, !tbaa !0
  %deg.i13 = getelementptr inbounds i8* %call.i9, i64 4
  %8 = bitcast i8* %deg.i13 to i32*
  %arrayidx3 = getelementptr inbounds i8* %call1.i11, i64 8
  %9 = bitcast i8* %arrayidx3 to i32*
  store i32 1, i32* %9, align 4, !tbaa !0
  store i32 2, i32* %8, align 4, !tbaa !0
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str1, i64 0, i64 0), i32 1, i32 2) nounwind
  %call8 = call %struct.DUPFFstruct* @DUPFFexgcd(%struct.DUPFFstruct** %cf, %struct.DUPFFstruct** %cg, %struct.DUPFFstruct* %0, %struct.DUPFFstruct* %5)
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
