; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20010118-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, i32, i32, i32, i32, i32 }

@main.w = internal unnamed_addr constant %struct.A { i32 100, i32 110, i32 20, i32 30, i32 -1, i32 -1 }, align 4

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

define void @foo(%struct.A* %v, i32 %w, i32 %x, i32* %y, i32* %z) nounwind uwtable {
entry:
  %v.addr = alloca %struct.A*, align 8
  %w.addr = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32*, align 8
  %z.addr = alloca i32*, align 8
  store %struct.A* %v, %struct.A** %v.addr, align 8
  store i32 %w, i32* %w.addr, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32* %y, i32** %y.addr, align 8
  store i32* %z, i32** %z.addr, align 8
  ret void
}

define void @bar(%struct.A* %v, i32 %x, i32 %y, i32 %w, i32 %h) nounwind uwtable {
entry:
  %v.addr = alloca %struct.A*, align 8
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %w.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %oldw = alloca i32, align 4
  %oldh = alloca i32, align 4
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  %dx = alloca i32, align 4
  %dy = alloca i32, align 4
  store %struct.A* %v, %struct.A** %v.addr, align 8
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %w, i32* %w.addr, align 4
  store i32 %h, i32* %h.addr, align 4
  %tmp = load %struct.A** %v.addr, align 8
  %a = getelementptr inbounds %struct.A* %tmp, i32 0, i32 0
  %tmp1 = load i32* %a, align 4
  %tmp2 = load i32* %x.addr, align 4
  %cmp = icmp ne i32 %tmp1, %tmp2
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp3 = load %struct.A** %v.addr, align 8
  %b = getelementptr inbounds %struct.A* %tmp3, i32 0, i32 1
  %tmp4 = load i32* %b, align 4
  %tmp5 = load i32* %y.addr, align 4
  %cmp6 = icmp ne i32 %tmp4, %tmp5
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %tmp8 = load i32* %w.addr, align 4
  store i32 %tmp8, i32* %oldw, align 4
  %tmp10 = load i32* %h.addr, align 4
  store i32 %tmp10, i32* %oldh, align 4
  %tmp12 = load %struct.A** %v.addr, align 8
  %e13 = getelementptr inbounds %struct.A* %tmp12, i32 0, i32 4
  %tmp14 = load i32* %e13, align 4
  store i32 %tmp14, i32* %e, align 4
  %tmp16 = load %struct.A** %v.addr, align 8
  %f17 = getelementptr inbounds %struct.A* %tmp16, i32 0, i32 5
  %tmp18 = load i32* %f17, align 4
  store i32 %tmp18, i32* %f, align 4
  %tmp21 = load %struct.A** %v.addr, align 8
  call void @foo(%struct.A* %tmp21, i32 0, i32 0, i32* %w.addr, i32* %h.addr)
  %tmp22 = load i32* %oldw, align 4
  %tmp23 = load i32* %w.addr, align 4
  %sub = sub nsw i32 %tmp22, %tmp23
  %conv = sitofp i32 %sub to double
  %tmp24 = load i32* %e, align 4
  %conv25 = sitofp i32 %tmp24 to double
  %mul = fmul double %conv, %conv25
  %div = fdiv double %mul, 2.000000e+00
  %conv26 = fptosi double %div to i32
  store i32 %conv26, i32* %dx, align 4
  %tmp27 = load i32* %oldh, align 4
  %tmp28 = load i32* %h.addr, align 4
  %sub29 = sub nsw i32 %tmp27, %tmp28
  %conv30 = sitofp i32 %sub29 to double
  %tmp31 = load i32* %f, align 4
  %conv32 = sitofp i32 %tmp31 to double
  %mul33 = fmul double %conv30, %conv32
  %div34 = fdiv double %mul33, 2.000000e+00
  %conv35 = fptosi double %div34 to i32
  store i32 %conv35, i32* %dy, align 4
  %tmp36 = load i32* %dx, align 4
  %tmp37 = load i32* %x.addr, align 4
  %add = add nsw i32 %tmp37, %tmp36
  store i32 %add, i32* %x.addr, align 4
  %tmp38 = load i32* %dy, align 4
  %tmp39 = load i32* %y.addr, align 4
  %add40 = add nsw i32 %tmp39, %tmp38
  store i32 %add40, i32* %y.addr, align 4
  %tmp41 = load i32* %x.addr, align 4
  %tmp42 = load %struct.A** %v.addr, align 8
  %a43 = getelementptr inbounds %struct.A* %tmp42, i32 0, i32 0
  store i32 %tmp41, i32* %a43, align 4
  %tmp44 = load i32* %y.addr, align 4
  %tmp45 = load %struct.A** %v.addr, align 8
  %b46 = getelementptr inbounds %struct.A* %tmp45, i32 0, i32 1
  store i32 %tmp44, i32* %b46, align 4
  %tmp47 = load i32* %w.addr, align 4
  %tmp48 = load %struct.A** %v.addr, align 8
  %c = getelementptr inbounds %struct.A* %tmp48, i32 0, i32 2
  store i32 %tmp47, i32* %c, align 4
  %tmp49 = load i32* %h.addr, align 4
  %tmp50 = load %struct.A** %v.addr, align 8
  %d = getelementptr inbounds %struct.A* %tmp50, i32 0, i32 3
  store i32 %tmp49, i32* %d, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %w = alloca %struct.A, align 4
  store i32 0, i32* %retval
  %tmp = bitcast %struct.A* %w to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%struct.A* @main.w to i8*), i64 24, i32 4, i1 false)
  call void @bar(%struct.A* %w, i32 400, i32 420, i32 50, i32 70)
  %d = getelementptr inbounds %struct.A* %w, i32 0, i32 3
  %tmp1 = load i32* %d, align 4
  %cmp = icmp ne i32 %tmp1, 70
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

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
