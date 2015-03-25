; ModuleID = './xAddrStruct.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { %struct.node*, i32 }

@s = common global %struct.node zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define { %struct.node*, i32 } @f() #0 {
  %1 = alloca %struct.node, align 8
  %2 = bitcast %struct.node* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.node* @s to i8*), i64 16, i32 8, i1 false)
  %3 = bitcast %struct.node* %1 to { %struct.node*, i32 }*
  %4 = load { %struct.node*, i32 }* %3, align 1
  ret { %struct.node*, i32 } %4
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.node, align 8
  store i32 0, i32* %1
  store %struct.node* @s, %struct.node** getelementptr inbounds (%struct.node* @s, i32 0, i32 0), align 8
  store i32 5, i32* getelementptr inbounds (%struct.node* @s, i32 0, i32 1), align 4
  %3 = call { %struct.node*, i32 } @f()
  %4 = bitcast %struct.node* %2 to { %struct.node*, i32 }*
  %5 = getelementptr { %struct.node*, i32 }* %4, i32 0, i32 0
  %6 = extractvalue { %struct.node*, i32 } %3, 0
  store %struct.node* %6, %struct.node** %5, align 1
  %7 = getelementptr { %struct.node*, i32 }* %4, i32 0, i32 1
  %8 = extractvalue { %struct.node*, i32 } %3, 1
  store i32 %8, i32* %7, align 1
  %9 = getelementptr inbounds %struct.node* %2, i32 0, i32 0
  %10 = load %struct.node** %9, align 8
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
