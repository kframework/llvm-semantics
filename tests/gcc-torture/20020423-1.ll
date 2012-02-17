; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020423-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %my_int = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 924, i32* %my_int, align 4
  %tmp = load i32* %my_int, align 4
  %mul = mul nsw i32 %tmp, 2
  %add = add nsw i32 %mul, 4
  %sub = sub i32 %add, 8
  %div = udiv i32 %sub, 2
  store i32 %div, i32* %result, align 4
  %tmp1 = load i32* %result, align 4
  %cmp = icmp ne i32 %tmp1, 922
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %tmp2 = load i32* %my_int, align 4
  %mul3 = mul nsw i32 %tmp2, 2
  %sub4 = sub i32 %mul3, 4
  %add5 = add i32 %sub4, 2
  %div6 = udiv i32 %add5, 2
  store i32 %div6, i32* %result, align 4
  %tmp7 = load i32* %result, align 4
  %cmp8 = icmp ne i32 %tmp7, 923
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end10:                                         ; preds = %if.end
  %tmp11 = load i32* %my_int, align 4
  %add12 = add nsw i32 %tmp11, 2
  %mul13 = mul nsw i32 %add12, 2
  %sub14 = sub i32 %mul13, 8
  %sub15 = sub i32 %sub14, 4
  %div16 = udiv i32 %sub15, 2
  store i32 %div16, i32* %result, align 4
  %tmp17 = load i32* %result, align 4
  %cmp18 = icmp ne i32 %tmp17, 920
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end10
  call void @abort() noreturn
  unreachable

if.end20:                                         ; preds = %if.end10
  %tmp21 = load i32* %my_int, align 4
  %add22 = add nsw i32 %tmp21, 2
  %mul23 = mul nsw i32 %add22, 2
  %sub24 = sub i32 %mul23, 12
  %div25 = udiv i32 %sub24, 2
  store i32 %div25, i32* %result, align 4
  %tmp26 = load i32* %result, align 4
  %cmp27 = icmp ne i32 %tmp26, 920
  br i1 %cmp27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.end20
  call void @abort() noreturn
  unreachable

if.end29:                                         ; preds = %if.end20
  %tmp30 = load i32* %my_int, align 4
  %mul31 = mul nsw i32 %tmp30, 4
  %add32 = add i32 %mul31, 2
  %sub33 = sub i32 %add32, 4
  %div34 = udiv i32 %sub33, 2
  store i32 %div34, i32* %result, align 4
  %tmp35 = load i32* %result, align 4
  %cmp36 = icmp ne i32 %tmp35, 1847
  br i1 %cmp36, label %if.then37, label %if.end38

if.then37:                                        ; preds = %if.end29
  call void @abort() noreturn
  unreachable

if.end38:                                         ; preds = %if.end29
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
