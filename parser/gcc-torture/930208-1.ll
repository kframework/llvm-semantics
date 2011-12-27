; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/930208-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i8, i8, i8, i8 }
%union.T = type { i64 }

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

define i32 @f(i64 %u.coerce) nounwind uwtable {
entry:
  %u = alloca %union.T, align 8
  %coerce.dive = getelementptr %union.T* %u, i32 0, i32 0
  store i64 %u.coerce, i64* %coerce.dive
  %c = bitcast %union.T* %u to %struct.anon*
  %b0 = getelementptr inbounds %struct.anon* %c, i32 0, i32 3
  %tmp = load i8* %b0, align 1
  %inc = add i8 %tmp, 1
  store i8 %inc, i8* %b0, align 1
  %c1 = bitcast %union.T* %u to %struct.anon*
  %b3 = getelementptr inbounds %struct.anon* %c1, i32 0, i32 0
  %tmp2 = load i8* %b3, align 1
  %inc3 = add i8 %tmp2, 1
  store i8 %inc3, i8* %b3, align 1
  %c4 = bitcast %union.T* %u to %struct.anon*
  %b1 = getelementptr inbounds %struct.anon* %c4, i32 0, i32 2
  %tmp5 = load i8* %b1, align 1
  %conv = sext i8 %tmp5 to i32
  %cmp = icmp ne i32 %conv, 2
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %c7 = bitcast %union.T* %u to %struct.anon*
  %b2 = getelementptr inbounds %struct.anon* %c7, i32 0, i32 1
  %tmp8 = load i8* %b2, align 1
  %conv9 = sext i8 %tmp8 to i32
  %cmp10 = icmp ne i32 %conv9, 2
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %cmp10, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  ret i32 %lor.ext
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %u = alloca %union.T, align 8
  store i32 0, i32* %retval
  %c = bitcast %union.T* %u to %struct.anon*
  %b1 = getelementptr inbounds %struct.anon* %c, i32 0, i32 2
  store i8 2, i8* %b1, align 1
  %c1 = bitcast %union.T* %u to %struct.anon*
  %b2 = getelementptr inbounds %struct.anon* %c1, i32 0, i32 1
  store i8 2, i8* %b2, align 1
  %c2 = bitcast %union.T* %u to %struct.anon*
  %b0 = getelementptr inbounds %struct.anon* %c2, i32 0, i32 3
  store i8 -1, i8* %b0, align 1
  %c3 = bitcast %union.T* %u to %struct.anon*
  %b3 = getelementptr inbounds %struct.anon* %c3, i32 0, i32 0
  store i8 -1, i8* %b3, align 1
  %coerce.dive = getelementptr %union.T* %u, i32 0, i32 0
  %0 = load i64* %coerce.dive
  %call = call i32 @f(i64 %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
