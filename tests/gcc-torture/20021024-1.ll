; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20021024-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@cp = common global i64* null, align 8
@m = common global i64 0, align 8
@main.r = internal global [64 x i64] zeroinitializer, align 16

define void @foo() nounwind uwtable {
entry:
  ret void
}

define void @bar(i32 %rop, i64* %r) nounwind uwtable {
entry:
  %rop.addr = alloca i32, align 4
  %r.addr = alloca i64*, align 8
  %rs1 = alloca i32, align 4
  %rs2 = alloca i32, align 4
  %rd = alloca i32, align 4
  store i32 %rop, i32* %rop.addr, align 4
  store i64* %r, i64** %r.addr, align 8
  br label %top

top:                                              ; preds = %if.then, %entry
  %tmp = load i32* %rop.addr, align 4
  %shr = lshr i32 %tmp, 23
  %and = and i32 %shr, 511
  store i32 %and, i32* %rs2, align 4
  %tmp1 = load i32* %rop.addr, align 4
  %shr2 = lshr i32 %tmp1, 9
  %and3 = and i32 %shr2, 511
  store i32 %and3, i32* %rs1, align 4
  %tmp4 = load i32* %rop.addr, align 4
  %and5 = and i32 %tmp4, 511
  store i32 %and5, i32* %rd, align 4
  %tmp6 = load i64** @cp, align 8
  store i64 1, i64* %tmp6
  %tmp7 = load i32* %rs1, align 4
  %idxprom = zext i32 %tmp7 to i64
  %tmp8 = load i64** %r.addr, align 8
  %arrayidx = getelementptr inbounds i64* %tmp8, i64 %idxprom
  %tmp9 = load i64* %arrayidx
  %tmp10 = load i32* %rs2, align 4
  %idxprom11 = zext i32 %tmp10 to i64
  %tmp12 = load i64** %r.addr, align 8
  %arrayidx13 = getelementptr inbounds i64* %tmp12, i64 %idxprom11
  %tmp14 = load i64* %arrayidx13
  %add = add i64 %tmp9, %tmp14
  store i64 %add, i64* @m, align 8
  %tmp15 = load i64** @cp, align 8
  store i64 2, i64* %tmp15
  call void @foo()
  %tmp16 = load i32* %rd, align 4
  %tobool = icmp ne i32 %tmp16, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %top
  br label %top

if.end:                                           ; preds = %top
  %tmp17 = load i32* %rd, align 4
  %idxprom18 = zext i32 %tmp17 to i64
  %tmp19 = load i64** %r.addr, align 8
  %arrayidx20 = getelementptr inbounds i64* %tmp19, i64 %idxprom18
  store i64 1, i64* %arrayidx20
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %cr = alloca i64, align 8
  store i32 0, i32* %retval
  store i64* %cr, i64** @cp, align 8
  store i64 47, i64* getelementptr inbounds ([64 x i64]* @main.r, i32 0, i64 4), align 8
  store i64 11, i64* getelementptr inbounds ([64 x i64]* @main.r, i32 0, i64 8), align 8
  call void @bar(i32 67110927, i64* getelementptr inbounds ([64 x i64]* @main.r, i32 0, i32 0))
  %tmp = load i64* @m, align 8
  %cmp = icmp ne i64 %tmp, 58
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
