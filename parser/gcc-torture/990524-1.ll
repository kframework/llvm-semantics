; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/990524-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@a = global [6 x i8] c"12345\00", align 1
@b = global [6 x i8] c"12345\00", align 1

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

define void @loop(i8* %pz, i8* %pzDta) nounwind uwtable {
entry:
  %pz.addr = alloca i8*, align 8
  %pzDta.addr = alloca i8*, align 8
  store i8* %pz, i8** %pz.addr, align 8
  store i8* %pzDta, i8** %pzDta.addr, align 8
  br label %for.cond

for.cond:                                         ; preds = %sw.epilog, %entry
  %tmp = load i8** %pzDta.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp, i32 1
  store i8* %incdec.ptr, i8** %pzDta.addr, align 8
  %tmp1 = load i8* %tmp
  %tmp2 = load i8** %pz.addr, align 8
  %incdec.ptr3 = getelementptr inbounds i8* %tmp2, i32 1
  store i8* %incdec.ptr3, i8** %pz.addr, align 8
  store i8 %tmp1, i8* %tmp2
  %conv = sext i8 %tmp1 to i32
  switch i32 %conv, label %sw.epilog [
    i32 0, label %sw.bb
    i32 34, label %sw.bb4
    i32 92, label %sw.bb4
  ]

sw.bb:                                            ; preds = %for.cond
  br label %loopDone2

sw.bb4:                                           ; preds = %for.cond, %for.cond
  %tmp5 = load i8** %pz.addr, align 8
  %arrayidx = getelementptr inbounds i8* %tmp5, i64 -1
  store i8 92, i8* %arrayidx
  %tmp6 = load i8** %pzDta.addr, align 8
  %arrayidx7 = getelementptr inbounds i8* %tmp6, i64 -1
  %tmp8 = load i8* %arrayidx7
  %tmp9 = load i8** %pz.addr, align 8
  %incdec.ptr10 = getelementptr inbounds i8* %tmp9, i32 1
  store i8* %incdec.ptr10, i8** %pz.addr, align 8
  store i8 %tmp8, i8* %tmp9
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb4, %for.cond
  br label %for.cond

loopDone2:                                        ; preds = %sw.bb
  %tmp11 = load i8** %pz.addr, align 8
  %sub.ptr.rhs.cast = ptrtoint i8* %tmp11 to i64
  %sub.ptr.sub = sub i64 ptrtoint ([6 x i8]* @a to i64), %sub.ptr.rhs.cast
  %tmp12 = load i8** %pzDta.addr, align 8
  %sub.ptr.rhs.cast13 = ptrtoint i8* %tmp12 to i64
  %sub.ptr.sub14 = sub i64 ptrtoint ([6 x i8]* @b to i64), %sub.ptr.rhs.cast13
  %cmp = icmp ne i64 %sub.ptr.sub, %sub.ptr.sub14
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %loopDone2
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %loopDone2
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @loop(i8* getelementptr inbounds ([6 x i8]* @a, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @b, i32 0, i32 0))
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
