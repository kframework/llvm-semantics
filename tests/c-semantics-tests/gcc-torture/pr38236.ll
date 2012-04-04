; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr38236.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.X = type { i32 }

define i32 @foo(%struct.X* %p, i32* %q, i32 %a, i32 %b) nounwind uwtable noinline {
entry:
  %p.addr = alloca %struct.X*, align 8
  %q.addr = alloca i32*, align 8
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %x = alloca %struct.X, align 4
  %y = alloca %struct.X, align 4
  store %struct.X* %p, %struct.X** %p.addr, align 8
  store i32* %q, i32** %q.addr, align 8
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32* %a.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store %struct.X* %x, %struct.X** %p.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32* %b.addr, align 4
  %tobool1 = icmp ne i32 %1, 0
  br i1 %tobool1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %i = getelementptr inbounds %struct.X* %x, i32 0, i32 0
  store i32* %i, i32** %q.addr, align 8
  br label %if.end4

if.else:                                          ; preds = %if.end
  %i3 = getelementptr inbounds %struct.X* %y, i32 0, i32 0
  store i32* %i3, i32** %q.addr, align 8
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  %2 = load i32** %q.addr, align 8
  store i32 1, i32* %2, align 4
  %3 = load %struct.X** %p.addr, align 8
  %i5 = getelementptr inbounds %struct.X* %3, i32 0, i32 0
  %4 = load i32* %i5, align 4
  ret i32 %4
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(%struct.X* null, i32* null, i32 1, i32 1)
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
