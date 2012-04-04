; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000801-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo = type { %struct.foo* }

define %struct.foo* @test(%struct.foo* %node) nounwind uwtable {
entry:
  %node.addr = alloca %struct.foo*, align 8
  store %struct.foo* %node, %struct.foo** %node.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %tmp = load %struct.foo** %node.addr, align 8
  %tobool = icmp ne %struct.foo* %tmp, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call = call i32 @bar()
  %tobool1 = icmp ne i32 %call, 0
  br i1 %tobool1, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %while.body
  %call2 = call i32 @baz()
  %tobool3 = icmp ne i32 %call2, 0
  br i1 %tobool3, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  br label %while.end

if.end:                                           ; preds = %land.lhs.true, %while.body
  %tmp4 = load %struct.foo** %node.addr, align 8
  %next = getelementptr inbounds %struct.foo* %tmp4, i32 0, i32 0
  %tmp5 = load %struct.foo** %next, align 8
  store %struct.foo* %tmp5, %struct.foo** %node.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %if.then, %while.cond
  %tmp6 = load %struct.foo** %node.addr, align 8
  ret %struct.foo* %tmp6
}

define i32 @bar() nounwind uwtable {
entry:
  ret i32 0
}

define i32 @baz() nounwind uwtable {
entry:
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.foo, align 8
  %b = alloca %struct.foo, align 8
  %c = alloca %struct.foo*, align 8
  store i32 0, i32* %retval
  %next = getelementptr inbounds %struct.foo* %a, i32 0, i32 0
  store %struct.foo* %b, %struct.foo** %next, align 8
  %next1 = getelementptr inbounds %struct.foo* %b, i32 0, i32 0
  store %struct.foo* null, %struct.foo** %next1, align 8
  %call = call %struct.foo* @test(%struct.foo* %a)
  store %struct.foo* %call, %struct.foo** %c, align 8
  %tmp = load %struct.foo** %c, align 8
  %tobool = icmp ne %struct.foo* %tmp, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
