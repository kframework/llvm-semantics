; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr39100.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { %struct.E*, i16, i16, [4 x i8] }
%struct.C = type { %struct.E*, i16, i16 }
%struct.E = type { i32, %struct.E* }

@main.c = internal unnamed_addr constant %0 { %struct.E* null, i16 0, i16 0, [4 x i8] undef }, align 8

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

define %struct.C* @foo(%struct.C* %h, %struct.E* %x) nounwind uwtable noinline {
entry:
  %h.addr = alloca %struct.C*, align 8
  %x.addr = alloca %struct.E*, align 8
  %pl = alloca %struct.E*, align 8
  %pa = alloca %struct.E**, align 8
  %nl = alloca %struct.E*, align 8
  %na = alloca %struct.E**, align 8
  %n = alloca %struct.E*, align 8
  store %struct.C* %h, %struct.C** %h.addr, align 8
  store %struct.E* %x, %struct.E** %x.addr, align 8
  store %struct.E* null, %struct.E** %pl, align 8
  store %struct.E** %pl, %struct.E*** %pa, align 8
  store %struct.E* null, %struct.E** %nl, align 8
  store %struct.E** %nl, %struct.E*** %na, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %tmp = load %struct.E** %x.addr, align 8
  %tobool = icmp ne %struct.E* %tmp, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp1 = load %struct.E** %x.addr, align 8
  %n2 = getelementptr inbounds %struct.E* %tmp1, i32 0, i32 1
  %tmp3 = load %struct.E** %n2, align 8
  store %struct.E* %tmp3, %struct.E** %n, align 8
  %tmp4 = load %struct.E** %x.addr, align 8
  %p = getelementptr inbounds %struct.E* %tmp4, i32 0, i32 0
  %tmp5 = load i32* %p, align 4
  %and = and i32 %tmp5, 1
  %cmp = icmp eq i32 %and, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %tmp6 = load %struct.C** %h.addr, align 8
  %cp = getelementptr inbounds %struct.C* %tmp6, i32 0, i32 2
  %tmp7 = load i16* %cp, align 2
  %inc = add i16 %tmp7, 1
  store i16 %inc, i16* %cp, align 2
  %tmp8 = load %struct.E** %x.addr, align 8
  %tmp9 = load %struct.E*** %pa, align 8
  store %struct.E* %tmp8, %struct.E** %tmp9
  %tmp10 = load %struct.E*** %pa, align 8
  %tmp11 = load %struct.E** %tmp10
  %n12 = getelementptr inbounds %struct.E* %tmp11, i32 0, i32 1
  store %struct.E** %n12, %struct.E*** %pa, align 8
  br label %if.end

if.else:                                          ; preds = %while.body
  %tmp13 = load %struct.C** %h.addr, align 8
  %cn = getelementptr inbounds %struct.C* %tmp13, i32 0, i32 1
  %tmp14 = load i16* %cn, align 2
  %inc15 = add i16 %tmp14, 1
  store i16 %inc15, i16* %cn, align 2
  %tmp16 = load %struct.E** %x.addr, align 8
  %tmp17 = load %struct.E*** %na, align 8
  store %struct.E* %tmp16, %struct.E** %tmp17
  %tmp18 = load %struct.E*** %na, align 8
  %tmp19 = load %struct.E** %tmp18
  %n20 = getelementptr inbounds %struct.E* %tmp19, i32 0, i32 1
  store %struct.E** %n20, %struct.E*** %na, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %tmp21 = load %struct.E** %n, align 8
  store %struct.E* %tmp21, %struct.E** %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp22 = load %struct.E** %nl, align 8
  %tmp23 = load %struct.E*** %pa, align 8
  store %struct.E* %tmp22, %struct.E** %tmp23
  %tmp24 = load %struct.E*** %na, align 8
  store %struct.E* null, %struct.E** %tmp24
  %tmp25 = load %struct.E** %pl, align 8
  %tmp26 = load %struct.C** %h.addr, align 8
  %x27 = getelementptr inbounds %struct.C* %tmp26, i32 0, i32 0
  store %struct.E* %tmp25, %struct.E** %x27, align 8
  %tmp28 = load %struct.C** %h.addr, align 8
  ret %struct.C* %tmp28
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %c = alloca %struct.C, align 8
  %e = alloca [2 x %struct.E], align 16
  %p6 = alloca %struct.E*, align 8
  store i32 0, i32* %retval
  %tmp = bitcast %struct.C* %c to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%0* @main.c to i8*), i64 16, i32 8, i1 false)
  %.array = getelementptr inbounds [2 x %struct.E]* %e, i32 0, i32 0
  %p = getelementptr inbounds %struct.E* %.array, i32 0, i32 0
  store i32 0, i32* %p, align 4
  %n = getelementptr inbounds %struct.E* %.array, i32 0, i32 1
  %arrayidx = getelementptr inbounds [2 x %struct.E]* %e, i32 0, i64 1
  store %struct.E* %arrayidx, %struct.E** %n, align 8
  %.array2 = getelementptr inbounds [2 x %struct.E]* %e, i32 0, i32 1
  %p3 = getelementptr inbounds %struct.E* %.array2, i32 0, i32 0
  store i32 1, i32* %p3, align 4
  %n4 = getelementptr inbounds %struct.E* %.array2, i32 0, i32 1
  store %struct.E* null, %struct.E** %n4, align 8
  %arrayidx7 = getelementptr inbounds [2 x %struct.E]* %e, i32 0, i64 0
  %call = call %struct.C* @foo(%struct.C* %c, %struct.E* %arrayidx7)
  %cn = getelementptr inbounds %struct.C* %c, i32 0, i32 1
  %tmp8 = load i16* %cn, align 2
  %conv = sext i16 %tmp8 to i32
  %cmp = icmp ne i32 %conv, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %cp = getelementptr inbounds %struct.C* %c, i32 0, i32 2
  %tmp10 = load i16* %cp, align 2
  %conv11 = sext i16 %tmp10 to i32
  %cmp12 = icmp ne i32 %conv11, 1
  br i1 %cmp12, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %x = getelementptr inbounds %struct.C* %c, i32 0, i32 0
  %tmp14 = load %struct.E** %x, align 8
  %arrayidx15 = getelementptr inbounds [2 x %struct.E]* %e, i32 0, i64 1
  %cmp16 = icmp ne %struct.E* %tmp14, %arrayidx15
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end19:                                         ; preds = %if.end
  %arrayidx20 = getelementptr inbounds [2 x %struct.E]* %e, i32 0, i64 1
  %n21 = getelementptr inbounds %struct.E* %arrayidx20, i32 0, i32 1
  %tmp22 = load %struct.E** %n21, align 8
  %arrayidx23 = getelementptr inbounds [2 x %struct.E]* %e, i32 0, i64 0
  %cmp24 = icmp ne %struct.E* %tmp22, %arrayidx23
  br i1 %cmp24, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.end19
  call void @abort() noreturn nounwind
  unreachable

if.end27:                                         ; preds = %if.end19
  %arrayidx28 = getelementptr inbounds [2 x %struct.E]* %e, i32 0, i64 0
  %n29 = getelementptr inbounds %struct.E* %arrayidx28, i32 0, i32 1
  %tmp30 = load %struct.E** %n29, align 8
  %tobool = icmp ne %struct.E* %tmp30, null
  br i1 %tobool, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end27
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end27
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind
