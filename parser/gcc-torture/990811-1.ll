; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/990811-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { i64, i32 }

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

define i32 @foo(i32 %x, i8* %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  store i32 %x, i32* %x.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  %tmp = load i32* %x.addr, align 4
  switch i32 %tmp, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb3
    i32 2, label %sw.bb7
  ]

sw.bb:                                            ; preds = %entry
  %tmp1 = load i8** %y.addr, align 8
  %0 = bitcast i8* %tmp1 to %struct.s*
  %a = getelementptr inbounds %struct.s* %0, i32 0, i32 0
  %tmp2 = load i64* %a, align 8
  %conv = trunc i64 %tmp2 to i32
  store i32 %conv, i32* %retval
  br label %return

sw.bb3:                                           ; preds = %entry
  %tmp4 = load i8** %y.addr, align 8
  %tmp5 = load i8* %tmp4
  %conv6 = sext i8 %tmp5 to i32
  store i32 %conv6, i32* %retval
  br label %return

sw.bb7:                                           ; preds = %entry
  %tmp8 = load i8** %y.addr, align 8
  %1 = bitcast i8* %tmp8 to i16*
  %tmp9 = load i16* %1
  %conv10 = sext i16 %tmp9 to i32
  store i32 %conv10, i32* %retval
  br label %return

sw.epilog:                                        ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; preds = %sw.bb7, %sw.bb3, %sw.bb
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.s, align 8
  %sh = alloca [10 x i16], align 16
  %c = alloca [10 x i8], align 1
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  %a = getelementptr inbounds %struct.s* %s, i32 0, i32 0
  store i64 1, i64* %a, align 8
  %b = getelementptr inbounds %struct.s* %s, i32 0, i32 1
  store i32 2, i32* %b, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %conv = trunc i32 %tmp1 to i16
  %tmp2 = load i32* %i, align 4
  %idxprom = sext i32 %tmp2 to i64
  %arrayidx = getelementptr inbounds [10 x i16]* %sh, i32 0, i64 %idxprom
  store i16 %conv, i16* %arrayidx, align 2
  %tmp3 = load i32* %i, align 4
  %conv4 = trunc i32 %tmp3 to i8
  %tmp5 = load i32* %i, align 4
  %idxprom6 = sext i32 %tmp5 to i64
  %arrayidx7 = getelementptr inbounds [10 x i8]* %c, i32 0, i64 %idxprom6
  store i8 %conv4, i8* %arrayidx7, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp8 = load i32* %i, align 4
  %inc = add nsw i32 %tmp8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %0 = bitcast %struct.s* %s to i8*
  %call = call i32 @foo(i32 0, i8* %0)
  %cmp9 = icmp ne i32 %call, 1
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.end
  %arraydecay = getelementptr inbounds [10 x i8]* %c, i32 0, i32 0
  %add.ptr = getelementptr inbounds i8* %arraydecay, i64 3
  %call11 = call i32 @foo(i32 1, i8* %add.ptr)
  %cmp12 = icmp ne i32 %call11, 3
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.end
  %arraydecay16 = getelementptr inbounds [10 x i16]* %sh, i32 0, i32 0
  %add.ptr17 = getelementptr inbounds i16* %arraydecay16, i64 3
  %1 = bitcast i16* %add.ptr17 to i8*
  %call18 = call i32 @foo(i32 2, i8* %1)
  %cmp19 = icmp ne i32 %call18, 3
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end15
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.end15
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @exit(i32) noreturn nounwind
