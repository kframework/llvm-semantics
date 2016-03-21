; ModuleID = './structInStruct.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.that = type { %struct.str }
%struct.str = type { [2 x i32 ()*], [2 x [2 x i32 ()*]] }

@globalThat = common global %struct.that zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %t = alloca %struct.that, align 8
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.that, %struct.that* %t, i32 0, i32 0
  %3 = getelementptr inbounds %struct.str, %struct.str* %2, i32 0, i32 0
  %4 = getelementptr inbounds [2 x i32 ()*], [2 x i32 ()*]* %3, i32 0, i64 0
  store i32 ()* @main, i32 ()** %4, align 8
  %5 = getelementptr inbounds %struct.that, %struct.that* %t, i32 0, i32 0
  %6 = bitcast %struct.str* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.that* @globalThat to i8*), i8* %6, i64 48, i32 8, i1 false)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
