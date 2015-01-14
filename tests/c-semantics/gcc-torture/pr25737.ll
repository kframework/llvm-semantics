; ModuleID = './pr25737.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.delay_block = type { %struct.delay_block* }

@Timer_Queue = internal global %struct.delay_block zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define %struct.delay_block* @time_enqueue(%struct.delay_block* %d) #0 {
  %1 = alloca %struct.delay_block*, align 8
  %q = alloca %struct.delay_block*, align 8
  store %struct.delay_block* %d, %struct.delay_block** %1, align 8
  %2 = load %struct.delay_block** getelementptr inbounds (%struct.delay_block* @Timer_Queue, i32 0, i32 0), align 8
  store %struct.delay_block* %2, %struct.delay_block** %q, align 8
  %3 = load %struct.delay_block** %1, align 8
  %4 = getelementptr inbounds %struct.delay_block* %3, i32 0, i32 0
  store %struct.delay_block* null, %struct.delay_block** %4, align 8
  %5 = load %struct.delay_block** getelementptr inbounds (%struct.delay_block* @Timer_Queue, i32 0, i32 0), align 8
  ret %struct.delay_block* %5
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store %struct.delay_block* @Timer_Queue, %struct.delay_block** getelementptr inbounds (%struct.delay_block* @Timer_Queue, i32 0, i32 0), align 8
  %2 = call %struct.delay_block* @time_enqueue(%struct.delay_block* @Timer_Queue)
  %3 = icmp ne %struct.delay_block* %2, null
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
