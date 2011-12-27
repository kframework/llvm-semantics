; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000706-5.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.baz = type { i32, i32, i32 }

@c = common global %struct.baz* null, align 8

define void @bar(i32 %b) nounwind uwtable {
entry:
  %tmp = load %struct.baz** @c, align 8
  %a = getelementptr inbounds %struct.baz* %tmp, i64 0, i32 0
  %tmp1 = load i32* %a, align 4
  %cmp = icmp eq i32 %tmp1, 1
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %b3 = getelementptr inbounds %struct.baz* %tmp, i64 0, i32 1
  %tmp4 = load i32* %b3, align 4
  %cmp5 = icmp eq i32 %tmp4, 2
  br i1 %cmp5, label %lor.lhs.false6, label %if.then

lor.lhs.false6:                                   ; preds = %lor.lhs.false
  %c = getelementptr inbounds %struct.baz* %tmp, i64 0, i32 2
  %tmp8 = load i32* %c, align 4
  %cmp9 = icmp eq i32 %tmp8, 3
  %cmp12 = icmp eq i32 %b, 4
  %or.cond = and i1 %cmp9, %cmp12
  br i1 %or.cond, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false6, %lor.lhs.false, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false6
  ret void
}

declare void @abort() noreturn

define void @foo(i64 %a.coerce0, i32 %a.coerce1, i32 %b) nounwind uwtable {
entry:
  %a = alloca %struct.baz, align 8
  %0 = bitcast %struct.baz* %a to i64*
  store i64 %a.coerce0, i64* %0, align 8
  %1 = getelementptr %struct.baz* %a, i64 0, i32 2
  store i32 %a.coerce1, i32* %1, align 8
  store %struct.baz* %a, %struct.baz** @c, align 8
  %2 = icmp eq i64 %a.coerce0, 8589934593
  br i1 %2, label %lor.lhs.false6.i, label %if.then.i

lor.lhs.false6.i:                                 ; preds = %entry
  %cmp9.i = icmp eq i32 %a.coerce1, 3
  %cmp12.i = icmp eq i32 %b, 4
  %or.cond.i = and i1 %cmp9.i, %cmp12.i
  br i1 %or.cond.i, label %bar.exit, label %if.then.i

if.then.i:                                        ; preds = %lor.lhs.false6.i, %entry
  call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %lor.lhs.false6.i
  ret void
}

define i32 @main() noreturn nounwind uwtable {
foo.exit:
  %a.i = alloca %struct.baz, align 8
  %0 = bitcast %struct.baz* %a.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  %1 = bitcast %struct.baz* %a.i to i64*
  store i64 8589934593, i64* %1, align 8
  %2 = getelementptr %struct.baz* %a.i, i64 0, i32 2
  store i32 3, i32* %2, align 8
  store %struct.baz* %a.i, %struct.baz** @c, align 8
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
