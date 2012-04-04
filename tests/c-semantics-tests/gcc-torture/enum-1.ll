; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/enum-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@tok = internal global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* @tok, align 4
  %call = call i32 @atom()
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define internal i32 @atom() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %0 = load i32* @tok, align 4
  %cmp = icmp sge i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i32* @tok, align 4
  %cmp1 = icmp slt i32 %1, 256
  br i1 %cmp1, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32* @tok, align 4
  %cmp2 = icmp sge i32 %2, 273
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %3 = load i32* @tok, align 4
  %cmp4 = icmp eq i32 %3, 257
  br i1 %cmp4, label %if.then, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false3
  %4 = load i32* @tok, align 4
  %cmp6 = icmp eq i32 %4, 258
  br i1 %cmp6, label %if.then, label %lor.lhs.false7

lor.lhs.false7:                                   ; preds = %lor.lhs.false5
  %5 = load i32* @tok, align 4
  %cmp8 = icmp eq i32 %5, 259
  br i1 %cmp8, label %if.then, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false7
  %6 = load i32* @tok, align 4
  %cmp10 = icmp eq i32 %6, 260
  br i1 %cmp10, label %if.then, label %lor.lhs.false11

lor.lhs.false11:                                  ; preds = %lor.lhs.false9
  %7 = load i32* @tok, align 4
  %cmp12 = icmp eq i32 %7, 261
  br i1 %cmp12, label %if.then, label %lor.lhs.false13

lor.lhs.false13:                                  ; preds = %lor.lhs.false11
  %8 = load i32* @tok, align 4
  %cmp14 = icmp eq i32 %8, 262
  br i1 %cmp14, label %if.then, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %lor.lhs.false13
  %9 = load i32* @tok, align 4
  %cmp16 = icmp eq i32 %9, 263
  br i1 %cmp16, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false15, %lor.lhs.false13, %lor.lhs.false11, %lor.lhs.false9, %lor.lhs.false7, %lor.lhs.false5, %lor.lhs.false3, %lor.lhs.false, %land.lhs.true
  store i32 1, i32* %retval
  br label %return

if.else:                                          ; preds = %lor.lhs.false15
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %10 = load i32* %retval
  ret i32 %10
}
