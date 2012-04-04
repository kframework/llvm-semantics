; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010116-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Data = type { i32, i32, i32 }

define void @find(%struct.Data* %first, %struct.Data* %last) noreturn nounwind uwtable {
for.cond:
  %sub.ptr.lhs.cast = ptrtoint %struct.Data* %last to i64
  %sub.ptr.rhs.cast = ptrtoint %struct.Data* %first to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 12
  %shr2 = lshr i64 %sub.ptr.div, 2
  %conv = trunc i64 %shr2 to i32
  %cmp = icmp sgt i32 %conv, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  tail call void @ok(i32 %conv)
  unreachable

for.end:                                          ; preds = %for.cond
  tail call void @abort() noreturn nounwind
  unreachable
}

define void @ok(i32 %i) noreturn nounwind uwtable {
entry:
  %cmp = icmp eq i32 %i, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

define i32 @main() noreturn nounwind uwtable {
entry:
  %DataList = alloca [4 x %struct.Data], align 16
  %arraydecay = getelementptr inbounds [4 x %struct.Data]* %DataList, i64 0, i64 0
  %add.ptr2 = getelementptr inbounds [4 x %struct.Data]* %DataList, i64 0, i64 4
  call void @find(%struct.Data* %arraydecay, %struct.Data* %add.ptr2)
  unreachable
}
