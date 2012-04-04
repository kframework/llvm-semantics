; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/extzvsi.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ieee = type { i8, i8, [2 x i8], [4 x i8] }

@x = common global %struct.ieee zeroinitializer, align 4

define i32 @foo() nounwind uwtable readonly {
entry:
  %0 = load i32* bitcast (%struct.ieee* @x to i32*), align 4
  %1 = lshr i32 %0, 1
  %bf.clear = and i32 %1, 2047
  %cmp = icmp eq i32 %bf.clear, 0
  br i1 %cmp, label %return, label %if.else

if.else:                                          ; preds = %entry
  %cmp1 = icmp ugt i32 %bf.clear, 1
  %. = select i1 %cmp1, i32 2, i32 0
  br label %return

return:                                           ; preds = %if.else, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ %., %if.else ]
  ret i32 %retval.0
}

define i32 @main() nounwind uwtable {
foo.exit:
  %0 = load i32* bitcast (%struct.ieee* @x to i32*), align 4
  %1 = and i32 %0, -4095
  %2 = or i32 %1, 2
  store i32 %2, i32* bitcast (%struct.ieee* @x to i32*), align 4
  ret i32 0
}
