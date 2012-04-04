; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20080604-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.barstruct = type { i8* }

@x = common global %struct.barstruct zeroinitializer, align 8
@.str = private unnamed_addr constant [14 x i8] c"Everything OK\00", align 1

define void @foo() nounwind uwtable noinline {
entry:
  %0 = load i8** getelementptr inbounds (%struct.barstruct* @x, i32 0, i32 0), align 8
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @baz(i32 %b) nounwind uwtable {
entry:
  %b.addr = alloca i32, align 4
  %bar = alloca %struct.barstruct, align 8
  %barptr = alloca %struct.barstruct*, align 8
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32* %b.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store %struct.barstruct* %bar, %struct.barstruct** %barptr, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  store %struct.barstruct* getelementptr inbounds (%struct.barstruct* @x, i64 1), %struct.barstruct** %barptr, align 8
  %1 = load %struct.barstruct** %barptr, align 8
  %add.ptr = getelementptr inbounds %struct.barstruct* %1, i64 -1
  store %struct.barstruct* %add.ptr, %struct.barstruct** %barptr, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load %struct.barstruct** %barptr, align 8
  %some_string = getelementptr inbounds %struct.barstruct* %2, i32 0, i32 0
  store i8* getelementptr inbounds ([14 x i8]* @.str, i32 0, i32 0), i8** %some_string, align 8
  call void @foo()
  %3 = load %struct.barstruct** %barptr, align 8
  %some_string1 = getelementptr inbounds %struct.barstruct* %3, i32 0, i32 0
  store i8* getelementptr inbounds ([14 x i8]* @.str, i32 0, i32 0), i8** %some_string1, align 8
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i8* null, i8** getelementptr inbounds (%struct.barstruct* @x, i32 0, i32 0), align 8
  call void @baz(i32 0)
  %0 = load i8** getelementptr inbounds (%struct.barstruct* @x, i32 0, i32 0), align 8
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}
