; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/restrict-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, i32 }

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

define void @bar(%struct.A* noalias %p) nounwind uwtable {
entry:
  %call = tail call i64 @foo(%struct.A* %p, %struct.A* %p) nounwind
  %0 = bitcast %struct.A* %p to i64*
  store i64 %call, i64* %0, align 8
  %trunc = trunc i64 %call to i32
  %cmp = icmp eq i32 %trunc, 2
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare i64 @foo(%struct.A*, %struct.A*)

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %a = alloca i64, align 8
  %tmpcast = bitcast i64* %a to %struct.A*
  store i64 1, i64* %a, align 8
  %call.i = call i64 @foo(%struct.A* %tmpcast, %struct.A* %tmpcast) nounwind
  store i64 %call.i, i64* %a, align 8
  %trunc.i = trunc i64 %call.i to i32
  %cmp.i = icmp eq i32 %trunc.i, 2
  br i1 %cmp.i, label %bar.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %entry
  ret i32 0
}
