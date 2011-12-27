; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr20601-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.T = type { i8*, [4096 x i8], i8** }

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"-u\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str3 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@g = global [4 x i8*] [i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0)], align 16
@c = common global i8** null, align 8
@b = common global i32 0, align 4
@.str4 = private unnamed_addr constant [8 x i8] c"/bin/sh\00", align 1
@t = common global %struct.T zeroinitializer, align 8
@a = common global [5 x i32] zeroinitializer, align 16
@d = common global i32 0, align 4
@e = common global i8** null, align 8
@f = common global [16 x i8*] zeroinitializer, align 16

define void @foo() noreturn nounwind uwtable readnone {
entry:
  br label %while.body

while.body:                                       ; preds = %while.body, %entry
  br label %while.body
}

define noalias i8* @bar(i8* nocapture %x, i32 %y) nounwind uwtable readnone noinline {
entry:
  ret i8* null
}

define i32 @main() noreturn nounwind uwtable {
entry:
  store i8** getelementptr inbounds ([4 x i8*]* @g, i64 0, i64 0), i8*** @c, align 8
  store i32 4, i32* @b, align 4
  store i8** getelementptr inbounds ([4 x i8*]* @g, i64 0, i64 1), i8*** @e, align 8
  store i32 3, i32* @d, align 4
  br label %while.cond.i

while.cond.i:                                     ; preds = %sw.epilog.i, %entry
  %tmp45.i = phi i8** [ %incdec.ptr58.i, %sw.epilog.i ], [ getelementptr inbounds ([4 x i8*]* @g, i64 0, i64 1), %entry ]
  %tmp59.i = phi i32 [ %dec56.i, %sw.epilog.i ], [ 3, %entry ]
  %tmp672.i = phi i32 [ %tmp671.i, %sw.epilog.i ], [ 1, %entry ]
  %cmp.i = icmp sgt i32 %tmp59.i, 0
  br i1 %cmp.i, label %land.rhs.i, label %setup2.exit

land.rhs.i:                                       ; preds = %while.cond.i
  %tmp4.i = load i8** %tmp45.i, align 8
  %tmp6.i = load i8* %tmp4.i, align 1
  %cmp7.i = icmp eq i8 %tmp6.i, 45
  br i1 %cmp7.i, label %while.body.i, label %land.lhs.true62.i

while.body.i:                                     ; preds = %land.rhs.i
  %arrayidx12.i = getelementptr inbounds i8* %tmp4.i, i64 1
  %tmp13.i = load i8* %arrayidx12.i, align 1
  %cmp15.i = icmp eq i8 %tmp13.i, 0
  br i1 %cmp15.i, label %if.end.i, label %land.lhs.true.i

land.lhs.true.i:                                  ; preds = %while.body.i
  %arrayidx20.i = getelementptr inbounds i8* %tmp4.i, i64 2
  %tmp21.i = load i8* %arrayidx20.i, align 1
  %cmp23.i = icmp eq i8 %tmp21.i, 0
  br i1 %cmp23.i, label %if.end.i, label %if.then.i

if.then.i:                                        ; preds = %land.lhs.true.i
  tail call void @abort() noreturn nounwind
  unreachable

if.end.i:                                         ; preds = %land.lhs.true.i, %while.body.i
  %conv30.i = sext i8 %tmp13.i to i32
  switch i32 %conv30.i, label %sw.epilog.i [
    i32 117, label %sw.bb.i
    i32 80, label %sw.bb40.i
    i32 45, label %sw.bb42.i
  ]

sw.bb.i:                                          ; preds = %if.end.i
  %arrayidx32.i = getelementptr inbounds i8** %tmp45.i, i64 1
  %tmp33.i = load i8** %arrayidx32.i, align 8
  %tobool.i = icmp eq i8* %tmp33.i, null
  br i1 %tobool.i, label %if.then34.i, label %if.end35.i

if.then34.i:                                      ; preds = %sw.bb.i
  tail call void @abort() noreturn nounwind
  unreachable

if.end35.i:                                       ; preds = %sw.bb.i
  store i8** %arrayidx32.i, i8*** getelementptr inbounds (%struct.T* @t, i64 0, i32 2), align 8
  %dec.i = add nsw i32 %tmp59.i, -1
  store i32 %dec.i, i32* @d, align 4
  store i8** %arrayidx32.i, i8*** @e, align 8
  br label %sw.epilog.i

sw.bb40.i:                                        ; preds = %if.end.i
  %or.i = or i32 %tmp672.i, 4096
  br label %sw.epilog.i

sw.bb42.i:                                        ; preds = %if.end.i
  %dec44.i = add nsw i32 %tmp59.i, -1
  store i32 %dec44.i, i32* @d, align 4
  %incdec.ptr46.i = getelementptr inbounds i8** %tmp45.i, i64 1
  store i8** %incdec.ptr46.i, i8*** @e, align 8
  %or52.i = or i32 %tmp672.i, 1536
  %cmp48.i = icmp eq i32 %tmp672.i, 1
  %or52.tmp672.i = select i1 %cmp48.i, i32 %or52.i, i32 %tmp672.i
  br label %setup2.exit

sw.epilog.i:                                      ; preds = %sw.bb40.i, %if.end35.i, %if.end.i
  %tmp57.i = phi i8** [ %tmp45.i, %sw.bb40.i ], [ %arrayidx32.i, %if.end35.i ], [ %tmp45.i, %if.end.i ]
  %tmp55.i = phi i32 [ %tmp59.i, %sw.bb40.i ], [ %dec.i, %if.end35.i ], [ %tmp59.i, %if.end.i ]
  %tmp671.i = phi i32 [ %or.i, %sw.bb40.i ], [ %tmp672.i, %if.end35.i ], [ %tmp672.i, %if.end.i ]
  %dec56.i = add nsw i32 %tmp55.i, -1
  store i32 %dec56.i, i32* @d, align 4
  %incdec.ptr58.i = getelementptr inbounds i8** %tmp57.i, i64 1
  store i8** %incdec.ptr58.i, i8*** @e, align 8
  br label %while.cond.i

land.lhs.true62.i:                                ; preds = %land.rhs.i
  %and.i = and i32 %tmp672.i, 1
  %tobool64.i = icmp eq i32 %and.i, 0
  br i1 %tobool64.i, label %if.then65.i, label %setup2.exit

if.then65.i:                                      ; preds = %land.lhs.true62.i
  tail call void @abort() noreturn nounwind
  unreachable

setup2.exit:                                      ; preds = %while.cond.i, %land.lhs.true62.i, %sw.bb42.i
  %tmp7.i = phi i32 [ %dec44.i, %sw.bb42.i ], [ %tmp59.i, %land.lhs.true62.i ], [ %tmp59.i, %while.cond.i ]
  %tmp6.i3 = phi i8** [ %incdec.ptr46.i, %sw.bb42.i ], [ %tmp45.i, %land.lhs.true62.i ], [ %tmp45.i, %while.cond.i ]
  %call1 = phi i32 [ %or52.tmp672.i, %sw.bb42.i ], [ %tmp672.i, %land.lhs.true62.i ], [ %tmp672.i, %while.cond.i ]
  store i8* getelementptr inbounds ([8 x i8]* @.str4, i64 0, i64 0), i8** getelementptr inbounds (%struct.T* @t, i64 0, i32 0), align 8
  %and.i2 = and i32 %call1, 512
  %tobool2.i = icmp eq i32 %and.i2, 0
  br i1 %tobool2.i, label %setup1.exit, label %if.then13.i

if.then13.i:                                      ; preds = %setup2.exit
  %inc.i = add nsw i32 %tmp7.i, 1
  store i32 %inc.i, i32* @d, align 4
  store i8** getelementptr inbounds ([16 x i8*]* @f, i64 0, i64 0), i8*** @e, align 8
  store i8* getelementptr inbounds ([8 x i8]* @.str4, i64 0, i64 0), i8** getelementptr inbounds ([16 x i8*]* @f, i64 0, i64 0), align 16
  %tmp193.i = load i8** %tmp6.i3, align 8
  store i8* %tmp193.i, i8** getelementptr inbounds ([16 x i8*]* @f, i64 0, i64 1), align 8
  %tobool214.i = icmp eq i8* %tmp193.i, null
  br i1 %tobool214.i, label %setup1.exit, label %for.inc.i

for.inc.i:                                        ; preds = %if.then13.i, %for.inc.i
  %indvar.i = phi i64 [ %tmp, %for.inc.i ], [ 0, %if.then13.i ]
  %tmp = add i64 %indvar.i, 1
  %incdec.ptr.i = getelementptr i8** %tmp6.i3, i64 %tmp
  %tmp18 = add i64 %indvar.i, 2
  %storemerge.i = getelementptr [16 x i8*]* @f, i64 0, i64 %tmp18
  %tmp19.i = load i8** %incdec.ptr.i, align 8
  store i8* %tmp19.i, i8** %storemerge.i, align 8
  %tobool21.i = icmp eq i8* %tmp19.i, null
  br i1 %tobool21.i, label %setup1.exit, label %for.inc.i

setup1.exit:                                      ; preds = %for.inc.i, %setup2.exit, %if.then13.i
  %and = and i32 %call1, 1024
  %tobool = icmp ne i32 %and, 0
  %tmp3 = load i32* getelementptr inbounds ([5 x i32]* @a, i64 0, i64 4), align 16
  %tobool4 = icmp eq i32 %tmp3, 0
  %or.cond = and i1 %tobool, %tobool4
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %setup1.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %setup1.exit
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
