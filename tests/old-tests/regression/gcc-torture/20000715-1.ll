; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000715-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@x = common global i32 0, align 4
@y = common global i32 0, align 4

define void @test1() nounwind uwtable {
entry:
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 3, i32* %x, align 4
  store i32 2, i32* %y, align 4
  %tmp = load i32* %x, align 4
  %tmp1 = load i32* %y, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i32* %x, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %x, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp3 = load i32* %y, align 4
  %inc4 = add nsw i32 %tmp3, 1
  store i32 %inc4, i32* %y, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp2, %cond.true ], [ %tmp3, %cond.false ]
  %cmp5 = icmp ne i32 %cond, 2
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %cond.end
  %tmp6 = load i32* %x, align 4
  %cmp7 = icmp ne i32 %tmp6, 3
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end9:                                          ; preds = %if.end
  %tmp10 = load i32* %y, align 4
  %cmp11 = icmp ne i32 %tmp10, 3
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end9
  call void @abort() noreturn
  unreachable

if.end13:                                         ; preds = %if.end9
  ret void
}

declare void @abort() noreturn

define void @test2() nounwind uwtable {
entry:
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 3, i32* %x, align 4
  store i32 2, i32* %y, align 4
  %tmp = load i32* %x, align 4
  %tmp1 = load i32* %y, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i32* %x, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %x, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp3 = load i32* %y, align 4
  %inc4 = add nsw i32 %tmp3, 1
  store i32 %inc4, i32* %y, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp2, %cond.true ], [ %tmp3, %cond.false ]
  store i32 %cond, i32* %z, align 4
  %tmp5 = load i32* %z, align 4
  %cmp6 = icmp ne i32 %tmp5, 2
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %cond.end
  %tmp7 = load i32* %x, align 4
  %cmp8 = icmp ne i32 %tmp7, 3
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end10:                                         ; preds = %if.end
  %tmp11 = load i32* %y, align 4
  %cmp12 = icmp ne i32 %tmp11, 3
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end10
  call void @abort() noreturn
  unreachable

if.end14:                                         ; preds = %if.end10
  ret void
}

define void @test3() nounwind uwtable {
entry:
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %xx = alloca i32, align 4
  %yy = alloca i32, align 4
  store i32 3, i32* %x, align 4
  store i32 2, i32* %y, align 4
  store i32 3, i32* %xx, align 4
  store i32 2, i32* %yy, align 4
  %tmp = load i32* %xx, align 4
  %tmp1 = load i32* %yy, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i32* %x, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %x, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp3 = load i32* %y, align 4
  %inc4 = add nsw i32 %tmp3, 1
  store i32 %inc4, i32* %y, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp2, %cond.true ], [ %tmp3, %cond.false ]
  %cmp5 = icmp ne i32 %cond, 2
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %cond.end
  %tmp6 = load i32* %x, align 4
  %cmp7 = icmp ne i32 %tmp6, 3
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end9:                                          ; preds = %if.end
  %tmp10 = load i32* %y, align 4
  %cmp11 = icmp ne i32 %tmp10, 3
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end9
  call void @abort() noreturn
  unreachable

if.end13:                                         ; preds = %if.end9
  ret void
}

define void @test4() nounwind uwtable {
entry:
  call void @init_xy()
  %tmp = load i32* @x, align 4
  %tmp1 = load i32* @y, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i32* @x, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* @x, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp3 = load i32* @y, align 4
  %inc4 = add nsw i32 %tmp3, 1
  store i32 %inc4, i32* @y, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp2, %cond.true ], [ %tmp3, %cond.false ]
  %cmp5 = icmp ne i32 %cond, 2
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %cond.end
  %tmp6 = load i32* @x, align 4
  %cmp7 = icmp ne i32 %tmp6, 3
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end9:                                          ; preds = %if.end
  %tmp10 = load i32* @y, align 4
  %cmp11 = icmp ne i32 %tmp10, 3
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end9
  call void @abort() noreturn
  unreachable

if.end13:                                         ; preds = %if.end9
  ret void
}

define internal void @init_xy() nounwind uwtable {
entry:
  store i32 3, i32* @x, align 4
  store i32 2, i32* @y, align 4
  ret void
}

define void @test5() nounwind uwtable {
entry:
  %z = alloca i32, align 4
  call void @init_xy()
  %tmp = load i32* @x, align 4
  %tmp1 = load i32* @y, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i32* @x, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* @x, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp3 = load i32* @y, align 4
  %inc4 = add nsw i32 %tmp3, 1
  store i32 %inc4, i32* @y, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp2, %cond.true ], [ %tmp3, %cond.false ]
  store i32 %cond, i32* %z, align 4
  %tmp5 = load i32* %z, align 4
  %cmp6 = icmp ne i32 %tmp5, 2
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %cond.end
  %tmp7 = load i32* @x, align 4
  %cmp8 = icmp ne i32 %tmp7, 3
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end10:                                         ; preds = %if.end
  %tmp11 = load i32* @y, align 4
  %cmp12 = icmp ne i32 %tmp11, 3
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end10
  call void @abort() noreturn
  unreachable

if.end14:                                         ; preds = %if.end10
  ret void
}

define void @test6() nounwind uwtable {
entry:
  %xx = alloca i32, align 4
  %yy = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 3, i32* %xx, align 4
  store i32 2, i32* %yy, align 4
  call void @init_xy()
  %tmp = load i32* %xx, align 4
  %tmp1 = load i32* @y, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i32* @x, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* @x, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp3 = load i32* @y, align 4
  %inc4 = add nsw i32 %tmp3, 1
  store i32 %inc4, i32* @y, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp2, %cond.true ], [ %tmp3, %cond.false ]
  store i32 %cond, i32* %z, align 4
  %tmp5 = load i32* %z, align 4
  %cmp6 = icmp ne i32 %tmp5, 2
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %cond.end
  %tmp7 = load i32* @x, align 4
  %cmp8 = icmp ne i32 %tmp7, 3
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end10:                                         ; preds = %if.end
  %tmp11 = load i32* @y, align 4
  %cmp12 = icmp ne i32 %tmp11, 3
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end10
  call void @abort() noreturn
  unreachable

if.end14:                                         ; preds = %if.end10
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @test1()
  call void @test2()
  call void @test3()
  call void @test4()
  call void @test5()
  call void @test6()
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
