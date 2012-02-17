; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020810-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i64, i64 }
%struct.A = type { i64 }
%struct.R = type { %struct.A, %struct.A }

@R = global %struct.R { %struct.A { i64 100 }, %struct.A { i64 200 } }, align 8

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

define void @f(i64 %r.coerce0, i64 %r.coerce1) nounwind uwtable {
entry:
  %tmp1 = load i64* getelementptr inbounds (%struct.R* @R, i64 0, i32 0, i32 0), align 8
  %cmp = icmp eq i64 %tmp1, %r.coerce0
  %tmp4 = load i64* getelementptr inbounds (%struct.R* @R, i64 0, i32 1, i32 0), align 8
  %cmp5 = icmp eq i64 %tmp4, %r.coerce1
  %or.cond = and i1 %cmp, %cmp5
  br i1 %or.cond, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define %0 @g() nounwind uwtable {
entry:
  %srcval = load i128* bitcast (%struct.R* @R to i128*), align 8
  %tmp2 = trunc i128 %srcval to i64
  %tmp3 = insertvalue %0 undef, i64 %tmp2, 0
  %tmp4 = lshr i128 %srcval, 64
  %tmp5 = trunc i128 %tmp4 to i64
  %tmp6 = insertvalue %0 %tmp3, i64 %tmp5, 1
  ret %0 %tmp6
}

define i32 @main() nounwind uwtable {
f.exit:
  %0 = load i64* getelementptr inbounds (%struct.R* @R, i64 0, i32 0, i32 0), align 8
  %1 = load i64* getelementptr inbounds (%struct.R* @R, i64 0, i32 1, i32 0), align 8
  %srcval.i = load i128* bitcast (%struct.R* @R to i128*), align 8
  %tmp2.i = trunc i128 %srcval.i to i64
  %tmp4.i1 = lshr i128 %srcval.i, 64
  %tmp5.i = trunc i128 %tmp4.i1 to i64
  %cmp = icmp eq i64 %tmp2.i, %0
  %cmp5 = icmp eq i64 %tmp5.i, %1
  %or.cond = and i1 %cmp, %cmp5
  br i1 %or.cond, label %if.end, label %if.then

if.then:                                          ; preds = %f.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %f.exit
  ret i32 0
}
