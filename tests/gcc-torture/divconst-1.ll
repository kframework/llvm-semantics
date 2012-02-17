; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/divconst-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.t1 = type { i32, i32, i32, i32 }

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

define void @f(%struct.t1* %ps) nounwind uwtable {
entry:
  %ps.addr = alloca %struct.t1*, align 8
  store %struct.t1* %ps, %struct.t1** %ps.addr, align 8
  %tmp = load %struct.t1** %ps.addr, align 8
  %a = getelementptr inbounds %struct.t1* %tmp, i32 0, i32 0
  store i32 10000, i32* %a, align 4
  %tmp1 = load %struct.t1** %ps.addr, align 8
  %a2 = getelementptr inbounds %struct.t1* %tmp1, i32 0, i32 0
  %tmp3 = load i32* %a2, align 4
  %div = udiv i32 %tmp3, 3
  %tmp4 = load %struct.t1** %ps.addr, align 8
  %b = getelementptr inbounds %struct.t1* %tmp4, i32 0, i32 1
  store i32 %div, i32* %b, align 4
  %tmp5 = load %struct.t1** %ps.addr, align 8
  %c = getelementptr inbounds %struct.t1* %tmp5, i32 0, i32 2
  store i32 10000, i32* %c, align 4
  %tmp6 = load %struct.t1** %ps.addr, align 8
  %c7 = getelementptr inbounds %struct.t1* %tmp6, i32 0, i32 2
  %tmp8 = load i32* %c7, align 4
  %div9 = udiv i32 %tmp8, 3
  %tmp10 = load %struct.t1** %ps.addr, align 8
  %d = getelementptr inbounds %struct.t1* %tmp10, i32 0, i32 3
  store i32 %div9, i32* %d, align 4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.t1, align 4
  store i32 0, i32* %retval
  call void @f(%struct.t1* %s)
  %a = getelementptr inbounds %struct.t1* %s, i32 0, i32 0
  %tmp = load i32* %a, align 4
  %cmp = icmp ne i32 %tmp, 10000
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.t1* %s, i32 0, i32 1
  %tmp1 = load i32* %b, align 4
  %cmp2 = icmp ne i32 %tmp1, 3333
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %c = getelementptr inbounds %struct.t1* %s, i32 0, i32 2
  %tmp4 = load i32* %c, align 4
  %cmp5 = icmp ne i32 %tmp4, 10000
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false3
  %d = getelementptr inbounds %struct.t1* %s, i32 0, i32 3
  %tmp7 = load i32* %d, align 4
  %cmp8 = icmp ne i32 %tmp7, 3333
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false6, %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false6
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
