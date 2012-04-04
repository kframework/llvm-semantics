; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20080506-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %u = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 -1, i32* %i, align 4
  %0 = load i32* %i, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32* %i, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ 0, %cond.false ]
  %cmp1 = icmp ugt i32 %cond, 1
  br i1 %cmp1, label %cond.true2, label %cond.false8

cond.true2:                                       ; preds = %cond.end
  %2 = load i32* %i, align 4
  %cmp3 = icmp sgt i32 %2, 0
  br i1 %cmp3, label %cond.true4, label %cond.false5

cond.true4:                                       ; preds = %cond.true2
  %3 = load i32* %i, align 4
  br label %cond.end6

cond.false5:                                      ; preds = %cond.true2
  br label %cond.end6

cond.end6:                                        ; preds = %cond.false5, %cond.true4
  %cond7 = phi i32 [ %3, %cond.true4 ], [ 0, %cond.false5 ]
  br label %cond.end9

cond.false8:                                      ; preds = %cond.end
  br label %cond.end9

cond.end9:                                        ; preds = %cond.false8, %cond.end6
  %cond10 = phi i32 [ %cond7, %cond.end6 ], [ 1, %cond.false8 ]
  store i32 %cond10, i32* %u, align 4
  %4 = load i32* %u, align 4
  %cmp11 = icmp ne i32 %4, 1
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end9
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %cond.end9
  %5 = load i32* %i, align 4
  %cmp12 = icmp sgt i32 %5, 0
  br i1 %cmp12, label %cond.true13, label %cond.false14

cond.true13:                                      ; preds = %if.end
  %6 = load i32* %i, align 4
  br label %cond.end15

cond.false14:                                     ; preds = %if.end
  br label %cond.end15

cond.end15:                                       ; preds = %cond.false14, %cond.true13
  %cond16 = phi i32 [ %6, %cond.true13 ], [ 0, %cond.false14 ]
  %7 = load i32* %i, align 4
  %cmp17 = icmp ult i32 %cond16, %7
  br i1 %cmp17, label %cond.true18, label %cond.false24

cond.true18:                                      ; preds = %cond.end15
  %8 = load i32* %i, align 4
  %cmp19 = icmp sgt i32 %8, 0
  br i1 %cmp19, label %cond.true20, label %cond.false21

cond.true20:                                      ; preds = %cond.true18
  %9 = load i32* %i, align 4
  br label %cond.end22

cond.false21:                                     ; preds = %cond.true18
  br label %cond.end22

cond.end22:                                       ; preds = %cond.false21, %cond.true20
  %cond23 = phi i32 [ %9, %cond.true20 ], [ 0, %cond.false21 ]
  br label %cond.end25

cond.false24:                                     ; preds = %cond.end15
  %10 = load i32* %i, align 4
  br label %cond.end25

cond.end25:                                       ; preds = %cond.false24, %cond.end22
  %cond26 = phi i32 [ %cond23, %cond.end22 ], [ %10, %cond.false24 ]
  store i32 %cond26, i32* %u, align 4
  %11 = load i32* %u, align 4
  %cmp27 = icmp ne i32 %11, 0
  br i1 %cmp27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %cond.end25
  call void @abort() noreturn nounwind
  unreachable

if.end29:                                         ; preds = %cond.end25
  ret i32 0
}

declare void @abort() noreturn nounwind
