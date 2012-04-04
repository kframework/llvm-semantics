; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr25737.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.delay_block = type { %struct.delay_block* }

@Timer_Queue = internal global %struct.delay_block zeroinitializer, align 8

define %struct.delay_block* @time_enqueue(%struct.delay_block* %d) nounwind uwtable {
entry:
  %d.addr = alloca %struct.delay_block*, align 8
  %q = alloca %struct.delay_block*, align 8
  store %struct.delay_block* %d, %struct.delay_block** %d.addr, align 8
  %0 = load %struct.delay_block** getelementptr inbounds (%struct.delay_block* @Timer_Queue, i32 0, i32 0), align 8
  store %struct.delay_block* %0, %struct.delay_block** %q, align 8
  %1 = load %struct.delay_block** %d.addr, align 8
  %succ = getelementptr inbounds %struct.delay_block* %1, i32 0, i32 0
  store %struct.delay_block* null, %struct.delay_block** %succ, align 8
  %2 = load %struct.delay_block** getelementptr inbounds (%struct.delay_block* @Timer_Queue, i32 0, i32 0), align 8
  ret %struct.delay_block* %2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store %struct.delay_block* @Timer_Queue, %struct.delay_block** getelementptr inbounds (%struct.delay_block* @Timer_Queue, i32 0, i32 0), align 8
  %call = call %struct.delay_block* @time_enqueue(%struct.delay_block* @Timer_Queue)
  %cmp = icmp ne %struct.delay_block* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
