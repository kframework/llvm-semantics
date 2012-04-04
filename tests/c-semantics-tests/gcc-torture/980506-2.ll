; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980506-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i32 }

define i32 @f() nounwind uwtable {
entry:
  %s = alloca %struct.anon, align 4
  %sp = alloca %struct.anon*, align 8
  %ip = alloca i32*, align 8
  %i = getelementptr inbounds %struct.anon* %s, i32 0, i32 0
  store i32* %i, i32** %ip, align 8
  %i1 = getelementptr inbounds %struct.anon* %s, i32 0, i32 0
  store i32 1, i32* %i1, align 4
  %0 = bitcast %struct.anon* %s to i8*
  %call = call i8* @self(i8* %0)
  %1 = bitcast i8* %call to %struct.anon*
  store %struct.anon* %1, %struct.anon** %sp, align 8
  %2 = load i32** %ip, align 8
  store i32 0, i32* %2, align 4
  %3 = load %struct.anon** %sp, align 8
  %i2 = getelementptr inbounds %struct.anon* %3, i32 0, i32 0
  %4 = load i32* %i2, align 4
  %add = add nsw i32 %4, 1
  ret i32 %add
}

define internal i8* @self(i8* %p) nounwind uwtable {
entry:
  %p.addr = alloca i8*, align 8
  store i8* %p, i8** %p.addr, align 8
  %0 = load i8** %p.addr, align 8
  ret i8* %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f()
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
