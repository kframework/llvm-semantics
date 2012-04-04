; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/cmpdi-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@args = global [8 x i64] [i64 0, i64 1, i64 -1, i64 9223372036854775807, i64 -9223372036854775808, i64 -9223372036854775807, i64 1891269347843992664, i64 -7816825554603336956], align 16
@correct_results = global [640 x i32] [i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13], align 16

define i32 @feq(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %cmp = icmp eq i64 %x, %y
  %. = select i1 %cmp, i32 13, i32 140
  ret i32 %.
}

define i32 @fne(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %cmp = icmp eq i64 %x, %y
  %. = select i1 %cmp, i32 140, i32 13
  ret i32 %.
}

define i32 @flt(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i64 %x, %y
  %. = select i1 %cmp, i32 13, i32 140
  ret i32 %.
}

define i32 @fge(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i64 %x, %y
  %. = select i1 %cmp, i32 140, i32 13
  ret i32 %.
}

define i32 @fgt(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %cmp = icmp sgt i64 %x, %y
  %. = select i1 %cmp, i32 13, i32 140
  ret i32 %.
}

define i32 @fle(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %cmp = icmp sgt i64 %x, %y
  %. = select i1 %cmp, i32 140, i32 13
  ret i32 %.
}

define i32 @fltu(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %cmp = icmp ult i64 %x, %y
  %. = select i1 %cmp, i32 13, i32 140
  ret i32 %.
}

define i32 @fgeu(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %cmp = icmp ult i64 %x, %y
  %. = select i1 %cmp, i32 140, i32 13
  ret i32 %.
}

define i32 @fgtu(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %cmp = icmp ugt i64 %x, %y
  %. = select i1 %cmp, i32 13, i32 140
  ret i32 %.
}

define i32 @fleu(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %cmp = icmp ugt i64 %x, %y
  %. = select i1 %cmp, i32 140, i32 13
  ret i32 %.
}

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc52, %entry
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %for.inc52 ], [ 0, %entry ]
  %res.0 = phi i32* [ %res.1, %for.inc52 ], [ getelementptr inbounds ([640 x i32]* @correct_results, i64 0, i64 0), %entry ]
  %0 = trunc i64 %indvars.iv93 to i32
  %cmp = icmp slt i32 %0, 8
  br i1 %cmp, label %for.body, label %for.end54

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [8 x i64]* @args, i64 0, i64 %indvars.iv93
  %1 = load i64* %arrayidx, align 8, !tbaa !0
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body ]
  %res.1 = phi i32* [ %incdec.ptr48, %for.inc ], [ %res.0, %for.body ]
  %2 = trunc i64 %indvars.iv to i32
  %cmp2 = icmp slt i32 %2, 8
  br i1 %cmp2, label %for.body3, label %for.inc52

for.body3:                                        ; preds = %for.cond1
  %arrayidx5 = getelementptr inbounds [8 x i64]* @args, i64 0, i64 %indvars.iv
  %3 = load i64* %arrayidx5, align 8, !tbaa !0
  %cmp.i = icmp eq i64 %1, %3
  %..i = select i1 %cmp.i, i32 13, i32 140
  %4 = load i32* %res.1, align 4, !tbaa !3
  %cmp6 = icmp eq i32 %..i, %4
  br i1 %cmp6, label %if.end, label %if.then

if.then:                                          ; preds = %for.body3
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body3
  %incdec.ptr = getelementptr inbounds i32* %res.1, i64 1
  %..i72 = select i1 %cmp.i, i32 140, i32 13
  %5 = load i32* %incdec.ptr, align 4, !tbaa !3
  %cmp9 = icmp eq i32 %..i72, %5
  br i1 %cmp9, label %if.end11, label %if.then10

if.then10:                                        ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.end
  %incdec.ptr8 = getelementptr inbounds i32* %res.1, i64 2
  %cmp.i69 = icmp slt i64 %1, %3
  %..i70 = select i1 %cmp.i69, i32 13, i32 140
  %6 = load i32* %incdec.ptr8, align 4, !tbaa !3
  %cmp14 = icmp eq i32 %..i70, %6
  br i1 %cmp14, label %if.end16, label %if.then15

