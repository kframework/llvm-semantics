; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020129-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { %struct.A*, %struct.C* }
%struct.B = type { %struct.C, %struct.A* }
%struct.C = type { %struct.D, i64, i64, i64, i64, i64 }
%struct.D = type { i32, %struct.D* }

@y = common global %struct.B zeroinitializer, align 8
@x = common global %struct.B zeroinitializer, align 8

define void @foo(%struct.B* %x, %struct.B* %y) nounwind uwtable {
entry:
  %x.addr = alloca %struct.B*, align 8
  %y.addr = alloca %struct.B*, align 8
  %a = alloca %struct.A*, align 8
  store %struct.B* %x, %struct.B** %x.addr, align 8
  store %struct.B* %y, %struct.B** %y.addr, align 8
  %tmp = load %struct.B** %x.addr, align 8
  %b2 = getelementptr inbounds %struct.B* %tmp, i32 0, i32 1
  %tmp1 = load %struct.A** %b2, align 8
  %cmp = icmp eq %struct.A* %tmp1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp3 = load %struct.B** %y.addr, align 8
  %b24 = getelementptr inbounds %struct.B* %tmp3, i32 0, i32 1
  %tmp5 = load %struct.A** %b24, align 8
  store %struct.A* %tmp5, %struct.A** %a, align 8
  %tmp6 = load %struct.B** %x.addr, align 8
  %b27 = getelementptr inbounds %struct.B* %tmp6, i32 0, i32 1
  store %struct.A* %tmp5, %struct.A** %b27, align 8
  %tmp8 = load %struct.B** %y.addr, align 8
  %b29 = getelementptr inbounds %struct.B* %tmp8, i32 0, i32 1
  store %struct.A* null, %struct.A** %b29, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %tmp10 = load %struct.A** %a, align 8
  %tobool = icmp ne %struct.A* %tmp10, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp11 = load %struct.B** %x.addr, align 8
  %b1 = getelementptr inbounds %struct.B* %tmp11, i32 0, i32 0
  %tmp12 = load %struct.A** %a, align 8
  %a2 = getelementptr inbounds %struct.A* %tmp12, i32 0, i32 1
  store %struct.C* %b1, %struct.C** %a2, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp13 = load %struct.A** %a, align 8
  %a1 = getelementptr inbounds %struct.A* %tmp13, i32 0, i32 0
  %tmp14 = load %struct.A** %a1, align 8
  store %struct.A* %tmp14, %struct.A** %a, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  %tmp15 = load %struct.B** %y.addr, align 8
  %b216 = getelementptr inbounds %struct.B* %tmp15, i32 0, i32 1
  %tmp17 = load %struct.A** %b216, align 8
  %cmp18 = icmp ne %struct.A* %tmp17, null
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end20:                                         ; preds = %if.end
  %tmp21 = load %struct.B** %x.addr, align 8
  %b122 = getelementptr inbounds %struct.B* %tmp21, i32 0, i32 0
  %c3 = getelementptr inbounds %struct.C* %b122, i32 0, i32 2
  %tmp23 = load i64* %c3, align 8
  %cmp24 = icmp eq i64 %tmp23, -1
  br i1 %cmp24, label %if.then25, label %if.end45

if.then25:                                        ; preds = %if.end20
  %tmp26 = load %struct.B** %y.addr, align 8
  %b127 = getelementptr inbounds %struct.B* %tmp26, i32 0, i32 0
  %c328 = getelementptr inbounds %struct.C* %b127, i32 0, i32 2
  %tmp29 = load i64* %c328, align 8
  %tmp30 = load %struct.B** %x.addr, align 8
  %b131 = getelementptr inbounds %struct.B* %tmp30, i32 0, i32 0
  %c332 = getelementptr inbounds %struct.C* %b131, i32 0, i32 2
  store i64 %tmp29, i64* %c332, align 8
  %tmp33 = load %struct.B** %y.addr, align 8
  %b134 = getelementptr inbounds %struct.B* %tmp33, i32 0, i32 0
  %c4 = getelementptr inbounds %struct.C* %b134, i32 0, i32 3
  %tmp35 = load i64* %c4, align 8
  %tmp36 = load %struct.B** %x.addr, align 8
  %b137 = getelementptr inbounds %struct.B* %tmp36, i32 0, i32 0
  %c438 = getelementptr inbounds %struct.C* %b137, i32 0, i32 3
  store i64 %tmp35, i64* %c438, align 8
  %tmp39 = load %struct.B** %y.addr, align 8
  %b140 = getelementptr inbounds %struct.B* %tmp39, i32 0, i32 0
  %c341 = getelementptr inbounds %struct.C* %b140, i32 0, i32 2
  store i64 -1, i64* %c341, align 8
  %tmp42 = load %struct.B** %y.addr, align 8
  %b143 = getelementptr inbounds %struct.B* %tmp42, i32 0, i32 0
  %c444 = getelementptr inbounds %struct.C* %b143, i32 0, i32 3
  store i64 0, i64* %c444, align 8
  br label %if.end45

if.end45:                                         ; preds = %if.then25, %if.end20
  %tmp46 = load %struct.B** %y.addr, align 8
  %b147 = getelementptr inbounds %struct.B* %tmp46, i32 0, i32 0
  %c348 = getelementptr inbounds %struct.C* %b147, i32 0, i32 2
  %tmp49 = load i64* %c348, align 8
  %cmp50 = icmp ne i64 %tmp49, -1
  br i1 %cmp50, label %if.then51, label %if.end52

if.then51:                                        ; preds = %if.end45
  call void @abort() noreturn
  unreachable

if.end52:                                         ; preds = %if.end45
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
