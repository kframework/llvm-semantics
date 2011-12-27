; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/960513-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

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

define x86_fp80 @f(x86_fp80 %d, i32 %i) nounwind uwtable readnone {
entry:
  %sub = fsub x86_fp80 0xK80000000000000000000, %d
  %cmp = icmp eq i32 %i, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul = fmul x86_fp80 %d, 0xKC0008000000000000000
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %sub281 = phi x86_fp80 [ %mul, %if.then ], [ %sub, %entry ]
  %mul6 = fmul x86_fp80 %sub281, %sub
  %sub8 = fsub x86_fp80 %sub281, %mul6
  %mul11 = fmul x86_fp80 %sub8, %sub
  %sub13 = fsub x86_fp80 %sub8, %mul11
  %mul16 = fmul x86_fp80 %sub13, %sub
  %sub18 = fsub x86_fp80 %sub13, %mul16
  %mul21 = fmul x86_fp80 %sub18, %sub
  %sub23 = fsub x86_fp80 %sub18, %mul21
  %mul26 = fmul x86_fp80 %sub23, %sub
  %sub28 = fsub x86_fp80 %sub23, %mul26
  ret x86_fp80 %sub28
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
