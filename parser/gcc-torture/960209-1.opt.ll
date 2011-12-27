; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/960209-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.a_struct = type { i8 }

@yabba = global i32 1, align 4
@an_array = common global [5 x %struct.a_struct] zeroinitializer, align 1
@a_ptr = common global %struct.a_struct* null, align 8

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

define i32 @f(i32, i64 %b) nounwind uwtable {
entry:
  %tmp36.pre = load i32* @yabba, align 4
  %tobool37 = icmp eq i32 %tmp36.pre, 0
  %not.cmp = icmp ne i64 %b, 0
  %. = sext i1 %not.cmp to i32
  br i1 %tobool37, label %if.end39, label %return

if.end39:                                         ; preds = %entry
  %a = zext i32 %0 to i64
  %idxprom = and i64 %a, 255
  %arrayidx = getelementptr inbounds [5 x %struct.a_struct]* @an_array, i64 0, i64 %idxprom
  store %struct.a_struct* %arrayidx, %struct.a_struct** @a_ptr, align 8
  br label %return

return:                                           ; preds = %entry, %if.end39
  %1 = phi i32 [ 0, %if.end39 ], [ %., %entry ]
  ret i32 %1
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %tmp36.pre.i = load i32* @yabba, align 4
  %tobool37.i = icmp eq i32 %tmp36.pre.i, 0
  br i1 %tobool37.i, label %if.end39.i, label %if.end

if.end39.i:                                       ; preds = %entry
  store %struct.a_struct* getelementptr inbounds ([5 x %struct.a_struct]* @an_array, i64 0, i64 1), %struct.a_struct** @a_ptr, align 8
  br label %if.end

if.end:                                           ; preds = %if.end39.i, %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
