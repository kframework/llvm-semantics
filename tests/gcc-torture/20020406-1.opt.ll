; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020406-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.DUPFFstruct = type { i32, i32, i32* }

@.str = private unnamed_addr constant [40 x i8] c"DUPFFexgcd called on degrees %d and %d\0A\00", align 1
@.str1 = private unnamed_addr constant [41 x i8] c"calling DUPFFexgcd on degrees %d and %d\0A\00", align 1

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define i32 @FFmul(i32 %x, i32 %y) nounwind uwtable readnone {
entry:
  ret i32 %x
}

define i32 @DUPFFdeg(%struct.DUPFFstruct* nocapture %f) nounwind uwtable readonly {
entry:
  %deg = getelementptr inbounds %struct.DUPFFstruct* %f, i64 0, i32 1
  %tmp1 = load i32* %deg, align 4
  ret i32 %tmp1
}

define %struct.DUPFFstruct* @DUPFFnew(i32 %maxdeg) nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 16) nounwind
  %0 = bitcast i8* %call to %struct.DUPFFstruct*
  %coeffs = getelementptr inbounds i8* %call, i64 8
  %1 = bitcast i8* %coeffs to i32**
  store i32* null, i32** %1, align 8
  %cmp = icmp sgt i32 %maxdeg, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %add = add nsw i32 %maxdeg, 1
  %conv = sext i32 %add to i64
  %call3 = tail call noalias i8* @calloc(i64 %conv, i64 4) nounwind
  %2 = bitcast i8* %call3 to i32*
  store i32* %2, i32** %1, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %maxdeg8 = bitcast i8* %call to i32*
  store i32 %maxdeg, i32* %maxdeg8, align 4
  %deg = getelementptr inbounds i8* %call, i64 4
  %3 = bitcast i8* %deg to i32*
  store i32 -1, i32* %3, align 4
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

define %struct.DUPFFstruct* @DUPFFexgcd(%struct.DUPFFstruct** %fcofac, %struct.DUPFFstruct** %gcofac, %struct.DUPFFstruct* %f, %struct.DUPFFstruct* %g) nounwind uwtable {
entry:
  %deg.i.phi.trans.insert = getelementptr inbounds %struct.DUPFFstruct* %f, i64 0, i32 1
  %tmp1.i.pre = load i32* %deg.i.phi.trans.insert, align 4
  %deg.i2.phi.trans.insert = getelementptr inbounds %struct.DUPFFstruct* %g, i64 0, i32 1
  %tmp1.i3.pre = load i32* %deg.i2.phi.trans.insert, align 4
  br label %tailrecurse

tailrecurse:                                      ; preds = %tailrecurse, %entry
  %tmp1.i3 = phi i32 [ %tmp1.i3.pre, %entry ], [ %tmp1.i14, %tailrecurse ]
  %tmp1.i = phi i32 [ %tmp1.i.pre, %entry ], [ %tmp1.i16, %tailrecurse ]
  %fcofac.tr = phi %struct.DUPFFstruct** [ %fcofac, %entry ], [ %gcofac.tr, %tailrecurse ]
  %gcofac.tr = phi %struct.DUPFFstruct** [ %gcofac, %entry ], [ %fcofac.tr, %tailrecurse ]
  %f.tr = phi %struct.DUPFFstruct* [ %f, %entry ], [ %g.tr, %tailrecurse ]
  %g.tr = phi %struct.DUPFFstruct* [ %g, %entry ], [ %f.tr, %tailrecurse ]
  %deg.i = getelementptr inbounds %struct.DUPFFstruct* %f.tr, i64 0, i32 1
  %deg.i2 = getelementptr inbounds %struct.DUPFFstruct* %g.tr, i64 0, i32 1
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str, i64 0, i64 0), i32 %tmp1.i, i32 %tmp1.i3) nounwind
  %tmp1.i14 = load i32* %deg.i, align 4
  %tmp1.i16 = load i32* %deg.i2, align 4
  %cmp = icmp slt i32 %tmp1.i14, %tmp1.i16
  br i1 %cmp, label %tailrecurse, label %if.end

if.end:                                           ; preds = %tailrecurse
  %cmp15 = icmp eq i32 %tmp1.i14, 2
  %cmp18 = icmp eq i32 %tmp1.i16, 1
  %or.cond = and i1 %cmp15, %cmp18
  br i1 %or.cond, label %if.end20, label %if.then19

if.then19:                                        ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end
  %coeffs = getelementptr inbounds %struct.DUPFFstruct* %f.tr, i64 0, i32 2
  %tmp22 = load i32** %coeffs, align 8
  %tmp23 = load i32* %tmp22, align 4
  %cmp24 = icmp eq i32 %tmp23, 0
  br i1 %cmp24, label %return, label %if.end27

