; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr20100-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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
  %tmp = load i16* %a.addr, align 2
  store i16 %tmp, i16* @g, align 2
  %tmp1 = load i16* %b.addr, align 2
  store i16 %tmp1, i16* @p, align 2
  %call = call zeroext i16 @inc_g()
  %call2 = call signext i8 @ring_empty()
  ret i8 %call2
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
  %tmp = load i16* %n, align 2
  %conv = zext i16 %tmp to i32
  %cmp = icmp slt i32 %conv, 5
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %0 = phi i1 [ false, %while.cond ], [ %cmp, %land.rhs ]
  br i1 %0, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %call3 = call zeroext i16 @inc_g()
  %tmp4 = load i16* %n, align 2
  %inc = add i16 %tmp4, 1
  store i16 %inc, i16* %n, align 2
  br label %while.cond

while.end:                                        ; preds = %land.end
  %tmp5 = load i16* %n, align 2
  ret i16 %tmp5
}

define internal zeroext i16 @curr_g() nounwind uwtable {
entry:
  %tmp = load i16* @g, align 2
  ret i16 %tmp
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
  %tmp = load i16* @g, align 2
  %conv2 = zext i16 %tmp to i32
  %cmp3 = icmp ne i32 %conv2, 1
  br i1 %cmp3, label %if.then, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load i16* @p, align 2
  %conv7 = zext i16 %tmp6 to i32
  %cmp8 = icmp ne i32 %conv7, 2
  br i1 %cmp8, label %if.then, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false5
  %tmp11 = load i8* @e, align 1
  %conv12 = zext i8 %tmp11 to i32
  %cmp13 = icmp ne i32 %conv12, 3
  br i1 %cmp13, label %if.then, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %lor.lhs.false10
  %call16 = call zeroext i16 @get_n()
  %conv17 = zext i16 %call16 to i32
  %cmp18 = icmp ne i32 %conv17, 1
  br i1 %cmp18, label %if.then, label %lor.lhs.false20

lor.lhs.false20:                                  ; preds = %lor.lhs.false15
  %tmp21 = load i16* @g, align 2
  %conv22 = zext i16 %tmp21 to i32
  %cmp23 = icmp ne i32 %conv22, 2
  br i1 %cmp23, label %if.then, label %lor.lhs.false25

lor.lhs.false25:                                  ; preds = %lor.lhs.false20
  %tmp26 = load i16* @p, align 2
  %conv27 = zext i16 %tmp26 to i32
  %cmp28 = icmp ne i32 %conv27, 2
  br i1 %cmp28, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false25, %lor.lhs.false20, %lor.lhs.false15, %lor.lhs.false10, %lor.lhs.false5, %lor.lhs.false, %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false25
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

define internal zeroext i16 @curr_p() nounwind uwtable {
entry:
  %tmp = load i16* @p, align 2
  ret i16 %tmp
}

define internal zeroext i16 @next_g() nounwind uwtable {
entry:
  %tmp = load i16* @g, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i8* @e, align 1
  %conv2 = zext i8 %tmp1 to i32
  %sub = sub nsw i32 %conv2, 1
  %cmp = icmp eq i32 %conv, %sub
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp4 = load i16* @g, align 2
  %conv5 = zext i16 %tmp4 to i32
  %add = add nsw i32 %conv5, 1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %add, %cond.false ]
  %conv6 = trunc i32 %cond to i16
  ret i16 %conv6
}
