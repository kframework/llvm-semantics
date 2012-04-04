; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr27285.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i8, i8, i8, [16 x i8] }

@main.x = private unnamed_addr constant %struct.S { i8 0, i8 25, i8 0, [16 x i8] c"\AA\BB\CC\DD\00\00\00\00\00\00\00\00\00\00\00\00" }, align 1

define void @foo(%struct.S* nocapture %x, %struct.S* nocapture %y) nounwind uwtable noinline {
entry:
  %b1 = getelementptr inbounds %struct.S* %x, i64 0, i32 1
  %0 = load i8* %b1, align 1, !tbaa !0
  %tobool13 = icmp eq i8 %0, 0
  br i1 %tobool13, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %conv = zext i8 %0 to i32
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %if.end
  %indvars.iv = phi i64 [ 0, %while.body.lr.ph ], [ %indvars.iv.next, %if.end ]
  %b.015 = phi i32 [ %conv, %while.body.lr.ph ], [ %b.1, %if.end ]
  %cmp = icmp sgt i32 %b.015, 7
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %sub = add nsw i32 %b.015, -8
  br label %if.end

if.else:                                          ; preds = %while.body
  %sub6 = sub nsw i32 8, %b.015
  %shl = shl i32 255, %sub6
  %phitmp = and i32 %shl, 255
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %b.1 = phi i32 [ %sub, %if.then ], [ 0, %if.else ]
  %c.0 = phi i32 [ 255, %if.then ], [ %phitmp, %if.else ]
  %arrayidx = getelementptr inbounds %struct.S* %x, i64 0, i32 3, i64 %indvars.iv
  %1 = load i8* %arrayidx, align 1, !tbaa !0
  %conv8 = zext i8 %1 to i32
  %and = and i32 %conv8, %c.0
  %conv10 = trunc i32 %and to i8
  %arrayidx12 = getelementptr inbounds %struct.S* %y, i64 0, i32 3, i64 %indvars.iv
  store i8 %conv10, i8* %arrayidx12, align 1, !tbaa !0
  %indvars.iv.next = add i64 %indvars.iv, 1
  %tobool = icmp eq i32 %b.1, 0
  br i1 %tobool, label %while.end, label %while.body

while.end:                                        ; preds = %if.end, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %x = alloca %struct.S, align 1
  %y = alloca %struct.S, align 1
  %0 = getelementptr inbounds %struct.S* %x, i64 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds (%struct.S* @main.x, i64 0, i32 0), i64 19, i32 1, i1 false)
  %1 = getelementptr inbounds %struct.S* %y, i64 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 19, i32 1, i1 false)
  call void @foo(%struct.S* %x, %struct.S* %y)
  %arrayidx = getelementptr inbounds %struct.S* %x, i64 0, i32 3, i64 0
  %2 = load i8* %arrayidx, align 1, !tbaa !0
  %arrayidx2 = getelementptr inbounds %struct.S* %y, i64 0, i32 3, i64 0
  %3 = load i8* %arrayidx2, align 1, !tbaa !0
  %cmp = icmp eq i8 %2, %3
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %arrayidx6 = getelementptr inbounds %struct.S* %x, i64 0, i32 3, i64 1
  %4 = load i8* %arrayidx6, align 1, !tbaa !0
  %arrayidx9 = getelementptr inbounds %struct.S* %y, i64 0, i32 3, i64 1
  %5 = load i8* %arrayidx9, align 1, !tbaa !0
  %cmp11 = icmp eq i8 %4, %5
  br i1 %cmp11, label %lor.lhs.false13, label %if.then

lor.lhs.false13:                                  ; preds = %lor.lhs.false
  %arrayidx15 = getelementptr inbounds %struct.S* %x, i64 0, i32 3, i64 2
  %6 = load i8* %arrayidx15, align 1, !tbaa !0
  %arrayidx18 = getelementptr inbounds %struct.S* %y, i64 0, i32 3, i64 2
  %7 = load i8* %arrayidx18, align 1, !tbaa !0
  %cmp20 = icmp eq i8 %6, %7
  br i1 %cmp20, label %lor.lhs.false22, label %if.then

lor.lhs.false22:                                  ; preds = %lor.lhs.false13
  %arrayidx24 = getelementptr inbounds %struct.S* %x, i64 0, i32 3, i64 3
  %8 = load i8* %arrayidx24, align 1, !tbaa !0
  %conv25 = zext i8 %8 to i32
  %and = and i32 %conv25, 128
  %arrayidx27 = getelementptr inbounds %struct.S* %y, i64 0, i32 3, i64 3
  %9 = load i8* %arrayidx27, align 1, !tbaa !0
  %conv28 = zext i8 %9 to i32
  %cmp29 = icmp eq i32 %and, %conv28
  br i1 %cmp29, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false22, %lor.lhs.false13, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false22
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