if.end27:                                         ; preds = %if.end20
  %cmp31 = icmp slt i32 %tmp1.i14, 0
  %storemerge1 = select i1 %cmp31, i32 0, i32 %tmp1.i14
  %call.i43 = tail call noalias i8* @malloc(i64 16) nounwind
  %0 = bitcast i8* %call.i43 to %struct.DUPFFstruct*
  %coeffs.i44 = getelementptr inbounds i8* %call.i43, i64 8
  %1 = bitcast i8* %coeffs.i44 to i32**
  store i32* null, i32** %1, align 8
  %cmp.i45 = icmp sgt i32 %tmp1.i16, -1
  br i1 %cmp.i45, label %if.then.i49, label %DUPFFnew.exit52

if.then.i49:                                      ; preds = %if.end27
  %add.i46 = add nsw i32 %tmp1.i16, 1
  %conv.i47 = sext i32 %add.i46 to i64
  %call3.i48 = tail call noalias i8* @calloc(i64 %conv.i47, i64 4) nounwind
  %2 = bitcast i8* %call3.i48 to i32*
  store i32* %2, i32** %1, align 8
  br label %DUPFFnew.exit52

DUPFFnew.exit52:                                  ; preds = %if.end27, %if.then.i49
  %tmp48 = phi i32* [ null, %if.end27 ], [ %2, %if.then.i49 ]
  %maxdeg8.i50 = bitcast i8* %call.i43 to i32*
  store i32 %tmp1.i16, i32* %maxdeg8.i50, align 4
  %deg.i51 = getelementptr inbounds i8* %call.i43, i64 4
  %3 = bitcast i8* %deg.i51 to i32*
  store i32 1, i32* %tmp48, align 4
  store i32 0, i32* %3, align 4
  %call.i29 = tail call noalias i8* @malloc(i64 16) nounwind
  %4 = bitcast i8* %call.i29 to %struct.DUPFFstruct*
  %coeffs.i30 = getelementptr inbounds i8* %call.i29, i64 8
  %5 = bitcast i8* %coeffs.i30 to i32**
  store i32* null, i32** %5, align 8
  %cmp.i31 = icmp sgt i32 %storemerge1, -1
  br i1 %cmp.i31, label %if.then.i35, label %DUPFFnew.exit38

if.then.i35:                                      ; preds = %DUPFFnew.exit52
  %add.i32 = add nsw i32 %storemerge1, 1
  %conv.i33 = sext i32 %add.i32 to i64
  %call3.i34 = tail call noalias i8* @calloc(i64 %conv.i33, i64 4) nounwind
  %6 = bitcast i8* %call3.i34 to i32*
  store i32* %6, i32** %5, align 8
  br label %DUPFFnew.exit38

DUPFFnew.exit38:                                  ; preds = %DUPFFnew.exit52, %if.then.i35
  %maxdeg8.i36 = bitcast i8* %call.i29 to i32*
  store i32 %storemerge1, i32* %maxdeg8.i36, align 4
  %deg.i37 = getelementptr inbounds i8* %call.i29, i64 4
  %7 = bitcast i8* %deg.i37 to i32*
  store i32 -1, i32* %7, align 4
  %call.i17 = tail call noalias i8* @malloc(i64 16) nounwind
  %coeffs.i18 = getelementptr inbounds i8* %call.i17, i64 8
  %8 = bitcast i8* %coeffs.i18 to i32**
  store i32* null, i32** %8, align 8
  br i1 %cmp.i45, label %if.then.i23, label %DUPFFnew.exit26

if.then.i23:                                      ; preds = %DUPFFnew.exit38
  %add.i20 = add nsw i32 %tmp1.i16, 1
  %conv.i21 = sext i32 %add.i20 to i64
  %call3.i22 = tail call noalias i8* @calloc(i64 %conv.i21, i64 4) nounwind
  %9 = bitcast i8* %call3.i22 to i32*
  store i32* %9, i32** %8, align 8
  br label %DUPFFnew.exit26

DUPFFnew.exit26:                                  ; preds = %DUPFFnew.exit38, %if.then.i23
  %maxdeg8.i24 = bitcast i8* %call.i17 to i32*
  store i32 %tmp1.i16, i32* %maxdeg8.i24, align 4
  %deg.i25 = getelementptr inbounds i8* %call.i17, i64 4
  %10 = bitcast i8* %deg.i25 to i32*
  store i32 -1, i32* %10, align 4
  %call.i = tail call noalias i8* @malloc(i64 16) nounwind
  %coeffs.i = getelementptr inbounds i8* %call.i, i64 8
  %11 = bitcast i8* %coeffs.i to i32**
  store i32* null, i32** %11, align 8
  br i1 %cmp.i31, label %if.then.i, label %DUPFFnew.exit

