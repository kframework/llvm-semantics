; ModuleID = './switchEnumUnion.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.tree_node = type { %struct.tree_common }
%struct.tree_common = type { %union.tree_node*, %union.tree_node*, [4 x i8] }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @blah() #0 {
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @convert_like_real(%union.tree_node* %convs) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %union.tree_node*, align 8
  store %union.tree_node* %convs, %union.tree_node** %2, align 8
  %3 = load %union.tree_node** %2, align 8
  %4 = bitcast %union.tree_node* %3 to %struct.tree_common*
  %5 = getelementptr inbounds %struct.tree_common* %4, i32 0, i32 2
  %6 = bitcast [4 x i8]* %5 to i32*
  %7 = load i32* %6, align 8
  %8 = shl i32 %7, 24
  %9 = ashr i32 %8, 24
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %9)
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 222)
  %12 = load %union.tree_node** %2, align 8
  %13 = bitcast %union.tree_node* %12 to %struct.tree_common*
  %14 = getelementptr inbounds %struct.tree_common* %13, i32 0, i32 2
  %15 = bitcast [4 x i8]* %14 to i32*
  %16 = load i32* %15, align 8
  %17 = shl i32 %16, 24
  %18 = ashr i32 %17, 24
  switch i32 %18, label %21 [
    i32 222, label %19
  ]

; <label>:19                                      ; preds = %0
  %20 = call i32 @blah()
  store i32 %20, i32* %1
  br label %23

; <label>:21                                      ; preds = %0
  br label %22

; <label>:22                                      ; preds = %21
  store i32 1, i32* %1
  br label %23

; <label>:23                                      ; preds = %22, %19
  %24 = load i32* %1
  ret i32 %24
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %convs = alloca %union.tree_node*, align 8
  store i32 0, i32* %1
  %2 = call noalias i8* @malloc(i64 24) #3
  %3 = bitcast i8* %2 to %union.tree_node*
  store %union.tree_node* %3, %union.tree_node** %convs, align 8
  %4 = load %union.tree_node** %convs, align 8
  %5 = bitcast %union.tree_node* %4 to %struct.tree_common*
  %6 = getelementptr inbounds %struct.tree_common* %5, i32 0, i32 2
  %7 = bitcast [4 x i8]* %6 to i32*
  %8 = load i32* %7, align 8
  %9 = and i32 %8, -256
  %10 = or i32 %9, 222
  store i32 %10, i32* %7, align 8
  %11 = load %union.tree_node** %convs, align 8
  %12 = call i32 @convert_like_real(%union.tree_node* %11)
  ret i32 %12
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
