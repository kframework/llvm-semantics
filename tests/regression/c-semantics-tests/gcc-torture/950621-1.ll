; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950621-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { i32, i32, %struct.s* }

define i32 @f(%struct.s* %sp) nounwind uwtable {
entry:
  %sp.addr = alloca %struct.s*, align 8
  store %struct.s* %sp, %struct.s** %sp.addr, align 8
  %0 = load %struct.s** %sp.addr, align 8
  %tobool = icmp ne %struct.s* %0, null
  br i1 %tobool, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %entry
  %1 = load %struct.s** %sp.addr, align 8
  %a = getelementptr inbounds %struct.s* %1, i32 0, i32 0
  %2 = load i32* %a, align 4
  %cmp = icmp eq i32 %2, -1
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %3 = load %struct.s** %sp.addr, align 8
  %b = getelementptr inbounds %struct.s* %3, i32 0, i32 1
  %4 = load i32* %b, align 4
  %cmp1 = icmp eq i32 %4, -1
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %entry
  %5 = phi i1 [ false, %land.lhs.true ], [ false, %entry ], [ %cmp1, %land.rhs ]
  %land.ext = zext i1 %5 to i32
  ret i32 %land.ext
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca %struct.s, align 8
  store i32 0, i32* %retval
  %b = getelementptr inbounds %struct.s* %x, i32 0, i32 1
  store i32 -1, i32* %b, align 4
  %a = getelementptr inbounds %struct.s* %x, i32 0, i32 0
  store i32 -1, i32* %a, align 4
  %call = call i32 @f(%struct.s* %x)
  %cmp = icmp eq i32 %call, 0
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