if.then.i:                                        ; preds = %DUPFFnew.exit26
  %add.i = add nsw i32 %storemerge1, 1
  %conv.i = sext i32 %add.i to i64
  %call3.i = tail call noalias i8* @calloc(i64 %conv.i, i64 4) nounwind
  %12 = bitcast i8* %call3.i to i32*
  store i32* %12, i32** %11, align 8
  br label %DUPFFnew.exit

DUPFFnew.exit:                                    ; preds = %DUPFFnew.exit26, %if.then.i
  %tmp59 = phi i32* [ null, %DUPFFnew.exit26 ], [ %12, %if.then.i ]
  %maxdeg8.i = bitcast i8* %call.i to i32*
  store i32 %storemerge1, i32* %maxdeg8.i, align 4
  %deg.i12 = getelementptr inbounds i8* %call.i, i64 4
  %13 = bitcast i8* %deg.i12 to i32*
  store i32 1, i32* %tmp59, align 4
  store i32 0, i32* %13, align 4
  %tmp1.i1155 = load i32* %deg.i2, align 4
  %cmp6556 = icmp sgt i32 %tmp1.i1155, 0
  br i1 %cmp6556, label %while.cond75.preheader.lr.ph.split.us, label %if.end133

while.cond75.preheader.lr.ph.split.us:            ; preds = %DUPFFnew.exit
  %tmp1.i7 = load i32* %deg.i, align 4
  br label %while.cond75.preheader.us

while.cond75.preheader.us:                        ; preds = %while.cond75.preheader.us, %while.cond75.preheader.lr.ph.split.us
  %cmp79.us = icmp slt i32 %tmp1.i7, %tmp1.i1155
  br i1 %cmp79.us, label %while.cond75.preheader.us, label %while.cond75.us

while.cond75.us:                                  ; preds = %while.cond75.preheader.us, %while.cond75.us
  br label %while.cond75.us

if.end133:                                        ; preds = %DUPFFnew.exit
  store %struct.DUPFFstruct* %0, %struct.DUPFFstruct** %fcofac.tr, align 8
  store %struct.DUPFFstruct* %4, %struct.DUPFFstruct** %gcofac.tr, align 8
  br label %return

return:                                           ; preds = %if.end20, %if.end133
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
  store i32* null, i32** %1, align 8
  %call3.i = call noalias i8* @calloc(i64 2, i64 4) nounwind
  %2 = bitcast i8* %call3.i to i32*
  store i32* %2, i32** %1, align 8
  %maxdeg8.i = bitcast i8* %call.i to i32*
  store i32 1, i32* %maxdeg8.i, align 4
  %deg.i = getelementptr inbounds i8* %call.i, i64 4
  %3 = bitcast i8* %deg.i to i32*
  %arrayidx = getelementptr inbounds i8* %call3.i, i64 4
  %4 = bitcast i8* %arrayidx to i32*
  store i32 1, i32* %4, align 4
  store i32 1, i32* %3, align 4
  %call.i1 = call noalias i8* @malloc(i64 16) nounwind
  %5 = bitcast i8* %call.i1 to %struct.DUPFFstruct*
  %coeffs.i2 = getelementptr inbounds i8* %call.i1, i64 8
  %6 = bitcast i8* %coeffs.i2 to i32**
  store i32* null, i32** %6, align 8
  %call3.i3 = call noalias i8* @calloc(i64 3, i64 4) nounwind
  %7 = bitcast i8* %call3.i3 to i32*
  store i32* %7, i32** %6, align 8
  %maxdeg8.i4 = bitcast i8* %call.i1 to i32*
  store i32 2, i32* %maxdeg8.i4, align 4
  %deg.i5 = getelementptr inbounds i8* %call.i1, i64 4
  %8 = bitcast i8* %deg.i5 to i32*
  %arrayidx7 = getelementptr inbounds i8* %call3.i3, i64 8
  %9 = bitcast i8* %arrayidx7 to i32*
  store i32 1, i32* %9, align 4
  store i32 2, i32* %8, align 4
  %tmp1.i = load i32* %3, align 4
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str1, i64 0, i64 0), i32 %tmp1.i, i32 2) nounwind
  %call17 = call %struct.DUPFFstruct* @DUPFFexgcd(%struct.DUPFFstruct** %cf, %struct.DUPFFstruct** %cg, %struct.DUPFFstruct* %0, %struct.DUPFFstruct* %5)
  ret i32 0
}
