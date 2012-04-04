; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020129-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.B = type { %struct.C, %struct.A* }
%struct.C = type { %struct.D, i64, i64, i64, i64, i64 }
%struct.D = type { i32, %struct.D* }
%struct.A = type { %struct.A*, %struct.C* }

@y = common global %struct.B zeroinitializer, align 8
@x = common global %struct.B zeroinitializer, align 8

define void @foo(%struct.B* %x, %struct.B* %y) nounwind uwtable {
entry:
  %x.addr = alloca %struct.B*, align 8
  %y.addr = alloca %struct.B*, align 8
  %a = alloca %struct.A*, align 8
  store %struct.B* %x, %struct.B** %x.addr, align 8
  store %struct.B* %y, %struct.B** %y.addr, align 8
  %0 = load %struct.B** %x.addr, align 8
  %b2 = getelementptr inbounds %struct.B* %0, i32 0, i32 1
  %1 = load %struct.A** %b2, align 8
  %cmp = icmp eq %struct.A* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.B** %y.addr, align 8
  %b21 = getelementptr inbounds %struct.B* %2, i32 0, i32 1
  %3 = load %struct.A** %b21, align 8
  store %struct.A* %3, %struct.A** %a, align 8
  %4 = load %struct.B** %x.addr, align 8
  %b22 = getelementptr inbounds %struct.B* %4, i32 0, i32 1
  store %struct.A* %3, %struct.A** %b22, align 8
  %5 = load %struct.B** %y.addr, align 8
  %b23 = getelementptr inbounds %struct.B* %5, i32 0, i32 1
  store %struct.A* null, %struct.A** %b23, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %6 = load %struct.A** %a, align 8
  %tobool = icmp ne %struct.A* %6, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load %struct.B** %x.addr, align 8
  %b1 = getelementptr inbounds %struct.B* %7, i32 0, i32 0
  %8 = load %struct.A** %a, align 8
  %a2 = getelementptr inbounds %struct.A* %8, i32 0, i32 1
  store %struct.C* %b1, %struct.C** %a2, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load %struct.A** %a, align 8
  %a1 = getelementptr inbounds %struct.A* %9, i32 0, i32 0
  %10 = load %struct.A** %a1, align 8
  store %struct.A* %10, %struct.A** %a, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  %11 = load %struct.B** %y.addr, align 8
  %b24 = getelementptr inbounds %struct.B* %11, i32 0, i32 1
  %12 = load %struct.A** %b24, align 8
  %cmp5 = icmp ne %struct.A* %12, null
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end7:                                          ; preds = %if.end
  %13 = load %struct.B** %x.addr, align 8
  %b18 = getelementptr inbounds %struct.B* %13, i32 0, i32 0
  %c3 = getelementptr inbounds %struct.C* %b18, i32 0, i32 2
  %14 = load i64* %c3, align 8
  %cmp9 = icmp eq i64 %14, -1
  br i1 %cmp9, label %if.then10, label %if.end22

if.then10:                                        ; preds = %if.end7
  %15 = load %struct.B** %y.addr, align 8
  %b111 = getelementptr inbounds %struct.B* %15, i32 0, i32 0
  %c312 = getelementptr inbounds %struct.C* %b111, i32 0, i32 2
  %16 = load i64* %c312, align 8
  %17 = load %struct.B** %x.addr, align 8
  %b113 = getelementptr inbounds %struct.B* %17, i32 0, i32 0
  %c314 = getelementptr inbounds %struct.C* %b113, i32 0, i32 2
  store i64 %16, i64* %c314, align 8
  %18 = load %struct.B** %y.addr, align 8
  %b115 = getelementptr inbounds %struct.B* %18, i32 0, i32 0
  %c4 = getelementptr inbounds %struct.C* %b115, i32 0, i32 3
  %19 = load i64* %c4, align 8
  %20 = load %struct.B** %x.addr, align 8
  %b116 = getelementptr inbounds %struct.B* %20, i32 0, i32 0
  %c417 = getelementptr inbounds %struct.C* %b116, i32 0, i32 3
  store i64 %19, i64* %c417, align 8
  %21 = load %struct.B** %y.addr, align 8
  %b118 = getelementptr inbounds %struct.B* %21, i32 0, i32 0
  %c319 = getelementptr inbounds %struct.C* %b118, i32 0, i32 2
  store i64 -1, i64* %c319, align 8
  %22 = load %struct.B** %y.addr, align 8
  %b120 = getelementptr inbounds %struct.B* %22, i32 0, i32 0
  %c421 = getelementptr inbounds %struct.C* %b120, i32 0, i32 3
  store i64 0, i64* %c421, align 8
  br label %if.end22

if.end22:                                         ; preds = %if.then10, %if.end7
  %23 = load %struct.B** %y.addr, align 8
  %b123 = getelementptr inbounds %struct.B* %23, i32 0, i32 0
  %c324 = getelementptr inbounds %struct.C* %b123, i32 0, i32 2
  %24 = load i64* %c324, align 8
  %cmp25 = icmp ne i64 %24, -1
  br i1 %cmp25, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.end22
  call void @abort() noreturn
  unreachable

if.end27:                                         ; preds = %if.end22
  ret void
}

declare void @abort() noreturn

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 6, i32* getelementptr inbounds (%struct.B* @y, i32 0, i32 0, i32 0, i32 0), align 4
  store i64 145, i64* getelementptr inbounds (%struct.B* @y, i32 0, i32 0, i32 2), align 8
  store i64 2448, i64* getelementptr inbounds (%struct.B* @y, i32 0, i32 0, i32 3), align 8
  store i64 -1, i64* getelementptr inbounds (%struct.B* @x, i32 0, i32 0, i32 2), align 8
  call void @foo(%struct.B* @x, %struct.B* @y)
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
