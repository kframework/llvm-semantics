; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr31169.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tree_type = type { [2 x i8], [2 x i8] }

define i32 @sign_bit_p(%struct.tree_type* nocapture %t, i64 %val_hi, i64 %val_lo) nounwind uwtable readonly {
entry:
  %0 = bitcast %struct.tree_type* %t to i32*
  %1 = load i32* %0, align 4
  %bf.clear = and i32 %1, 511
  %conv18 = zext i32 %bf.clear to i64
  %cmp = icmp ugt i32 %bf.clear, 64
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %sub3 = add i64 %conv18, -65
  %shl = shl i64 1, %sub3
  %sub5 = sub i64 128, %conv18
  %shr = lshr i64 -1, %sub5
  br label %if.end

if.else:                                          ; preds = %entry
  %sub6 = add nsw i32 %bf.clear, -1
  %sh_prom = zext i32 %sub6 to i64
  %shl7 = shl i64 1, %sh_prom
  %sub9 = sub i64 64, %conv18
  %shr10 = lshr i64 -1, %sub9
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %mask_lo.0 = phi i64 [ -1, %if.then ], [ %shr10, %if.else ]
  %lo.0 = phi i64 [ 0, %if.then ], [ %shl7, %if.else ]
  %mask_hi.0 = phi i64 [ %shr, %if.then ], [ 0, %if.else ]
  %hi.0 = phi i64 [ %shl, %if.then ], [ 0, %if.else ]
  %and = and i64 %mask_hi.0, %val_hi
  %cmp11 = icmp eq i64 %and, %hi.0
  br i1 %cmp11, label %land.lhs.true, label %if.end17

land.lhs.true:                                    ; preds = %if.end
  %and13 = and i64 %mask_lo.0, %val_lo
  %cmp14 = icmp eq i64 %and13, %lo.0
  br i1 %cmp14, label %return, label %if.end17

if.end17:                                         ; preds = %land.lhs.true, %if.end
  br label %return

return:                                           ; preds = %land.lhs.true, %if.end17
  %retval.0 = phi i32 [ 0, %if.end17 ], [ 1, %land.lhs.true ]
  ret i32 %retval.0
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}
