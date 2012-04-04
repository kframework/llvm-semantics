; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980707-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@buildargv.arglist = internal global [256 x i8*] zeroinitializer, align 16
@.str = private unnamed_addr constant [5 x i8] c" a b\00", align 1

define i8** @buildargv(i8* %input) nounwind uwtable {
entry:
  br label %while.cond1.outer

while.cond1.outer:                                ; preds = %if.end21, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end21 ], [ 0, %entry ]
  %numargs.0.ph = phi i32 [ %inc, %if.end21 ], [ 0, %entry ]
  %input.addr.0.ph = phi i8* [ %incdec.ptr22, %if.end21 ], [ %input, %entry ]
  br label %while.cond1

while.cond1:                                      ; preds = %while.cond1.outer, %while.body3
  %input.addr.0 = phi i8* [ %incdec.ptr, %while.body3 ], [ %input.addr.0.ph, %while.cond1.outer ]
  %0 = load i8* %input.addr.0, align 1, !tbaa !0
  switch i8 %0, label %if.end [
    i8 32, label %while.body3
    i8 0, label %while.end23
  ]

while.body3:                                      ; preds = %while.cond1
  %incdec.ptr = getelementptr inbounds i8* %input.addr.0, i64 1
  br label %while.cond1

if.end:                                           ; preds = %while.cond1
  %indvars.iv.next = add i64 %indvars.iv, 1
  %inc = add nsw i32 %numargs.0.ph, 1
  %arrayidx = getelementptr inbounds [256 x i8*]* @buildargv.arglist, i64 0, i64 %indvars.iv
  store i8* %input.addr.0, i8** %arrayidx, align 8, !tbaa !2
  br label %while.cond7

while.cond7:                                      ; preds = %while.body14, %if.end
  %input.addr.1 = phi i8* [ %input.addr.0, %if.end ], [ %incdec.ptr15, %while.body14 ]
  %1 = load i8* %input.addr.1, align 1, !tbaa !0
  switch i8 %1, label %while.body14 [
    i8 0, label %while.end23
    i8 32, label %if.end21
  ]

while.body14:                                     ; preds = %while.cond7
  %incdec.ptr15 = getelementptr inbounds i8* %input.addr.1, i64 1
  br label %while.cond7

if.end21:                                         ; preds = %while.cond7
  %incdec.ptr22 = getelementptr inbounds i8* %input.addr.1, i64 1
  store i8 0, i8* %input.addr.1, align 1, !tbaa !0
  br label %while.cond1.outer

while.end23:                                      ; preds = %while.cond1, %while.cond7
  %numargs.1 = phi i32 [ %inc, %while.cond7 ], [ %numargs.0.ph, %while.cond1 ]
  %idxprom24 = sext i32 %numargs.1 to i64
  %arrayidx25 = getelementptr inbounds [256 x i8*]* @buildargv.arglist, i64 0, i64 %idxprom24
  store i8* null, i8** %arrayidx25, align 8, !tbaa !2
  ret i8** getelementptr inbounds ([256 x i8*]* @buildargv.arglist, i64 0, i64 0)
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %input = alloca [256 x i8], align 16
  %arraydecay = getelementptr inbounds [256 x i8]* %input, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %arraydecay, i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), i64 5, i32 1, i1 false)
  br label %while.cond1.outer.i

while.cond1.outer.i:                              ; preds = %if.end21.i, %entry
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %if.end21.i ], [ 0, %entry ]
  %numargs.0.ph.i = phi i32 [ %inc.i, %if.end21.i ], [ 0, %entry ]
  %input.addr.0.ph.i = phi i8* [ %incdec.ptr22.i, %if.end21.i ], [ %arraydecay, %entry ]
  br label %while.cond1.i

while.cond1.i:                                    ; preds = %while.body3.i, %while.cond1.outer.i
  %input.addr.0.i = phi i8* [ %incdec.ptr.i, %while.body3.i ], [ %input.addr.0.ph.i, %while.cond1.outer.i ]
  %0 = load i8* %input.addr.0.i, align 1, !tbaa !0
  switch i8 %0, label %if.end.i [
    i8 32, label %while.body3.i
    i8 0, label %buildargv.exit
  ]

