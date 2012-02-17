; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000706-2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.baz = type { i32, i32, i32, i32, i32 }

define void @bar(%struct.baz* %x, i32 %f, i32 %g, i32 %h, i32 %i, i32 %j) nounwind uwtable {
entry:
  %a = getelementptr inbounds %struct.baz* %x, i64 0, i32 0
  %tmp1 = load i32* %a, align 4
  %cmp = icmp eq i32 %tmp1, 1
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.baz* %x, i64 0, i32 1
  %tmp3 = load i32* %b, align 4
  %cmp4 = icmp eq i32 %tmp3, 2
  br i1 %cmp4, label %lor.lhs.false5, label %if.then

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %c = getelementptr inbounds %struct.baz* %x, i64 0, i32 2
  %tmp7 = load i32* %c, align 4
  %cmp8 = icmp eq i32 %tmp7, 3
  br i1 %cmp8, label %lor.lhs.false9, label %if.then

lor.lhs.false9:                                   ; preds = %lor.lhs.false5
  %d = getelementptr inbounds %struct.baz* %x, i64 0, i32 3
  %tmp11 = load i32* %d, align 4
  %cmp12 = icmp eq i32 %tmp11, 4
  br i1 %cmp12, label %lor.lhs.false13, label %if.then

lor.lhs.false13:                                  ; preds = %lor.lhs.false9
  %e = getelementptr inbounds %struct.baz* %x, i64 0, i32 4
  %tmp15 = load i32* %e, align 4
  %cmp16 = icmp eq i32 %tmp15, 5
  %cmp19 = icmp eq i32 %f, 6
  %or.cond = and i1 %cmp16, %cmp19
  %cmp22 = icmp eq i32 %g, 7
  %or.cond1 = and i1 %or.cond, %cmp22
  %cmp25 = icmp eq i32 %h, 8
  %or.cond2 = and i1 %or.cond1, %cmp25
  %cmp28 = icmp eq i32 %i, 9
  %or.cond3 = and i1 %or.cond2, %cmp28
  %cmp31 = icmp eq i32 %j, 10
  %or.cond4 = and i1 %or.cond3, %cmp31
  br i1 %or.cond4, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false13, %lor.lhs.false9, %lor.lhs.false5, %lor.lhs.false, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false13
  ret void
}

declare void @abort() noreturn

define void @foo(i8* nocapture %z, %struct.baz* nocapture byval align 8 %x, i8* nocapture %y) nounwind uwtable {
entry:
  %0 = bitcast %struct.baz* %x to i64*
  %tmp1.i = load i64* %0, align 8
  %1 = icmp eq i64 %tmp1.i, 8589934593
  br i1 %1, label %lor.lhs.false5.i, label %if.then.i

lor.lhs.false5.i:                                 ; preds = %entry
  %c.i = getelementptr inbounds %struct.baz* %x, i64 0, i32 2
  %2 = bitcast i32* %c.i to i64*
  %tmp7.i = load i64* %2, align 8
  %3 = icmp eq i64 %tmp7.i, 17179869187
  br i1 %3, label %lor.lhs.false13.i, label %if.then.i

lor.lhs.false13.i:                                ; preds = %lor.lhs.false5.i
  %e.i = getelementptr inbounds %struct.baz* %x, i64 0, i32 4
  %tmp15.i = load i32* %e.i, align 8
  %cmp16.i = icmp eq i32 %tmp15.i, 5
  br i1 %cmp16.i, label %bar.exit, label %if.then.i

if.then.i:                                        ; preds = %lor.lhs.false13.i, %lor.lhs.false5.i, %entry
  tail call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %lor.lhs.false13.i
  ret void
}

define i32 @main() noreturn nounwind uwtable {
foo.exit:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
