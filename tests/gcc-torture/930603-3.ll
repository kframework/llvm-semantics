; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/930603-3.c'
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

define i32 @f(i8* %b, i32 %c) nounwind uwtable {
entry:
  %b.addr = alloca i8*, align 8
  %c.addr = alloca i32, align 4
  %v = alloca i64, align 8
  store i8* %b, i8** %b.addr, align 8
  store i32 %c, i32* %c.addr, align 4
  store i64 0, i64* %v, align 8
  %tmp = load i32* %c.addr, align 4
  switch i32 %tmp, label %sw.default [
    i32 100, label %sw.bb
    i32 107, label %sw.bb8
  ]

sw.bb:                                            ; preds = %entry
  %tmp1 = load i8** %b.addr, align 8
  %arrayidx = getelementptr inbounds i8* %tmp1, i64 0
  %tmp2 = load i8* %arrayidx
  %conv = zext i8 %tmp2 to i64
  %shl = shl i64 %conv, 8
  %tmp3 = load i8** %b.addr, align 8
  %arrayidx4 = getelementptr inbounds i8* %tmp3, i64 1
  %tmp5 = load i8* %arrayidx4
  %conv6 = zext i8 %tmp5 to i64
  %add = add i64 %shl, %conv6
  store i64 %add, i64* %v, align 8
  %tmp7 = load i64* %v, align 8
  %shr = lshr i64 %tmp7, 9
  store i64 %shr, i64* %v, align 8
  br label %sw.epilog

sw.bb8:                                           ; preds = %entry
  %tmp9 = load i8** %b.addr, align 8
  %arrayidx10 = getelementptr inbounds i8* %tmp9, i64 3
  %tmp11 = load i8* %arrayidx10
  %conv12 = zext i8 %tmp11 to i32
  %shr13 = ashr i32 %conv12, 4
  %conv14 = sext i32 %shr13 to i64
  store i64 %conv14, i64* %v, align 8
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

sw.epilog:                                        ; preds = %sw.bb8, %sw.bb
  %tmp15 = load i64* %v, align 8
  %conv16 = trunc i64 %tmp15 to i32
  ret i32 %conv16
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %buf = alloca [4 x i8], align 1
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [4 x i8]* %buf, i32 0, i64 0
  store i8 -86, i8* %arrayidx, align 1
  %arrayidx1 = getelementptr inbounds [4 x i8]* %buf, i32 0, i64 1
  store i8 5, i8* %arrayidx1, align 1
  %arraydecay = getelementptr inbounds [4 x i8]* %buf, i32 0, i32 0
  %call = call i32 (...)* bitcast (i32 (i8*, i32)* @f to i32 (...)*)(i8* %arraydecay, i32 100)
  %cmp = icmp ne i32 %call, 85
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
