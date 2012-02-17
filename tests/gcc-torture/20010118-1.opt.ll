; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20010118-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, i32, i32, i32, i32, i32 }

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define void @foo(%struct.A* nocapture %v, i32 %w, i32 %x, i32* nocapture %y, i32* nocapture %z) nounwind uwtable readnone {
entry:
  ret void
}

define void @bar(%struct.A* %v, i32 %x, i32 %y, i32 %w, i32 %h) nounwind uwtable {
entry:
  %a = getelementptr inbounds %struct.A* %v, i64 0, i32 0
  %tmp1 = load i32* %a, align 4
  %cmp = icmp eq i32 %tmp1, %x
  %b = getelementptr inbounds %struct.A* %v, i64 0, i32 1
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %tmp4 = load i32* %b, align 4
  %cmp6 = icmp eq i32 %tmp4, %y
  br i1 %cmp6, label %if.end, label %if.then

if.then:                                          ; preds = %entry, %lor.lhs.false
  %e13 = getelementptr inbounds %struct.A* %v, i64 0, i32 4
  %tmp14 = load i32* %e13, align 4
  %f17 = getelementptr inbounds %struct.A* %v, i64 0, i32 5
  %tmp18 = load i32* %f17, align 4
  %conv25 = sitofp i32 %tmp14 to double
  %mul = fmul double %conv25, 0.000000e+00
  %div = fmul double %mul, 5.000000e-01
  %conv26 = fptosi double %div to i32
  %conv32 = sitofp i32 %tmp18 to double
  %mul33 = fmul double %conv32, 0.000000e+00
  %div34 = fmul double %mul33, 5.000000e-01
  %conv35 = fptosi double %div34 to i32
  %add = add nsw i32 %conv26, %x
  %add40 = add nsw i32 %conv35, %y
  store i32 %add, i32* %a, align 4
  store i32 %add40, i32* %b, align 4
  %c = getelementptr inbounds %struct.A* %v, i64 0, i32 2
  store i32 %w, i32* %c, align 4
  %d = getelementptr inbounds %struct.A* %v, i64 0, i32 3
  store i32 %h, i32* %d, align 4
  br label %if.end

if.end:                                           ; preds = %lor.lhs.false, %if.then
  ret void
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
