; ModuleID = './switchEnumUnion.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.tree_node = type { %struct.tree_common }
%struct.tree_common = type { %union.tree_node*, %union.tree_node*, i32 }

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
  %3 = load %union.tree_node*, %union.tree_node** %2, align 8
  %4 = bitcast %union.tree_node* %3 to %struct.tree_common*
  %5 = getelementptr inbounds %struct.tree_common, %struct.tree_common* %4, i32 0, i32 2
  %6 = load i32, i32* %5, align 8
  %7 = shl i32 %6, 24
  %8 = ashr i32 %7, 24
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %8)
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 222)
  %11 = load %union.tree_node*, %union.tree_node** %2, align 8
  %12 = bitcast %union.tree_node* %11 to %struct.tree_common*
  %13 = getelementptr inbounds %struct.tree_common, %struct.tree_common* %12, i32 0, i32 2
  %14 = load i32, i32* %13, align 8
  %15 = shl i32 %14, 24
  %16 = ashr i32 %15, 24
  switch i32 %16, label %19 [
    i32 222, label %17
  ]

; <label>:17                                      ; preds = %0
  %18 = call i32 @blah()
  store i32 %18, i32* %1
  br label %21

; <label>:19                                      ; preds = %0
  br label %20

; <label>:20                                      ; preds = %19
  store i32 1, i32* %1
  br label %21

; <label>:21                                      ; preds = %20, %17
  %22 = load i32, i32* %1
  ret i32 %22
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
  %4 = load %union.tree_node*, %union.tree_node** %convs, align 8
  %5 = bitcast %union.tree_node* %4 to %struct.tree_common*
  %6 = getelementptr inbounds %struct.tree_common, %struct.tree_common* %5, i32 0, i32 2
  %7 = load i32, i32* %6, align 8
  %8 = and i32 %7, -256
  %9 = or i32 %8, 222
  store i32 %9, i32* %6, align 8
  %10 = load %union.tree_node*, %union.tree_node** %convs, align 8
  %11 = call i32 @convert_like_real(%union.tree_node* %10)
  ret i32 %11
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