if.then15:                                        ; preds = %if.end11
  tail call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end11
  %incdec.ptr13 = getelementptr inbounds i32* %res.1, i64 3
  %..i68 = select i1 %cmp.i69, i32 140, i32 13
  %7 = load i32* %incdec.ptr13, align 4, !tbaa !3
  %cmp19 = icmp eq i32 %..i68, %7
  br i1 %cmp19, label %if.end21, label %if.then20

if.then20:                                        ; preds = %if.end16
  tail call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %if.end16
  %incdec.ptr18 = getelementptr inbounds i32* %res.1, i64 4
  %cmp.i65 = icmp sgt i64 %1, %3
  %..i66 = select i1 %cmp.i65, i32 13, i32 140
  %8 = load i32* %incdec.ptr18, align 4, !tbaa !3
  %cmp24 = icmp eq i32 %..i66, %8
  br i1 %cmp24, label %if.end26, label %if.then25

if.then25:                                        ; preds = %if.end21
  tail call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %if.end21
  %incdec.ptr23 = getelementptr inbounds i32* %res.1, i64 5
  %..i64 = select i1 %cmp.i65, i32 140, i32 13
  %9 = load i32* %incdec.ptr23, align 4, !tbaa !3
  %cmp29 = icmp eq i32 %..i64, %9
  br i1 %cmp29, label %if.end31, label %if.then30

if.then30:                                        ; preds = %if.end26
  tail call void @abort() noreturn nounwind
  unreachable

if.end31:                                         ; preds = %if.end26
  %incdec.ptr28 = getelementptr inbounds i32* %res.1, i64 6
  %cmp.i61 = icmp ult i64 %1, %3
  %..i62 = select i1 %cmp.i61, i32 13, i32 140
  %10 = load i32* %incdec.ptr28, align 4, !tbaa !3
  %cmp34 = icmp eq i32 %..i62, %10
  br i1 %cmp34, label %if.end36, label %if.then35

if.then35:                                        ; preds = %if.end31
  tail call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end31
  %incdec.ptr33 = getelementptr inbounds i32* %res.1, i64 7
  %..i60 = select i1 %cmp.i61, i32 140, i32 13
  %11 = load i32* %incdec.ptr33, align 4, !tbaa !3
  %cmp39 = icmp eq i32 %..i60, %11
  br i1 %cmp39, label %if.end41, label %if.then40

if.then40:                                        ; preds = %if.end36
  tail call void @abort() noreturn nounwind
  unreachable

if.end41:                                         ; preds = %if.end36
  %incdec.ptr38 = getelementptr inbounds i32* %res.1, i64 8
  %cmp.i57 = icmp ugt i64 %1, %3
  %..i58 = select i1 %cmp.i57, i32 13, i32 140
  %12 = load i32* %incdec.ptr38, align 4, !tbaa !3
  %cmp44 = icmp eq i32 %..i58, %12
  br i1 %cmp44, label %if.end46, label %if.then45

if.then45:                                        ; preds = %if.end41
  tail call void @abort() noreturn nounwind
  unreachable

if.end46:                                         ; preds = %if.end41
  %incdec.ptr43 = getelementptr inbounds i32* %res.1, i64 9
  %..i56 = select i1 %cmp.i57, i32 140, i32 13
  %13 = load i32* %incdec.ptr43, align 4, !tbaa !3
  %cmp49 = icmp eq i32 %..i56, %13
  br i1 %cmp49, label %for.inc, label %if.then50

if.then50:                                        ; preds = %if.end46
  tail call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %if.end46
  %incdec.ptr48 = getelementptr inbounds i32* %res.1, i64 10
  %indvars.iv.next = add i64 %indvars.iv, 1
  br label %for.cond1

for.inc52:                                        ; preds = %for.cond1
  %indvars.iv.next94 = add i64 %indvars.iv93, 1
  br label %for.cond

for.end54:                                        ; preds = %for.cond
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"long long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
