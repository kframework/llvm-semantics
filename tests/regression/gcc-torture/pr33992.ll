; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr33992.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define void @bar(i64 %i) nounwind uwtable noinline {
entry:
  %i.addr = alloca i64, align 8
  store i64 %i, i64* %i.addr, align 8
  %tmp = load i64* %i.addr, align 8
  %tobool = icmp ne i64 %tmp, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @foo(i64* %r) nounwind uwtable alwaysinline {
entry:
  %r.addr = alloca i64*, align 8
  %i = alloca i32, align 4
  store i64* %r, i64** %r.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i64** %r.addr, align 8
  %tmp1 = load i64* %tmp
  %tmp2 = load i32* %i, align 4
  %sub = sub nsw i32 63, %tmp2
  %sh_prom = zext i32 %sub to i64
  %shl = shl i64 1, %sh_prom
  %and = and i64 %tmp1, %shl
  %tobool = icmp ne i64 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.cond
  br label %for.end

if.end:                                           ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp3 = load i32* %i, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then
  %tmp4 = load i32* %i, align 4
  %conv = sext i32 %tmp4 to i64
  call void @bar(i64 %conv)
  ret void
}

define void @do_test(i64* %r) nounwind uwtable noinline {
entry:
  %r.addr.i = alloca i64*, align 8
  %i.i = alloca i32, align 4
  %r.addr = alloca i64*, align 8
  %i = alloca i32, align 4
  store i64* %r, i64** %r.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i64** %r.addr, align 8
  %0 = bitcast i64** %r.addr.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  %1 = bitcast i32* %i.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %1) nounwind
  store i64* %tmp1, i64** %r.addr.i, align 8
  store i32 0, i32* %i.i, align 4
  br label %for.cond.i

for.cond.i:                                       ; preds = %if.end.i, %for.body
  %tmp.i = load i64** %r.addr.i, align 8
  %tmp1.i = load i64* %tmp.i
  %tmp2.i = load i32* %i.i, align 4
  %sub.i = sub nsw i32 63, %tmp2.i
  %sh_prom.i = zext i32 %sub.i to i64
  %shl.i = shl i64 1, %sh_prom.i
  %and.i = and i64 %tmp1.i, %shl.i
  %tobool.i = icmp ne i64 %and.i, 0
  br i1 %tobool.i, label %foo.exit, label %if.end.i

if.end.i:                                         ; preds = %for.cond.i
  %tmp3.i = load i32* %i.i, align 4
  %inc.i = add nsw i32 %tmp3.i, 1
  store i32 %inc.i, i32* %i.i, align 4
  br label %for.cond.i

foo.exit:                                         ; preds = %for.cond.i
  %tmp4.i = load i32* %i.i, align 4
  %conv.i = sext i32 %tmp4.i to i64
  call void @bar(i64 %conv.i) nounwind
  %2 = bitcast i64** %r.addr.i to i8*
  call void @llvm.lifetime.end(i64 -1, i8* %2) nounwind
  %3 = bitcast i32* %i.i to i8*
  call void @llvm.lifetime.end(i64 -1, i8* %3) nounwind
  br label %for.inc

for.inc:                                          ; preds = %foo.exit
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %r = alloca i64, align 8
  store i32 0, i32* %retval
  store i64 -9223372036854775807, i64* %r, align 8
  call void @do_test(i64* %r)
  ret i32 0
}

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
