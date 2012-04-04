; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020213-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { float, i32 }

@a = common global %struct.A zeroinitializer, align 4
@b = common global i32 0, align 4

define void @foo() nounwind uwtable {
entry:
  %0 = load float* getelementptr inbounds (%struct.A* @a, i32 0, i32 0), align 4
  %call = call i32 @bar(float %0)
  store i32 %call, i32* getelementptr inbounds (%struct.A* @a, i32 0, i32 1), align 4
  %1 = load i32* getelementptr inbounds (%struct.A* @a, i32 0, i32 1), align 4
  %2 = load i32* @b, align 4
  %sub = sub nsw i32 %2, 1
  %cmp = icmp slt i32 %1, %sub
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %3 = load i32* getelementptr inbounds (%struct.A* @a, i32 0, i32 1), align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %4 = load i32* @b, align 4
  %sub1 = sub nsw i32 %4, 1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %3, %cond.true ], [ %sub1, %cond.false ]
  store i32 %cond, i32* getelementptr inbounds (%struct.A* @a, i32 0, i32 1), align 4
  %5 = load i32* getelementptr inbounds (%struct.A* @a, i32 0, i32 1), align 4
  %6 = load i32* @b, align 4
  %sub2 = sub nsw i32 %6, 1
  %cmp3 = icmp sge i32 %5, %sub2
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %cond.end
  ret void
}

define i32 @bar(float %x) nounwind uwtable {
entry:
  %x.addr = alloca float, align 4
  store float %x, float* %x.addr, align 4
  ret i32 2241
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store float 1.000000e+00, float* getelementptr inbounds (%struct.A* @a, i32 0, i32 0), align 4
  store i32 3384, i32* @b, align 4
  call void @foo()
  ret i32 0
}
