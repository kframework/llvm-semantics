; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr20100-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g = internal global i16 0, align 2
@p = internal global i16 0, align 2
@e = common global i8 0, align 1

define signext i8 @frob(i16 zeroext %a, i16 zeroext %b) nounwind uwtable {
entry:
  %a.addr = alloca i16, align 2
  %b.addr = alloca i16, align 2
  store i16 %a, i16* %a.addr, align 2
  store i16 %b, i16* %b.addr, align 2
  %0 = load i16* %a.addr, align 2
  store i16 %0, i16* @g, align 2
  %1 = load i16* %b.addr, align 2
  store i16 %1, i16* @p, align 2
  %call = call zeroext i16 @inc_g()
  %call1 = call signext i8 @ring_empty()
  ret i8 %call1
}

define internal zeroext i16 @inc_g() nounwind uwtable {
entry:
  %call = call zeroext i16 @next_g()
  store i16 %call, i16* @g, align 2
  ret i16 %call
}

define internal signext i8 @ring_empty() nounwind uwtable {
entry:
  %retval = alloca i8, align 1
  %call = call zeroext i16 @curr_p()
  %conv = zext i16 %call to i32
  %call1 = call zeroext i16 @curr_g()
  %conv2 = zext i16 %call1 to i32
  %cmp = icmp eq i32 %conv, %conv2
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i8 1, i8* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i8 0, i8* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %0 = load i8* %retval
  ret i8 %0
}

define zeroext i16 @get_n() nounwind uwtable {
entry:
  %n = alloca i16, align 2
  %org_g = alloca i16, align 2
  store i16 0, i16* %n, align 2
  %call = call zeroext i16 @curr_g()
  store i16 %call, i16* %org_g, align 2
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %call1 = call signext i8 @ring_empty()
  %tobool = icmp ne i8 %call1, 0
  br i1 %tobool, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %while.cond
  %0 = load i16* %n, align 2
  %conv = zext i16 %0 to i32
  %cmp = icmp slt i32 %conv, 5
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %1 = phi i1 [ false, %while.cond ], [ %cmp, %land.rhs ]
  br i1 %1, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %call3 = call zeroext i16 @inc_g()
  %2 = load i16* %n, align 2
  %inc = add i16 %2, 1
  store i16 %inc, i16* %n, align 2
  br label %while.cond

while.end:                                        ; preds = %land.end
  %3 = load i16* %n, align 2
  ret i16 %3
}

define internal zeroext i16 @curr_g() nounwind uwtable {
entry:
  %0 = load i16* @g, align 2
  ret i16 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i8 3, i8* @e, align 1
  %call = call signext i8 @frob(i16 zeroext 0, i16 zeroext 2)
  %conv = sext i8 %call to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %0 = load i16* @g, align 2
  %conv2 = zext i16 %0 to i32
  %cmp3 = icmp ne i32 %conv2, 1
  br i1 %cmp3, label %if.then, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %1 = load i16* @p, align 2
  %conv6 = zext i16 %1 to i32
  %cmp7 = icmp ne i32 %conv6, 2
  br i1 %cmp7, label %if.then, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false5
  %2 = load i8* @e, align 1
  %conv10 = zext i8 %2 to i32
  %cmp11 = icmp ne i32 %conv10, 3
  br i1 %cmp11, label %if.then, label %lor.lhs.false13

lor.lhs.false13:                                  ; preds = %lor.lhs.false9
  %call14 = call zeroext i16 @get_n()
  %conv15 = zext i16 %call14 to i32
  %cmp16 = icmp ne i32 %conv15, 1
  br i1 %cmp16, label %if.then, label %lor.lhs.false18

lor.lhs.false18:                                  ; preds = %lor.lhs.false13
  %3 = load i16* @g, align 2
  %conv19 = zext i16 %3 to i32
  %cmp20 = icmp ne i32 %conv19, 2
  br i1 %cmp20, label %if.then, label %lor.lhs.false22

lor.lhs.false22:                                  ; preds = %lor.lhs.false18
  %4 = load i16* @p, align 2
  %conv23 = zext i16 %4 to i32
  %cmp24 = icmp ne i32 %conv23, 2
  br i1 %cmp24, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false22, %lor.lhs.false18, %lor.lhs.false13, %lor.lhs.false9, %lor.lhs.false5, %lor.lhs.false, %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false22
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %5 = load i32* %retval
  ret i32 %5
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

define internal zeroext i16 @curr_p() nounwind uwtable {
entry:
  %0 = load i16* @p, align 2
  ret i16 %0
}

define internal zeroext i16 @next_g() nounwind uwtable {
entry:
  %0 = load i16* @g, align 2
  %conv = zext i16 %0 to i32
  %1 = load i8* @e, align 1
  %conv1 = zext i8 %1 to i32
  %sub = sub nsw i32 %conv1, 1
  %cmp = icmp eq i32 %conv, %sub
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i16* @g, align 2
  %conv3 = zext i16 %2 to i32
  %add = add nsw i32 %conv3, 1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %add, %cond.false ]
  %conv4 = trunc i32 %cond to i16
  ret i16 %conv4
}
