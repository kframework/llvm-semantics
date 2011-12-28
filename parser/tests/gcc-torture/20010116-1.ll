; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20010116-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.Data = type { i32, i32, i32 }

define void @find(%struct.Data* %first, %struct.Data* %last) nounwind uwtable {
entry:
  %first.addr = alloca %struct.Data*, align 8
  %last.addr = alloca %struct.Data*, align 8
  %i = alloca i32, align 4
  store %struct.Data* %first, %struct.Data** %first.addr, align 8
  store %struct.Data* %last, %struct.Data** %last.addr, align 8
  %tmp = load %struct.Data** %last.addr, align 8
  %tmp1 = load %struct.Data** %first.addr, align 8
  %sub.ptr.lhs.cast = ptrtoint %struct.Data* %tmp to i64
  %sub.ptr.rhs.cast = ptrtoint %struct.Data* %tmp1 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 12
  %shr = ashr i64 %sub.ptr.div, 2
  %conv = trunc i64 %shr to i32
  store i32 %conv, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp2 = load i32* %i, align 4
  %cmp = icmp sgt i32 %tmp2, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp4 = load i32* %i, align 4
  call void @ok(i32 %tmp4)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp5 = load i32* %i, align 4
  %dec = add nsw i32 %tmp5, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @abort() noreturn
  unreachable

return:                                           ; No predecessors!
  ret void
}

define void @ok(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %tmp = load i32* %i.addr, align 4
  %cmp = icmp ne i32 %tmp, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %DataList = alloca [4 x %struct.Data], align 16
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [4 x %struct.Data]* %DataList, i32 0, i32 0
  %add.ptr = getelementptr inbounds %struct.Data* %arraydecay, i64 0
  %arraydecay1 = getelementptr inbounds [4 x %struct.Data]* %DataList, i32 0, i32 0
  %add.ptr2 = getelementptr inbounds %struct.Data* %arraydecay1, i64 4
  call void @find(%struct.Data* %add.ptr, %struct.Data* %add.ptr2)
  %0 = load i32* %retval
  ret i32 %0
}
