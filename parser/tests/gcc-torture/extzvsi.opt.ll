; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/extzvsi.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.ieee = type { i8, i8, [2 x i8], [4 x i8] }

@x = common global %struct.ieee zeroinitializer, align 4

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

define i32 @foo() nounwind uwtable readonly {
entry:
  %0 = load i32* bitcast (%struct.ieee* @x to i32*), align 4
  %1 = lshr i32 %0, 1
  %bf.clear = and i32 %1, 2047
  %cmp = icmp eq i32 %bf.clear, 0
  br i1 %cmp, label %return, label %if.else

if.else:                                          ; preds = %entry
  %cmp2 = icmp ugt i32 %bf.clear, 1
  br i1 %cmp2, label %return, label %if.end4

if.end4:                                          ; preds = %if.else
  br label %return

return:                                           ; preds = %if.else, %entry, %if.end4
  %2 = phi i32 [ 0, %if.end4 ], [ 1, %entry ], [ 2, %if.else ]
  ret i32 %2
}

define i32 @main() nounwind uwtable {
if.else.i:
  %0 = load i32* bitcast (%struct.ieee* @x to i32*), align 4
  %1 = and i32 %0, -4095
  %2 = or i32 %1, 2
  store i32 %2, i32* bitcast (%struct.ieee* @x to i32*), align 4
  ret i32 0
}
