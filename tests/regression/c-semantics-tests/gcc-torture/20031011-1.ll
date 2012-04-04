; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20031011-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %ll_bitsize = alloca i32, align 4
  %ll_bitpos = alloca i32, align 4
  %rl_bitsize = alloca i32, align 4
  %rl_bitpos = alloca i32, align 4
  %end_bit = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 32, i32* %ll_bitpos, align 4
  store i32 32, i32* %ll_bitsize, align 4
  store i32 0, i32* %rl_bitpos, align 4
  store i32 32, i32* %rl_bitsize, align 4
  %0 = load i32* %ll_bitpos, align 4
  %1 = load i32* %ll_bitsize, align 4
  %add = add nsw i32 %0, %1
  %2 = load i32* %rl_bitpos, align 4
  %3 = load i32* %rl_bitsize, align 4
  %add1 = add nsw i32 %2, %3
  %cmp = icmp sgt i32 %add, %add1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %4 = load i32* %ll_bitpos, align 4
  %5 = load i32* %ll_bitsize, align 4
  %add2 = add nsw i32 %4, %5
  br label %cond.end

cond.false:                                       ; preds = %entry
  %6 = load i32* %rl_bitpos, align 4
  %7 = load i32* %rl_bitsize, align 4
  %add3 = add nsw i32 %6, %7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add2, %cond.true ], [ %add3, %cond.false ]
  store i32 %cond, i32* %end_bit, align 4
  %8 = load i32* %end_bit, align 4
  %cmp4 = icmp ne i32 %8, 64
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %cond.end
  %9 = load i32* %rl_bitpos, align 4
  %10 = load i32* %rl_bitsize, align 4
  %add5 = add nsw i32 %9, %10
  %11 = load i32* %ll_bitpos, align 4
  %12 = load i32* %ll_bitsize, align 4
  %add6 = add nsw i32 %11, %12
  %cmp7 = icmp sgt i32 %add5, %add6
  br i1 %cmp7, label %cond.true8, label %cond.false10

cond.true8:                                       ; preds = %if.end
  %13 = load i32* %rl_bitpos, align 4
  %14 = load i32* %rl_bitsize, align 4
  %add9 = add nsw i32 %13, %14
  br label %cond.end12

cond.false10:                                     ; preds = %if.end
  %15 = load i32* %ll_bitpos, align 4
  %16 = load i32* %ll_bitsize, align 4
  %add11 = add nsw i32 %15, %16
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false10, %cond.true8
  %cond13 = phi i32 [ %add9, %cond.true8 ], [ %add11, %cond.false10 ]
  store i32 %cond13, i32* %end_bit, align 4
  %17 = load i32* %end_bit, align 4
  %cmp14 = icmp ne i32 %17, 64
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %cond.end12
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %cond.end12
  %18 = load i32* %ll_bitpos, align 4
  %19 = load i32* %ll_bitsize, align 4
  %add17 = add nsw i32 %18, %19
  %20 = load i32* %rl_bitpos, align 4
  %21 = load i32* %rl_bitsize, align 4
  %add18 = add nsw i32 %20, %21
  %cmp19 = icmp slt i32 %add17, %add18
  br i1 %cmp19, label %cond.true20, label %cond.false22

cond.true20:                                      ; preds = %if.end16
  %22 = load i32* %ll_bitpos, align 4
  %23 = load i32* %ll_bitsize, align 4
  %add21 = add nsw i32 %22, %23
  br label %cond.end24

cond.false22:                                     ; preds = %if.end16
  %24 = load i32* %rl_bitpos, align 4
  %25 = load i32* %rl_bitsize, align 4
  %add23 = add nsw i32 %24, %25
  br label %cond.end24

cond.end24:                                       ; preds = %cond.false22, %cond.true20
  %cond25 = phi i32 [ %add21, %cond.true20 ], [ %add23, %cond.false22 ]
  store i32 %cond25, i32* %end_bit, align 4
  %26 = load i32* %end_bit, align 4
  %cmp26 = icmp ne i32 %26, 32
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %cond.end24
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %cond.end24
  %27 = load i32* %rl_bitpos, align 4
  %28 = load i32* %rl_bitsize, align 4
  %add29 = add nsw i32 %27, %28
  %29 = load i32* %ll_bitpos, align 4
  %30 = load i32* %ll_bitsize, align 4
  %add30 = add nsw i32 %29, %30
  %cmp31 = icmp slt i32 %add29, %add30
  br i1 %cmp31, label %cond.true32, label %cond.false34

cond.true32:                                      ; preds = %if.end28
  %31 = load i32* %rl_bitpos, align 4
  %32 = load i32* %rl_bitsize, align 4
  %add33 = add nsw i32 %31, %32
  br label %cond.end36

cond.false34:                                     ; preds = %if.end28
  %33 = load i32* %ll_bitpos, align 4
  %34 = load i32* %ll_bitsize, align 4
  %add35 = add nsw i32 %33, %34
  br label %cond.end36

cond.end36:                                       ; preds = %cond.false34, %cond.true32
  %cond37 = phi i32 [ %add33, %cond.true32 ], [ %add35, %cond.false34 ]
  store i32 %cond37, i32* %end_bit, align 4
  %35 = load i32* %end_bit, align 4
  %cmp38 = icmp ne i32 %35, 32
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %cond.end36
  call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %cond.end36
  ret i32 0
}

declare void @abort() noreturn nounwind
