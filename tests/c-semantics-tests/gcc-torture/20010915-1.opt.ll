; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010915-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@check = global i32 0, align 4
@o = global i32 0, align 4
@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@.str3 = private unnamed_addr constant [2 x i8] c"d\00", align 1
@.str4 = private unnamed_addr constant [2 x i8] c"e\00", align 1
@h = common global i8* null, align 8
@u = common global i8* null, align 8
@r.c.0 = internal unnamed_addr global i8 98
@r.cnt = internal unnamed_addr global i32 0, align 4

define i32 @main(i32 %argc, i8** nocapture %argv) noreturn nounwind uwtable {
entry:
  %args = alloca [5 x i8*], align 16
  %0 = bitcast [5 x i8*]* %args to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 32, i32 16, i1 false)
  %1 = getelementptr [5 x i8*]* %args, i64 0, i64 0
  store i8* getelementptr inbounds ([2 x i8]* @.str, i64 0, i64 0), i8** %1, align 16
  %2 = getelementptr [5 x i8*]* %args, i64 0, i64 1
  store i8* getelementptr inbounds ([2 x i8]* @.str1, i64 0, i64 0), i8** %2, align 8
  %3 = getelementptr [5 x i8*]* %args, i64 0, i64 2
  store i8* getelementptr inbounds ([2 x i8]* @.str2, i64 0, i64 0), i8** %3, align 16
  %4 = getelementptr [5 x i8*]* %args, i64 0, i64 3
  store i8* getelementptr inbounds ([2 x i8]* @.str3, i64 0, i64 0), i8** %4, align 8
  %5 = getelementptr [5 x i8*]* %args, i64 0, i64 4
  store i8* getelementptr inbounds ([2 x i8]* @.str4, i64 0, i64 0), i8** %5, align 16
  %call = call i32 @x(i32 5, i8** %1)
  %6 = load i32* @check, align 4, !tbaa !0
  %cmp1 = icmp ne i32 %6, 2
  %7 = load i32* @o, align 4, !tbaa !0
  %cmp3 = icmp ne i32 %7, 5
  %or.cond4 = or i1 %cmp1, %cmp3
  br i1 %or.cond4, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @x(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %0 = load i32* @o, align 4, !tbaa !0
  %cmp = icmp slt i32 %0, %argc
  %cmp1 = icmp sgt i32 %argc, 2
  %or.cond = and i1 %cmp, %cmp1
  br i1 %or.cond, label %land.lhs.true2, label %if.else

land.lhs.true2:                                   ; preds = %entry
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds i8** %argv, i64 %idxprom
  %1 = load i8** %arrayidx, align 8, !tbaa !3
  %tobool = icmp eq i8* %1, null
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %land.lhs.true2
  %2 = load i8* %1, align 1, !tbaa !1
  %cmp5.i = icmp eq i8 %2, 97
  br i1 %cmp5.i, label %cond.end.i, label %if.then37.i

cond.end.i:                                       ; preds = %if.then
  %arrayidx7.i = getelementptr inbounds i8* %1, i64 1
  %3 = load i8* %arrayidx7.i, align 1, !tbaa !1
  %cmp33.i = icmp eq i8 %3, 0
  br i1 %cmp33.i, label %lor.lhs.false.i, label %if.then37.i

lor.lhs.false.i:                                  ; preds = %cond.end.i
  %4 = load i32* @check, align 4, !tbaa !0
  %inc.i = add nsw i32 %4, 1
  store i32 %inc.i, i32* @check, align 4, !tbaa !0
  %cmp35.i = icmp sgt i32 %4, 1
  br i1 %cmp35.i, label %if.then37.i, label %s.exit

if.then37.i:                                      ; preds = %lor.lhs.false.i, %cond.end.i, %if.then
  tail call void @abort() noreturn nounwind
  unreachable

s.exit:                                           ; preds = %lor.lhs.false.i
  %5 = load i8* %1, align 1, !tbaa !1
  %cmp5.i31 = icmp eq i8 %5, 97
  br i1 %cmp5.i31, label %cond.end.i34, label %if.then37.i38

cond.end.i34:                                     ; preds = %s.exit
  %6 = load i8* %arrayidx7.i, align 1, !tbaa !1
  %cmp33.i33 = icmp eq i8 %6, 0
  br i1 %cmp33.i33, label %lor.lhs.false.i37, label %if.then37.i38

lor.lhs.false.i37:                                ; preds = %cond.end.i34
  %inc.i35 = add nsw i32 %4, 2
  store i32 %inc.i35, i32* @check, align 4, !tbaa !0
  %cmp35.i36 = icmp sgt i32 %4, 0
  br i1 %cmp35.i36, label %if.then37.i38, label %s.exit39

if.then37.i38:                                    ; preds = %lor.lhs.false.i37, %cond.end.i34, %s.exit
  tail call void @abort() noreturn nounwind
  unreachable

s.exit39:                                         ; preds = %lor.lhs.false.i37
  store i8* null, i8** @u, align 8, !tbaa !3
  %7 = load i8** %arrayidx, align 8, !tbaa !3
  %cmp17 = icmp eq i8* %7, %arrayidx7.i
  br i1 %cmp17, label %if.then18, label %while.cond

if.then18:                                        ; preds = %s.exit39
  %call21 = tail call i8* @m(i8* undef)
  unreachable

if.else:                                          ; preds = %land.lhs.true2, %entry
  tail call void @abort() noreturn nounwind
  unreachable

while.cond:                                       ; preds = %s.exit39, %r.exit
  %8 = phi i32 [ %inc, %r.exit ], [ %0, %s.exit39 ]
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* @o, align 4, !tbaa !0
  %cmp24 = icmp slt i32 %inc, %argc
  br i1 %cmp24, label %while.body, label %return

while.body:                                       ; preds = %while.cond
  %idxprom25 = sext i32 %inc to i64
  %arrayidx26 = getelementptr inbounds i8** %argv, i64 %idxprom25
  %9 = load i8** %arrayidx26, align 8, !tbaa !3
  %10 = load i8* %9, align 1, !tbaa !1
  %11 = load i8* @r.c.0, align 1, !tbaa !1
  %cmp.i = icmp eq i8 %10, %11
  br i1 %cmp.i, label %lor.lhs.false.i41, label %if.then.i

lor.lhs.false.i41:                                ; preds = %while.body
  %arrayidx.i = getelementptr inbounds i8* %9, i64 1
  %12 = load i8* %arrayidx.i, align 1, !tbaa !1
  %cmp5.i40 = icmp ne i8 %12, 0
  %13 = load i32* @r.cnt, align 4, !tbaa !0
  %cmp8.i = icmp sgt i32 %13, 3
  %or.cond.i = or i1 %cmp5.i40, %cmp8.i
  br i1 %or.cond.i, label %if.then.i, label %r.exit

if.then.i:                                        ; preds = %lor.lhs.false.i41, %while.body
  tail call void @abort() noreturn nounwind
  unreachable

r.exit:                                           ; preds = %lor.lhs.false.i41
  %inc.i42 = add i8 %10, 1
  store i8 %inc.i42, i8* @r.c.0, align 1, !tbaa !1
  %inc10.i = add nsw i32 %13, 1
  store i32 %inc10.i, i32* @r.cnt, align 4, !tbaa !0
  br label %while.cond

return:                                           ; preds = %while.cond
  ret i32 0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define noalias i8* @s(i8* %v, i8** nocapture %pp) nounwind uwtable {
entry:
  %0 = load i8* %v, align 1, !tbaa !1
  %cmp5 = icmp eq i8 %0, 97
  br i1 %cmp5, label %cond.end, label %if.then37

cond.end:                                         ; preds = %entry
  %arrayidx7 = getelementptr inbounds i8* %v, i64 1
  %1 = load i8* %arrayidx7, align 1, !tbaa !1
  %cmp33 = icmp eq i8 %1, 0
  br i1 %cmp33, label %lor.lhs.false, label %if.then37

lor.lhs.false:                                    ; preds = %cond.end
  %2 = load i32* @check, align 4, !tbaa !0
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* @check, align 4, !tbaa !0
  %cmp35 = icmp sgt i32 %2, 1
  br i1 %cmp35, label %if.then37, label %if.end38

if.then37:                                        ; preds = %entry, %cond.end, %lor.lhs.false
  tail call void @abort() noreturn nounwind
  unreachable

if.end38:                                         ; preds = %lor.lhs.false
  store i8* %arrayidx7, i8** %pp, align 8, !tbaa !3
  ret i8* null
}

define noalias i8* @m(i8* nocapture %x) noreturn nounwind uwtable {
entry:
  tail call void @abort() noreturn nounwind
  unreachable
}

define i32 @r(i8* nocapture %f) nounwind uwtable {
entry:
  %0 = load i8* %f, align 1, !tbaa !1
  %1 = load i8* @r.c.0, align 1, !tbaa !1
  %cmp = icmp eq i8 %0, %1
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %arrayidx = getelementptr inbounds i8* %f, i64 1
  %2 = load i8* %arrayidx, align 1, !tbaa !1
  %cmp5 = icmp ne i8 %2, 0
  %3 = load i32* @r.cnt, align 4, !tbaa !0
  %cmp8 = icmp sgt i32 %3, 3
  %or.cond = or i1 %cmp5, %cmp8
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry, %lor.lhs.false
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %inc = add i8 %0, 1
  store i8 %inc, i8* @r.c.0, align 1, !tbaa !1
  %inc10 = add nsw i32 %3, 1
  store i32 %inc10, i32* @r.cnt, align 4, !tbaa !0
  ret i32 1
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
