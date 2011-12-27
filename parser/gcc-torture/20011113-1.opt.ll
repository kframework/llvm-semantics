; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20011113-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i8, i8, i8, i8, [4 x i64] }
%struct.U = type { [3 x i64] }
%struct.t = type { [2 x i8], i8, i8, [4 x i64] }

@t = global %0 { i8 26, i8 0, i8 0, i8 0, [4 x i64] [i64 0, i64 21, i64 22, i64 23] }, align 8

define noalias %struct.t* @foo(%struct.t* %x) nounwind uwtable {
entry:
  %arrayidx = getelementptr inbounds %struct.t* %x, i64 0, i32 3, i64 1
  %tmp8 = load i64* %arrayidx, align 1
  %arrayidx7.1 = getelementptr inbounds %struct.t* %x, i64 0, i32 3, i64 2
  %tmp9 = load i64* %arrayidx7.1, align 1
  %arrayidx7.2 = getelementptr inbounds %struct.t* %x, i64 0, i32 3, i64 3
  %tmp10 = load i64* %arrayidx7.2, align 1
  %cmp.i = icmp eq i64 %tmp8, 21
  %cmp4.i = icmp eq i64 %tmp9, 22
  %or.cond = and i1 %cmp.i, %cmp4.i
  %cmp9.i = icmp eq i64 %tmp10, 23
  %or.cond19 = and i1 %or.cond, %cmp9.i
  br i1 %or.cond19, label %bar.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %entry
  ret %struct.t* null
}

define noalias %struct.t* @bar(%struct.U* nocapture byval align 8 %d, i32 %m) nounwind uwtable {
entry:
  %arrayidx = getelementptr inbounds %struct.U* %d, i64 0, i32 0, i64 0
  %tmp = load i64* %arrayidx, align 8
  %cmp = icmp eq i64 %tmp, 21
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %arrayidx2 = getelementptr inbounds %struct.U* %d, i64 0, i32 0, i64 1
  %tmp3 = load i64* %arrayidx2, align 8
  %cmp4 = icmp eq i64 %tmp3, 22
  br i1 %cmp4, label %lor.lhs.false5, label %if.then

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %arrayidx7 = getelementptr inbounds %struct.U* %d, i64 0, i32 0, i64 2
  %tmp8 = load i64* %arrayidx7, align 8
  %cmp9 = icmp eq i64 %tmp8, 23
  br i1 %cmp9, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false5, %lor.lhs.false, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false5
  ret %struct.t* null
}

define noalias %struct.t* @baz(%struct.t* %x) nounwind uwtable {
entry:
  %arrayidx6 = getelementptr inbounds %struct.t* %x, i64 0, i32 3, i64 1
  %tmp = load i64* %arrayidx6, align 1
  %arrayidx65.1 = getelementptr inbounds %struct.t* %x, i64 0, i32 3, i64 2
  %tmp6 = load i64* %arrayidx65.1, align 1
  %arrayidx65.2 = getelementptr inbounds %struct.t* %x, i64 0, i32 3, i64 3
  %tmp7 = load i64* %arrayidx65.2, align 1
  %cmp.i = icmp eq i64 %tmp, 21
  %cmp4.i = icmp eq i64 %tmp6, 22
  %or.cond = and i1 %cmp.i, %cmp4.i
  %cmp9.i = icmp eq i64 %tmp7, 23
  %or.cond18 = and i1 %or.cond, %cmp9.i
  br i1 %or.cond18, label %bar.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %entry
  ret %struct.t* null
}

declare void @abort() noreturn

define i32 @main() noreturn nounwind uwtable {
entry:
  %tmp.i = load i64* getelementptr inbounds (%0* @t, i64 0, i32 4, i64 1), align 8
  %tmp6.i = load i64* getelementptr inbounds (%0* @t, i64 0, i32 4, i64 2), align 8
  %tmp7.i = load i64* getelementptr inbounds (%0* @t, i64 0, i32 4, i64 3), align 8
  %cmp.i.i = icmp eq i64 %tmp.i, 21
  %cmp4.i.i = icmp eq i64 %tmp6.i, 22
  %or.cond.i = and i1 %cmp.i.i, %cmp4.i.i
  %cmp9.i.i = icmp eq i64 %tmp7.i, 23
  %or.cond18.i = and i1 %or.cond.i, %cmp9.i.i
  br i1 %or.cond18.i, label %foo.exit, label %if.then.i.i

if.then.i.i:                                      ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

foo.exit:                                         ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