while.body3.i:                                    ; preds = %while.cond1.i
  %incdec.ptr.i = getelementptr inbounds i8* %input.addr.0.i, i64 1
  br label %while.cond1.i

if.end.i:                                         ; preds = %while.cond1.i
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %inc.i = add nsw i32 %numargs.0.ph.i, 1
  %arrayidx.i = getelementptr inbounds [256 x i8*]* @buildargv.arglist, i64 0, i64 %indvars.iv.i
  store i8* %input.addr.0.i, i8** %arrayidx.i, align 8, !tbaa !2
  br label %while.cond7.i

while.cond7.i:                                    ; preds = %while.body14.i, %if.end.i
  %input.addr.1.i = phi i8* [ %input.addr.0.i, %if.end.i ], [ %incdec.ptr15.i, %while.body14.i ]
  %1 = load i8* %input.addr.1.i, align 1, !tbaa !0
  switch i8 %1, label %while.body14.i [
    i8 0, label %buildargv.exit
    i8 32, label %if.end21.i
  ]

while.body14.i:                                   ; preds = %while.cond7.i
  %incdec.ptr15.i = getelementptr inbounds i8* %input.addr.1.i, i64 1
  br label %while.cond7.i

if.end21.i:                                       ; preds = %while.cond7.i
  %incdec.ptr22.i = getelementptr inbounds i8* %input.addr.1.i, i64 1
  store i8 0, i8* %input.addr.1.i, align 1, !tbaa !0
  br label %while.cond1.outer.i

buildargv.exit:                                   ; preds = %while.cond7.i, %while.cond1.i
  %numargs.1.i = phi i32 [ %numargs.0.ph.i, %while.cond1.i ], [ %inc.i, %while.cond7.i ]
  %idxprom24.i = sext i32 %numargs.1.i to i64
  %arrayidx25.i = getelementptr inbounds [256 x i8*]* @buildargv.arglist, i64 0, i64 %idxprom24.i
  store i8* null, i8** %arrayidx25.i, align 8, !tbaa !2
  %2 = load i8** getelementptr inbounds ([256 x i8*]* @buildargv.arglist, i64 0, i64 0), align 16, !tbaa !2
  %3 = load i8* %2, align 1, !tbaa !0
  %cmp8 = icmp eq i8 %3, 97
  br i1 %cmp8, label %cond.end, label %if.then38

cond.end:                                         ; preds = %buildargv.exit
  %arrayidx10 = getelementptr inbounds i8* %2, i64 1
  %4 = load i8* %arrayidx10, align 1, !tbaa !0
  %tobool = icmp eq i8 %4, 0
  br i1 %tobool, label %cond.true45, label %if.then38

if.then38:                                        ; preds = %buildargv.exit, %cond.end
  call void @abort() noreturn nounwind
  unreachable

cond.true45:                                      ; preds = %cond.end
  %5 = load i8** getelementptr inbounds ([256 x i8*]* @buildargv.arglist, i64 0, i64 1), align 8, !tbaa !2
  %6 = load i8* %5, align 1, !tbaa !0
  %cmp56 = icmp eq i8 %6, 98
  br i1 %cmp56, label %cond.end89, label %if.then92

cond.end89:                                       ; preds = %cond.true45
  %arrayidx59 = getelementptr inbounds i8* %5, i64 1
  %7 = load i8* %arrayidx59, align 1, !tbaa !0
  %tobool91 = icmp eq i8 %7, 0
  br i1 %tobool91, label %if.end93, label %if.then92

if.then92:                                        ; preds = %cond.true45, %cond.end89
  call void @abort() noreturn nounwind
  unreachable

if.end93:                                         ; preds = %cond.end89
  %8 = load i8** getelementptr inbounds ([256 x i8*]* @buildargv.arglist, i64 0, i64 2), align 16, !tbaa !2
  %cmp95 = icmp eq i8* %8, null
  br i1 %cmp95, label %if.end98, label %if.then97

if.then97:                                        ; preds = %if.end93
  call void @abort() noreturn nounwind
  unreachable

if.end98:                                         ; preds = %if.end93
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"any pointer", metadata !0}
