; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000801-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i8* %bp, i32 %n) nounwind uwtable {
entry:
  %bp.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %c = alloca i8, align 1
  %ep = alloca i8*, align 8
  %sp = alloca i8*, align 8
  store i8* %bp, i8** %bp.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i8** %bp.addr, align 8
  %tmp1 = load i32* %n.addr, align 4
  %idx.ext = zext i32 %tmp1 to i64
  %add.ptr = getelementptr inbounds i8* %tmp, i64 %idx.ext
  store i8* %add.ptr, i8** %ep, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp3 = load i8** %bp.addr, align 8
  %tmp4 = load i8** %ep, align 8
  %cmp = icmp ult i8* %tmp3, %tmp4
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp5 = load i8** %bp.addr, align 8
  %add.ptr6 = getelementptr inbounds i8* %tmp5, i64 3
  store i8* %add.ptr6, i8** %sp, align 8
  %tmp7 = load i8** %sp, align 8
  %tmp8 = load i8* %tmp7
  store i8 %tmp8, i8* %c, align 1
  %tmp9 = load i8** %bp.addr, align 8
  %tmp10 = load i8* %tmp9
  %tmp11 = load i8** %sp, align 8
  store i8 %tmp10, i8* %tmp11
  %tmp12 = load i8* %c, align 1
  %tmp13 = load i8** %bp.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp13, i32 1
  store i8* %incdec.ptr, i8** %bp.addr, align 8
  store i8 %tmp12, i8* %tmp13
  %tmp14 = load i8** %bp.addr, align 8
  %add.ptr15 = getelementptr inbounds i8* %tmp14, i64 1
  store i8* %add.ptr15, i8** %sp, align 8
  %tmp16 = load i8** %sp, align 8
  %tmp17 = load i8* %tmp16
  store i8 %tmp17, i8* %c, align 1
  %tmp18 = load i8** %bp.addr, align 8
  %tmp19 = load i8* %tmp18
  %tmp20 = load i8** %sp, align 8
  store i8 %tmp19, i8* %tmp20
  %tmp21 = load i8* %c, align 1
  %tmp22 = load i8** %bp.addr, align 8
  %incdec.ptr23 = getelementptr inbounds i8* %tmp22, i32 1
  store i8* %incdec.ptr23, i8** %bp.addr, align 8
  store i8 %tmp21, i8* %tmp22
  %tmp24 = load i8** %bp.addr, align 8
  %add.ptr25 = getelementptr inbounds i8* %tmp24, i64 2
  store i8* %add.ptr25, i8** %bp.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %one = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* %one, align 4
  %0 = bitcast i32* %one to i8*
  call void @foo(i8* %0, i32 4)
  %1 = bitcast i32* %one to i8*
  call void @foo(i8* %1, i32 4)
  %tmp = load i32* %one, align 4
  %cmp = icmp ne i32 %tmp, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
